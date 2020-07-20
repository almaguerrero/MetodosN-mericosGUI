% Este programa realiza la Transformada de Fourier 
% Bidimensional en dos imagenes, despues intercambia 
% la imaginaria de ambas, regresando la imagen 
% al dominio del tiempo
% 
% Dr JCPO 08 Abril 2019 

clear all;
close all;
clc;
%2D FFT Demo

% Importar imageA en color
imageA = imread('in.jpg');
% Cambiar imageA a escala de grises
imageA = rgb2gray(imageA);

% Cambiar el tipo de dato de imageA
% de uint8 a doble punto flotante
imageA = im2double(imageA);
figure;
imshow(imageA);


imageB = imread('in.jpg');
imageB = rgb2gray(imageB);
imageB = im2double(imageB);

figure;
imshow(imageB);

%Perform 2D FFTs

fftA = fft2(double(imageA));
fftB = fft2(double(imageB));

%Display magnitude and phase of 2D FFTs

figure; 
imagesc(fftshift(100*log(1+abs(fftA)))), colormap gray
title('Image A FFT2 Magnitude')
figure;
surfl(fftshift(100*log(1+abs(fftA))));shading interp; colormap(bone);

figure;
imshow(angle(fftshift(fftA)),[-pi pi]), colormap gray
title('Image A FFT2 Phase')
figure;
surfl(angle(fftshift(fftA)));shading interp; colormap(bone);


figure;
imagesc(fftshift(100*log(1+abs(fftB)))), colormap gray
title('Image B FFT2 Magnitude')
figure;
surfl(fftshift(100*log(1+abs(fftB))));shading interp; colormap(bone);

figure, imshow(angle(fftshift(fftB)),[-pi pi]), colormap gray
title('Image B FFT2 Phase');

%Switch magnitude and phase of 2D FFTs

fftC = abs(fftA).*exp(i*angle(fftB));
fftD = abs(fftB).*exp(i*angle(fftA));

%Perform inverse 2D FFTs on switched images

imageC = ifft2(fftC);
imageD = ifft2(fftD);

%Calculate limits for plotting

cmin = min(min(abs(imageC)));
cmax = max(max(abs(imageC)));

dmin = min(min(abs(imageD)));
dmax = max(max(abs(imageD)));

%Display switched images

figure, imshow(abs(imageC), [cmin cmax]), colormap gray
title('Image C  Magnitude')
figure, imshow(abs(imageD), [dmin dmax]), colormap gray
title('Image D  Magnitude')

