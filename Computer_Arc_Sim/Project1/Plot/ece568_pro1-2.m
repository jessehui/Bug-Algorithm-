
X = [];
Y = [];

hold on;

[X , Y] = single_para(X,Y, 1.5229, 0.6567, 18.3101, 'ifqsize: 4 (default)');
[X , Y] = single_para(X,Y, 1.5890, 0.6293, 18.7524, 'ifqsize: 8');
[X , Y] = single_para(X,Y, 1.6806, 0.5950, 19.3962, 'ifqsize: 16');


plot(X,Y);
xlabel('Performance');
ylabel('Energy');