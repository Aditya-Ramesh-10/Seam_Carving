clear
clc
close all

im = imread('lake_gen.jpg');
imshow(im);

% Scaling factor
scale_on = 'c'; % can be made to 'r' for rows
scale_factor = 0.75;


o_im = seam_carving(im, scale_on, scale_factor);
figure, imshow(o_im)

figure, subplot(1,2,1), imshow(im)
subplot(1,2,2), imshow(o_im)