function [w,S] = FourierPower(y)
% Gives the frequencies, w, and power, S, for an input time series, y

Ny = length(y); % time-series length
Fs = 1; % sampling frequency
NFFT = 2^nextpow2(Ny);
f = Fs/2*linspace(0,1,NFFT/2+1); % frequency
w = 2*pi*f'; % angular frequency (as column vector)
S = fft(y,NFFT); % Fourier Transform
S = 2*abs(S(1:NFFT/2+1)).^2/Ny; % single-sided power spectral density
S = S/(2*pi); % convert to angular frequency space

end
