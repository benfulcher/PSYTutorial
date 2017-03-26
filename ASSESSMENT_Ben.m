%% YOUR NAME:

%% assessment for ERP
% 8 x 1 point --- EXCERCISE (marked as E in this document). Fill in the
% appropriate location, submit this m-file to the tutor.

% 3 x 1 point --- OPEN ENDED QUESTIONS (marked as Q1-Q3, at the end). Write
% your answer in this document, submit it to the tutor.
%
% 3 x 1 point --- FIGURE SUBMISSION. Use this code to submit figures as .jpg or .png
% to the tutor. Use channel 187, which was not used in the lecture.
% For this assessment, choose a cateogry other than upright face.

% DON'T FORGET TO WRITE YOUR NAME AT THE TOP

% Start with a clear workspace
clear all
close all

%% Useful setting for debugging
dbstop if error
dbstop if warning

% Set home directory
% homeDir = '~/Desktop/Psy3310 Intro to comp neuro/15Dec3_IntroCompNeuroscience/'; % **change for your setting**
% cd(homeDir);

%-------------------------------------------------------------------------------
%% First we're going to generate some signals
%-------------------------------------------------------------------------------
% Let's store the different signals in the structure, x
x = struct();

% Let's set the number of samples in each signal:
numSamples = 1000; % the number of samples in the random noise signal
noiseLevel = 1; % the standard deviation of the noise signal

% 1. Random noise
x.RandomNoise = noiseLevel*randn(numSamples,1); % generate random, Gaussian-distributed values

% We can imagine values in x orderded through time.
% In this case, x is just a set of random numbers, so there should be no
% correlation structure.

% 2. Pure sinusoid
% Just a single, pure sin wave
x.SingleSinusoid = sin((1:numSamples)'/10);

% 3. Pure sinusoid with random noise added:
x.SingleSinusoidNoise = x.SingleSinusoid + x.RandomNoise;

% 4. Sum of two sinusoids of different frequencies
% Let's add two sine waves, one with double the frequency of the other, together
x.TwoSinusoids = x.SingleSinusoid + sin((1:numSamples)'/20);

% 5. Two sinusoids with noise
% Let's add random noise to those two sine waves
x.TwoSinusoidsNoise = x.TwoSinusoids + x.RandomNoise;

%-------------------------------------------------------------------------------
%% Let's plot each signal in the time domain
%-------------------------------------------------------------------------------
% Plot the time series:
signalTypes = fieldnames(x);
numSignals = length(signalTypes);

figure('color','w');
for i = 1:numSignals
    subplot(numSignals,1,i)
    plot(x.(signalTypes{i}),'k');
    xlabel('Time (sample)'); ylabel('Value')
    title(signalTypes{i})
end

% Explain the components in each signal from their definitions above
% Look at the signals -- do they look like you expect them to?
% You might like to keep this plot open to compare to other analyses we will do later on

%-------------------------------------------------------------------------------
%% How does the sinusoid look as we increase the noise level?
% E1: Run the code below and note what happens to the periodic signal
% when the noise level increases
% e.g., on the SingleSinusoidNoise signal
noiseLevelScale = linspace(0.1,2,40); % increasing noise level

f = figure('color','w');
for i = 1:length(noiseLevelScale)
    plot(x.SingleSinusoid + noiseLevelScale(i)*x.RandomNoise,'-k')
    title(sprintf('Noise level scale: %.2f',noiseLevelScale(i)))
    drawnow
    pause(0.1)
end

%-------------------------------------------------------------------------------
%% Look at the distribution of values in each signal:
%-------------------------------------------------------------------------------
figure('color','w');
for i = 1:numSignals
    subplot(numSignals,1,i)
    histogram(x.(signalTypes{i}),'Normalization','Probability');
    xlabel('Value'); ylabel('Probability density')
    title(signalTypes{i})
end

% E1: Say briefly what these pictures mean?
% E2: Can you interpret them in terms of the time domain shapes

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

%-------------------------------------------------------------------------------
%% OPEN Q.
% Q: Generate a sinusoidal signal with different amounts of added noise
% e.g., x = sin((1:numSamples)'/10) + noiseLevel * randn(numSamples,1);
% (for a range of noise levels)
% Compare the power spectrum (FourierPower.m) of the signal as you increase the
% noise level.
% What happens to the peak?
% Plot the spectrum at lower noise, moderate noise, and high noise

% Q: Generate a signal that has three peaks in its power spectrum.
% Generate the power spectrum (using FourierPower.m) to verify.
