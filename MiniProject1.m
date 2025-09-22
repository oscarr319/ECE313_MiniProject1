
% Read the audio file

[y, Fs] = audioread('headlines.wav');

q = 16000;

% Change sample to 16,000Hz

z = resample(y,q,Fs);

% Change from stereo to mono

z = mean(z,2);

% Truncate to 448,000 samples (28 sec)

z = z(1:448000);

z = reshape(z,[448,1000]);

x = fft(z);

a = ifft(x); %part a

a = reshape(a, [448000,1]); %part b

soundsc(a, q);

sMag = abs(x);

sPhase = angle(x);

sReal = real(x);

sImag = imag(x);

% plot the histograms

histogram(sMag);
histogram(sPhase);
histogram(sReal);
histogram(sImag);

% Describe shapes of the distributions
% What is the range of each?

function y = F(x)
 eps=0.1; power=0.4;
 y = sign(x) .* ((abs(x) + eps).^power - eps.^power);
end

fMag = F(sMag);
fReal = F(sReal);
fImag = F(sImag);

histogram(fMag); %what is the range?
histogram(fPhase); %what is the range?


imagesc(fMag);

imagesc(fReal);

imagesc(fImag);



imagesc(sPhase); %Describe any connections you see between this visualization
% and the sound of the original audio signal

imagesc(fReal);

function RGB = RealImag2RGB(S)
 FSreal = F(real(S))
 FSimag= F(imag(S))
 R = % TODO: map FSreal, FSimag to a red intensity between 0 and 1
 G = % TODO: map FSreal, FSimag to a green intensity between 0 and 1
 B = % TODO: map FSreal, FSimag to a blue intensity between 0 and 1
 RGB = uint8(255*cat(3, R, G, B)); % represent as an RGB image
end



