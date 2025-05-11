# install WAV

# Run: julia wav_package.jl
# https://github.com/dancasimiro/WAV.jl
# generates waveform data for a one second long 1 kHz sine tone, at a sampling frequency of 8 kHz, 
# # writes it to a WAV file and then reads the data back. It then appends a 2 kHz tone to the same file and plays the result.

using WAV
fs = 8e3
t = 0.0:1/fs:prevfloat(1.0)
f = 1e3
y = sin.(2pi * f * t) * 0.1
wavwrite(y, "example.wav", Fs=fs)

y, fs = wavread("example.wav")
y = sin.(2pi * 2f * t) * 0.1
wavappend(y, "example.wav")

y, fs = wavread("example.wav")
wavplay(y, fs)
