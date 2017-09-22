---
title: The Dream Of The External Graphics Card Is Real
---

![](http://img0.tuicool.com/uuErUvy.jpg!web)

[Enlarge](https://cdn.arstechnica.net/wp-content/uploads/2017/07/DSC03138.jpg)/The Sonnet eGFX Breakaway Box and Sapphire RX 580.

Mark Walton

| | Specs at a glance: Sonnet eGFX Breakaway Box |
| :--- | :--- |
| Power | 350W Asaka AK-PS035AF01 SFX |
| Ports | 1x PCIe 3.0 X16, 1x Thunderbolt 3.0 |
| Size | 18.5cm x 34.0cm x 20.2cm |
| Other perks | 120mm Asaka Fan |
| Price | $300 \(~£300, but TBC\) |

The external graphics card \(or eGFX\), long the pipe dream of laptop-touting gamers the world over, has finally come of age. Thanks to[Thunderbolt 3](https://arstechnica.co.uk/gadgets/2017/05/intel-thunderbolt-3-royalty-free/)—which offers up to 40Gbps of bandwidth, the equivalent of four PCIe 3.0 lanes—consumers finally have access to enough bandwidth in a universal standard to make eGFX a viable option.

So the theory goes, you can now take most laptops with a Thunderbolt 3 port, plug in a box containing a power supply and your GPU of choice, and enjoy better visuals and higher frame rates in games, and faster rendering in production tasks. You can even whack a PCIe video capture card or a production-ready audio interface in that external box, if you so wish.

Thus far the limiting factor, aside from some potential performance bottlenecks and driver support, has been price. The[Razer Core](https://arstechnica.co.uk/gadgets/2016/01/razer-uses-thunderbolt-3-to-add-dedicated-graphics-to-its-sleek-new-ultrabook/), as beautifully designed as it is, costs a whopping £500/$500 without a graphics card—and that's if it's even in stock. Meanwhile, the Asus ROG XG Station 2—which is most certainly not beautifully designed—costs £400/$400. When paired with a decent graphics card like an Nvidia GTX 1070 or an AMD RX 580, a full eGFX setup runs just shy of £900/$900, not including the price of a laptop to pair it with.

Fortunately, there's now another option. Sonnet, a US-based company that makes all manner of Thunderbolt expansion chassis for PC andMac, has released the[eGFX Breakaway Box](http://www.sonnettech.com/product/egfx-breakaway-box), a compact Thunderbolt 3 dock for PCIe graphics cards that costs just $300 \(UK price TBC\). While admittedly not the most attractive of devices \(if at least understated compared to the ROG XG Station 2\), the eGFX Breakaway Box is perfectly functional, pairing a 350W SFX power supply with one eight-pin \(6+2\) and one six-pin PCIe power connector for use with a graphics card TDP of up to 300W.

Theoretically, then, you can stuff a[Titan Xp](https://arstechnica.co.uk/gadgets/2017/04/nvidia-titan-xp-gp-102-details-price/)or[Vega FE](https://arstechnica.co.uk/gadgets/2017/07/amd-vega-fe-reviews/)inside the Breakaway Box and enjoy l33t-level gaming on a laptop. The reality, however, is more complex. Sonnet's Breakaway Box, coupled with some slick driver support from AMD, mean that yes, it is entirely possible to turn a thin-and-light ultrabook into a mean gaming machine capable of playing games like[_Doom_](https://arstechnica.co.uk/gaming/2016/05/doom-2016-single-player-review-back-to-basics/)and[_Rise of the Tomb Raider_](https://arstechnica.co.uk/gaming/2015/11/rise-of-the-tomb-raider-review-this-is-laras-best-adventure-yet/)at high settings and good frame rates. For those not interested in a separate desktop or a bulkier gaming laptop, an eGFX is a good solution.

But there are are limits to what can be done over Thunderbolt 3, with diminishing returns the more GPU power you pipe over the cable. That's not to mention that, in a world where the likes of a[GTX 1050 Ti](https://arstechnica.co.uk/gadgets/2017/01/best-budget-graphics-card/)or[GTX 1060](https://arstechnica.co.uk/gadgets/2016/07/nvidia-gtx-1060-review/)can fit inside a slim laptop, the eGFX isn't quite as alluring as it once was.

## Wait, why do I want one of these?

Still, there are reasons to be excited, not least of which is that the eGFX finally works without the need for complex driver setups \(on Windows 10 at least\), and can be hot-swapped without crashing your system. This is far cry from the early days of eGFXs when AMD launched the[XGH external graphics](https://arstechnica.com/uncategorized/2008/12/amds-xgh-external-gpus-may-soon-see-the-light-of-day/)standard, which essentially took the pins from PCIe slot and passed them through to an external connector \(a solution used by Alienware for its proprietary Graphics Amplifier\). Other connectivity standards at the time didn't have the bandwidth to support a graphics card, yet few laptop manufacturers implemented XGH.[Fujitsu Siemens' Graphics Booster](https://www.guru3d.com/articles-pages/amilo-sa3650-with-graphics-booster-review,1.html)is one of the rare commercial examples.

![](http://img2.tuicool.com/ANnA7jM.jpg!web)

[Enlarge](https://cdn.arstechnica.net/wp-content/uploads/sites/3/2017/07/image1b.jpg)/The Fujitsu Graphics Booster was one of the first commercially available external graphics cards.

Later, others launched graphics cards linked to[ExpressCard slots](https://www.banggood.com/Expresscard-Version-V8_0-EXP-GDC-Beast-Laptop-External-Independent-Video-Card-Dock-p-1009976.html), which offered just a single lane of PCIe bandwidth. Others still came up with wacky solutions that used internal mini-PCIe slots with carefully placed cables. Neither offered anywhere near the sort of bandwidth required to drive a graphics card properly, nor any official driver support from AMD and Nvidia.

That changed with the launch of Apple and Intel's Thunderbolt standard, which had support for external PCIe devices baked in. The first iteration of Thunderbolt in 2011 only supported up to 10Gbps of bandwidth, which wasn't quite enough for external GPUs. The arrival in 2013 of Thunderbolt 2, which doubled the available bandwidth to 20Gbps, triggered the start of viable external graphics solutions. And finally, with 2015's Thunderbolt 3, which uses the same connector as USB 3.1 and offers full compatibility with the USB standard, the PC industry seems to be properly on board with eGFX.

Following the launch of the Razer Core, one the first commercially available docks, AMD added support for eGFX via its[XConnect](https://arstechnica.co.uk/gaming/2016/03/amd-xconnect-external-gpu/)driver, which allows users to add and remove external graphics cards without restarting the computer each time. Nvidia has been less vocal about its support for external graphics, but sure enough, they work just fine via its Optimus driver, which has long been used to switch between discrete GPUs and integrated GPUs on Intel laptops. Both AMD and Nvidia show a list of applications currently using the eGFX, while also offering an option to close those applications and safely remove the dock.

While the driver side of eGFX has been simplified, the hardware side is still complex. Not all manufacturers implement the full X4 PCIe speed on their Thunderbolt 3 ports, instead falling back to X2. Even if they do, there's no guarantee that the laptop's BIOS allows eGFX to be connected. Sonnet has a list of compatible laptops on its website, although that doesn't appear to be updated all that often. The

[Dell Precision 7520](https://arstechnica.co.uk/gadgets/2017/07/dell-precision-7520-de-linux-review/)

I used, for example, works fine with eGFXs after a BIOS update, but isn't listed on the Sonnet website.

The applications for eGFX are broader than just games, although, naturally that's what most consumers are interested in. You can take a thin-and-light laptop like[HP's Spectre](https://arstechnica.co.uk/gadgets/2016/06/hp-spectre-13-review-uk-details/), attach a graphics dock with an AMD RX 560 inside, and play_Doom_at well over 100FPS on the internal 1080p display without issue. Or, as used by numerous VFX production houses in London's Soho, you can plug in one of Red's ludicrously expensive \(to the tune of £7,000\) Rocket-X accelerator cards for smooth scrubbing of 6K footage inside Adobe Premier.

Video capture cards like Blackmagic's Intensity Pro 4K, which only use a X4 interface, work well too, as do high-end audio interfaces like the £6000 Avid Pro Tools HD Native+. Indeed, for the predominantly Mac-based music production industry, external PCIe boxes have been the only way to add essential hardware to Macs since Apple launched the trashcan Mac Pro.

Source: https://arstechnica.com/gadgets/2017/08/laptop-external-graphics-card-review/?mbid=synd_digg

