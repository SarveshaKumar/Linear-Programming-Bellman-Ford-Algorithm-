% Configuration Data:
% Program: HW_3_5_Transship
% Author: Sarvesha Kumar Kombaiah Seetha
% Version: 2.2
% Date: 1/5/17
clear
clf
clc
% Set up and Plot Graph
% Specify Nodes:
NdNames ={'LA', 'Seattle', 'Chicago', 'Dallas', 'Philly', 'Baltimore'};
% Specify Edge Data% From Node
N1 = [1 1 1 1 1 2 2 2 2 2 3 3 3 3 3 4 4 4 4 4 5 5 5 5 5 6 6 6 6 6];
% To Node
N2 = [2 3 4 5 6 1 3 4 5 6 1 2 4 5 6 1 2 3 5 6 1 2 3 4 6 1 2 3 4 5];
% Cost MatrixCost = [90 150 100 200 250  90 100 120 180 240  150 100 50 120 140 ...100 120 50 100 150  200 180 120 100 30  250 240 140 150 30];
    % Define
    GraphG = digraph(N1, N2, Cost, NdNames);
    % Plot 
    Graphp = plot(G,'EdgeLabel', G.Edges.Weight);
    %p.XData = [2 2.0 4 4.2 6 6.2];
    %p.YData = [3 5.2 2 6.2 2 6.2];
    % Setup and Solve LP Problems
    % Objective Function:  
    % fval = Sum(Xij Cij)
    % Xij -i = source, j = destination
    % Objective Funtion Coeff vectorf = Cost;
    % Constraint Matrix & Vector (A x < b)A = [0 0 0 0 0  0 0 0 0 0  1 1 1 1 1  ...0 0 0 0 0  0 0 0 0 0  0 0 0 0 0; 0 0 0 0 0  0 0 0 0 0  0 0 0 0 0  ...1 1 1 1 1  0 0 0 0 0  0 0 0 0 0]; 
    b = [100 200];
    Aeq = [ 0 0 0 0 0   1 0 0 0 0   1 0 0 0 0  ...1 0 0 0 0   1 0 0 0 0   1 0 0 0 0; -1 0 0 0 0   1 1 1 1 1  0 -1 0 0 0  ...0 -1 0 0 0  0 -1 0 0 0  0 -1 0 0 0;0 0 0 -1 0  0 0 0 -1 0  0 0 0 -1 0  ...0 0 0 -1 0   1 1 1 1 1  0 0 0 -1 0; 0 0 0 0 1   0 0 0 0 1  0 0 0 0 1  ...0 0 0 0 1   0 0 0 0 1  0 0 0 0 0];
    beq = [130 0 0 140];
    lb = zeros(30,1);
    ub = inf(30,1);
    % Solveusing LP% 
    [Soln, TotCost] = linprog(f,A,b,Aeq,beq,lb,ub)
    % Solve using IP% Specify Soln(i) elements that must be integers
intcon = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30];[Soln, TotCost] =intlinprog(f,intcon,A,b,Aeq,beq,lb,ub)