clear;
clc;
close all;
%load the data
load('F0_PVT.mat');

%standardize data
two_data = [black_foam car_sponge];
two_data = standardize(two_data);

black_foam_pressure = two_data(1,1:10);
black_foam_vibration = two_data(2,1:10);
black_foam_temperature = two_data(3,1:10);
car_sponge_pressure = two_data(1,11:20);
car_sponge_vibration = two_data(2,11:20);
car_sponge_temperature = two_data(3,11:20);

%get mean for black foam and car sponge
black_foam_pressure_mean = mean(black_foam_pressure);
black_foam_vibration_mean = mean(black_foam_vibration);
black_foam_temperature_mean = mean(black_foam_temperature);

car_sponge_pressure_mean = mean(car_sponge_pressure);
car_sponge_vibration_mean = mean(car_sponge_vibration);
car_sponge_temperature_mean = mean(car_sponge_temperature);

%plot the points
%Pressure vs vibration
figure;
scatter(black_foam_pressure,black_foam_vibration,'filled','black');
hold on;
scatter(car_sponge_pressure,car_sponge_vibration,'filled','yellow');
xlabel('pressure');
ylabel('vibration');
%calculate SW and Sb
Sw = ([black_foam_pressure;black_foam_vibration] - [black_foam_pressure_mean;black_foam_vibration_mean]) * ([black_foam_pressure;black_foam_vibration] - [black_foam_pressure_mean;black_foam_vibration_mean])' + ([car_sponge_pressure;car_sponge_vibration] - [car_sponge_pressure_mean;car_sponge_vibration_mean]) * ([car_sponge_pressure;car_sponge_vibration] - [car_sponge_pressure_mean;car_sponge_vibration_mean])';
Sb = ([black_foam_pressure_mean;black_foam_vibration_mean] - [car_sponge_pressure_mean;car_sponge_vibration_mean]) * ([black_foam_pressure_mean;black_foam_vibration_mean] - [car_sponge_pressure_mean;car_sponge_vibration_mean])';
[V,D,U] = eig(Sw\Sb);
V_1 = V(:,1);
plot([-V_1(1),V_1(1)]*2.5,[V_1(2),-V_1(2)]*2.5);
%pressure vs temperature
figure;
scatter(black_foam_pressure,black_foam_vibration,'filled','black');
hold on;
scatter(car_sponge_pressure,car_sponge_temperature,'filled','yellow');
xlabel('pressure');
ylabel('temperature');
Sw = ([black_foam_pressure;black_foam_temperature] - [black_foam_pressure_mean;black_foam_temperature_mean]) * ([black_foam_pressure;black_foam_temperature] - [black_foam_pressure_mean;black_foam_temperature_mean])' + ([car_sponge_pressure;car_sponge_temperature] - [car_sponge_pressure_mean;car_sponge_temperature_mean]) * ([car_sponge_pressure;car_sponge_temperature] - [car_sponge_pressure_mean;car_sponge_temperature_mean])';
Sb = ([black_foam_pressure_mean;black_foam_temperature_mean] - [car_sponge_pressure_mean;car_sponge_temperature_mean]) * ([black_foam_pressure_mean;black_foam_temperature_mean] - [car_sponge_pressure_mean;car_sponge_temperature_mean])';
[V,D,U] = eig(Sw\Sb);
V_1 = V(:,1);
plot([-V_1(1),V_1(1)]*2.5,[V_1(2),-V_1(2)]*2.5);
%temperature vs vibration
figure;
scatter(black_foam_temperature,black_foam_vibration,'filled','black');
hold on;
scatter(car_sponge_temperature,car_sponge_vibration,'filled','yellow');
xlabel('temperature');
ylabel('vibration');
Sw = ([black_foam_temperature;black_foam_vibration] - [black_foam_temperature_mean;black_foam_vibration_mean]) * ([black_foam_temperature;black_foam_vibration] - [black_foam_temperature_mean;black_foam_vibration_mean])' + ([car_sponge_temperature;car_sponge_vibration] - [car_sponge_temperature_mean;car_sponge_vibration_mean]) * ([car_sponge_temperature;car_sponge_vibration] - [car_sponge_temperature_mean;car_sponge_vibration_mean])';
Sb = ([black_foam_temperature_mean;black_foam_vibration_mean] - [car_sponge_temperature_mean;car_sponge_vibration_mean]) * ([black_foam_temperature_mean;black_foam_vibration_mean] - [car_sponge_temperature_mean;car_sponge_vibration_mean])';
[V,D,U] = eig(Sw\Sb);
V_1 = V(:,1);
plot([-V_1(1),V_1(1)]*2.5,[V_1(2),-V_1(2)]*2.5);
