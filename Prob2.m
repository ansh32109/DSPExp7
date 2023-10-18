alpha = 3;
% Specify the parameters
f_cutoff=0.25;
L=21;

% Design the filters
Rect_filter=fir1(L-1, f_cutoff, "low", rectwin(L));     %Rectangular window
Hamm_filter=fir1(L-1,f_cutoff, "low", hamming(L));      %Hanning Window
freqz(Rect_filter, 1, 1024,"whole");
freqz(Hamm_filter, 1, 1024, "whole");

% Impulse responses of the filters
stem(Rect_filter,'b', "MarkerFaceColor","b");
hold on;
stem(Hamm_filter,'r', "MarkerFaceColor","r");
hold off;
grid on;
xlabel("Time (s)");
ylabel("Amplitude");
title("Impulse response of the filters");
legend("Rectangular", "Hamming");

% Plot the bode plots
bode(tf(Rect_filter, 1),tf(Hamm_filter, 1));
grid on;
legend("Rectangular", "Hamming");