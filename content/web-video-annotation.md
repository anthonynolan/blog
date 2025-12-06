Title: Video annotation in a browser
Category: Image processing
Date: 2025-12-06
Author: Anthony

<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-FYDC27JYB4"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-FYDC27JYB4');
</script>

# Collecting dancer coordinates from video

I have used this technique before to track a dumbbell during exercise. I got Open AI Codex to write a web page for me which played the video, overlaid a resizable red box which could be dragged during video play. The coordinates of the box are output multiple times per second and will be used to train a model. 

![Web Label Gatherer](images/web_label_gatherer.png)

It is tricky to keep the box correctly aligned around the moving dancer even at lower playback speed, but I will go with what I have for now and come back to do this more accurately if that proves to be useful. 