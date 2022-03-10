datasets = [
    "D:\scripts\pattern recognization\PR_CW_DATA_2021\acrylic_211_01_HOLD.mat",
    "D:\scripts\pattern recognization\PR_CW_DATA_2021\black_foam_110_01_HOLD.mat",
    "D:\scripts\pattern recognization\PR_CW_DATA_2021\car_sponge_101_01_HOLD.mat",
    "D:\scripts\pattern recognization\PR_CW_DATA_2021\flour_sack_410_01_HOLD.mat",
    "D:\scripts\pattern recognization\PR_CW_DATA_2021\kitchen_sponge_114_01_HOLD.mat",
    "D:\scripts\pattern recognization\PR_CW_DATA_2021\steel_vase_702_01_HOLD.mat"
    ];
for i = 1:length(datasets)
    load(datasets(i));
    figure;
    subplot(4,1,1);
    plot(1:1000,F0pac)
    title('vibrations vs time')
    xlabel('time')
    ylabel('vibration')

    subplot(4,1,2)
    plot(1:1000,F0pdc)
    title('pressure vs time')
    xlabel('time')
    ylabel('pressure')
    
    subplot(4,1,3)
    plot(1:1000,F0tdc)
    title('temperature vs time')
    xlabel('time')
    ylabel('temperature')
    
    subplot(4,1,4)
    plot(1:1000,F0Electrodes)
    title('Electrode Imprdences vs time')
    xlabel('time')
    ylabel('vibration')

end
