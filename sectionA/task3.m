load('F0_PVT.mat');
figure;
scatter3(acrylic(1,:),acrylic(2,:),acrylic(3,:),"filled",'red');
hold on;
xlabel("pressure");
ylabel("vibration");
zlabel("temperature");
scatter3(black_foam(1,:),black_foam(2,:),black_foam(3,:),"filled",'black');
scatter3(car_sponge(1,:),car_sponge(2,:),car_sponge(3,:),"filled",'yellow');
scatter3(flour_sack(1,:),flour_sack(2,:),flour_sack(3,:),"filled",'blue');
scatter3(kitchen_sponge(1,:),kitchen_sponge(2,:),kitchen_sponge(3,:),"filled",'green');
scatter3(steel_vase(1,:),steel_vase(2,:),steel_vase(3,:),"filled",'magenta');
legend('acrylic','black foam','car sponge','flour sack','kitchen sponge','steel vase');