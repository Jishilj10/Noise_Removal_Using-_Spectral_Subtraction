# Noise_Removal_Using_Spectral_Subtraction
This repository contains MATLAB scripts for audio signal processing, including noise removal, frequency shaping, and amplitude shaping. The processed signal is saved as a new audio file. Below is a brief overview of the project:

## Requirements
- MATLAB

## Getting Started
1. Clone the repository to your local machine.
```
git clone https://github.com/Jishilj10/Noise_Removal_Using_Spectral_Subtraction.git
```
2. Open MATLAB and navigate to the project directory.
3. Run the MATLAB script Recorder.m to record real-world noisy data.
3. Run the MATLAB script main.m.

## Signal Processing Steps
1. **Original Signal Spectrum**
The script starts by displaying the spectrum of the original audio signal.

2. **Noise Removal (Spectral Subtraction)**
The script applies the spectral subtraction method to remove noise from the original signal. The noise signal is split into frames, and noise estimation is performed. The noisy signal frames are processed, and the signal is reconstructed.

3. **Frequency Shaping**
A frequency shaping window is created and applied to the signal to emphasize or attenuate specific frequency ranges.

4. **Amplitude Shaping**
Amplitude shaping is performed to adjust the overall amplitude of the signal while avoiding clipping or distortion.

5. **Final Signal Spectrum**
The spectrum of the final processed signal is displayed.

6. **Audio File Creation**
The original audio signal and the final processed signal are saved as audio files: original audio.wav and Final processed signal.wav, respectively.

## File Description
-  **audio_processing.m**: MATLAB script for audio signal processing.
- **Csound.wav**: Original audio signal file.
- **Cnoise1.wav**: Noise signal file.



