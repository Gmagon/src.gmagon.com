---
title: Discover Types of Sequence Prediction Problems
---

Sequence prediction is different from other types of supervised learning problems.

The sequence imposes an order on the observations that must be preserved when training models and making predictions.

Generally, prediction problems that involve sequence data are referred to as sequence prediction problems, although there are a suite of problems that differ based on the input and output sequences.

In this tutorial, you will discover the different types of sequence prediction problems.

After completing this tutorial, you will know:

* The 4 types of sequence prediction problems.
* Definitions for each type of sequence prediction problem by the experts.
* Real-world examples of each type of sequence prediction problem.

Let’s get started.

![](http://img0.tuicool.com/iyiIRjn.jpg!web)

Gentle Introduction to Making Predictions with Sequences

Photo by[abstrkt.ch](https://www.flickr.com/photos/xa4/6881309290/), some rights reserved.

## Tutorial Overview

This tutorial is divided into 5 parts; they are:

1. Sequence
2. Sequence Prediction
3. Sequence Classification
4. Sequence Generation
5. Sequence to Sequence Prediction

## Sequence

Often we deal with sets in applied machine learning such as a train or test sets of samples.

Each sample in the set can be thought of as an observation from the domain.

In a set, the order of the observations is not important.

A sequence is different. The sequence imposes an explicit order on the observations.

The order is important. It must be respected in the formulation of prediction problems that use the sequence data as input or output for the model.

### Sequence Prediction

Sequence prediction involves predicting the next value for a given input sequence.

For example:

* Given: 1, 2, 3, 4, 5
* Predict: 6

![](http://img1.tuicool.com/fa2YZ3m.png!web)

Example of a Sequence Prediction Problem

Sequence prediction attempts to predict elements of a sequence on the basis of the preceding elements

—[Sequence Learning: From Recognition and Prediction to Sequential Decision Making](http://www.sts.rpi.edu/~rsun/sun.expert01.pdf), 2001.

A prediction model is trained with a set of training sequences. Once trained, the model is used to perform sequence predictions. A prediction consists in predicting the next items of a sequence. This task has numerous applications such as web page prefetching, consumer product recommendation, weather forecasting and stock market prediction.

—[CPT+: Decreasing the time/space complexity of the Compact Prediction Tree](https://link.springer.com/chapter/10.1007/978-3-319-18032-8_49), 2015

Sequence prediction may also generally be referred to as “_sequence learning_“.

Learning of sequential data continues to be a fundamental task and a challenge in pattern recognition and machine learning. Applications involving sequential data may require prediction of new events, generation of new sequences, or decision making such as classification of sequences or sub-sequences.

—[On Prediction Using Variable Order Markov Models](http://www.jair.org/media/1491/live-1491-2335-jair.pdf), 2004.

Technically, we could refer to all of the following problems in this post as a type of sequence prediction problem. This can make things confusing for beginners.

Some examples of sequence prediction problems include:

* **Weather Forecasting**
. Given a sequence of observations about the weather over time, predict the expected weather tomorrow.
* **Stock Market Prediction**
. Given a sequence of movements of a security over time, predict the next movement of the security.
* **Product Recommendation**
. Given a sequence of past purchases of a customer, predict the next purchase of a customer.

## Sequence Classification

Sequence classification involves predicting a class label for a given input sequence.

For example:

* Given: 1, 2, 3, 4, 5
* Predict: “good” or “bad”

![](http://img0.tuicool.com/3iQBbar.png!web)

Example of a Sequence Classification Problem

The objective of sequence classification is to build a classification model using a labeled dataset D so that the model can be used to predict the class label of an unseen sequence.

— Chapter 14,[Data Classification: Algorithms and Applications](http://www.amazon.com/dp/B00MOU4SC0?tag=inspiredalgor-20), 2015

The input sequence may be comprised of real values or discrete values. In the latter case, such problems may be referred to as discrete sequence classification.

Some examples of sequence classification problems include:

* **DNA Sequence Classification**
. Given a DNA sequence of ACGT values, predict whether the sequence codes for a coding or non-coding region.
* **Anomaly Detection**
. Given a sequence of observations, predict whether the sequence is anomalous or not.
* **Sentiment Analysis**
. Given a sequence of text such as a review or a tweet, predict whether sentiment of the text is positive or negative.

## Sequence Generation

Sequence generation involves generating a new output sequence that has the same general characteristics as other sequences in the corpus.

For example:

* Given: \[1, 3, 5\], \[7, 9, 11\]
* Predict: \[3, 5 ,7\]

\[recurrent neural networks\] can be trained for sequence generation by processing real data sequences one step at a time and predicting what comes next. Assuming the predictions are probabilistic, novel sequences can be generated from a trained network by iteratively sampling from the network’s output distribution, then feeding in the sample as input at the next step. In other words by making the network treat its inventions as if they were real, much like a person dreaming

—[Generating Sequences With Recurrent Neural Networks](https://arxiv.org/abs/1308.0850), 2013.

Some examples of sequence generation problems include:

* **Text Generation**
. Given a corpus of text, such as the works of Shakespeare, generate new sentences or paragraphs of text that read like Shakespeare.
* **Handwriting Prediction**
. Given a corpus of handwriting examples, generate handwriting for new phrases that has the properties of handwriting in the corpus.
* **Music Generation**
. Given a corpus of examples of music, generate new musical pieces that have the properties of the corpus.

Sequence generation may also refer to the generation of a sequence given a single observation as input.

An example is the automatic textual description of images.

* **Image Caption Generation**
. Given an image as input, generate a sequence of words that describe an image.

![](http://img2.tuicool.com/Vzeuuai.png!web)

Example of a Sequence Generation Problem

Being able to automatically describe the content of an image using properly formed English sentences is a very challenging task, but it could have great impact, for instance by helping visually impaired people better understand the content of images on the web. \[…\] Indeed, a description must capture not only the objects contained in an image, but it also must express how these objects relate to each other as well as their attributes and the activities they are involved in. Moreover, the above semantic knowledge has to be expressed in a natural language like English, which means that a language model is needed in addition to visual understanding.

—[Show and Tell: A Neural Image Caption Generator](https://arxiv.org/abs/1411.4555), 2015

## Sequence-to-Sequence Prediction

Sequence-to-sequence prediction involves predicting an output sequence given an input sequence.

For example:

* Given: 1, 2, 3, 4, 5
* Predict: 6, 7, 8, 9, 10

![](http://img2.tuicool.com/7vayEnq.png!web)

Example of a Sequence-to-Sequence Prediction Problem

Despite their flexibility and power, \[deep neural networks\] can only be applied to problems whose inputs and targets can be sensibly encoded with vectors of fixed dimensionality. It is a significant limitation, since many important problems are best expressed with sequences whose lengths are not known a-priori. For example, speech recognition and machine translation are sequential problems. Likewise, question answering can also be seen as mapping a sequence of words representing the question to a sequence of words representing the answer.

—[Sequence to Sequence Learning with Neural Networks](https://arxiv.org/abs/1409.3215), 2014

It is a subtle but challenging extension of sequence prediction where rather than predicting a single next value in the sequence, a new sequence is predicted that may or may not have the same length or be of the same time as the input sequence.

This type of problem has recently seen a lot of study in the area of automatic text translation \(e.g. translating English to French\) and may be referred to by the abbreviation seq2seq.

seq2seq learning, at its core, uses recurrent neural networks to map variable-length input sequences to variable-length output sequences. While relatively new, the seq2seq approach has achieved state-of-the-art results in not only its original application – machine translation.

—[Multi-task Sequence to Sequence Learning](https://arxiv.org/abs/1511.06114), 2016.

If the input and output sequences are a time series, then the problem may be referred to as multi-step time series forecasting.

* **Multi-Step Time Series Forecasting**
. Given a time series of observations, predict a sequence of observations for a range of future time steps.
* **Text Summarization**
. Given a document of text, predict a shorter sequence of text that describes the salient parts of the source document.
* **Program Execution**
. Given the textual description program or mathematical equation, predict the sequence of characters that describes the correct output.

## Further Reading

This section provides more resources on the topic if you are looking go deeper.

* [Sequence on Wikipedia](https://en.wikipedia.org/wiki/Sequence)
* [CPT+: Decreasing the time/space complexity of the Compact Prediction Tree](https://link.springer.com/chapter/10.1007/978-3-319-18032-8_49)
, 2015
* [On Prediction Using Variable Order Markov Models](http://www.jair.org/media/1491/live-1491-2335-jair.pdf)
, 2004
* [An Introduction to Sequence Prediction](http://data-mining.philippe-fournier-viger.com/an-introduction-to-sequence-prediction/)
, 2016
* [Sequence Learning: From Recognition and Prediction to Sequential Decision Making](http://www.sts.rpi.edu/~rsun/sun.expert01.pdf)
, 2001
* Chapter 14, Discrete Sequence Classification,
[Data Classification: Algorithms and Applications](http://amzn.to/2tkM723)
, 2015
* [Generating Sequences With Recurrent Neural Networks](https://arxiv.org/abs/1308.0850)
, 2013
* [Show and Tell: A Neural Image Caption Generator](https://arxiv.org/abs/1411.4555)
, 2015
* [Multi-task Sequence to Sequence Learning](https://arxiv.org/abs/1511.06114)
, 2016
* [Sequence to Sequence Learning with Neural Networks](https://arxiv.org/abs/1409.3215)
, 2014
* [Recursive and direct multi-step forecasting: the best of both worlds](https://robjhyndman.com/papers/rectify.pdf)
, 2012

## Summary

In this tutorial, you discovered the different types of sequence prediction problems.

Specifically, you learned:

* The 4 types of sequence prediction problems.
* Definitions for each type of sequence prediction problem by the experts.
* Real-world examples of each type of sequence prediction problem.

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


Source: https://machinelearningmastery.com/sequence-prediction/