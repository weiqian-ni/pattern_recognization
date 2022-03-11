clc;
clear;

%task a
%get the electrode data
time_step = 350;
mat_name = ["acrylic_211_01_HOLD", "acrylic_211_02_HOLD","acrylic_211_03_HOLD","acrylic_211_04_HOLD","acrylic_211_05_HOLD","acrylic_211_06_HOLD","acrylic_211_07_HOLD","acrylic_211_08_HOLD","acrylic_211_09_HOLD","acrylic_211_10_HOLD","black_foam_110_01_HOLD", "black_foam_110_02_HOLD","black_foam_110_03_HOLD","black_foam_110_04_HOLD","black_foam_110_05_HOLD","black_foam_110_06_HOLD","black_foam_110_07_HOLD","black_foam_110_08_HOLD","black_foam_110_09_HOLD","black_foam_110_10_HOLD","car_sponge_101_01_HOLD","car_sponge_101_02_HOLD","car_sponge_101_03_HOLD","car_sponge_101_04_HOLD","car_sponge_101_05_HOLD","car_sponge_101_06_HOLD","car_sponge_101_07_HOLD","car_sponge_101_08_HOLD","car_sponge_101_09_HOLD","car_sponge_101_10_HOLD","flour_sack_410_01_HOLD","flour_sack_410_02_HOLD","flour_sack_410_03_HOLD","flour_sack_410_04_HOLD","flour_sack_410_05_HOLD","flour_sack_410_06_HOLD","flour_sack_410_07_HOLD","flour_sack_410_08_HOLD","flour_sack_410_09_HOLD","flour_sack_410_10_HOLD","kitchen_sponge_114_01_HOLD","kitchen_sponge_114_02_HOLD","kitchen_sponge_114_03_HOLD","kitchen_sponge_114_04_HOLD","kitchen_sponge_114_05_HOLD","kitchen_sponge_114_06_HOLD","kitchen_sponge_114_07_HOLD","kitchen_sponge_114_08_HOLD","kitchen_sponge_114_09_HOLD","kitchen_sponge_114_10_HOLD","steel_vase_702_01_HOLD", "steel_vase_702_02_HOLD", "steel_vase_702_03_HOLD", "steel_vase_702_04_HOLD", "steel_vase_702_05_HOLD", "steel_vase_702_06_HOLD", "steel_vase_702_07_HOLD", "steel_vase_702_08_HOLD", "steel_vase_702_09_HOLD", "steel_vase_702_10_HOLD"];
prefix = "D:\scripts\pattern recognization\PR_CW_DATA_2021\";
total_electrode_data = [];
for i = 1:length(mat_name)
    load(prefix+mat_name(i));
    total_electrode_data = [total_electrode_data F0Electrodes(:,time_step)];
end

%get covariance matrix
covariance_matrix = cov(total_electrode_data');
[V,D,W] = eig(covariance_matrix);

%get the Scree plot
eigenvalues = zeros(1,19);
for i = 19:-1:1
    eigenvalues(1,20-i) = D(i,i);
end
figure;
plot(eigenvalues,'-o');
ylabel("eigenvalues");

%task b
%standardize the data
standardized_electrode_data = standard(total_electrode_data);
V_1 = V(:,19);
V_2 = V(:,18);
V_3 = V(:,17);
projection_1 = V_1' * standardized_electrode_data;
projection_2 = V_2' * standardized_electrode_data;
projection_3 = V_3' * standardized_electrode_data;
%plot the scattered graph
figure;
scatter3(projection_1,projection_2,projection_3,"filled",'blue');
%plot the eigenvectors
hold on;
plot3(zeros(1,101),0:0.01:1,zeros(1,101));
plot3(0:0.01:1,zeros(1,101),zeros(1,101));
plot3(zeros(1,101),zeros(1,101),0:0.01:1);
