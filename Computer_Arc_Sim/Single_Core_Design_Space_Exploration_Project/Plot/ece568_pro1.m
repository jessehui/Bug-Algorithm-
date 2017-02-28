% X = [];
% Y = [];
% 
% hold on;
% %default
% IPC = 1.5229;   %instructions per cycle
% CPI = 0.6567;   % cycles per instruction
% Ene_Cyc = 18.3101;  % energy / cycle
% Per_Ene = CPI * Ene_Cyc * CPI;  
% plot(IPC, Per_Ene, '*');
% text(IPC, Per_Ene, 'Default');
% X(end+1) = IPC;
% Y(end+1) = Per_Ene;
% 
% 
% %branch prdiction
% IPC = 1.4287;
% CPI = 0.7;
% Ene_Cyc = 17.8654;
% Per_Ene = CPI * Ene_Cyc * CPI;
% plot(IPC, Per_Ene, '*');
% text(IPC, Per_Ene, '2lev');
% X(end+1) = IPC;
% Y(end+1) = Per_Ene;
% 
% % [X , Y] = single_para(X,Y, , , , '');
% 
% [X , Y] = single_para(X,Y, 1.5229, 0.6567, 18.3530, 'bimod');
% 
% [X , Y] = single_para(X,Y, 0.7515, 1.3306, 14.3185, 'nottaken');
% 
% [X , Y] = single_para(X,Y, 0.7580, 1.3192, 14.6071, 'taken');
% 
% 
% plot(X,Y);
% xlabel('Performance');
% ylabel('Energy');



% 
% X = [];
% Y = [];
% 
% hold on;
% 
% [X , Y] = single_para(X,Y, 1.5229, 0.6567, 18.3341, 'bimod = 1024');
% [X , Y] = single_para(X,Y, 1.5229, 0.6567, 18.2929, 'bimod = 2048');
% [X , Y] = single_para(X,Y, 1.5229, 0.6567, 18.2991, 'bimod = 3072');
% [X , Y] = single_para(X,Y, 1.5229, 0.6567, 18.3202, 'bimod = 4096');
% 
% 
% 
% 
% 
% plot(X,Y);
% xlabel('Performance');
% ylabel('Energy');



% 
% 
% X = [];
% Y = [];
% 
% hold on;
% 
% 
% [X , Y] = single_para(X,Y, 1.5229, 0.6567, 18.3230, '1:1024:32:0');
% [X , Y] = single_para(X,Y, 1.5229, 0.6567, 18.3545, '1:2048:8:0');
% [X , Y] = single_para(X,Y, 1.5229, 0.6567, 18.2827, '1:512:8:0');
% [X , Y] = single_para(X,Y, 1.5229, 0.6567, 18.3884, '4:2048:32:0');
% 
% plot(X,Y);
% xlabel('Performance');
% ylabel('Energy');



% 
% X = [];
% Y = [];
% 
% hold on;
% 
% 
% [X , Y] = single_para(X,Y, 1.5229, 0.6567, 18.3757, 'ras = 0');
% [X , Y] = single_para(X,Y, 1.5229, 0.6567, 18.3563, 'ras = 16');
% [X , Y] = single_para(X,Y, 1.5229, 0.6567, 18.3975, 'ras = 32');
% 
% 
% plot(X,Y);
% xlabel('Performance');
% ylabel('Energy');


% 
% X = [];
% Y = [];
% 
% hold on;
% 
% [X , Y] = single_para(X,Y, 1.5229, 0.6567, 18.3101, 'btb = 512 4 (default)');
% [X , Y] = single_para(X,Y, 1.5226, 0.6568, 17.9109, 'btb = 128 4');
% [X , Y] = single_para(X,Y, 1.5229, 0.6567, 18.8229, 'btb = 2048 4');
% [X , Y] = single_para(X,Y, 1.5229, 0.6567, 18.7979, 'btb = 512 16');
% [X , Y] = single_para(X,Y, 1.5223, 0.6569, 17.8460, 'btb = 512 1');
% 
% plot(X,Y);
% xlabel('Performance');
% ylabel('Energy');

% 
% X = [];
% Y = [];
% 
% hold on;
% 
% [X , Y] = single_para(X,Y, 1.5229, 0.6567, 18.3101, 'dl1:128:32:4:l (default)');
% [X , Y] = single_para(X,Y, 1.5236, 0.6563, 19.4561, 'dl1:256:32:4:l');
% [X , Y] = single_para(X,Y, 1.5236, 0.6563, 21.1113, 'dl1:512:32:4:l');
% [X , Y] = single_para(X,Y, 1.5238, 0.6563, 19.3362, 'dl1:128:64:4:l');
% [X , Y] = single_para(X,Y, 1.5236, 0.6563, 22.7087, 'dl1:128:32:16:l');
% [X , Y] = single_para(X,Y, 1.5238, 0.6563, 19.3362, 'dl1:128:64:4:l');
% [X , Y] = single_para(X,Y, 1.5238, 0.6563, 19.3362, 'dl1:128:64:4:l');
% 
% 
% plot(X,Y);
% xlabel('Performance');
% ylabel('Energy');
% 
% 



% 
% X = [];
% Y = [];
% 
% hold on;
% 
% [X , Y] = single_para(X,Y, 1.5229, 0.6567, 18.3101, 'il1:512:32:1:l (default)');
% [X , Y] = single_para(X,Y, 1.0309, 0.9700, 13.9739, 'il1:128:32:1:l');
% [X , Y] = single_para(X,Y, 1.7512, 0.5710, 24.1817, 'il1:2048:32:1:l');
% [X , Y] = single_para(X,Y, 1.7513, 0.5710, 24.2644, 'il1:512:32:4:l');
% [X , Y] = single_para(X,Y, 1.7512, 0.5710, 35.8048, 'il1:512:32:16:l');
% 
% 
% plot(X,Y);
% xlabel('Performance');
% ylabel('Energy');
% 


% X = [];
% Y = [];
% 
% hold on;
% 
% [X , Y] = single_para(X,Y, 1.5229, 0.6567, 18.3101, 'int mult: 1 (default)');
% [X , Y] = single_para(X,Y, 1.5229, 0.6567, 18.3123, 'int mult: 2');
% [X , Y] = single_para(X,Y, 1.5229, 0.6567, 18.3626, 'int mult: 4');
% [X , Y] = single_para(X,Y, 1.5229, 0.6567, 18.3490, 'int mult: 6');
% [X , Y] = single_para(X,Y, 1.5229, 0.6567, 18.3540, 'int mult: 8');
% 
% plot(X,Y);
% xlabel('Performance');
% ylabel('Energy');
% 



X = [];
Y = [];

hold on;

[X , Y] = single_para(X,Y, 1.5229, 0.6567, 18.3101, 'float mult: 1 (default)');
[X , Y] = single_para(X,Y, 1.5345, 0.6517, 18.4217, 'float mult: 2');
[X , Y] = single_para(X,Y, 1.5388, 0.6498, 18.4530, 'float mult: 4');
[X , Y] = single_para(X,Y, 1.5388, 0.6498, 18.4585, 'float mult: 6');
[X , Y] = single_para(X,Y, 1.5388, 0.6498, 18.4352, 'float mult: 8');

plot(X,Y);
xlabel('Performance');
ylabel('Energy');
