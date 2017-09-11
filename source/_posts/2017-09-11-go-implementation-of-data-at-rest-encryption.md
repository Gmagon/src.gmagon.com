---
title: Go implementation of Data At Rest Encryption
---

!
[](http://www.mckinsey.com/~/media/McKinsey/Business Functions/McKinsey Digital/Our Insights/How companies are using big data and analytics/How-companies-data-1536x1536-300_Standard.ashx?mw=605&car=211:119)

### Introduction

Encrypting network traffic is becoming the default. There are standardized protocols like SSH and TLS as well as projects like Let’s Encrypt to protect data sent over the network. TLS for example takes a data stream, chunks the stream into messages and encrypts every message before sending it through the network. TLS ensures that each message is encrypted and authenticated to prevent an attacker from reading or modifying any data sent over a TLS connection.

Surprisingly there are no comparable standards or solutions when it comes to file encryption — or more precisely data at rest encryption. Whenever data should be stored securely on untrusted storage you are more or less on your own. As a consequence many projects and products were invented to provide some sort of file or data encryption. Unfortunately these solutions are islands and incompatibility problems are the default. Even worse file encryption is done wrong frequently. GPG, as just one example, is shown at [Adam Langley’s blog post](https://www.imperialviolet.org/2014/06/27/streamingencryption.html).

### DARE Format

At [Minio](https://minio.io/) we want to give our users the ability to store their data encrypted. But instead of inventing yet another island solution which can be used by nobody else, we want to provide a general solution for data at rest encryption. Therefore we came up with a [format](https://github.com/minio/sio/blob/master/DARE.md) for encrypting arbitrary data streams in a secure way. The format should:

* provide confidentiality and integrity of the encrypted data.
* fit many use cases — not just solve our specific issue.
* be as simple as possible.
* keep the overhead small.

Providing confidentiality and integrity of the encrypted data is the most important property. We combined all primitives in a very simple way to keep the attack surface small and implementation complexity low. Therefore the data stream is split into a sequence of packages and every package is encrypted separately. The encryption is done in a way that it is not possible to read or modify the encrypted packages without breaking the used cipher. An encrypted package looks like this:

```
header (16 bytes) | payload (1 byte - 64 KB) | tag (16 bytes)
```

The header contains some meta data of the package like a version, cipher suite, payload length, sequence number and nonce. The tag is a checksum computed while encrypting the payload and depends on every byte of the header and payload. The 16 byte header contains the following fields:

```
version | cipher | payload length | sequence number | nonce


1 byte 1 byte 2 bytes 4 bytes 8 bytes
```

Each package is encrypted with an [AEAD cipher](https://en.wikipedia.org/wiki/Authenticated_encryption) — either AES-256-GCM or ChaCha20Poly1305. The sequence number is basically a counter incremented after every encrypted package to prevent reordering of packages. The purpose of the nonce is to reduce the damage of key reuse. If an encryption key is ever reused \(and there would be no nonce\) an attacker would be able to XOR two payloads of packages with the same sequence number resulting into the XOR of both plaintexts. The nonce is randomly generated and mitigates such attacks caused by accidental key reuse. Instead of generating a new nonce per package we generate the nonce once at the beginning of the encryption process and repeat it in every package header. The reason is that generating a separate nonce per package has no advantages. Even worse the probability of using the same nonce twice within two different data streams encrypted with the same key is much higher if the nonce is generated randomly per package instead of per data stream.

The DARE format combines authenticated cipher schemes and a very simple reorder protection mechanism to achieve a tamper-proof property. However, this tamper-proof property is lost as soon as an encryption key is used twice. Therefore DARE requires an unique encryption key. Within the DARE specification we give some [recommendations](https://github.com/minio/sio/blob/master/DARE.md#appendix-a---key-derivation-from-a-master-key)on how to do this correctly.

Minio — as an object storage — deals with large amounts of data. Therefore DARE is designed to handle large data streams while keeping the overhead low. Every encrypted package contains a header and an authentication tag which increases the size of the encrypted data stream about ~0.05%. To illustrate this: The overhead for a 5 GB data stream is about 2.5 MB. Further DARE supports large data streams up to 256 TB which should be sufficient for any current use case. However, if larger streams must be encrypted in the future DARE can be tweaked in newer versions to support larger streams by making different trade-offs.

### Secure-IO

Minio also provides a reference Go [implementation](https://github.com/minio/sio) of the DARE format. It exports an easy-to-use API to encrypt/decrypt arbitrary data streams securely. The following example shows how to encrypt a file with a 32 byte master key.

```
masterkey := []byte("my-secret-32-byte-master-enc-key")
// this nonce must be unique (should generated randomly)
// It must be remembered but needn't be secret.
nonce := []byte{
0, 1, 2, 3, 4, 5 ,6 ,7, 8, 9, 10, 11, 12, 13, 14, 15,
}
plaintext, err := os.Open("my-unencrypted-file")
if err != nil {
fmt.Printf("Failed open 'my-unencrypted-file': %v", err)
return
}
defer plaintext.Close()
ciphertext, err := os.Create("my-encrypted-file")
if err != nil {
fmt.Printf("Failed create 'my-encrypted-file': %v", err)
return
}
defer ciphertext.Close()
// derive an unique encryption key
kdf := hmac.New(sha256.New, masterkey)
kdf.Write(nonce)
config := sio.Config {
Key: kdf.Sum(nil),
CipherSuites: []byte{sio.AES_256_GCM},
}
_, err = sio.Encrypt(ciphertext, plaintext, config)
if err != nil {
fmt.Printf("Failed to encrypt data: %v", err)
return
}
```



Additional examples and the package documentation can be found at [godoc.org](https://godoc.org/github.com/minio/sio). Further if you want to play with the DARE format and en/decrypt data streams on your machine you can check out this [demo tool](https://github.com/aead/ee).

### Conclusion

Minio will use DARE for server-side and client-side-encryption. This will give our users the ability to encrypt their data with client-side-encryption and decrypt the data with server-side-encryption or vice versa. We hope that DARE will be a useful solution not just for our users but also for the wider developer community. If you have any questions or suggestions join our [slack channel](https://minio.slack.com/). Feedback is always welcome!

Source: [https://blog.minio.io/data-at-rest-encryption-done-right-7446c644ddb6](https://blog.minio.io/data-at-rest-encryption-done-right-7446c644ddb6)

