function [f, g] = Fitness_Maeda2019(x)

% Simulation settings
options = odeset('RelTol',1e-6,'AbsTol',ones(1,14)*1e-6);
ode = @Model_ODE;
odeaux = @Model_Flux;
% span = -50:0.1:50; % original
span = [ -50, -15, -8, -4, 0, 0.1, 0.2, 0.3, 0.5, 1, 2, 4, 8, 15, 30 ]; % for making quasi-experimental data

% Set GA results
x_original = setGAresult(); % This is for the original Maeda model


%% Simulation
% 13-fold upshift--wildtype
strain_no = 1;
y1 = setInitConc();
param1 = setParamSet(x_original);
[y1, param1] = modifyInitConcAndParamSet(y1, param1, x_original, strain_no);
param1 = setModParam_Maeda2019(param1,x);
[ T1, Y1 ] = runSimulation(ode,odeaux,span,y1,param1,options);
% printParamValues(y1,param1); % Use this line to print initial condition and parameter values.
T1 = real(T1);
Y1 = real(Y1);

% 13-fold upshift--deltaGDH
strain_no = 2;
y2 = setInitConc();
param2 = setParamSet(x_original);
[y2, param2] = modifyInitConcAndParamSet(y2, param2, x_original, strain_no);
param2 = setModParam_Maeda2019(param2,x);
[ T2, Y2 ] = runSimulation(ode,odeaux,span,y2,param2,options);
% printParamValues(y2,param2); % Use this line to print initial condition and parameter values.
T2 = real(T2);
Y2 = real(Y2);

% 13-fold upshift--deltaGOGAT
strain_no = 3;
y3 = setInitConc();
param3 = setParamSet(x_original);
[y3, param3] = modifyInitConcAndParamSet(y3, param3, x_original, strain_no);
param3 = setModParam_Maeda2019(param3,x);
[ T3, Y3 ] = runSimulation(ode,odeaux,span,y3,param3,options);
% printParamValues(y3,param3); % Use this line to print initial condition and parameter values.
T3 = real(T3);
Y3 = real(Y3);


%% Fitness calculation
if T1(end) ~= span(end) || T2(end) ~= span(end) || T3(end) ~= span(end)
    f = 1e+10;
    g = 1e+10;
    return;
end

MSE = zeros(3,1);

% WT
strain_no = 1;
[T_exp, GLU_exp, GLN_exp] = ExpData_Maeda2019(strain_no);
MSE(strain_no) = calcMSE(T1,Y1(:,11:12),T_exp,[GLU_exp,GLN_exp]); % MSE

% deltaGDH
strain_no = 2;
[T_exp, GLU_exp, GLN_exp] = ExpData_Maeda2019(strain_no);
MSE(strain_no) = calcMSE(T2,Y2(:,11:12),T_exp,[GLU_exp,GLN_exp]); % MSE

% deltaGOGAT
strain_no = 3;
[T_exp, GLU_exp, GLN_exp] = ExpData_Maeda2019(strain_no);
MSE(strain_no) = calcMSE(T3,Y3(:,11:12),T_exp,[GLU_exp,GLN_exp]); % MSE

BOF = sqrt(mean(MSE)); % BOF

x_pred = getMLpredictedX();
RMSE = sqrt( mean( ( log10(x) - log10(x_pred) ) .^ 2 ) ); % RMSE

% Constrained optimization
f = RMSE;
g = BOF - 2e-2;

% Unconstrained optimization
% f = BOF;


function x_pred = getMLpredictedX()
% Unit: mM
% x_pred( 1): Kututp    % 2.7.7.59 % 75
% x_pred( 2): Kutippi   % 2.7.7.59 % 13
% x_pred( 3): Kgdhog    % 1.4.1.4  % 26
% x_pred( 4): Kgdhnh    % 1.4.1.4  % 1342
% x_pred( 5): Kgdhglu   % 1.4.1.4  % 25
% x_pred( 6): Kgdhnadph % 1.4.1.4  % 5
% x_pred( 7): Kgdhnadp  % 1.4.1.4  % 6
% x_pred( 8): Kgoggln   % 1.4.1.13 % 64
% x_pred( 9): Kgogog    % 1.4.1.13 % 26
% x_pred(10): Kgognadph % 1.4.1.13 % 5
% x_pred(11): Kgogglu   % 1.4.1.13 % 25
% x_pred(12): Kgognadp  % 1.4.1.13 % 6
% x_pred(13): Kgsatp    % 6.3.1.2  % 2
% x_pred(14): Kgsglu    % 6.3.1.2  % 25
% x_pred(15): Kgsnh     % 6.3.1.2  % 1342
% x_pred(16): Kgsadp    % 6.3.1.2  % 8
% x_pred(17): Kgspi     % 6.3.1.2  % 9
% x_pred(18): Kgsgln    % 6.3.1.2  % 64

% /Users/maeda/Desktop/Projects/Km_Prediction/DataForPaper/ML_Results/Analysis/PredictKm_20220721_2/Table_Output.csv
x_pred = [ ...
    0.094881849;
    0.284704951;
    1.195200328;
    0.510117202;
    6.020398393;
    0.039969346;
    0.044580063;
    0.298684843;
    0.103969398;
    0.027663856;
    1.347789085;
    0.137337452;
    0.723790021;
    2.645247309;
    0.297217597;
    0.071184366;
    0.779063434;
    0.312872282;
    ];

x_pred = x_pred'; % 1 x n --> n x 1

