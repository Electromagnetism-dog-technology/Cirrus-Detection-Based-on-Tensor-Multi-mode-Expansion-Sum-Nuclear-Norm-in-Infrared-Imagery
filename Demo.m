% This matlab code is for cirrus dectection
%
% Reference:
% Chunping Yang, Xuan Kong, Zhaoyang Cao, Zhenming Peng*, 
% Cirrus Detection Based on Tensor Multi-mode Expansion Sum Nuclear Norm in Infrared Imagery, IEEE Access, 2020, 8, 149963-149983.
%
% Written by Xuan Kong 
% 2020-1-18
%%
clear;
clc;
close all;

addpath('Libs/')
imgpath = 'images/';
imgDir = dir([imgpath 'image1.png']);

img = imread([imgpath imgDir.name]);
figure,subplot(131)
imshow(img),title('Original image')

if ndims( img ) == 3
   img = rgb2gray( img );
end
img = double(img);


%% TMESNN
[backImg,tarImg,~,~]=TMESNN_TRPCA(img,0.1,0.1,0.001,0.001);

%% result
maxv = max(max(double(img)));
E = uint8( mat2gray(tarImg)*maxv );
A = uint8( mat2gray(backImg)*maxv );
subplot(132),imshow(E,[]),title('Target image')
subplot(133),imshow(A,[]),title('Background image')


