clear all;
clc

%define
DEAD = 0;
ALIVE = 1;
MAX_COL = 31;%matrix column number
MAX_ROW = 31;
GAME_MAP = zeros(MAX_ROW,MAX_COL);
GEN = 20;%generation

%initiative pattern
NEW_MAP = zeros(MAX_ROW,MAX_COL,GEN);

%pattern 1 : center (8,8)
GAME_MAP(6:10,6) = ALIVE;
GAME_MAP(6:10,10) = ALIVE;
GAME_MAP(6,8) = ALIVE;
%GAME_MAP(15,15) = ALIVE;
GAME_MAP(10,8) = ALIVE;

%pattern 2 : center (9,24)
GAME_MAP(8:9,23) = ALIVE;
GAME_MAP(8:9,25) = ALIVE;
GAME_MAP(7:8,24) = ALIVE;
GAME_MAP(10,24) = ALIVE;

%pattern 3 : center (23,6)
GAME_MAP(23,5:7) = ALIVE;
GAME_MAP(22:24,6) = ALIVE;



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
    

