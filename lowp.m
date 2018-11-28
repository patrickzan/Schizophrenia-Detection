function y = lowp(x, fp, fsl, Fs)
% Low-pass filter
rp = 0.1;
rs = 30;
wp = 2*pi*fp/Fs;
ws = 2*pi*fsl/Fs;
%  wsl = 2*pi*fsl/Fs;
% wsh = 2*pi*fsh/Fs;
% wp = [wpl, wph];
% ws = [wsl, wsh];
% Cheby Shev filter
[n, wn] = cheb1ord(ws/pi, wp/pi, rp, rs);
[bz1, az1] = cheby1(n, rp, wp/pi);
% [h, w] = freqz(bz1, az1, 256, Fs);
% h = 20*log10(abs(h));

% figure; plot(w, h); title('Frequency response'); grid on;

y = filter(bz1,az1,x); % return filtered signal
[r, lag] = xcorr(y, x);
r(lag<0) = [];
delay = find(r==max(r));
y = [y(delay:end), zeros(1, delay-1)];
end

