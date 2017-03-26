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

### Q3

Generate an autocorrelated signal, `x`, using the following:

    A = -0.8;
    numSamples = 500;
    x = zeros(numSamples,1);
    n = randn(numSamples,1);
    x(1) = 0.5;
    for i = 2:numSamples
        x(i) = A*x(i-1) + n(i);
    end
Plot `x` (using `plot`). Does it look like it has non-random structure?

Zoom in on it to look at whether current values of `x` are correlated with future values of `x`.

Predict what the autocorrelation will be at lags 1 and 2.

Plot the autocorrelation using `autocorr` to check your intuition.

Repeat the above with A = 0.8;

### Q4?

??Something using real data?
