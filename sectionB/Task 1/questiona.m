clc;
clear;
load('D:\scripts\pattern recognization\wn1918\sectionB\F0_PVT.mat');
pressure = [acrylic(1,:) black_foam(1,:) car_sponge(1,:) flour_sack(1,:) kitchen_sponge(1,:) steel_vase(1,:)];
vibration = [acrylic(2,:) black_foam(2,:) car_sponge(2,:) flour_sack(2,:) kitchen_sponge(2,:) steel_vase(2,:)];
temperature = [acrylic(3,:) black_foam(3,:) car_sponge(3,:) flour_sack(3,:) kitchen_sponge(3,:) steel_vase(3,:)];
dataMatrix = [pressure; vibration; temperature];
covariance_matrix = cov(dataMatrix');
[V,D,W] = eig(covariance_matrix);