# Assessment

### Q1: Distinguishing underlying periodic structure in noisy time series
Generate sinusoidal signals of length 500 with different amounts of added noise (for a range of noise levels):

    x = sin((1:500)'/f) + noiseLevel * randn(500,1);

for a frequency, `f = 15`, and noise level, `noiseLevel`.

Unlike in the tutorial, we'll add different random noise to each signal.

---

Start with no noise (`noiseLevel = 0;`), and then increase manually (e.g., try `noiseLevel = 0.5;`, `noiseLevel = 1;`, etc.), plotting the time series that you generate each time (using `plot`).

From these plotting experiments, pick four noise levels:
(i) `noiseLevel = 0`, and four more, corresponding to
(ii) 'low noise' (periodic structure clearly visible by eye),
(iii) 'moderate noise' (noisy, but can still see periodic structure by eye),
(iv) 'threshold' (the point at which you can no longer see the periodicity), and
(v) 'high noise' (signal looks like noise by eye).
**Note down your choices for the five noise levels**

---

**Plot the power spectrum** (using `FourierPower.m` provided with this tutorial) for each of the five time series (at your five chosen noise levels).

**Note what happens to the peak in the power spectrum as the noise level increases (both the position of the peak and the size of the peak)**

---
Repeating the visual experiments above, try to select a value of the noise level at which you can no longer distinguish a peak.
(you will need to select values for the noise level manually, reproducing time series and then plotting the power spectrum using `FourierPower.m`)

**What is this threshold value, is it larger than the value you set above? Why?**


### Q2: Multiple peaks in the power spectrum

Think about how you might generate a time series that has three peaks in its power spectrum.

**Write down the code you used to generate this time series.**

**Plot the signal in the time domain (using `plot`)**

**Show the power spectrum (using `FourierPower.m`) to verify the three peaks**

### Q3: Autocorrelation function of autocorrelated time series

Generate an autocorrelated signal, `x`, using the following:

    A = -0.8;
    numSamples = 500;
    x = zeros(numSamples,1);
    n = randn(numSamples,1);
    x(1) = 0.5;
    for i = 2:numSamples
        x(i) = A*x(i-1) + n(i);
    end

This generates a time series in which the value at a given time (`x(i)`) depends on some rescaling of the previous value (`x(i-1)`), plus some noise, `n(i)`.
This induces correlations between values of `x`.

Plot `x` (using `plot`).
Zoom in on it to look at whether current values of `x` are correlated with future values of `x`.

**Does x look like it has non-random structure? Predict what the autocorrelation will be at lags 1 and 2.**

**Plot the autocorrelation of `x` using `autocorr` to check your intuition.**

**Repeat the above with `A = 0.8;`**

### Q4?

??Something using real data?
