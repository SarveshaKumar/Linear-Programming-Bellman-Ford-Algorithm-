% Configuration Data:
% Program: HW_3_1_Short Path CPM BEllman Ford 
% Author: Sarvesha Kumar Kombaiah Seetha 
% Version: 2.2
% Date: 4/11/17
clear
clf
clc
% Inputs  
% Specify Nodes:
Names ={'Source', 'N2', 'N3', 'N4', 'N5', 'N6', 'Dest'};
% Specify Edge Data% 
From Node (Node 1 = Source)FrmNd = [1  1  2  3  2  3  3  4  5  5  6  4  5  6];    
ToNd =  [2  3  3  2  4  5  6  5  4  6  5  7  7  7];
Cost =  [60 30 10 10 30 50 70 10 10 10 10 50 30 10];
% Calculate & Output
% Define 
GraphG = digraph(FrmNd, ToNd, Cost, Names);
% Plot 
Graphplot(G,'EdgeLabel', G.Edges.Weight);pausep = plot(G)
% Calculate and plot the shortest path
[shortPath,Length] = shortestpath(G,'Source','Dest')highlight(p, shortPath, 'MarkerSize', 6, 'NodeColor','r', 'EdgeColor','g')dend
% Find 
PathLPcnt = 1;        
% Path
counterCPath(LPcnt) = 1;   
% Set first node in path = 1
for LPcnt = 2:1:Nn
    CPath(LPcnt) = Follow(CPath(LPcnt-1));
if CPath(LPcnt) == 0CPath(LPcnt) = Nn;
    endendCritPath = CPathMaxCost = MaxLn(1)