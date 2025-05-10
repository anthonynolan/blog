Title: Most Common Spanish words to Anki
Date: 2025-02-23 14:50
Category: Software
Author: Anthony

# Get the most common words from Spanish

Results will depend on the corpus used. I am not interested in accuracy, so just got a Spanish corpus from nltk. 

- figured out which words were junk and removed them (underscores etc)
- Count frequencies
- Dump this to a list suitable for prompting an llm

## Used this prompt

```
Thanslate these words to english. I want one spanish word followed by a comma and then the english translation. 'para, como, p...
```

Finally a bit of python to put them in the right format for anki import.

The code is [here](https://github.com/anthonynolan/most-common-spanish-words)

