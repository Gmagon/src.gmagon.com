---
title: Google’s Transformer solves a tricky problem in machine translation
---

![](https://tctechcrunch2011.files.wordpress.com/2017/07/google-feed1.png)Machine learning has turned out to be a very useful tool for translation, but it has a few weak spots. The tendency of translation models to do their work word by word is one of those, and can lead to serious errors. Google details the nature of this problem, and their solution to it,[in an interesting post on its Research blog](https://research.googleblog.com/2017/08/transformer-novel-neural-network.html).

The problem is explained well byJakob Uszkoreit, in the company’s natural language processing department. Consider the two following sentences:

> I arrived at the bank after crossing the street.

> I arrived at the bank after crossing theriver.

Obviously “bank” means something different in each sentence, but an algorithm chewing its way through might very easily pick the wrong one — since it doesn’t know which “bank” is the right one until it gets to the_end_of the sentence. This kind of ambiguity is everywhere once you start looking for it.

Me, I would just rewrite the sentence \(Strunk and White warned about this\), but of course that’s not an option for a translation system. And it would be very inefficient to modify the neural networks to basically translate the whole sentence to see if there’s anything weird going on, then try again if there is.

Google’s solution is what’s called an attention mechanism, built into a system it calls Transformer. It compares each word to every_other_word in the sentence to see if any of them will affect one another in some key way — to see whether “he” or “she” is speaking, for instance, or whether a word like “bank” is meant in a particular way.

When the translated sentence is being constructed, the attention mechanism compares each word as it is appended to every other one. This gif illustrates the whole process. Well, kind of.

![](https://tctechcrunch2011.files.wordpress.com/2017/08/transform20fps.gif?w=800&h=708)

If this all sounds familiar, it may be because you read about it earlier this week:[a competing translation company, DeepL](https://techcrunch.com/2017/08/29/deepl-schools-other-online-translators-with-clever-machine-learning/), also uses an attention mechanism. Its co-founder cited this problem as one they had worked hard on as well, and even mentioned the paper Google’s post is based on \([Attention is all you need](https://arxiv.org/abs/1706.03762)\) — though obviously they made their own version. And a very effective one it is — perhaps even better than Google’s.

An interesting side effect of Google’s approach is that it gives a window into the system’s logic: because Transformer gives each word a score in relation to every other word, you can see what words it thinks are related, or potentially related:

![](https://tctechcrunch2011.files.wordpress.com/2017/08/image21.png)Pretty cool, right? Well, I think it is. That’s another type of ambiguity, where “it” could refer to either the street or the animal, and only the final word gives it away. We’d figure it out automatically, but machines must still be taught.

Source: https://techcrunch.com/2017/08/31/googles-transformer-solves-a-tricky-problem-in-machine-translation/

