Title: First vibecoding mistakes
Category: Software
Date: 2025-05-26
Author: Anthony
Status: Published

<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-FYDC27JYB4"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-FYDC27JYB4');
</script>

I started the deeplearning.ai course on vibecoding with Replit today and already I can see some of the mistakes I have been making. Here are some of my takeaways so far.

## Pick one feature to build at a time and know exactly what you are expecting

I have been using cline for coding and have frequently made the mistake of putting more than one ask in the prompt. The sophistication of llms may give the impression that they could handle this, but in vibecoding at the moment this is a bad idea. Along with making it harder for the llm to do its job it is harder for you to determine that the requested features work.

- So create a branch in git
- decide what you want and 
- write it out in text. Refine this text until it is very clear. 
- Decide what context the llm needs. I try to keep this as short as possible to avoid confusion, but make sure it has what it needs and it not shooting in the dark. Your context is likely to stick with a few files while you are developing a feature or set of features, but keep an eye on it as you proceed so you are not leaving out something important.

## One feature one session

Once you have what you need - by a combination of vibecoding and fixing things up yourself - check it in and start a new session in your assistant. This should keep things reasonably clean.

## Don't lose your understanding of what everything does

Coding this way is not yet at the fire and forget stage. It is easy to get into a mess that you need to fix yourself. I sometimes drop chunks of problematic code into chat gpt at this stage to get help fixing it. 

