% main file
% Yilin Liu, Aug 7, 2018
clc; clear all; close all

load brain_image
I_org = a5;

% I_org = imread('brain.bmp');   % Brain2
% I_org = im2double(rgb2gray(I_org));

% I_org = phantom(256);          % Shepp Logan

[m, n] = size(I_org);
scale = sqrt(m * n);

load Umask_random_03_01    % Random sampling with 30% sampling rate and 0.1 sampling radius
R_0 = Umask;

% load Umask_Cartesian_70  % Cartesian sampling with 70 readout lines
% R_0 = Umask;

% load Umask_radial_10     % Radial sampling with 10 trajectory lines
% R_0 = Umask;

R = fftshift(R_0);
Y = R.*fft2(I_org) / scale;  % k-space data

lamda  = 0.0001;  % total variation penalty parameter
rho    = 150;  % augmented Lagrangian parameter
numItr = 100;  % maximum times of iteration
rectol = 1e-4;  % stopping tolerance
I_res = rec_tv(R, Y, lamda, rho, numItr, rectol);
I_res2 = rec_mctv(R, Y, lamda, rho, numItr, rectol);

ReErr = norm(abs(I_org(:)) - abs(I_res(:))) / norm(abs(I_org(:)));
ReErr2 = norm(abs(I_org(:)) - abs(I_res2(:))) / norm(abs(I_org(:)));
PSNR = psnr(I_org, abs(I_res));
PSNR2 = psnr(I_org, abs(I_res2));
fprintf('The relative error of TV reconstruction result is %.4f.\n', ReErr)
fprintf('The relative error of MCTV reconstruction result is %.4f.\n', ReErr2)
fprintf('The PSNR of TV reconstruction result is %.4f.\n', PSNR)
fprintf('The PSNR of MCTV reconstruction result is %.4f.\n', PSNR2)

plot_res(I_org, R_0, I_res, I_res2);