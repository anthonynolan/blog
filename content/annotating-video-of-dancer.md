Title: Annotating video of an Irish Dancer
Category: 
Date: 2025-12-05
Author: Anthony

<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-FYDC27JYB4"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-FYDC27JYB4');
</script>

# Idea

I have a video of an Irish Dancer taken from a stationary camera. I would like to create a version of this video which is more closely cropped to the dancer so she can be seen more clearly. 

I did something like this for a project I did recently to track a dumbbell in an image. I took the approach of playing the video in a browser and showing an overlay of a red bounding box. The box was movable as the video played and the coordinates of the box were written to the console as the video played and the box moved. 

This approach gave quite a jerky movement of the box. This may have been something related to how the playback worked in the browser, or more likely how the coordinates were written to the console. I an effort to do better on an idea like this I wanted to try some automatic annotation tools.

# CVAT

This is an opersource fairly high end tool for annotating video. I uploaded my video and manually created a bounding box. The process of interpolating this or tracking with AI is not straightforward. I can either learn more about this approach - which may pay dividends in the future for other projects - or can revert to the browser method and see if I can improve that. 

The dancer does not move in a nice linear fashion like the pool balls in the videos from CVAT on youtube, but interpolation may be the best way to go. Quite a steep learning curve for these tools but that is to be expected. Labeling video is not an easy task and there are a lot of options.

# References

CVAT is at http://cvat.ai

