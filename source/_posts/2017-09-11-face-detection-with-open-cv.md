---
title: How does face detection with Open CV work?
---

![](http://ravindranaik.com/wp-content/uploads/2017/05/opencv_hor_900_1-300x100.jpg)

OpenCV is the most popular library for computer vision. Originally written in C/C++, it now provides bindings for Python.

OpenCV uses machine learning algorithms to search for faces within a picture. For something as complicated as a face, there isn’t one simple test that will tell you if it found a face or not. Instead, there are thousands of small patterns/features that must be matched. The algorithms break the task of identifying the face into thousands of smaller, bite-sized tasks, each of which is easy to solve. These tasks are also called [classifiers](http://en.wikipedia.org/wiki/Statistical_classification).

For something like a face, you might have 6,000 or more classifiers, all of which must match for a face to be detected \(within error limits, of course\). But therein lies the problem: For face detection, the algorithm starts at the top left of a picture and moves down across small blocks of data, looking at each block, constantly asking, “_Is this a face? … Is this a face? … Is this a face_?” Since there are 6,000 or more tests per block, you might have millions of calculations to do, which will grind your computer to a halt.

To make this work, OpenCV uses [cascades](http://docs.opencv.org/modules/objdetect/doc/cascade_classification.html). What’s a cascade? The best answer can be found from the [dictionary](http://dictionary.reference.com/browse/cascade):_A waterfall or series of waterfalls._

Like a series of waterfalls, the OpenCV cascade breaks the problem of detecting faces into multiple stages. For each block, it does a very rough and quick test. If that passes, it does a slightly more detailed test, and so on. The algorithm may have 30-50 of these stages or cascades, and it will only detect a face if all stages pass. The advantage is that the majority of the pictures will return negative during the first few stages, which means the algorithm won’t waste time testing all 6,000 features on it. Instead of taking hours, face detection can now be done in real time.

### Cascades in practice

Though the theory may sound complicated, in practice it is quite easy. The cascades themselves are just a bunch of XML files that contain OpenCV data used to detect objects. You initialize your code with the cascade you want, and then it does the work for you.

Since face detection is such a common case, OpenCV comes with a number of built-in cascades for detecting everything from faces to eyes to hands and legs. There are even cascades for non-human things.

Here is how face detection with OpenCV works.

Source: http://ravindranaik.com/face-detection-opencv/

