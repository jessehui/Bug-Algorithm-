clear all;
clc

%define
DEAD = 0;
ALIVE = 1;
MAX_COL = 32;%matrix column number
MAX_ROW = 32;
GAME_MAP = zeros(MAX_ROW,MAX_COL);
GEN = 3;%generation

%initiative pattern
NEW_MAP = zeros(MAX_ROW,MAX_COL,GEN);
GAME_MAP(13:17,13) = ALIVE;
GAME_MAP(13:17,17) = ALIVE;
GAME_MAP(13,15) = ALIVE;
%GAME_MAP(15,15) = ALIVE;
GAME_MAP(17,15) = ALIVE;

figure
imagesc(GAME_MAP);
title( sprintf('Generation 1') );

NEW_MAP(:,:,1) = GAME_MAP;
 
%display
g = 2
while g <= GEN
    for i = 2:MAX_ROW-1
        for j = 2:MAX_COL-1
            NEW_MAP(i,j,g) = next_gen(i,j,NEW_MAP(:,:,g-1));
        end
    end
    figure
    imagesc(NEW_MAP(:,:,g));
    title( sprintf('Generation %d',g) );
    g = g+1;
end


test1 = NEW_MAP(:,:,1);
col = test1(:,13); %column No.13
for i = 1:30
    col(i) = num2str(col(i));
end
s = strcat(col(1),col(2));
for i=3:30
    s = strcat(s,col(i));
    i = i+1;
end

s = bin2dec(s);
s = dec2hex(s);










