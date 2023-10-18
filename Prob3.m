alpha = 3;
%Load the file and plot the spectrogram
[y, Fs]=audioread("instru3.wav");
[S,F,T]=spectrogram(y, hamming(1024), 512, [], Fs);

%Design a digital filter
L=31;
cutoff_f=1500;
[b,a]=fir1(L-1, cutoff_f/Fs, "bandpass", hamming(L));

%Filter the signal and plot the new spectrogram
new_signal=filter(b,a,y);
S_filtered=spectrogram(new_signal, hamming(1024), 512, [], Fs);

%Plot both the graphs
subplot(2,1,1);
imagesc(T, F, 10*log10(abs(S_filtered)));
axis xy;
colormap jet;
ylabel("Frequency (Hz)");
xlabel("Time (s)");
title("Filtered Spectrogram");
colorbar;
subplot(2,1,2);
imagesc(T, F, 10*log10(abs(S)))
axis xy
colormap jet;
title("Original Spectrogram");
ylabel("Frequency (Hz)");
xlabel("Time (s)");
colorbar;

%Save and listen to the file
audiowrite("filtered_output.wav", new_signal, Fs);
sound(new_signal, Fs);