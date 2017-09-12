% Paper:Image Saliency Detection Based on Geodesics-like and Boundary Contrast
% Author: Runxin Ma
% Email: gyc@scse.hebut.edu.cn
% Date: 9/12/2017
function [S]=S_GBC(filename,pathname)
%% clear variates
% clear, clc, 
% close all
% addpath(genpath('Funcs'));
%% Parameter Settings
doFrameRemoving = true;        
SRC = pathname;       %Path of input images
srcSuffix = '.jpg';     %suffix for your input image

%% Saliency Map Calculation
% files = dir(fullfile(SRC, strcat('*', srcSuffix)));
for k=1
    srcName = filename;
    noSuffixName = srcName(1:end-length(srcSuffix));
    %% Remove Image Frames
    srcImg = imread(fullfile(SRC, srcName));
    if doFrameRemoving
        [noFrameImg, frameRecord] = removeframe(srcImg, 'sobel');
        [h, w, chn] = size(noFrameImg);
    else
        noFrameImg = srcImg;
        [h, w, chn] = size(noFrameImg);
        frameRecord = [h, w, 1, h, 1, w];
    end
    %% Segment input rgb image into super-pixels
    pixNumInSP = 200;                           %pixels in each super-pixel
    spnumber = round( h * w / pixNumInSP );    
    idxImg = SLIC_Split(noFrameImg, spnumber);
    I=noFrameImg;
    Su=idxImg;
    %% Boundary Contrast Map
    S1=edc(I);
    S1=S1/max(max(S1));
    %figure,imshow(S1,[])
    %% Geodesics-like Map
    [S2,JJJ]=geo(noFrameImg,Su);
    %figure,imshow(S2,[])
    %figure,imshow(JJJ,[])
    %% Fusion
    S0=(S1+S2).*JJJ;
    S0=S0/max(max(S0));
    S=min(min(S0))*ones(frameRecord(1),frameRecord(2));
    S(frameRecord(3):frameRecord(4),frameRecord(5):frameRecord(6))=S0;
%     figure,imshow(S,[])
end
end

        