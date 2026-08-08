Title: Running DiffusionGemma on RunPod
Category: AI
Date: 2026-08-08
Author: Anthony

<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-FYDC27JYB4"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-FYDC27JYB4');
</script>


I have been doing some experiments with diffusion models for images recently. I wanted to try out [DiffusionGemma](https://ai.google.dev/gemma/docs/diffusiongemma) which is an experimental text diffusion model from Google. I would have guessed that diffusion would be slower at producing text than a normal autoregressive language model, but that does not appear to be the case. Text diffusion models are, like the image models do not produce one token at a time. Instead they incrementally update a single space - an image or a canvas of text in this case. The first thing to do was get the model running. 

## Local

I have a windows laptop with a basic consumer grade GPU. It has about 6 Gb of VRAM which is tiny compared to something designed for AI rather than basic gaming. I have however been able to run a variety of largish text models there for experimentation purposes. I find it faster to iterate this way than I would if I had to be constantly moving code to a GPU on RunPod. This turned out to be impossible for a model the size of DiffusionGemma. It is an open weight model and I had wrongly assumed that this meant it was small. I tried to load the model from Hugging Face using `device_map="auto"`. This resulted in the model being spread across CPU and GPU and giving some very bad errors when I tried to generate (matrix shape mismatches). A bit of exploration revealed that this was a GPU memory issue. It is possible that I could have gotten the model running on CPU along where I have a lot more memory, but inference would have been extremely slow if it was possible at all. So I switched to RunPod. 


## RunPod

First efforts here failed too because of the memory issue. I found a way to figure out how much memory a model would need. Running this:

```
uv run accelerate estimate-memory google/diffusiongemma-26B-A4B-it
```
(with the accelerate lib added to your uv project) 
returns the memory requirements for a few levels of quantization. I don't think these quantizations necessarily have to exist, so just check which one you are expecting to use in the HF or other docs. 

This is useful too and should give some memory requirement numbers. But note that once the model is in your cache it will not give you correct numbers:

```
uv run hf download google/diffusiongemma-26B-A4B-it --dry-run
```

So I picked an H200 GPU on RunPod with 141 Gb of VRAM, enough to fit all of the layers. I don't think this is a very exact science. Beyond the numbers given by the `estimate-memory` call above there are other memory requirements which I have found a bit more difficult to get handle on. I gave myself a bit of headroom and everything seemed to work fine. 

This model uses some very cutting edge technologies and will need a recent version of torch to work properly. Initially I was getting an error because my GPU did not support a particular type of matrix multiplication which is useful for MOE models - of which `gemma-diff` is one. An additional parameter got me out of this. But getting the right version of the libs to work required a bit of trial and error. (Hence this post)

Next up I ssh'd to the server and installed the most recent version of uv. If I used pip to do this, which is my normal way, I got an old version of uv which did not allow me to exclude deps. So to install uv I did this:

```
curl -LsSf https://astral.sh/uv/install.sh | sh
export PATH="$HOME/.local/bin:$PATH"
hash -r
uv --version
```

Then I figured out where the local python 3 was installed and made sure I was happy with the version. If that is ok you can run this:

```
uv venv --python /usr/local/bin/python --system-site-packages
```

The `--system-site-packages` is necessary to make sure that the venv is not completely isolated from the local site packages. Without that uv will download all of the (huge) packages required to get this to work. 

Then run `uv sync` if it shows you a long line up of packages that it is slowly downloading, something is wrong. These pods include version of the cuda drivers, torch and some other things to make this setup faster. 

Nearly ready to start the jupyter notebook in RunPod. To install your kernel do this:

```
uv run python -m ipykernel install --user --name diffusion --display-name "Python (diffusion)"
```

Then open your notebook, select that kernel and you should be able to run things. 

## Running a few experiments

My experiments are very minimal. I ran inference: *Why is the sky blue?* and then I played with streaming. I did not check the quality of the outputs, but did notice that it seemed very fast at producing tokens.

## Speed results compared to Artificial Analysis

You can see from this tiny experiment that DiffusionGemma produced 271 tokens in 0.7s. This is roughly 387 tokens per minute.

<img src="{static}/images/diffusion/gemma_speed.png" alt="gemma-speed"/>

From Artificial Analysis that is roughly the speed of Gemini Flash Lite:

<img src="{static}/images/diffusion/artificial.png" alt="artificial-analysis"/>

Artificial Analysis uses a slightly different method to count tokens (settling on OpenAI tokens for all output), but this is unlikely to make much difference. 

## Code

You can find the code for this [here](https://github.com/anthonynolan/diffusion_experiments) the specific notebook is the `diffusion_gemma.ipynb` one. 

