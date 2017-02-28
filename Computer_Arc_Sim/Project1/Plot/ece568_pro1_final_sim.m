

X = [];
Y = [];

hold on;

[X , Y] = single_para(X,Y, 1.5229, 0.6567, 18.3101, 'default configuration');
[X , Y] = single_para(X,Y, 2.1052, 0.4750, 26.3169, 'bimod, commit width: 16, HP');
[X , Y] = single_para(X,Y, 2.1186, 0.4720, 27.1646, 'bimod, commit width: 8, HP');
[X , Y] = single_para(X,Y, 1.8811, 0.5316, 25.0468, '2-lev, commit width: 16, HP');
[X , Y] = single_para(X,Y, 1.8866, 0.5300, 25.7384, '2-lev, commit width: 8, HP');

[X , Y] = single_para(X,Y, 1.8142, 0.5512, 21.7758, 'Bimod, commit width 8, BTB 128 4 RUU 16, LP');
[X , Y] = single_para(X,Y, 1.6911, 0.5913, 21.6146, '2-lev, commit width 8, BTB 128 4 RUU 16, LP');

plot(X,Y);
xlabel('Performance');
ylabel('Energy');

title('HP: High Performance, LP: Low Power')