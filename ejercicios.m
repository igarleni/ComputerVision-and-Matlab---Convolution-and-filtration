%1.- Compare the result produced by gaussian filter and median filter over
%disney_r*.png images
I1=imread('disney_r1.png');
fg=fspecial('gaussian',10,1.5);
R_gauss1=imfilter(I1,fg);

I2=imread('disney_r2.png');
fg=fspecial('gaussian',10,1.5);
R_gauss2=imfilter(I2,fg);

I3 = imread('disney_r3.png');
fg = fspecial('gaussian',10,1.5);
R_gauss3 = imfilter(I3,fg);

I4 = imread('disney_r4.png');
fg = fspecial('gaussian',10,1.5);
R_gauss4 = imfilter(I4,fg);

I5 = imread('disney_r5.png');
fg = fspecial('gaussian',10,1.5);
R_gauss5 = imfilter(I5,fg);

figure, subplot(2,3,1), imshow(R_gauss1), ...
    subplot(2,3,2), imshow(R_gauss2), ...
    subplot(2,3,3), imshow(R_gauss3), ...
    subplot(2,3,4), imshow(R_gauss4), ...
    subplot(2,3,5), imshow(R_gauss5);

%2.- How can you improve images' quality distorsion2.jpg, rostro1.jpg and
%rostro2.png?
J1 = imread('distorsion2.jpg');
fg = fspecial('unsharp');
J1filter = imfilter(J1,fg);
J2 = imread('rostro2.png');
fg = fspecial('gaussian',10,0.5);
J2filter = imfilter(J2,fg);
figure, subplot(2,2,1), imshow(J1), ...
    subplot(2,2,2), imshow(J2), ...
    subplot(2,2,3), imshow(J1filter), ...
    subplot(2,2,4), imshow(J2filter);

%3.- Use correlation to find forms onto an image. Use one of these:
%formas.png, estrella.png, ovalo.png, cuadrado.png, cuadrado2.png,
%cuadrado3.png, texto.png, letra_i.png, letra_k.png, letra_m.png, 
%letra_o.png, letra_p.png
main = imread('formas.png');
star = imread('estrella.png');
circle = imread('ovalo.png');
square1 = imread('cuadrado.png');
square2 = imread('cuadrado2.png');
square3 = imread('cuadrado3.png');

%4.- Analyze distorsion1.jpg and apply different tecniques to improve it
%(delete noise). Specifically, Gaussian smoothing and 'motion' filter. Can
%you find another way to improve its quality?


%5.- Get corners of formas.png image using moravec method (on pseudo_moravec.m)
