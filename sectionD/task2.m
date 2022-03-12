close all;
clear;
clc;
%get the electrode data
time_step = 350;
mat_name = ["acrylic_211_01_HOLD", "acrylic_211_02_HOLD","acrylic_211_03_HOLD","acrylic_211_04_HOLD","acrylic_211_05_HOLD","acrylic_211_06_HOLD","acrylic_211_07_HOLD","acrylic_211_08_HOLD","acrylic_211_09_HOLD","acrylic_211_10_HOLD","black_foam_110_01_HOLD", "black_foam_110_02_HOLD","black_foam_110_03_HOLD","black_foam_110_04_HOLD","black_foam_110_05_HOLD","black_foam_110_06_HOLD","black_foam_110_07_HOLD","black_foam_110_08_HOLD","black_foam_110_09_HOLD","black_foam_110_10_HOLD","car_sponge_101_01_HOLD","car_sponge_101_02_HOLD","car_sponge_101_03_HOLD","car_sponge_101_04_HOLD","car_sponge_101_05_HOLD","car_sponge_101_06_HOLD","car_sponge_101_07_HOLD","car_sponge_101_08_HOLD","car_sponge_101_09_HOLD","car_sponge_101_10_HOLD","flour_sack_410_01_HOLD","flour_sack_410_02_HOLD","flour_sack_410_03_HOLD","flour_sack_410_04_HOLD","flour_sack_410_05_HOLD","flour_sack_410_06_HOLD","flour_sack_410_07_HOLD","flour_sack_410_08_HOLD","flour_sack_410_09_HOLD","flour_sack_410_10_HOLD","kitchen_sponge_114_01_HOLD","kitchen_sponge_114_02_HOLD","kitchen_sponge_114_03_HOLD","kitchen_sponge_114_04_HOLD","kitchen_sponge_114_05_HOLD","kitchen_sponge_114_06_HOLD","kitchen_sponge_114_07_HOLD","kitchen_sponge_114_08_HOLD","kitchen_sponge_114_09_HOLD","kitchen_sponge_114_10_HOLD","steel_vase_702_01_HOLD", "steel_vase_702_02_HOLD", "steel_vase_702_03_HOLD", "steel_vase_702_04_HOLD", "steel_vase_702_05_HOLD", "steel_vase_702_06_HOLD", "steel_vase_702_07_HOLD", "steel_vase_702_08_HOLD", "steel_vase_702_09_HOLD", "steel_vase_702_10_HOLD"];
prefix = "D:\scripts\pattern recognization\PR_CW_DATA_2021\";
total_electrode_data = [];
for i = 1:length(mat_name)
    load(prefix+mat_name(i));
    total_electrode_data = [total_electrode_data F0Electrodes(:,time_step)];
end
electrode_types = ["E1","E2","E3","E4","E5","E6","E7","E8","E9","E10","E11","E12","E13","E14","E15","E16","E17","E18","E19"]';
%split training testing data
%??
rng(1); % For reproducibility
total_electrode_data_reformed = reshape(total_electrode_data',[19*60,1]);
labels = [];
for i = 1:19
    for j = 1:60
        labels = [labels electrode_types(i)];
    end
end
labels = labels';

Mdl = TreeBagger(50,total_electrode_data_reformed,labels,'OOBPrediction','On',...
    'Method','classification')
view(Mdl.Trees{1},'Mode','graph')

figure;
oobErrorBaggedEnsemble = oobError(Mdl);
plot(oobErrorBaggedEnsemble)
xlabel 'Number of grown trees';
ylabel 'Out-of-bag classification error';

