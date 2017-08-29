---
title: List of some of the largest cryptocurrency hacks so far
---

![](https://i.imgur.com/3qvCwHS.jpg)

There’s been quite a few large, high profile cryptocurrency hacks over the past few years. Hundreds of millions of dollars have been stolen. Although blockchain technology is fundamentally more secure than centralized database systems, the ecosystem is still incredibly young and poor programming practices create many security vulnerabilities, especially with systems built around blockchains.

Here’s a list of some of the largest cryptocurrency hacks so far.

# August 2010 - Bitcoin protocol hack, 184 billion Bitcoins created 

On August 15th 2010, Jeff Garzik, a Bitcoin Core developer, noticed that someone was able to generate a 184 billion Bitcoin transaction in a single block. Bitcoin’s maximum supply is supposed to be capped at 21 million. Garzik[posted this revelation on bitcointalk](https://bitcointalk.org/index.php?topic=822.0).

The attacker was able to abuse a bug in the code used to check transactions before including them in a block. The code had an integer overflow bug and couldn’t detect when a transaction contained outputs that summed over 2^64 satoshis \(i.e. 184 billion BTC\). Instead of realizing that such a transaction contained an insane amount of BTC, the Bitcoin network actually thought that there was only a small amount. The attacker exploited this bug and issued a transaction with outputs summing to just over 2^64 satoshis. This transaction was accepted by the blockchain and it was lucky that it was detected by Garzik 1.5 hours after the transaction occured.

2.5 hours later, Gavin Andresen patched the bug. It took another hour for Satoshi to accept the patch. A hard fork was then deployed and the new chain rolled back the 184 billion transaction and every transaction after it.

Although no funds were lost during this attack, it was still a significant event for Bitcoin. The quick response by the devs to fix the bug and revert the attack instilled new confidence in the budding currency and demonstrated Bitcoin’s resiliency to malicious attacks.

# March 2014 - Mt. Gox exchange hack with $473 million stolen 

The Mt. Gox hack is the largest cryptocurrency disaster to ever occur to this date. In total, $473 million worth of Bitcoin was stolen from the exchange. This theft occured over several years.

Prior to the hack, Mt. Gox was one of the largest cryptocurrency exchanges and at one point, was handling over 70% of all Bitcoin transactions worldwide. However, due to an abysmal CEO, a dysfunctional engineering organization, and poor code, unknown hackers were able siphon Bitcoin from the exchange without detection for years.

Much of the blame can be laid on Mark Karpeles, the CEO of the company. Karpeles was more of a childish, idealistic programmer than a CEO and seemingly thought of Mt. Gox as an interesting side project. For example, an insider claimed that Mt. Gox didn’t use any version control software and the only person that could approve changes to the source code was Mark Karpeles himself.

Version control software \(VCS\) provides significant programming benefits. First, it gives the programmer a concise and complete history of change in the codebase. Using VCS, a programmer can see who made what changes at what time and s/he could also temporarily or permanently rollback changes. Second, VCS allows multiple programmers to work on the codebase at the same time without stepping on each other’s toes. Git, for example, elegantly merges different changes to the same file and provides a nice way to fix any conflicts. Without VCS, it’d be a coordination nightmare for a large group of programmers working on the same codebase. Now realize that this codebase handles millions of dollars of transactions a day and you’ll see how scary the whole situation was.

Furthermore, Karpeles should definitely not be the sole person approving code. A CEO should be focused on high level challenges such as developing business strategy and managing the overall operations and resources of a company. Karpeles’s insistence on being the sole authority to approve code just shows how immature and flawed his management style was. Mt. Gox is not your personal programming project, it’s a professional financial services company and you need to let your engineers take care of the code.

This, of course, resulted in a highly unsecure codebase. Competent software engineers would have left such a dysfunctional engineering organization in a heartbeat and those who did stay would find their security patches often forgotten by Karpeles. Could it even be possible that Mt. Gox was hacked by a former engineer that was tired of Karpeles’s bullshit?![](https://i.imgur.com/sE6ME2O.jpg)In any case, major red flags started appearing in early February 2014 before the eventual closure of the exchange in late February. Here’s an excerpt from Wikipedia on the series of events leading up to the exchange’s collapse:

> On 7 February 2014, Mt. Gox halted all bitcoin withdrawals. The company said it was pausing withdrawal requests “to obtain a clear technical view of the currency processes”. The company issued a press release on February 10, 2014, stating that the issue was due to transaction malleability: “A bug in the bitcoin software makes it possible for someone to use the bitcoin network to alter transaction details to make it seem like a sending of bitcoins to a bitcoin wallet did not occur when in fact it did occur. Since the transaction appears as if it has not proceeded correctly, the bitcoins may be resent. Mt Gox is working with the bitcoin core development team and others to mitigate this issue.”
>
> On 17 February 2014, with all Mt. Gox withdrawals still halted and competing exchanges back in full operation, the company published another press release indicating the steps it claimed it was taking to address security issues. In an email interview with the Wall Street Journal, CEO Mark Karpeles refused to comment on increasing concerns among customers about the financial status of the exchange, did not give a definite date on which withdrawals would be resumed, and wrote that the exchange would impose “new daily and monthly limits” on withdrawals if and when they were resumed. A poll of 3,000 Mt. Gox customers by CoinDesk indicated that 68% of polled customers were still awaiting funds from Mt. Gox. The median waiting time was between one and three months, and 21% of poll respondents had been waiting for three months or more.
>
> On 20 February 2014, with all withdrawals still halted, Mt. Gox issued yet another statement, not giving any date for the resumption of withdrawals. A protest by two bitcoin enthusiasts outside the building that houses the Mt. Gox headquarters in Tokyo continued. Citing “security concerns”, Mt. Gox moved its offices to a different location in Shibuya. Bitcoin prices quoted by Mt. Gox dropped to below 20% of the prices on other exchanges, reflecting the market’s estimate of the unlikelihood of Mt. Gox paying its customers.
>
> On 23 February 2014, Mt. Gox CEO Mark Karpeles resigned from the board of the Bitcoin Foundation. The same day, all posts on its Twitter account were removed.
>
> On 24 February 2014, Mt. Gox suspended all trading, and hours later its website went offline, returning a blank page. A leaked alleged internal crisis management document claimed that the company was insolvent, after having lost 744,408 bitcoins in a theft which went undetected for years. Six other major bitcoin exchanges released a joint statement distancing themselves from Mt. Gox, shortly before Mt. Gox’s website went offline.
>
> On 25 February 2014, Mt. Gox reported on its website that a “decision was taken to close all transactions for the time being”, citing “recent news reports and the potential repercussions on Mt Gox’s operations”. Chief executive Mark Karpeles told Reuters that Mt. Gox was “at a turning point”.
>
> From 1 February 2014 until the end of March, during the period of Mt. Gox problems, the value of bitcoin declined by 36%.
>
> On 28 February 2014 Mt. Gox filed in Tokyo for a form of bankruptcy protection from creditors called minji saisei \(or civil rehabilitation\) to allow courts to seek a buyer, reporting that it had liabilities of about 6.5 billion yen \($65 million, at the time\), and 3.84 billion yen in assets. The company said it had lost almost 750,000 of its customers’ bitcoins, and around 100,000 of its own bitcoins, totaling around 7% of all bitcoins, and worth around $473 million near the time of the filing. Mt. Gox released a statement saying, “The company believes there is a high possibility that the bitcoins were stolen,” blamed hackers, and began a search for the missing bitcoin. Chief Executive Karpeles said technical issues opened up the way for fraudulent withdrawals.

Investigations on the Mt. Gox case have been ongoing since it filed for bankruptcy in 2014 and recent revelations showed that the exchange was very likely targeted by Eurasian hackers with the stolen BTC laundered through another exchange, BTC-e. The owner and operator of BTC-e, Alexander Vinnik, was arrested in Athens on July 25th. Vinnik is accused of using BTC-e and Tradehill, another U.S.-based exchange he owned, to process funds “obtained” from Mt. Gox between 2011 and 2014. BTC-e is believed to have processed more than 300,000 bitcoins in transactions that can be traced to the theft.

# January 2015 - Bitstamp exchange hack with $5.1 million stolen 

Bitstamp suspended trading in January 2015 after one of its active operational Bitcoin storage wallets \(AKA hot wallets\) was compromised. The hackers made away with 19,000 Bitcoins which represent roughly $5,000,000 at the time.

Most of Bitstamp’s Bitcoins are stored in cold wallet reserves \(i.e. wallets stored in servers not connected to the internet\). Its most recent proof-of-reserve showed that it held 183,497 bitcoins in its cold wallet reserve - or about $96.9 million at the time. Although losing $5,000,000 from a hot wallet is a big deal, it’s not disastrous.

Nevertheless, Bitstamp’s Bitcoin price still plummeted after news of the breach broke.

Investigations into the breach showed that many of Bitstamp’s employees were targeted in a weeks-long phishing attempt. Those behind the attack used Skype and email to communicate with employees and attempted to distribute files containing malware by appealing to their personal histories and interests. Bitstamp’s system became compromised after systems administrator Luka Kodric downloaded a file that he believed had been sent by a representative for an organization that was seeking his membership.

# June 2016 - Decentralized Autonomous Organization \(DAO\) hack with $50 million stolen![](https://i.imgur.com/ppWQMoI.jpg)The DAO was an Ethereum project. Its goal was to codify the rules and decision-making apparatus of an orgnization, eliminating the need for documents and people in governing, creating a structure with decentralized control. 

According to this CoinDesk[article](https://www.coindesk.com/understanding-dao-hack-journalists/), here’s how it works:

* A group of people writes the smart contracts \(programs\) that will run the organization
* There is an initial funding period, in which people add funds to the DAO by purchasing tokens that represent ownership – this is called a crowdsale, or an initial coin offering \(ICO\) – to give it the resources it needs.
* When the funding period is over, the DAO begins to operate.
* People then can make proposals to the DAO on how to spend the money, and the members who have bought in can vote to approve these proposals.

The DAO ICO launched on April 30th, 2016 with a 28-day funding window. It became the largest crowdfunding in history at the time, raising over $150 million from more than 11,000 contributors.

The DAO smart contract code had a critical vulnerability though and an attacker was able to create a child DAO and drain Ether from the real DAO. By June 18th, the attacker managed to drain 3.6 million Ether from the real DAO into the child DAO.

The Ethereum Foundation’s response was to hard fork the Ethereum blockchain in order to move all the Ether from the hacker’s account \(approximately $50 million\) to a new address. DAO curators were then chosen to oversee the distribution of the DAO’s crowdsale funds back to its original contributors.

Although the hard fork managed to revert the attack and helped DAO investors recover their funds, it was controversial. Some members of the Ethereum community were concerned it might undermine the perception that the blockchain was immutable, and that contract agreements, once settled to the blockchain, would be final.

Surprisingly, the legacy Ethereum chain post-hard-fork did not die out and continued to exist, eventually becoming known as Ethereum Classic. For some reason, Ethereum Classic was quickly listed on a few large cryptocurrency exchanges such as Poloniex. This cemented it as another serious altcoin and today, has a market cap of $1.4 billion.

# July 2016 - Steemit.com hack with $85,000 stolen 

Steem is a social media blockchain where users get rewarded for creating or curating good content. Steemit.com is a website that hosts content posted on the Steem blockchain and it’s the original and most popular UI used to interact with the blockchain.

Users can have their accounts hosted on Steemit.com. Each account is associated with a Steem wallet and users are able to claim Steem Dollar/Steem rewards while also being able to deposit and withdraw Steem Dollars/Steem.

On July 2016, Steemit was attacked with around 260 accounts being compromised. In total, around $85,000 worth of Steem and Steem Dollars were stolen. This is the risk of having a centralized database store cryptocurrency wallets.

# August 2016 - Bitfinex hack with $66 million stolen 

The Bitfinex hack was the second-biggest breach of a Bitcoin exchange platform at the time \(first place goes to Mt. Gox\). A total of 120,000 Bitcoin were stolen. This was worth about $72 million at the time. Bitfinex first announced the security breach on August 2, 2016.

The attackers exploited a vulnerability with Bitfinex’s multisignature wallets used to store their customer’s funds. A multisignature wallet has keys divided among a number of owners to manager risk. In order to send a transaction, all parties need to sign off on it. In the case of Bitfinex, it had a system set up with another company, BitGo, whereby Bitfinex would store two keys and BitGo would store one key.

In this setup, BitGo would act as an additional layer of security and verify any transactions leaving Bitfinex. This allowed Bitfinex to reduce the use of cold storage wallets and had many customer’s funds stored in hot wallets. When Bitfinex’s servers were hacked, the attackers managed to not only get Bitfinex to sign off on illegal Bitcoin withdrawals, the BitGo security layer somehow failed as well and BitGo co-signed the illegal withdrawals.

The details are murky on how the attackers managed to get BitGo to co-sign the transactions. BitGo has publicly confirmed that their own servers were not compromised. The rumour is that the system Bitfinex setup was broken such that BitGo would do whatever Bitfinex said to do with a user’s funds. As such, Bitfinex’s multisignature wallet system really only had a single point of failure - Bitfinex’s servers - and it’s really no different than simply using hot wallets.

# July 2017 - CoinDash ICO hack with $7 million stolen 

![](https://i.imgur.com/v0G6PIN.jpg)

An attacker exploited a vulnerability found in Parity Multisig Wallet version 1.5+. S/he used this vulnerability to drain Ether from three high-profile multisignature contracts used to store funds from previous ICOs \(Edgeless Casino, Swarm City, and æternity blockchain\). In total, 153,037 Ether was stolen.

On July 19th, Parity issued a security warning on its website detailing the discovery of the vulnerability: “A vulnerability in Parity Wallet’s variant of the standard multi-sig contract has been found - Immediately move assets contained in the multi-sig wallet to a secure address”.

Fortunately, on release of this statement, a group of white hat hackers took it upon themselves to drain the funds of other multi-sig wallets belonging to other ICOs before the malicious hackers were able to get to them as well.

# August 2017 - Enigma ICO hack with $500,000 stolen 

The Enigma ICO was hacked in a very different way from the CoinDash ICO. Enigma was started by a group of MIT graduates and the project was able to create a strong community of over 9,000 users who joined the project’s mailing list and Slack group.

The hacker was able to break into Enigma’s website, Slack group, and mailing list and sent fraudulent messages to the project’s community asking for money. This allowed the hacker to gather almost 1,500 Ether \(about $500,000\). This is despite a previous warning by Enigma that it would not collect money in this way until its ICO in September.

It was discovered that Enigma’s CEO Guy Zyskind’s email credentials had been dumped on the internet from the hacking of different services in the past. Zyskind failed to change the password to his email and this, coupled with the lack of two-factor authentication setup, allowed the hacker to access Enigma’s website, Slack group, and mailing list.

The hack was particularly embarassing not only because it could have easily been avoided if two-factor authentication was in place, but also because another Enigma cofounder had recently shared his “simple solution” for preventing ICO hacks on Business Insider.

Source: [https://storeofvalue.github.io/posts/cryptocurrency-hacks-so-far-august-24th/](https://storeofvalue.github.io/posts/cryptocurrency-hacks-so-far-august-24th/)

