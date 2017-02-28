% 
% X = [];
% Y = [];
% 
% hold on;
% 
% [X , Y] = single_para(X,Y, 1.5229, 0.6567, 18.3101, 'ifqsize: 4 (default)');
% [X , Y] = single_para(X,Y, 1.5890, 0.6293, 18.7524, 'ifqsize: 8');
% [X , Y] = single_para(X,Y, 1.6806, 0.5950, 19.3962, 'ifqsize: 16');
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
% [X , Y] = single_para(X,Y, 1.5229, 0.6567, 18.3101, 'issue:width 4 (default)');
% [X , Y] = single_para(X,Y, 1.5229, 0.6567, 21.3746, 'issue:width 8');
% [X , Y] = single_para(X,Y, 1.5229, 0.6567, 27.5353, 'issue:width 16');
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
% [X , Y] = single_para(X,Y, 1.5229, 0.6567, 18.3101, 'issue:inorder false (default)');
% [X , Y] = single_para(X,Y, 0.8049, 1.2424, 13.0251, 'issue:inorder true');
% 
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
% [X , Y] = single_para(X,Y, 1.5229, 0.6567, 18.3101, 'commit:width 4 (default)');
% [X , Y] = single_para(X,Y, 1.5322, 0.6527, 21.4118, 'commit:width 8');
% [X , Y] = single_para(X,Y, 1.5322, 0.6527, 27.3826, 'commit:width 16');
% 
% 
% plot(X,Y);
% xlabel('Performance');
% ylabel('Energy');

% X = [];
% Y = [];
% 
% hold on;
% 
% [X , Y] = single_para(X,Y, 1.2720, 0.7861, 15.9790, 'ruu:size 8');
% [X , Y] = single_para(X,Y, 1.5229, 0.6567, 18.3101, 'ruu:size 16 (default)');
% [X , Y] = single_para(X,Y, 1.5754, 0.6348, 20.4006, 'ruu:size 32');
% 
% 
% 
% plot(X,Y);
% xlabel('Performance');
% ylabel('Energy');



X = [];
Y = [];

hold on;

[X , Y] = single_para(X,Y, 1.5229, 0.6567, 18.3101, 'lsq:size 8 (default)');
[X , Y] = single_para(X,Y, 1.5388, 0.6498, 18.5611, 'lsq:size 16');
[X , Y] = single_para(X,Y, 1.5388, 0.6498, 18.7235, 'lsq:size 32');



plot(X,Y);
xlabel('Performance');
ylabel('Energy');