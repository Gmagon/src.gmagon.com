---
title: How Establish A Hardware Root of Trust-Titan
---

By Uday Savagaonkar, Technical Lead Manager, Nelly Porter, Senior Product Manager, Nadim Taha, Software Lead, Benjamin Serebrin, Tech Lead and Neal Mueller, Product Marketing Lead

While there are no absolutes in computer security, we design, build and operate[Google Cloud Platform](https://cloud.google.com/)\(GCP\) with the goal to protect customers' code and data. We harden our architecture at multiple layers, with components that include Google-designed hardware, a Google-controlled firmware stack, Google-curated OS images, a Google-hardened hypervisor, as well as data center physical security and services.

| ![](http://img0.tuicool.com/Jb2IFrn.png!web) |
| :--- |
| Photograph of Titan inside Google's purpose-built server |

In this post, we provide details of the mechanisms of how we will establish a[hardware root of trust](https://cloud.google.com/security/security-design/#secure_boot_stack_and_machine_identity)using our custom chip, Titan.

First[introduced at Google Cloud Next '17](https://www.blog.google/topics/google-cloud/bolstering-security-across-google-cloud/), Titan is a secure, low-power microcontroller designed with Google hardware security requirements and scenarios in mind. Let’s take a look at how Titan works to ensure that a machine boots from a known good state using verifiable code, and establishes the hardware root of trust for cryptographic operations in our data centers.

| ![](http://img0.tuicool.com/jMniEzj.png!web) |
| :--- |
| Photograph of Urs Hölzle unveiling Titan at Google Cloud Next '17 \([YouTube](https://youtu.be/kwnWfHq2EfQ?t=31m27s)\) |

### Machine boot basics 

Machines in Google’s datacenters, as with most modern computers, have multiple components, including one or more CPUs, RAM, Baseboard Management Controller \(BMC\), NIC, boot firmware, boot firmware flash and persistent storage. Let’s review how these components interact to boot the machine:

1. The machine's boot process starts when the BMC configuring the machine hardware lets the CPU come out of reset. 
2. The CPU then loads the basic firmware \(Boot or UEFI\) from the boot firmware flash, which performs further hardware/software configuration. 
3. Once the machine is sufficiently configured, the boot firmware accesses the "boot sector" on the machine's persistent storage, and loads a special program called the "boot loader" into the system memory. 
4. The boot firmware then passes execution control to the boot loader, which loads the initial OS image from storage into system memory and passes execution control to the operating system. 

In our datacenters, we protect the boot process with secure boot. Our machines boot a known firmware/software stack, cryptographically verify this stack and then gain \(or fail to gain\) access to resources on our network based on the status of that verification. Titan integrates with this process and offers additional layers of protection.

As[privileged software attacks increase](https://www.blackhat.com/us-17/briefings/schedule/index.html#fractured-backbone-breaking-modern-os-defenses-with-firmware-attacks-7609)and[more research becomes available](https://www.blackhat.com/us-17/briefings/schedule/#firmware-is-the-new-black---analyzing-past-three-years-of-biosuefi-security-vulnerabilities-6924)on rootkits, we have committed to delivering secure boot and hardware-based root of trust for machines that form our infrastructure and host our Google Cloud workloads.

### Secure boot with Titan

Typically, secure boot relies on a combination of an authenticated boot firmware and boot loader along with digitally signed boot files to provide its security guarantees. In addition, a secure element can provide private key storage and management. Titan not only meets these expectations, but goes above and beyond to provide two important additional security properties: remediation and first-instruction integrity. Trust can be re-established through remediation in the event that bugs in Titan firmware are found and patched, and first-instruction integrity allows us to identify the earliest code that runs on each machine’s startup cycle.

To achieve these security properties, Titan comprises several components: a secure application processor, a cryptographic co-processor, a hardware random number generator, a sophisticated key hierarchy, embedded static RAM \(SRAM\), embedded flash and a read-only memory block. Titan communicates with the main CPU via the[Serial Peripheral Interface \(SPI\)](https://en.wikipedia.org/wiki/Serial_Peripheral_Interface_Bus)bus, and interposes between the boot firmware flash of the first privileged component, e.g., the BMC or[Platform Controller Hub \(PCH\)](https://en.wikipedia.org/wiki/Platform_Controller_Hub), allowing Titan to observe every byte of boot firmware.

Titan's application processor immediately executes code from its embedded read-only memory when its host machine is powered up. The fabrication process lays down immutable code, known as the boot ROM, that is trusted implicitly and validated at every chip reset. Titan runs a Memory Built-In Self-Test every time the chip boots to ensure that all memory \(including ROM\) has not been tampered with. The next step is to load Titan’s firmware. Even though this firmware is embedded in the on-chip flash, the Titan boot ROM does not trust it blindly. Instead, the boot ROM verifies Titan's firmware using public key cryptography, and mixes the identity of this verified code into Titan's key hierarchy. Then, the boot ROM loads the verified firmware.

Once Titan has booted its own firmware in a secure fashion, it will turn its attention to the host’s boot firmware flash, and verify its contents using public key cryptography. Titan can gate PCH/BMC access to the boot firmware flash until after it has verified the flash content, at which point it signals readiness to release the rest of the machine from reset. Holding the machine in reset while Titan cryptographically verifies the boot firmware provides us the first-instruction integrity property: we know what boot firmware and OS booted on our machine from the very first instruction. In fact, we even know which microcode patches may have been fetched before the boot firmware's first instruction. Finally, the Google-verified boot firmware configures the machine and loads the boot loader, which subsequently verifies and loads the operating system.

| ![](http://img2.tuicool.com/VrieIjB.png!web) |
| :--- |
| Photograph of Titan up-close on a printed circuit board. |

### Cryptographic identity using Titan

In addition to enabling secure boot, we’ve developed an end-to-end cryptographic identity system based on Titan that can act as the root of trust for varied cryptographic operations in our data centers. The Titan chip manufacturing process generates unique keying material for each chip, and securely stores this material—along with provenance information—into a registry database. The contents of this database are cryptographically protected using keys maintained in an offline quorum-based Titan Certification Authority \(CA\). Individual Titan chips can generate Certificate Signing Requests \(CSRs\) directed at the Titan CA, which—under the direction of a quorum of Titan identity administrators—can verify the authenticity of the CSRs using the information in the registry database before issuing identity certificates.

The Titan-based identity system not only verifies the provenance of the chips creating the CSRs, but also verifies the firmware running on the chips, as the code identity of the firmware is hashed into the on-chip key hierarchy. This property enables remediation and allows us to fix bugs in Titan firmware, and issue certificates that can only be wielded by patched Titan chips. The Titan-based identity system enables back-end systems to securely provision secrets and keys to individual Titan-enabled machines, or jobs running on those machines. Titan is also able to chain and sign critical audit logs, making those logs tamper-evident. To offer tamper-evident logging capabilities, Titan cryptographically associates the log messages with successive values of a secure monotonic counter maintained by Titan, and signs these associations with its private key. This binding of log messages with secure monotonic counter values ensures that audit logs cannot be altered or deleted without detection, even by insiders with root access to the relevant machine.

### Conclusion

Our goal is to protect the boot process by securing it with a dedicated entity that is explicitly engineered to behave in an expected manner. Titan provides this root of trust by enabling verification of the system firmware and software components, and establishes a strong, hardware-rooted system identity. Google designed Titan's hardware logic in-house to reduce the chances of hardware backdoors. The Titan ecosystem ensures that production infrastructure boots securely using authorized and verifiable code.

In short:

1. Titan provides a hardware-based root of trust that establishes strong identity of a machine, with which we can make important security decisions and validate the “health” of the system. 
2. Titan offers integrity verification of firmware and software components. 
3. The system’s strong identity ensures that we'll have a non-repudiable audit trail of any changes done to the system. Tamper-evident logging capabilities help identify actions performed by an insider with root access. 

For more information about how we harden our environment, visit the[Google Cloud Platform Security page](https://cloud.google.com/security/).



Source: [https://cloudplatform.googleblog.com/2017/08/Titan-in-depth-security-in-plaintext.html](http://www.tuicool.com/articles/hit/INvQBzj)

