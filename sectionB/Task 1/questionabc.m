clc;
clear;
load('D:\PR\pattern_recognization-main\F0_PVT.mat');
%part a
pressure = [acrylic(1,:) black_foam(1,:) car_sponge(1,:) flour_sack(1,:) kitchen_sponge(1,:) steel_vase(1,:)];
vibration = [acrylic(2,:) black_foam(2,:) car_sponge(2,:) flour_sack(2,:) kitchen_sponge(2,:) steel_vase(2,:)];
temperature = [acrylic(3,:) black_foam(3,:) car_sponge(3,:) flour_sack(3,:) kitchen_sponge(3,:) steel_vase(3,:)];
dataMatrix = [pressure; vibration; temperature];
covariance_matrix = cov(dataMatrix');
[V,D,W] = eig(covariance_matrix);

%part b

standardized_data = standard(dataMatrix);
standardized_V = standard(V);
figure;

scatter3(standardized_data(1,:),standardized_data(2,:),standardized_data(3,:),"filled",'blue');
xlabel("pressure");
ylabel("vibration");
zlabel("temperature");
hold on;

Z = zeros(1,3);
V_1 = V(:,1)';
V_2 = V(:,2)';
V_3 = V(:,3)';
pts1 = [Z; V_1];
pts2 = [Z; V_2];
pts3 = [Z; V_3];
plot3(pts1(:,1), pts1(:,2), pts1(:,3))
plot3(pts2(:,1), pts2(:,2), pts2(:,3))
plot3(pts3(:,1), pts3(:,2), pts3(:,3))

%part c
data_projected1 = V_3 * standardized_data;
data_projected2 = V_2 * standardized_data;
projected_data = [data_projected1;data_projected2];
figure;
scatter(data_projected1, data_projected2);
