---
title: Generative Long Short-Term Memory Networks
---

The Long Short-Term Memory recurrent neural network was developed for sequence prediction.

In addition to sequence prediction problems. LSTMs can also be used as a generative model

In this post, you will discover how LSTMs can be used as generative models.

After completing this post, you will know:

* About generative models, with a focus on generative models for text called language modeling.
* Examples of applications where LSTM Generative models have been used.
* Examples of how to model text for generative models with LSTMs.

Let’s get started.

![](http://img2.tuicool.com/q6NNrmV.jpg!web)

Gentle Introduction to Generative Long Short-Term Memory Networks

Photo by[Fraser Mummery](https://www.flickr.com/photos/73014677@N05/10035345914/), some rights reserved.

### Need help with LSTMs for Sequence Prediction?

Take my free 7-day email course and discover 6 different LSTM architectures \(with sample code\).

Click to sign-up and also get a free PDF Ebook version of the course.

[Start Your FREE Mini-Course Now!](https://machinelearningmastery.lpages.co/leadbox/1403a9373f72a2%3A164f8be4f346dc/5754903989321728/)

## Generative Models

LSTMs can be used as a generative model.

Given a large corpus of sequence data, such as text documents, LSTM models can be designed to learn the general structural properties of the corpus, and when given a seed input, can generate new sequences that are representative of the original corpus.

The problem of developing a model to generalize a corpus of text is called language modeling in the field of natural language processing. A language model may work at the word level and learn the probabilistic relationships between words in a document in order to accurately complete a sentence and generate entirely new sentences. At its most challenging, language models work at the character level, learning from sequences of characters, and generating new sequences one character at a time.

The goal of character-level language modeling is to predict the next character in a sequence.

—[Generating Text with Recurrent Neural Networks](http://www.cs.utoronto.ca/~ilya/pubs/2011/LANG-RNN.pdf), 2011.

Although more challenging, the added flexibility of a character-level model allows new words to be generated, punctuation added, and the generation of any other structures that may exist in the text data.

… predicting one character at a time is more interesting from the perspective of sequence generation, because it allows the network to invent novel words and strings.

—[Generating Sequences With Recurrent Neural Networks](https://arxiv.org/abs/1308.0850), 2013.

Language modeling is by far the most studied application of Generative LSTMs, perhaps because of the use of standard datasets where model performance can be quantified and compared. This approach has been used to generate text on a suite of interesting language modeling problems, such as:

* Generating Wikipedia articles \(including markup\).
* Generating snippets from great authors like Shakespeare.
* Generating technical manuscripts \(including markup\).
* Generating computer source code.
* Generating article headlines.

The quality of the results vary; for example, the markup or source code may require manual intervention to render or compile. Nevertheless, the results are impressive.

The approach has also been applied to different domains where a large corpus of existing sequence information is available and new sequences can be generated one step at a time, such as:

* Handwriting generation.
* Music generation.
* Speech generation.

![](http://img2.tuicool.com/qyyAbq6.png!web)

Example of LSTMs used in Automatic Handwriting Generation.

Taken from “[Generating Sequences With Recurrent Neural Networks](https://arxiv.org/abs/1308.0850)“, 2014.

## Generative LSTMs

A Generative LSTM is not really architecture, it is more a change in perspective about what an LSTM predictive model learns and how the model is used.

We could conceivably use any LSTM architecture as a generative model. In this case, we will use a simple Vanilla LSTM.

![](http://img0.tuicool.com/IVRRbmq.png!web)

Vanilla LSTM Architecture for Generative Models

In the case of a character-level language model, the alphabet of all possible characters is fixed. A one hot encoding is used both for learning input sequences and predicting output sequences.

A one-to-one model is used where one step is predicted for each input time step. This means that input sequences may require specialized handling in order to be vectorized or formatted for efficiently training a supervised model.

For example, given the sequence:

```
"hello world"
```

A dataset would need to be constructed such as:

```
'h' => 'e'
'e' => 'l'
'l' => 'l'
...

```

This could be presented as-is as a dataset of one time step samples, which could be quite limiting to the network \(e.g. no BPTT\).

Alternately, it could be vectorized to a fixed-length input sequence for a many-to-one time step model, such as:

```
['h', 'e', 'l'] => 'l'
['e', 'l', 'l'] => 'o'
['l', 'l', 'o'] => ' '
...
```

Or, a fixed-length output sequence for a one-to-many time step model:

```
'h' => ['e', 'l', 'l']
'e' => ['l', 'l', 'o']
'l' => ['l', 'o', ' ']
...
```

Or some variation on these approaches.

Note that the same vectorized representation would be required when making predictions, meaning that predicted characters would need to be presented as input for subsequent samples. This could be quite clumsy in implementation.

The internal state of the network may need careful management, perhaps reset at choice locations in the input sequence \(e.g. end of paragraph, page, or chapter\) rather than at the end of each input sequence.



## Summary

In this post, you discovered the use of LSTMs as generative models.

Specifically, you learned:

* About generative models, with a focus on generative models for text called language modeling.
* Examples of applications where LSTM Generative models have been used.
* Examples of how to model text for generative models with LSTMs.

Do you have any questions?

Ask your questions in the comments below and I will do my best to answer.

## Develop LSTMs for Sequence Prediction Today!

![](http://img1.tuicool.com/qE73Q3A.png!web)

#### Develop Your Own LSTM models in Minutes

…with just a few lines of python code

Discover how in my new Ebook:

[Long Short-Term Memory Networks with Python](https://machinelearningmastery.com/lstms-with-python/)

It provides**self-study tutorials**on topics like:

_CNN LSTMs, Encoder-Decoder LSTMs, generative models, data preparation, making predictions_and much more…

Finally Bring LSTM Recurrent Neural Networks to

Your Sequence Predictions Projects

Skip the Academics. Just Results.



Source: [https://machinelearningmastery.com/gentle-introduction-generative-long-short-term-memory-networks/](http://www.tuicool.com/articles/hit/2auUFfA)

