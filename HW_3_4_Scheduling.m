% Configuration Data:
% Program: HW_3_4_Sched
% Author: Sarvesha Kumar Kombaiah Seetha
% Version: 2.2
% Date: 4/11/17
clear
clf
clc
% Inputs 
% Specify Nodes:
Names ={'X1', 'X2', 'X3', 'OR1', 'OR2', 'OR3'};
% Specify Edge Data% From Node (Node 1 = Source)
FrmNd =   [1 1 1 2 2 2 3 3 3];    
ToNd =    [4 5 6 4 5 6 4 5 6];
HrCost =  [2 2 2 4 4 4 6 6 6];
Prft =    [9 9 9 20 20 20 32 32 32];
Psuc =    [0.8 0.8 0.8 0.9 0.9 0.9 0.6 0.6 0.6];
% Define and Plot Graph
% Define 
GraphG = digraph(FrmNd, ToNd, HrCost, Names);
% Plot 
Graphplot(G,'EdgeLabel', G.Edges.Weight);
% Solve IP Problem% Constraint values:
b1 = 12;   
% Maximum demand for Type 1 surgery
b2 = 6; b3 = 3;   b4 = 12;    
% Max hrs avail in OR 1
b5 = 12;b6 = 12;
% Bounds
lb = [0 0 0 0 0 0 0 0 0];ub = [];
% Objective Function 1:  
% fval = f1 X1 + f2X2 + ... + f9 X9
% Note that X1 = X14, X2 = X15, ... & X9 = X36
% Objective Funtion Coeff vector for number of surgeries objective
fns = [-1 -1 -1 -1 -1 -1 -1 -1 -1]; 
% Constraint Matrix & Vector (A x < b)
A = [1 1 1 0 0 0 0 0 0; 0 0 0 1 1 1 0 0 0; 0 0 0 0 0 0 1 1 1; 2 0 0 4 0 0 6 0 0 ;0 2 0 0 4 0 0 6 0; 0 0 2 0 0 4 0 0 6]; 
b = [b1 b2 b3 b4 b5 b6];
Ae = [];
be = [];
intcon = [1, 2, 3, 4, 5, 6, 7, 8, 9];
% Solve
Xns = intlinprog(fns,intcon, A ,b, Ae, be, lb, ub)
Ns = -fns*Xns
% Objective Function 2: 
% fval = f1 X1 + f2 X2 + ... + f9 X9% Note that X1 = X14, X2 = X15, ... & X9 = X36
% Objective Funtion Coeff vector for profit objective
fpft = -Prft;  
% Constraint Matrix & Vector (A x < b)
% No change in A, b, Ae, be, or intcon.
% SolveXp
ft = intlinprog(fpft,intcon, A ,b, Ae, be, lb, ub)
Profit = -fpft*Xpft


