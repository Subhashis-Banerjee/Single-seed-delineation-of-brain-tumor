 clear all; close all; clc;
 
 I = imread('t1.pgm');
 imshow(I, [])
 title('Original Image');
 
 % Compute the thresholds
 thresh = multithresh(I,4);
 
 T(1)=1;
 T(6)=255;
 T(2:5)=thresh;
 V2  = assignLebel3(I, T);
 imshow(V2);