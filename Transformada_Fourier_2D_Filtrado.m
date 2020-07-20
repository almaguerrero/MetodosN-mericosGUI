% Este programa realiza la Transformada de Fourier 
% Bidimensional en una imagen, 
% despues le aplica diferentes tipos de filtro  
% la regresa al dominio del tiempo, 
% pudiendo visualizar el resultado
% 
% 
% Dr JCPO 10 Abril 2019 


clear all;
close all;
clc;
%2D FFT Demo

% Importar imageA en color
%imageA = imread('lena.bmp');
%imageA = imread('oIumJ.png');
imageA = imread('orginal.jpg');


% Cambiar imageA a escala de grises
%imageA = rgb2gray(imageA);
[ax ay] = size(imageA);

% Cambiar el tipo de dato de imageA
% de uint8 a doble punto flotante
imageA = im2double(imageA);
figure;
imshow(imageA);

% Creacion del filtro
mask1=zeros(ax,ay);

tam=30;
lim_inf_x=round(ax/2)-tam;
lim_sup_x=round(ax/2)+tam;
lim_inf_y=round(ay/2)-tam;
lim_sup_y=round(ay/2)+tam;
mask1(lim_inf_x:lim_sup_x,lim_inf_y:lim_sup_y)=1;


mask2=1-mask1;

figure;
subplot(2,2,1);imshow(mask1);
subplot(2,2,2);imshow(mask2);


%Perform 2D FFTs

fftA = fft2(double(imageA));
Mag_fftA=abs(fftA);
Phase_fftA=angle(fftA);
%Display magnitude and phase of 2D FFTs

figure; 
imagesc(fftshift(100*log(1+Mag_fftA))), colormap gray
title('Image A FFT2 Magnitude')
figure;
surfl(fftshift(100*log(1+Mag_fftA)));shading interp; colormap(bone);

figure;
imshow(fftshift(Phase_fftA),[-pi pi]), colormap gray
title('Image A FFT2 Phase')
figure;
surfl(fftshift(Phase_fftA));shading interp; colormap(bone);

Mag_filtrada=fftshift(Mag_fftA).*mask1;
Fase_filtrada=fftshift(Phase_fftA).*mask1;

figure; 
imagesc((100*log(1+Mag_filtrada))), colormap gray
title('Filtered Magnitude')
figure;
surfl((100*log(1+Mag_filtrada)));shading interp; colormap(bone);

figure;
imshow((Fase_filtrada),[-pi pi]), colormap gray
title('Filtered Phase')
figure;
surfl((Fase_filtrada));shading interp; colormap(bone);

% Mag_filtrada=fftshift(Mag_filtrada);
% 
% Fase_filtrada=fftshift(Fase_filtrada);


% Switch magnitude and phase of 2D FFTs

fftC = Mag_filtrada.*exp(i*Fase_filtrada);

%Perform inverse 2D FFTs on switched images

imageC = ifft2(fftC);

%Calculate limits for plotting

cmin = min(min(abs(imageC)));
cmax = max(max(abs(imageC)));

%Display switched images

figure, imshow(abs(imageC), [cmin cmax]), colormap gray
title('Image Filtered')

