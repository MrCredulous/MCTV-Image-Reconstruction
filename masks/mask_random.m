%~~~~变密度随机采样模板 生成程序  包含两个子程序
clc;close all;clear all;
M=256;
N=256;
imSize=[M,N];
p=8;
pctg=0.3;  %采样率0.3 即SR为0.3
distType=2;
radius=0.05;
disp=0;  %disp=0或1  表示是否显示子程序genPDF中的图

%genPDF(imSize,p,pctg,distType,radius,disp) pctg:采样率；radius:中心采样半径 %p:power of polynomial.
% distType:1 or 2 for L1 or L2 distance measure
pdf = genPDF(imSize,p,pctg,distType,radius,disp); %生成采样概率密度函数（pdf）
      %(generates a pdf for a 1d or 2d random sampling pattern with polynomial variable density sampling)  
Umask = genSampling(pdf,10,60);  %变密度随机采样模板

%genSampling(pdf,iter,tol) 
%pdf - probability density function to choose samples from
%	iter - number of tries
%	tol  - the deviation from the desired number of samples in samples

% disp('测量比例，即采样率')
SR = sum(sum(Umask))/(M*N)
 
figure
imshow(Umask)


