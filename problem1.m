% Import the audio file for the vowel sound
[vowel_x, fs] = audioread('vowel.wav');
sound(vowel_x, fs);

% Define time vector for the vowel sound
t_vowel = (0:(length(vowel_x) - 1)) / fs;

% Plot the entire signal for the vowel sound
figure;
subplot(2,1,1);
plot(t_vowel, vowel_x);
title('Vowel: Entire Signal');
xlabel('Time (s)');
ylabel('Amplitude');

% Plot a short segment (e.g., 50 milliseconds) in the middle of the vowel sound
segment_duration = 0.05; % 50 milliseconds
segment_start = (length(vowel_x) / 2) - (fs * segment_duration / 2);
segment_end = (length(vowel_x) / 2) + (fs * segment_duration / 2);

subplot(2,1,2);
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

% Import the audio file for the consonant sound
[consonant_x, fs] = audioread('consonant.wav');
sound(consonant_x, fs);

% Define time vector for the consonant sound
t_consonant = (0:(length(consonant_x) - 1)) / fs;

% Plot the entire signal for the consonant sound
figure;
subplot(2,1,1);
plot(t_consonant, consonant_x);
title('Consonant: Entire Signal');
xlabel('Time (s)');
ylabel('Amplitude');

% Plot a short segment (e.g., 50 milliseconds) in the middle of the consonant sound
segment_start = (length(consonant_x) / 2) - (fs * segment_duration / 2);
segment_end = (length(consonant_x) / 2) + (fs * segment_duration / 2);

subplot(2,1,2);
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
