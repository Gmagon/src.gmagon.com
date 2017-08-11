---
title: 'We Should Stop Here, It’s Bat Country!'
---

![](http://img1.tuicool.com/3aqmeeV.png!web)

\[Roland Meertens\] has a bat detector, or rather, he has a device that can record ultrasound – the type of sound that bats use to echolocate. What he wants is a bat detector. When he discovered bats living behind his house, he set to work creating[a program that would use his recorder to detect when bats were around](http://www.pinchofintelligence.com/detecting-bats-recognising-sound-tensorflow/).

\[Roland\]’s workflow consists of breaking up a recording from his backyard into one second clips, loading them in to a Python program and running some machine learning code to determine whether the clip is a recording of a bat or not and using this to determine the number of bats flying around. He uses several Python libraries to do this including[Tensorflow](https://www.tensorflow.org/)and[LibROSA](https://librosa.github.io/librosa/).

The Python code breaks each one second clip into twenty-two parts. For each part, he determines the max, min, mean, standard deviation, and max-min of the sample – if multiple parts of the signal have certain features \(such as a high standard deviation\), then the software has detected a bat call. Armed with this, \[Roland\] turned his head to the machine learning so that he could offload the work of detecting the bats. Again, he turned to Python and the[Keras](https://keras.io/)library.

With a 95% success rate, \[Roland\] now has a bat detector! One that works pretty well, too. For more on detecting bats and machine learning, check out the[bat detector in this list](https://hackaday.com/2016/01/16/hacklet-91-ultrasonic-projects/)of ultrasonic projects and check out this[IDE for working with Tensorflow](https://hackaday.com/2017/06/27/machine-learning-ide-in-alpha/)and machine learning.



Source: [http://hackaday.com/2017/08/10/we-should-stop-here-its-bat-country/](http://www.tuicool.com/articles/hit/eeaYjeY)

