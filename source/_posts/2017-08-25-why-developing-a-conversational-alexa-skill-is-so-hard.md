---
title: Why Developing A Conversational Alexa Skill Is So Hard?
---

Developing an Alexa skill that executes simple commands is pretty straightforward. But when you want to engage the user in a conversation, things get much more complex. Here’s why.

Most Alexa skills seem to fit a simple pattern of performing user commands. Some of these commands may have parameters such as a song title or the name of a city, but the communication usually doesn’t go beyond this. But if you want an actual conversation to take place within your skill, funny things start happening. In the following sections, I’ll share our experience and a few tips that may help you work around some of the issues you’re going to face. You’ll also get a peek into the language that humans use when talking to a machine.

![](https://blog.infermedica.com/content/images/2017/08/why-its-hard-to-develop-an-alexa-skill-1@2x-3.png)

# Symptom checker skill {#symptomcheckerskill}

We have recently published[an Alexa skill that asks you to name your symptoms](https://www.amazon.com/Infermedica-Symptom-Checker/dp/B071JFJWZC/)and conducts a simple interview leading to the identification of possible causes of your health problems. The skill was built using[our API](https://developer.infermedica.com/), which features both a symptom-checking engine and NLP capabilities \(capturing symptoms mentioned in English messages\). The skill is meant as a proof-of-concept to encourage others to develop their own voice applications using our API offering.

During the process we have faced some obstacles, in areas other than we anticipated. Please note that we haven’t even attempted to handle an entirely free-form dialogue; our conversation structure is more or less fixed. Such fixed flow, however, was already a challenge for the conventional skill design process.

# Conversation-unfriendly {#conversationunfriendly}

You might get the impression that Amazon is discouraging you from engaging in conversations with your users. Of the ten examples listed on their[developer portal](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/getting-started-guide#what-kind-of-skill-do-you-want-to-create), only one is conversational in nature \(playing Jeopardy\). The rest boils down to acting upon a simple request and quitting \(looking up simple answers, spitting out a piece of news, or controlling lights or an audio player\).

> “Amazon may have anticipated that giving developers too much freedom would result in a constant lack of understanding, which, at the end of the day, would be blamed on Alexa itself.”

I can think of two possible reasons for this. First, these apps were supposed to be additional_skills_that enhance the main experience, thus giving the impression that the primary conversation takes place outside specific apps. Secondly, Amazon may have anticipated that giving developers too much freedom would result in a constant lack of understanding, which, at the end of the day, would be blamed on Alexa itself.

## Intents and slots {#intentsandslots}

Alexa’s interaction model is not conversation-friendly. In Alexa’s terms, this sort of interaction may be achieved using the “custom skill” type. However, if you’re expecting to find a convenient framework for implementing a custom chat, you’ll be disappointed. Even when using a “custom skill”, you're forced to enumerate a fixed set of_intents_that you allow the user to express. An intent might be a desire to order coffee or find movie titles. Confirmation \(saying “yes” in response to a question\) and denial \(“no”\) are also intents. Some intents may have_slots_for parameters, such as a city name or type of coffee. You have to specify the type of each slot; you can either use one of the predefined types, or you need to — you guessed it — enumerate a fixed set of values. It’s hard to imagine a casual chat having this level of rigor.

> “Alexa’s interaction model is not conversation-friendly.”

Now imagine that you’re trying to make a skill that can read your symptoms and narrow down their most likely causes \(as we did\). While it is technically feasible to enter the names of the over 1,400 symptoms currently defined in our medical knowledge base, it is impossible to provide multiple synonymous expressions for each value \(say, “earache”, “pain in my ear”, “ear hurts”\). Even if this were possible, maintaining this sort of a list independently of the main knowledge base would kill any real life project in no time.

## What you can do {#whatyoucando}

There is a proven workaround for this. What you need to do is force Alexa into thinking that:

1. Whatever the user says fits into a one-and-only catch-it-all intent.
2. This intent itself is one huge slot of the
   `AMAZON.LITERAL`
   type. This type is our ticket to freedom — it makes it possible to catch any text. Note that its use is discouraged by Amazon \(once it was even
   [scheduled for removal](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/migrating-to-the-improved-built-in-and-custom-slot-types#literal)
   in future versions, but apparently they changed their minds\).

Note that to have the skill approved you’ll also need to add in three obligatory intents: calling for help, cancelling the current action and asking the cylinder to shut up.

In sample utterances, you should include a one-word message and some longer examples to let Alexa learn that every possible utterance fits our intent. The built-in intents require no examples.

The recipe has two parts:[intent schema](https://gist.github.com/adam-ra/01c335833bea7da2d2797fcca5e818a4)and[sample utterances](https://gist.github.com/adam-ra/e5cee2ed87e65976bfc392fade325d82). This way you’ll effectively prevent Alexa from trying to capture intents and slots in user utterances, giving you access to the entire original text that was transcribed from the user’s speech via Alexa Voice Services. This means that you’re left alone with unstructured text messages, and your app is supposed to send back text replies. Enter the[world of chatbots](https://blog.infermedica.com/three-challenges-youre-going-to-face-when-building-a-chatbot/)!

# Dealing with misheard words {#dealingwithmisheardwords}

Despite all the hype and glory, Alexa Voice Services, the underlying voice recognition platform, is far from perfect. A known source of trouble is[having a non-standard accent](https://www.wired.com/2017/03/voice-is-the-next-big-platform-unless-you-have-an-accent/). But practical issues seem to go far beyond that.

> “We should expect some errors to appear, especially if the utterance is atypical or simply short — there’s just not enough context to disambiguate.”

Readers interested in Natural Language Processing should know that no real-life speech recognition would be possible without large-scale[statistical language modeling](https://www.microsoft.com/en-us/research/project/language-modeling-for-speech-recognition/). The acoustic signal is highly ambiguous, and it takes a vast amount of known word-after-word patterns for a system to decide what is actually being said. If this seems counter-intuitive to you, try to recall the last time you were trying to give someone a surname, address or wifi password over the phone. Communicating messages like these is difficult because the receiver’s brain has no adequate language model for them.

This is all to say that we should expect some errors to appear, especially if the utterance is atypical or simply short — there’s just not enough context to disambiguate.

## Are you email or mail? {#areyouemailormail}

Lack of context is a common problem. At some point in our interview, we need to learn the user’s age and gender. The latter question is causing a surprising amount of trouble. If the answer is “male”, it is simply never understood as such. The most commonly \(mis\)heard answer is “mail”, followed by some longer phrases such as “I a mail” or even “can you mail”. Since we have no access to voice recordings, we can only guess what the users wanted to say. Some of the unexpected words seen in the logs might have resulted from mumbling or even from multiple people speaking in the room. Alexa’s language model has fewer problems with interpreting “female”, but it is not unusual to see “email” in the transcripts.

How do we deal with these? Well, in the case of this simple two-choice question we hardcoded the most common patterns and pretended nothing unusual was happening.

A bigger issue emerges when misinterpreted utterances are answers to open-ended questions. Yes, this happens a lot when we’re trying to understand descriptions of users’ health problems. A dive into anonymous logs revealed many complaints about “coffins” and “coffee” \(coughing?\). These take various forms, for instance, “I have a drive coffin a fever” \(dry coughing and fever?\), and one dramatic confession: “I am coffee” \(I am coughing?\). We have also discovered Alexa’s weird affinity for Disney \(_dizzy_, perhaps also_dyspnea_\).

## The best language models are domain-dependent {#thebestlanguagemodelsaredomaindependent}

Many of these issues could be resolved with domain-specific language models. Unfortunately, Alexa offers just one general-purpose speech recognizer with no way of injecting extra-linguistic context. An ideal solution would allow us to select one of several pre-trained, domain-specific models, such as medical domain, IT and management, casual gossip and lifestyle, etc. It would also be helpful to be able to boost the probabilities of certain expected phrases \(such as “female” and “male”\). We hope that both will eventually be offered on all major voice platforms.

# Voice communication encourages freer language {#voicecommunicationencouragesfreerlanguage}

Chat language is casual. In the case of chatbots, the user’s language is partially tamed by the use of instant response templates. Also, some chatbots give verbose introductions that set the tone for the conversation to come.

![](https://blog.infermedica.com/content/images/2017/08/why-its-hard-to-develop-an-alexa-skill-2@2x-2.jpg "Poncho bot giving verbose suggestions. You can&apos;t afford this on Alexa!")Poncho bot giving verbose suggestions. You can't afford this on Alexa!

The nature of voice interface encourages casual, everyday language. Skill designers may use introductions and interludes to steer the interlocutor towards machine-friendly language, but it’s a tricky task not to bore the users to death. The slow pace of Alexa’s speech in combination with our[ever-shrinking attention span](http://time.com/3858309/attention-spans-goldfish/)leaves little room for explanations.

This freedom of expression makes it harder to understand our users, especially since some words are simply misheard.

## How to compare language variants {#howtocomparelanguagevariants}

Having two conversational agents performing the same kind of health check-up puts us in a good position to compare the language used when talking to Alexa with that used when typing to a chatbot, at least for this specific domain.

Both[Symptomate](https://www.facebook.com/Symptomate/)\(Facebook Messenger bot\) and the[Symptom Checker Alexa skill](https://www.amazon.com/Infermedica-Symptom-Checker/dp/B071JFJWZC/)have similar conversation flow. During the first stages of the conversation, users are asked to describe their symptoms in their own words. I have used those descriptions \(as recorded in anonymous logs\) to find the ways these languages differ.

Comparing two samples of language to find similarities and differences is a fundamental issue in corpus linguistics and lexicography. While in principle there’s much more to it, it is usually simplified to comparing word frequencies to spot irregularities. If you’re interested in this topic, the best starting point would be the[seminal paper](https://www.sketchengine.co.uk/wp-content/uploads/comparing_corpora_2001.pdf)by the late Adam Kilgarriff, founder of[Lexical Computing](https://www.lexicalcomputing.com/).

## Spoken words, typed words {#spokenwordstypedwords}

It should not come as a surprise that spoken and written languages are different. But just how different and how does this affect the system? Let us compare which words are more popular when typing to a chatbot and which when speaking to Alexa. The following visualization shows exactly those words that best differentiate between the language used by humans addressing the chatbot and the voice symptom checker. The size of a word reflects how specific it is to one of these language varieties \(calculated using the_log-likelihood ratio_metric\). Red words were more frequently spoken to Alexa \(according to what Alexa heard\), while blue words were more frequently typed to the Symptomate chatbot.

![](https://blog.infermedica.com/content/images/2017/08/why-its-hard-to-develop-an-alexa-skill-3@2x.png)Words used in communication with the chatbot \(blue\) and with the voice assistant \(red\).

Alexa received more direct, personal language. You can see this in the appearance of personal pronouns \(_you_,_my_\). Also, pain is more often described using the verb_hurt_\(_my stomach hurts_rather than_stomach pain_\). Chatbot has seen more medical terms and formal language \(e.g._abdominal_,_dyspnea_,_pressure_,_difficulty_\).

On average, our chatbot can understand 13% more stories than our Alexa skill \(rough estimate\). It is hard to tell how much of this is to be blamed on speech recognition errors and how much is due to our NLP system’s preference for formal language.

# Summary {#summary}

In this article, I’ve argued that making a conversational Alexa skill is quite difficult. First of all, the design of the Alexa Skills Kit doesn’t really help with this. You need to abuse the skill configuration to free your application from rigid intent–slot frames that would otherwise kill any free-form conversation. Then you need to deal with errors of the underlying voice recognition technology or wait and hope this will improve over time. The more open-ended your domain is, the more of these you’re likely to face. Last but not least, your users will use even more casual language than they would when typing to a chatbot.

All of these observations have been made while developing our[Symptom Checker skill](https://www.amazon.com/Infermedica-Symptom-Checker/dp/B071JFJWZC/). Feel free to try it out and judge for yourself whether we have managed to overcome these difficulties.





Source: https://blog.infermedica.com/why-its-hard-to-develop-a-conversational-alexa-skill/

