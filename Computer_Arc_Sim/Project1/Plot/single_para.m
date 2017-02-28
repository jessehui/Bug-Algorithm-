function [X,Y] = single_para(X, Y, IPC, CPI, Ene_Cyc, para)
    Per_Ene = CPI * Ene_Cyc * CPI;  
    plot(IPC, Per_Ene, '*');
    text(IPC, Per_Ene, para);
    X(end+1) = IPC;
    Y(end+1) = Per_Ene;

end