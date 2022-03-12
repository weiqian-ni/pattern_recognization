clear;
close all;
clc;
load("F0_PVT.mat");
whole_data = [acrylic black_foam car_sponge flour_sack kitchen_sponge steel_vase];
whole_data = standardize(whole_data);
idx = kmeans(whole_data',6,'Distance','cityblock');
%plot the result
color = 'white';
figure;
for i = 1:60
    if(idx(i) == 1)
        color = 'green';
    end
    if(idx(i) == 2)
        color = 'blue';
    end
    if(idx(i) == 3)
        color = 'red';
    end
    if(idx(i) == 4)
        color = 'yellow';
    end
    if(idx(i) == 5)
        color = 'black';
    end
    if(idx(i) == 6)
        color = 'magenta';
    end
    scatter3(whole_data(1,i),whole_data(2,i),whole_data(3,i),'filled',color);
    hold on;
end
xlabel("pressure");
ylabel("vibration");
zlabel("temperature");

%plot orginal result
figure;
scatter3(whole_data(1,1:10),whole_data(2,1:10),whole_data(3,1:10),"filled",'red');
hold on;
scatter3(whole_data(1,11:20),whole_data(2,11:20),whole_data(3,11:20),"filled",'black');
scatter3(whole_data(1,21:30),whole_data(2,21:30),whole_data(3,21:30),"filled",'yellow');
scatter3(whole_data(1,31:40),whole_data(2,31:40),whole_data(3,31:40),"filled",'blue');
scatter3(whole_data(1,41:50),whole_data(2,41:50),whole_data(3,41:50),"filled",'green');
scatter3(whole_data(1,51:60),whole_data(2,51:60),whole_data(3,51:60),"filled",'magenta');
xlabel("pressure");
ylabel("vibration");
zlabel("temperature");
