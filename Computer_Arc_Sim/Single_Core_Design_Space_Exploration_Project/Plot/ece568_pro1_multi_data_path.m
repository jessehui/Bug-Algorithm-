% X = [];
% Y = [];
% 
% hold on;
% 
% [X , Y] = single_para(X,Y, 1.5229, 0.6567, 18.3101, 'ifqsize 4, decode:width 4 (default)');
% [X , Y] = single_para(X,Y, 1.6051, 0.6230, 18.7856, 'ifqsize 8, decode:width 8');
% [X , Y] = single_para(X,Y, 1.6051, 0.6230, 18.8079, 'ifqsize 8, decode:width 16');
% [X , Y] = single_para(X,Y, 1.6922, 0.5910, 19.4114, 'ifqsize 16, decode:width 8');
% [X , Y] = single_para(X,Y, 1.6954, 0.5898, 19.3929, 'ifqsize 16, decode:width 16');
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
% [X , Y] = single_para(X,Y, 1.5229, 0.6567, 18.3101, 'ifqsize 4, decode:width 4, issue:width 4 (default)');
% [X , Y] = single_para(X,Y, 1.6428, 0.6087, 22.1847, 'ifqsize 8, decode:width 8, issue:width 8');
% [X , Y] = single_para(X,Y, 1.6428, 0.6087, 28.4749, 'ifqsize 8, decode:width 8, issue:width 16');
% [X , Y] = single_para(X,Y, 1.6428, 0.6087, 28.6554, 'ifqsize 8, decode:width 16, issue:width 16');
% [X , Y] = single_para(X,Y, 1.7442, 0.5733, 22.9850, 'ifqsize 16, decode:width 8, issue:width 8');
% [X , Y] = single_para(X,Y, 1.7442, 0.5733, 29.4572, 'ifqsize 16, decode:width 8, issue:width 16');
% [X , Y] = single_para(X,Y, 1.7477, 0.5722, 22.9842, 'ifqsize 16, decode:width 16, issue:width 8');
% [X , Y] = single_para(X,Y, 1.7477, 0.5722, 29.6442, 'ifqsize 16, decode:width 16, issue:width 16');
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
% [X , Y] = single_para(X,Y, 1.5229, 0.6567, 18.3101, 'ifqsize 4, commit:width 4 (default)');
% [X , Y] = single_para(X,Y, 1.5900, 0.6289, 18.3228, 'ifqsize 8, commit:width 8');
% [X , Y] = single_para(X,Y, 1.5900, 0.6289, 18.1668, 'ifqsize 8, commit:width 12');
% [X , Y] = single_para(X,Y, 1.5900, 0.6289, 18.0824, 'ifqsize 8, commit:width 16');
% [X , Y] = single_para(X,Y, 1.6807, 0.5950, 18.9061, 'ifqsize 16, commit:width 8');
% [X , Y] = single_para(X,Y, 1.6807, 0.5950, 18.8303, 'ifqsize 16, commit:width 12');
% [X , Y] = single_para(X,Y, 1.6807, 0.5950, 18.6778, 'ifqsize 16, commit:width 16');
% 
% 
% 
% plot(X,Y);
% xlabel('Performance');
% ylabel('Energy');

%#####################################################
%Branch prediction
% X = [];
% Y = [];
% 
% hold on;
% 
% [X , Y] = single_para(X,Y, 1.2845, 0.7785, 16.6971, '2lev 1 512 8 0, ras 0 ');
% [X , Y] = single_para(X,Y, 1.5229, 0.6567, 18.3101, '2lev 1 1024 8 0, ras 8 (default)');
% [X , Y] = single_para(X,Y, 1.5229, 0.6567, 18.3309, '2lev 1 512 8 0, ras 8 ');
% [X , Y] = single_para(X,Y, 1.5229, 0.6566, 18.3112, '2lev 1 512 8 0, ras 16 ');
% [X , Y] = single_para(X,Y, 1.5229, 0.6566, 18.3453, '2lev 1 512 8 0, ras 32');
% 
% [X , Y] = single_para(X,Y, 1.2845, 0.7785, 16.7265, '2lev 1 256 8 0, ras 0 ');
% [X , Y] = single_para(X,Y, 1.5229, 0.6567, 18.2930, '2lev 1 256 8 0, ras 8 ');
% [X , Y] = single_para(X,Y, 1.5229, 0.6566, 18.3064, '2lev 1 256 8 0, ras 16 ');
% [X , Y] = single_para(X,Y, 1.5229, 0.6566, 18.3195, '2lev 1 256 8 0, ras 32');
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
% [X , Y] = single_para(X,Y, 1.5229, 0.6567, 18.3101, '2lev 1 1024 8 0, btb 512 4 (default)');
% [X , Y] = single_para(X,Y, 1.2845, 0.7785, 16.7265, '2lev 1 1024 4 0, btb 256 4 ');
% [X , Y] = single_para(X,Y, 1.5229, 0.6567, 18.2930, '2lev 1 1024 2 0, btb 128 4 ');
% [X , Y] = single_para(X,Y, 1.5229, 0.6566, 18.3064, '2lev 1 256  2 0, btb 512 2 ');
% 
% 
% 
% 
% plot(X,Y);
% xlabel('Performance');
% ylabel('Energy');



%###############################
%Memory system
% X = [];
% Y = [];
% 
% hold on;
% 
% [X , Y] = single_para(X,Y, 1.5229, 0.6567, 18.3101, 'dl1:128:32:4:l, dl2:1024:64:4:l (default)');
% [X , Y] = single_para(X,Y, 1.5236, 0.6563, 19.5327, 'dl1:256:32:4:l, dl2:2048:64:4:l');
% [X , Y] = single_para(X,Y, 1.5237, 0.6563, 22.6405, 'dl1:512:32:4:l, dl2:1024:64:16:l');
% [X , Y] = single_para(X,Y, 1.5238, 0.6562, 23.3992, 'dl1:256:64:4:l, dl2:1024:128:16:l');
% [X , Y] = single_para(X,Y, 1.5072, 0.6653, 17.0312, 'dl1:64:16:4:l, dl2:512:64:4:l');
% 
% 
% 
% plot(X,Y);
% xlabel('Performance');
% ylabel('Energy');
% 


X = [];
Y = [];

hold on;

[X , Y] = single_para(X,Y, 1.5229, 0.6567, 18.3101, 'dl1:128:32:4:l, il1:512:32:1:l (default)');
[X , Y] = single_para(X,Y, 1.7524, 0.5707, 24.6850, 'dl1:256:32:4:l, il1:1024:64:1:l');
%[X , Y] = single_para(X,Y, 1.5229, 0.6567, 18.2930, 'dl1:512:64:4:l, il1:1024:128:1:l');
[X , Y] = single_para(X,Y, 1.7529, 0.5705, 36.6994, 'dl1:128:64:16:l, il1:512:64:4:l');




plot(X,Y);
xlabel('Performance');
ylabel('Energy');
