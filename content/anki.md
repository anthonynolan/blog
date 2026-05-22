Title: Using Codex to enhance an anki deck
Category: Knowledge Engineering
Date: 2026-05-22
Author: Anthony

<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-FYDC27JYB4"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-FYDC27JYB4');
</script>


I have exported an anki deck and want you to review it. It is in the filtered deck file. I want you to see if there
  are improvements that can be made to these cards. For example adding examples, finding links between them and if
  there are other areas that I should study which represent gaps in my knowledge of the topic covered in these cards.

# Enhancing an anki deck

I have about 1000 anki cards on a range of subjects. Some of the cards are of poor quality - too long, not specific enough for example. And there are just gaps. If I have a set of cards on an aspect of world history and there are important parts missing, then I would like to correct that. I decided to use Codex to do this. 

The process was export a subset of my notes, ask codex to suggest improvements, get the improvements made with suitable tagging so that I can track what was done. Reimport. 

## Export a subset

I started with a set of 10 cards about the book Livewired by David Eagleman. This was an excellent book full of interesting examples and the science behind them. The cards had ended up really being the examples though and as time went on I was finding them to be somewhat isolated. So these were a good candidate for the first round of Codex based improvement. 

In Anki choose Export Notes in Plain text. Make sure you include the guids in your export. I included all the options - there are only about 5. These guids will allow modified cards to replace their originals and maintain things like study schedules. 

## Show them to codex

Here is my first prompt:

```
I have exported an anki deck and want you to review it. It is in the filtered deck file. I want you to see if there
  are improvements that can be made to these cards. For example adding examples, finding links between them and if
  there are other areas that I should study which represent gaps in my knowledge of the topic covered in these cards.
```

## The results

Codex responded with a set of high value fixes including splitting some cards. It also gave me a bullet pointed list of things I should study next based on the gaps in the cars. This is really helpful. I got codex to write this to a text file which I will append to as I repeat and enhance this process for further subsets of my collection. 

References were provided for all of the card changes made. 

26 new cards created (from 10 originals)

## Thoughts

These cards were based on a book I had read. Before I can really create cards for the gaps I need to read or study somethign about these topics. Having said that many of the new 'split cards' that codex created contain information that is new to me. They are short and to the point and because they are strongly linked to knowledge that I already have I am able to learn and integrate this new knowledge without problem. I just need to watch out for cases where I am adding cards and not really understanding what lies behind them. 

Given the jump in card count for just this small subset this method could quickly become overwhelming. I need to limit the amount of time I spend on anki overall. Hopefully these changes will improve the value I am getting from this time. 
