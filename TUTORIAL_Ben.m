% In this tutorial, we'll go through some code to produce some of the
% time-series analysis techniques we learned from the lecture

% Start with a clear workspace
clear all
close all

% Set home directory
% homeDir = '~/Desktop/Psy3310 Intro to comp neuro/15Dec3_IntroCompNeuroscience/'; % **change for your setting**
% cd(homeDir);

%-------------------------------------------------------------------------------
%% First we're going to generate some signals
%-------------------------------------------------------------------------------
% We'll store the different signals in the structure, x
x = struct();

% Let's set the number of samples in each signal:
numSamples = 1000; % the number of samples in each signal (i.e., time-series length)
noiseLevel = 1; % the standard deviation of the noise signal

% 1. Random noise
% We can imagine values in the vector, orderded through time.
% In this case, x is just a set of random numbers, so there should be no
% structure through time.
x.RandomNoise = noiseLevel*randn(numSamples,1); % generate random, Gaussian-distributed values

% 2. Pure sinusoid
% Just a single, pure sin wave
% This will have values that are correlated through time, unlike the noise
% (imagine this as a signal that we want to measure and pick up on)
x.SingleSinusoid = sin((1:numSamples)'/10);

% 3. Pure sinusoid with random noise added:
% By adding the noise to the sine wave, we can produce a noisy sine wave
x.SingleSinusoidNoise = x.SingleSinusoid + x.RandomNoise;

% 4. Sum of two sinusoids of different frequencies
% Let's add two sine waves, one with double the frequency of the other, together
% Add a faster oscillation to the existing SingleSinusoid signal:
x.TwoSinusoids = x.SingleSinusoid + sin((1:numSamples)'/20);

% 5. Two sinusoids with noise
% Let's add random noise to those two sine waves to obscure the periodic structure
x.TwoSinusoidsNoise = x.TwoSinusoids + x.RandomNoise;

%-------------------------------------------------------------------------------
%% Let's plot each signal in the time domain
%-------------------------------------------------------------------------------
% Plot the time series:
signalTypes = fieldnames(x); % names of all of the signals we defined above
numSignals = length(signalTypes); % the number of signals we defined

% Generate a new figure and plot each signal, and title each subplot
figure('color','w');
for i = 1:numSignals
    subplot(numSignals,1,i)
    plot(x.(signalTypes{i}),'k');
    xlabel('Time (sample)');
    ylabel('Value')
    title(signalTypes{i})
end

%===============================================================================
%                       ---QUESTIONS TO THINK ABOUT---
%===============================================================================
% Explain the components in each signal from their definitions above.
% Look at the signals -- do they look like you expect them to?
% You might like to keep this plot open to compare to other analyses we will
%   do later on.
%===============================================================================


%-------------------------------------------------------------------------------
%% How does the sinusoid look as we increase the noise level?
%-------------------------------------------------------------------------------
% Set a range of noise levels:
noiseLevelScale = linspace(0.1,2,40); % increasing noise level

% Plot a sine wave as the noise level increases (for a fixed noise signal):
f = figure('color','w');
for i = 1:length(noiseLevelScale)
    plot(x.SingleSinusoid + noiseLevelScale(i)*x.RandomNoise,'-k')
    title(sprintf('Noise level scale: %.2f',noiseLevelScale(i)))
    drawnow
    pause(0.1)
end

%===============================================================================
%                       ---QUESTIONS TO THINK ABOUT---
%===============================================================================
% What happens to the periodic signal as you increase the amount of noise?
% Is there a noise level at which it's impossible to identify the underlying
% periodic signal?
%===============================================================================

%-------------------------------------------------------------------------------
%% Autocorrelation functions
%-------------------------------------------------------------------------------
% How does a value at time t correlate with the value at time t+1?
figure('color','w');
for i = 1:numSignals
    subplot(numSignals,1,i)
    autocorr(x.(signalTypes{i}));
    xlabel('Time lag (samples)'); ylabel('Autocorrelation')
    title(signalTypes{i})
end

% E: What do the shapes tell you about the temporal correlation in the signals?
% E: What happens to the strength of the correlation when noise is added to a signal?
% E: Can you explain why?

%-------------------------------------------------------------------------------
%% We can assess the correlation structure by looking at the Fourier transform
%-------------------------------------------------------------------------------
figure('color','w');
for i = 1:numSignals
    % First compute the Fourier transform:
    % This function gives us the power spectrum:
    [w,S] = FourierPower(x.(signalTypes{i}));
    subplot(numSignals,1,i)
    plot(w,S,'.-k'); % plot the power spectrum
    xlabel('Angular frequency (rad/sample)')
    ylabel('Spectral power');
    title(signalTypes{i})
end

% E: Note the features in each spectrum
% E: What do the peaks mean?
% E: Do the peaks change when noise is added?
