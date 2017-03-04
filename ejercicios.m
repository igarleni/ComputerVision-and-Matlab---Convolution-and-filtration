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
formas=imread('formas.png');
imshow(formas);
estrella=imread('estrella.png');
figure,imshow(estrella);
Ires=imfilter(double(formas),double(estrella));
%maximo
[max(max(Ires)) min(min(Ires))] %[max(I(:)) min(I(:))]
Ires=Ires/max(max(Ires));
Ith=(Ires>=0.96);
[rows cols] = find(Ith==1)
[res ces]=size(estrella);
r2=uint16(round(res/2)); c2=uint16(round(ces/2));
for r=1:size(rows)
    inirow =rows(r)-r2+1;
    if (inirow<=0) 
            inirow=1;
    end
     finrow =rows(r)+r2;
    if (finrow>size(formas,1)) 
            finrow=size(formas,1);
    end
    c=r;
        inicol=cols(c)-c2+1;
         if (inicol<=0) 
            inicol=1;
        end
     fincol =cols(c)+c2;
    if (fincol>size(formas,2)) 
            fincol=size(formas,2);
    end
        
        Iest(inirow:inirow+size(estrella,1)-1,inicol:inicol+size(estrella,2)-1)=estrella(1:size(estrella,1),1:size(estrella,2));
    
end
figure,imshow(Iest);

%4.- Analyze distorsion1.jpg and apply different tecniques to improve it
%(delete noise). Specifically, Gaussian smoothing and 'motion' filter. Can
%you find another way to improve its quality?
J=imread('distorsion2.jpg');
H = fspecial('motion',20,45);
MotionBlur = imfilter(J,H,'replicate');        
fg=fspecial('gaussian',10,1.5);
R_gauss=imfilter(J,fg);
figure, subplot (1,3,1),imshow(J),title('original'),...
    subplot (1,3,2), imshow(R_gauss),title('Gaussian'),...
    subplot (1,3,3), imshow(MotionBlur),title('Motion Blurred Image')

%5.- Get corners of formas.png image using MORAVEC method (on pseudo_moravec.m)
I = imread('formas.png');
Isize = size(I);
h = conv2([1 -1], I);
v = conv2([1 -1]', I);
diag1 = conv2([1 0 ; 0  1], I);
diag2 = conv2([0 1; -1 0], I);

%get the min
for i = 2:(Isize(1)-1)
    for j = 2:(Isize(2)-1)
        c(i,j) = min (min( sum(sum(abs(h(i-1:i+1,j-1:j+1)))),...
            sum(sum(abs(v(i-1:i+1,j-1:j+1))))),...
            min( sum(sum(abs(diag1(i-1:i+1,j-1:j+1)))),...
            sum(sum(abs(diag1(i-1:i+1,j-1:j+1))))));
    end
end

%normalize
maxC = max(max(c));
c = c / maxC;

%find corners
corners = c;
Csize = size(c);
for i = 2:(Csize(1)-1)
    for j = 2:(Csize(2)-1)
        square = c((i-1):(i+1),(j-1):(j+1));
        if (max(max(square)) == c(i,j))
            corners(i,j) = 255;
        else
            corners (i,j) = 0;
        end
    end
end

imshow(corners)

