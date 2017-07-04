---
title: Researchers Crack 1024-bit RSA Encryption in GnuPG Crypto Library
---

![](http://img0.tuicool.com/Qn67Bja.png!web)

Security boffins have discovered a critical vulnerability in a GnuPG cryptographic library that allowed the researchers to completely break RSA-1024 and successfully extract the secret RSA key to decrypt data.

Gnu Privacy Guard \(GnuPG or GPG\) is popular open source encryption software used by many operating systems from Linux and FreeBSD to Windows and macOS X.

It's the same software used by the former NSA contractor and whistleblower Edward Snowden to keep his communication secure from law enforcement.

The vulnerability, labeled[CVE-2017-7526](https://lists.gnupg.org/pipermail/gnupg-announce/2017q2/000408.html), resides in the**Libgcrypt**cryptographic library used by GnuPG, which is prone to local FLUSH+RELOAD side-channel attack.

A team of researchers — from Technical University of Eindhoven, the University of Illinois, the University of Pennsylvania, the University of Maryland, and the University of Adelaide — found that the "left-to-right sliding window" method used by the libgcrypt library for carrying out the mathematics of cryptography leaks significantly more information about exponent bits than for right-to-left, allowing full RSA key recovery.

"In this paper, we demonstrate a complete break of RSA-1024 as implemented in Libgcrypt. Our attack makes essential use of the fact that Libgcrypt uses the left-to-right method for computing the sliding-window expansion," the researchers wrote in the[research paper](https://eprint.iacr.org/2017/627.pdf).

"The pattern of squarings and multiplications in left-to-right sliding windows leaks significantly more information about the exponent than right-to-left. We show how to extend the Heninger-Shacham algorithm for partial key reconstruction to make use of this information and obtain a very efficient full key recovery for RSA-1024."

L3 Cache Side-Channel Attack requires an attacker to run arbitrary software on the hardware where the private RSA key is used.

The attack allows an attacker to extract the secret crypto key from a system by analyzing the pattern of memory utilization or the electromagnetic outputs of the device that are emitted during the decryption process.

"Thus in practice, there are easier ways to access the private keys than to mount this side-channel attack. However, on boxes with virtual machines, this attack may be used by one VM to steal private keys from another VM," Libgcrypt[advisory](https://lists.gnupg.org/pipermail/gnupg-announce/2017q2/000408.html)reads.

Researchers have also provided evidence that the same side channel attack also works against RSA-2048, which require moderately more computation than RSA-1024.

The research paper titled, 'Sliding right into disaster: Left-to-right sliding windows leak,' was authored by David J. Bernstein, Joachim Breitner, Daniel Genkin, Leon Groot Bruinderink, Nadia Heninger, Christine van Vredendaal, Tanja Lange and Yuval Yarom.

Libgcrypt has released a fix for the issue in Libgcrypt version 1.7.8.[Debian](https://www.debian.org/security/2017/dsa-3901)and[Ubuntu](https://www.ubuntuupdates.org/package/core/zesty/main/updates/libgcrypt20-dev)have already updated their library with the latest version of Libgcrypt.

So, you are strongly advised to check if your Linux distribution is running the latest version of the Libgcrypt library.



Source: [http://thehackernews.com/2017/07/gnupg-libgcrypt-rsa-encryption.html](http://www.tuicool.com/articles/hit/2uUvMfZ)

