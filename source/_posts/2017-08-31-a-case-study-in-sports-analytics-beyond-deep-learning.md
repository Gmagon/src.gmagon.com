---
title: A Case Study in Sports Analytics-Beyond Deep Learning
---

When it comes to televised sporting events, the ability of the cameras to follow the action — both smoothly and accurately — can make or break the viewing experience. That’s why, last year, alongside California Institute of Technology Assistant Professor Yisong Yue, I and a team of collaborators from Disney Research and the University of British Columbia published a[paper](http://www.yisongyue.com/publications/cvpr2016_online_smooth_long.pdf)on automating broadcast cameras usingmachine learning.

The project was designed to improve the television broadcast experience by teaching automatic cameras to be more human like. This involved creating[machine learning algorithms](https://www.datascience.com/blog/introduction-to-machine-learning-algorithms)that trained automated cameras to strike a delicate balance between capturing all movements accurately and maintaining a smooth viewing experience. The Walt Disney Company plans to use this research to improve its soccer and basketball coverage.

Before I elaborate on the strategies we used to achieve this objective, which involved combining a deep neural network with a model-based approach, I want to take a step back and discuss, at a higher level, machine learning,deep learning, and imitation learning.

Machine Learning, Deep Learning, and Imitation Learning

[Machine learning techniques](https://www.datascience.com/resources/video/data-science-elevate-panel-real-world-machine-learning)

have led to remarkable success in a diverse range of data-driven applications, largely because of a massive increase of data and computational power. With this increased availability of data comes the opportunity to fit complex models to that data, and the more complex the model, the more accurate the predictions.

Additionally, computational advances have facilitated many modern data-driven methods; perhaps, most notably, the GPU-enabled acceleration of artificialneural networks, also called deep learning. Deep learning is the workhorse behind many of the recent breakthroughs in large-scale applications of machine learning, ranging from image classification, to object recognition, to more complicated sequence prediction tasks such as machine translation.

With an abundance of data, a deep artificial neural network can tease outstatistical patterns and solve difficult classification and regression tasks with remarkable accuracy. For many image classification problems, deep learning-based methods now can reliably outperform humans.

Below is a snapshot of typical deep learning training anddeployment. The model is represented by a multi-layer artificial neural network. Classification errors are propagated backward to improve prediction accuracy.

![](http://img0.tuicool.com/nUVJVjI.jpg!web)

**Deep learning approach. Image credit: Nvidia**

**
**

Another field within machine learning is imitation learning, in which an AI system is tasked with performing sequentialdecision making that mimics human demonstrations, a technique we employed in our camera automation project. 

Imitation Learning in the Sports Domain
Imagine the task of a professional camera operator: In every instance, he or she should process visual sensory input and position the camera in a way that best captures the scene in an aesthetically pleasing fashion. As a team, we were similarly tasked withteaching a machine to mimic human experts by smoothly composing a series of camera movements based on scene information.

Our project has major implications for television, as autonomous camera planning can bring high-quality broadcasting to a wider base ofsport events. This is especially true for amateur and junior events where access to professional camera work is often prohibitively expensive to obtain. So, how did we do it?


#### Deep Learning is Not Enough

As Professor Yue describes in the video above, simply throwingdata at a deep neural net did not yield optimal results. For an automated camera control application, both movement accuracy and human aesthetic intuition need to be taken into account.  

A machine learning method by itself can be very good at choosing the right camera orientation, but without incorporating a smooth model that imitates human actions over a wholesequence of movements, the camera will course correct step-by-step — resulting in a jerky and unpleasant viewing experience. Therefore, the solution was to combine powerful learning tools, such as deep learning, with less expressive — but more stable 

**—**

machine learning methods. This resulted in a smooth imitation learning algorithm capable of mimicking human decisions using much less data.  

Takeaway

It is likely that we will continue to see impressive results from deep learning-based systems in the coming years, thanks to expanding data andcomputing power. However, it’s worth keeping in mind that for many scenarios, clever algorithms can still greatly enhance — and even outperform — the raw power of data.

About the authors:

Hoang M. Le is a Ph.D. graduate student in machine learning at the California Institute of Technology. His research focuses on the theory and applications of sequential decision making and reinforcement learning.

Yisong Yue, who also contributed to this post, is an assistant professor in the 

Computing and Mathematical Sciences Department

 at the California Institute of Technology. Yisong's research lies primarily in the theory and application of statistical machine learning, and he is particularly interested in developing novel methods for

spatial–temporal

 reasoning, structured prediction, interactive learning systems, and learning with humans in the loop.



Source:  https://www.datascience.com/blog/beyond-deep-learning-a-case-study-in-sports-analytics