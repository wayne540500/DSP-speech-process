# DSP-speech-process

Problem 1. Speech Recording. 
Record yourself saying a vowel sound and a consonant sound, respectively. You can create 
your recordings using a computer, smart phone, or other digital device. There are many audio 
recording utilities for both Windows, Linux and Mac systems. You can also use MATLAB 
audiorecorder( ) function. A good thing with the audiorecorder( ) function is that you can 
specify the desired sampling frequency and number of bits per sample. For human speech, 
sampling rate of 8KHz and bit depth of 8 bits are typically considered sufficient. However,
using a higher sampling rate and more bits/sample can give you better recording quality. 
Import your audio file into MATLAB using the audioread( ) function or other suitable 
function. 
To verify that your file is correctly imported into MATLAB, use the sound function to play 
the audio signals: sound (x,fs). You will need to specify the sampling rate fs. 
In MATLAB, plot both the entire signal as well as a short segment (e.g. 50 milliseconds) 
in the middle of the sound. Comment on how the two waveforms are different.
The 'vowel' signal should be approximately periodic. The period is called the pitch period. 
What is the pitch period of your 'vowel' sound as measured in units of milliseconds?

Problem1:
The main difference between entire signal and short segment is that the entire signal 
provides an overview of the entire audio recording, while the short segment allows 
you to zoom in on a specific part of the audio to analyze details. The choice between 
the two depends on your analysis goals and the specific characteristics you want to 
examine in the recorded speech.
For the vowel sound, I record my voice in “vowel.wav”. I choose “e” to be my letter.
Pitch period of the vowel sound: 0.02 ms

![image](https://github.com/wayne540500/DSP-speech-process/assets/69573286/b1b77115-c4db-472a-94b1-7f30aa8f16b2)

For the consonant sound, I record my voice in “consonant.wav”. I choose “m” to be 
my letter.
Pitch period of the consonant sound: 0.02 ms

![image](https://github.com/wayne540500/DSP-speech-process/assets/69573286/fd8e1c6b-6758-4098-a511-9f9eb0591bc6)


Problem 2, Speech Spectra.
Use the MATLAB fft function to approximately compute the discrete-time Fourier transform 
(DTFT) of the 50 millisecond segments you plotted in the previous exercise. Note that it is 
best to specify a FFT length that is a power of 2 that is closest to the length of your segment. 
Plot the magnitude frequency-spectrum for both sounds.
Plot each spectrum on both linear and log scales. (For the log scale, use 20log10|X| for 
dB). Comment on your observations. 
The spectrum of 'vowel' sound should have distinct peaks at approximately equally spaced
intervals (these are harmonics). 
Does the first peak frequency correspond to the pitch period you observed in part 1?
Also plot the short-term Fourier transform using the "spectrogram( )" function to see 
how the spectrum changes slightly over time.

Promlem2:
In the context of speech signals, the first peak frequency in the magnitude spectrum 
typically corresponds to the fundamental frequency (F0), which is the inverse of the 
pitch period. They are approximately equal, it suggests that the first peak frequency 
is indeed related to the pitch period.
Pitch period of the vowel sound: 0.02 ms
Pitch period of the consonant sound: 0.02 ms
So, compare the first peak frequency in the spectrum (usually the lowest peak) to the 
pitch period you observed in Part 1. If they are close in value, it indicates a 
correspondence between the pitch period and the fundamental frequency observed 
in the spectrum.

![image](https://github.com/wayne540500/DSP-speech-process/assets/69573286/672c6272-fd7a-4f6c-b208-0f35be272b34)

![image](https://github.com/wayne540500/DSP-speech-process/assets/69573286/465e5cd2-f0d4-473f-ae3f-9e81918778bd)

![image](https://github.com/wayne540500/DSP-speech-process/assets/69573286/093449c7-5782-4f62-97cf-2d67f392c9df)
