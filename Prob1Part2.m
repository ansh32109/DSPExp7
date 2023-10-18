%Specify the parameters
N_values=[100,200,300];
DFT_size=1024;
fs=1000;        %Sampling rate
F=100;          %Signal Frequency
time=(0:(DFT_size-1))/fs;
%Define the signal and windowing
signal=ones(1,1024);
plot(time, signal);
grid on;
for i=1:length(N_values)
    window=hamming(N_values(i));
    windowed_signal=window.*signal(1:N_values(i));

    %Compute the DFT
    signal_DFT=fft(windowed_signal, DFT_size);
    normalized=abs(signal_DFT)/N_values(i);

    %Make the frequency axis
    f=(0:(DFT_size-1))/DFT_size;

    %Plot the spectrum
    subplot(3,1,i);
    plot(f,20*log10(normalized));
    grid on;
    title(sprintf("Spectrum for N = %d", N_values(i)));
    xlabel("Frequency(Hz)");
    ylabel("Magnitude (dB)");
end