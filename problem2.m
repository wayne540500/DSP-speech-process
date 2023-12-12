% Import the audio file for the vowel sound
[vowel_x, fs] = audioread('vowel.wav');
sound(vowel_x, fs);

% Define time vector for the vowel sound
t_vowel = (0:(length(vowel_x) - 1)) / fs;

% Plot the entire signal for the vowel sound
figure;
subplot(3,2,1);
plot(t_vowel, vowel_x);
title('Vowel: Entire Signal');
xlabel('Time (s)');
ylabel('Amplitude');

% Plot a short segment (e.g., 50 milliseconds) in the middle of the vowel sound
segment_duration = 0.05; % 50 milliseconds
segment_start = (length(vowel_x) / 2) - (fs * segment_duration / 2);
segment_end = (length(vowel_x) / 2) + (fs * segment_duration / 2);

subplot(3,2,2);
plot(t_vowel(segment_start:segment_end), vowel_x(segment_start:segment_end));
title('Vowel: Short Segment (50 ms)');
xlabel('Time (s)');
ylabel('Amplitude');

% Calculate the autocorrelation for the vowel sound
autocorr_vowel = xcorr(vowel_x);

% Find the peak in the autocorrelation for the vowel sound
autocorr_vowel = autocorr_vowel(length(vowel_x):end); % Exclude the negative lags
[max_peak_vowel, max_lag_vowel] = max(autocorr_vowel);

% Calculate pitch period in milliseconds for the vowel sound
pitch_period_samples_vowel = max_lag_vowel; % Lag at the maximum peak
pitch_period_ms_vowel = pitch_period_samples_vowel / fs * 1000;

fprintf('Pitch period of the vowel sound: %.2f ms\n', pitch_period_ms_vowel);

% Compute the FFT of the 50 ms segment of the vowel sound
Nfft_vowel = 2^ceil(2 + log2(length(vowel_x(segment_start:segment_end)))); % FFT length
spectrum_vowel = fft(vowel_x(segment_start:segment_end), Nfft_vowel);
frequencies_vowel = fs * (0:(Nfft_vowel-1)) / Nfft_vowel; % Frequency axis

% Plot magnitude spectra on linear scale for the vowel sound
subplot(3,2,3);
plot(frequencies_vowel, abs(spectrum_vowel));
title('Magnitude Spectrum of Vowel (Linear)');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

% Plot magnitude spectra on log scale (dB) for the vowel sound
subplot(3,2,4);
plot(frequencies_vowel, 20 * log10(abs(spectrum_vowel)));
title('Magnitude Spectrum of Vowel (Log Scale)');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');

% Import the audio file for the consonant sound
[consonant_x, fs] = audioread('consonant.wav');
sound(consonant_x, fs);

% Define time vector for the consonant sound
t_consonant = (0:(length(consonant_x) - 1)) / fs;

% Plot the entire signal for the consonant sound
subplot(3,2,5);
plot(t_consonant, consonant_x);
title('Consonant: Entire Signal');
xlabel('Time (s)');
ylabel('Amplitude');

% Plot a short segment (e.g., 50 milliseconds) in the middle of the consonant sound
segment_start = (length(consonant_x) / 2) - (fs * segment_duration / 2);
segment_end = (length(consonant_x) / 2) + (fs * segment_duration / 2);

subplot(3,2,6);
plot(t_consonant(segment_start:segment_end), consonant_x(segment_start:segment_end));
title('Consonant: Short Segment (50 ms)');
xlabel('Time (s)');
ylabel('Amplitude');

% Calculate the autocorrelation for the consonant sound
autocorr_consonant = xcorr(consonant_x);

% Find the peak in the autocorrelation for the consonant sound
autocorr_consonant = autocorr_consonant(length(consonant_x):end); % Exclude the negative lags
[max_peak_consonant, max_lag_consonant] = max(autocorr_consonant);

% Calculate pitch period in milliseconds for the consonant sound
pitch_period_samples_consonant = max_lag_consonant; % Lag at the maximum peak
pitch_period_ms_consonant = pitch_period_samples_consonant / fs * 1000;

fprintf('Pitch period of the consonant sound: %.2f ms\n', pitch_period_ms_consonant);

% Compute the FFT of the 50 ms segment of the consonant sound
Nfft_consonant = 2^ceil(2 + log2(length(consonant_x(segment_start:segment_end)))); % FFT length
spectrum_consonant = fft(consonant_x(segment_start:segment_end), Nfft_consonant);
frequencies_consonant = fs * (0:(Nfft_consonant-1)) / Nfft_consonant; % Frequency axis

% Plot magnitude spectra on linear scale for the consonant sound
figure;
subplot(2,2,1);
plot(frequencies_consonant, abs(spectrum_consonant));
title('Magnitude Spectrum of Consonant (Linear)');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

% Plot magnitude spectra on log scale (dB) for the consonant sound
subplot(2,2,2);
plot(frequencies_consonant, 20 * log10(abs(spectrum_consonant)));
title('Magnitude Spectrum of Consonant (Log Scale)');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');

% Compute and plot the spectrogram for the vowel sound
figure;
subplot(2,2,3);
spectrogram(vowel_x(:, 1), hann(Nfft_vowel), 0, Nfft_vowel, fs, 'yaxis');
title('Spectrogram of Vowel');

% Compute and plot the spectrogram for the consonant sound
subplot(2,2,4);
spectrogram(consonant_x(:, 1), hann(Nfft_consonant), 0, Nfft_consonant, fs, 'yaxis');
title('Spectrogram of Consonant');


