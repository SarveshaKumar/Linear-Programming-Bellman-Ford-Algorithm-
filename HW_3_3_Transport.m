% Configuration Data:
% Program: HW_3_3_Transport
% Author: Sarvesha Kumar Kombaiah Seetha
% Version: 1.2
% Date: 4/13/17
% Description:
...
clear
clc
clf
% Set up and Plot Graph
% Specify Nodes:
NdNames ={'SA', 'SB', 'D1', 'D2', 'D3'};
% Specify Edge 
DataN1 = [1 1 1 2 2 2];
N2 = [3 4 5 3 4 5];
TransCosts = [0.06 0.08 0.11 0.12 0.06 0.08];
% Define
GraphG = graph(N1, N2, TransCosts, NdNames);
% Plot 
Graphp = plot(G,'EdgeLabel', G.Edges.Weight);p.XData = [2 2.2 6.2 6 5.8];p.YData = [3 5 2 4 6];
% Setup and Solve LP Problems
% Objective Function:  
%fval = f * X 
% Xi = Source, Xj = destination, Xij source i -> destination j% Order of variables: Xj, Xi, Xij
% Note that there are 3 Xj, 2 Xi and 6 Xij
% Objective Funtion 
Coeff vectorf = [-0.39 -0.37 -0.4 0.23 0.25 0.06 0.08 0.11 0.12 0.06 0.08];
% Constraint Matrix & Vector (A x < b)
A = [1 0 0 0 0  0 0 0 0 0 0; 0 1 0 0 0  0 0 0 0 0 0; 0 0 1 0 0  0 0 0 0 0 0; 0 0 0 1 0  0 0 0 0 0 0; 0 0 0 0 1  0 0 0 0 0 0];
b = [1800 2300 550 2000 1500];
Aeq = [0 0 0 -1 0  1 1 1 0 0 0; 0 0 0 0 -1  0 0 0 1 1 1;-1 0 0 0 0  1 0 0 1 0 0; 0 -1 0 0 0  0 1 0 0 1 0;0 0 -1 0 0  0 0 1 0 0 1];
beq = [0 0 0 0 0];
lb = [0 0 0 0 0  0 0 0 0 0 0];
ub = inf(11,1);
% Solve Reference Case & Print
Solution = linprog(f,A,b,Aeq,beq,lb,ub)Profit = -f*SolutionAProd = Solution(4)AProd = Solution(5)
% SensitivityStudy% +10% on Xa1
f1 = [-0.39 -0.37 -0.4 0.23 0.25 (1.2*0.06) 0.08 0.11 0.12 0.06 0.08];
Solution = linprog(f1,A,b,Aeq,beq,lb,ub)
Profit = -f1*Solution
% -10% on Xa1
f2 = [-0.39 -0.37 -0.4 0.23 0.25 (0.8*0.06) 0.08 0.11 0.12 0.06 0.08];
Solution = linprog(f2,A,b,Aeq,beq,lb,ub)Profit = -f2*Solution
% +10% on Xa2
f1 = [-0.39 -0.37 -0.4 0.23 0.25 0.06 (1.2*0.08) 0.11 0.12 0.06 0.08];
Solution = linprog(f1,A,b,Aeq,beq,lb,ub)Profit = -f1*Solution
% -10% on Xa2
f2 = [-0.39 -0.37 -0.4 0.23 0.25 0.06 (0.8*0.08) 0.11 0.12 0.06 0.08];
Solution = linprog(f2,A,b,Aeq,beq,lb,ub)Profit = -f2*Solution
% +10% on Xa3
f1 = [-0.39 -0.37 -0.4 0.23 0.25 0.06 0.08 (1.2*0.11) 0.12 0.06 0.08];
Solution = linprog(f1,A,b,Aeq,beq,lb,ub)Profit = -f1*Solution
% -10% on Xa3
f2 = [-0.39 -0.37 -0.4 0.23 0.25 0.06 0.08 (0.8*0.11) 0.12 0.06 0.08];
Solution = linprog(f2,A,b,Aeq,beq,lb,ub)Profit = -f2*Solution