# Assessment

### Q1
Generate sinusoidal signals with different amounts of added noise (for a range of noise levels):

    x = sin((1:numSamples)'/f) + noiseLevel * randn(numSamples,1);

for a chosen frequency, `f`, and noise level, `noiseLevel`.

Start with no noise (`noiseLevel = 0`), and then increase, plotting each signal you generate (using `plot`).

Compare the power spectrum (using `FourierPower.m` provided with this tutorial) of the signal as you increase the noise level.

What happens to the peak in the Power Spectrum as you increase the noise?

At approximately what noise level would you be able to distinguish this signal from a pure noise signal?

### Q2

Think about how you might generate a signal that has three peaks in its power spectrum.

Plot the signal in the time domain (using `plot`).

Generate the power spectrum (using `FourierPower.m`) to verify.

### Q3?

??Something using real data?
