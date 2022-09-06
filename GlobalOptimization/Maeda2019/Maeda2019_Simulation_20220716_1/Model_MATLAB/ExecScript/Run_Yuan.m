clearvars;

%% Directory and file settings
RootDir = '../'; % Model_MATLAB
ExpDataDir = strcat(RootDir,'ExpData'); % Model_MATLAB/ExpData
InputDir = strcat(RootDir,'Input'); % Model_MATLAB/Input
ModelDir = strcat(RootDir,'Model'); % Model_MATLAB/Model
UtilDir  = strcat(RootDir,'Util');  % Model_MATLAB/Util
PlotDir  = strcat(RootDir,'Plot');  % Model_MATLAB/Plot
outputfile = 'Yuan.mat';

%% Add path
addpath(ExpDataDir);
addpath(InputDir);
addpath(ModelDir);
addpath(UtilDir);
addpath(PlotDir);

%% Simulation settings
options = odeset('RelTol',1e-10,'AbsTol',ones(1,14)*1e-10);
ode = @Model_ODE;
odeaux = @Model_Flux;
span = -50:0.1:50;
spanplot = [-5 50];

%% Set GA results
x = setGAresult;

%% 13-fold upshift--wildtype
strain_no = 1;
y1 = setInitConc();
param1 = setParamSet(x);
[y1, param1] = modifyInitConcAndParamSet(y1, param1, x, strain_no);
[ T1, Y1, F1 ] = runSimulation(ode,odeaux,span,y1,param1,options);
% printParamValues(y1,param1); % Use this line to print initial condition and parameter values.

%% 13-fold upshift--deltaGDH
strain_no = 2;
y2 = setInitConc();
param2 = setParamSet(x);
[y2, param2] = modifyInitConcAndParamSet(y2, param2, x, strain_no);
[ T2, Y2, F2 ] = runSimulation(ode,odeaux,span,y2,param2,options);
% printParamValues(y2,param2); % Use this line to print initial condition and parameter values.

%% 13-fold upshift--deltaGOGAT
strain_no = 3;
y3 = setInitConc();
param3 = setParamSet(x);
[y3, param3] = modifyInitConcAndParamSet(y3, param3, x, strain_no);
[ T3, Y3, F3 ] = runSimulation(ode,odeaux,span,y3,param3,options);
% printParamValues(y3,param3); % Use this line to print initial condition and parameter values.

%% 3-fold upshift--wildtype
strain_no = 13;
y13 = setInitConc();
param13 = setParamSet(x);
[y13, param13] = modifyInitConcAndParamSet(y13, param13, x, strain_no);
[ T13, Y13, F13 ] = runSimulation(ode,odeaux,span,y13,param13,options);
% printParamValues(y13,param13); % Use this line to print initial condition and parameter values.

%% 3-fold upshift--deltaGOGAT
strain_no = 14;
y14 = setInitConc();
param14 = setParamSet(x);
[y14, param14] = modifyInitConcAndParamSet(y14, param14, x, strain_no);
[ T14, Y14, F14 ] = runSimulation(ode,odeaux,span,y14,param14,options);
% printParamValues(y14,param14); % Use this line to print initial condition and parameter values.

%% down-shift--wildtype
strain_no = 15;
y15 = setInitConc();
param15 = setParamSet(x);
[y15, param15] = modifyInitConcAndParamSet(y15, param15, x, strain_no);
[ T15, Y15, F15 ] = runSimulation(ode,odeaux,span,y15,param15,options);
% printParamValues(y15,param15); % Use this line to print initial condition and parameter values.

%% down-shift--deltaGOGAT
strain_no = 16;
y16 = setInitConc();
param16 = setParamSet(x);
[y16, param16] = modifyInitConcAndParamSet(y16, param16, x, strain_no);
[ T16, Y16, F16 ] = runSimulation(ode,odeaux,span,y16,param16,options);
% printParamValues(y16,param16); % Use this line to print initial condition and parameter values.

%% 13-fold upshift--deltaAT/AR
strain_no = 17;
y17 = setInitConc();
param17 = setParamSet(x);
[y17, param17] = modifyInitConcAndParamSet(y17, param17, x, strain_no);
[ T17, Y17, F17 ] = runSimulation(ode,odeaux,span,y17,param17,options);
% printParamValues(y17,param17); % Use this line to print initial condition and parameter values.

%% 13-fold upshift--deltaAmtB
strain_no = 18;
y18 = setInitConc();
param18 = setParamSet(x);
[y18, param18] = modifyInitConcAndParamSet(y18, param18, x, strain_no);
[ T18, Y18, F18 ] = runSimulation(ode,odeaux,span,y18,param18,options);
% printParamValues(y18,param18); % Use this line to print initial condition and parameter values.

%% Save simulation results
save(outputfile, ...
    'y1','y2','y3','y13','y14','y15','y16','y17','y18', ...
    'param1','param2','param3','param13','param14','param15','param16','param17','param18', ...
    'T1','T2','T3','T13','T14','T15','T16','T17','T18', ...
    'Y1','Y2','Y3','Y13','Y14','Y15','Y16','Y17','Y18', ...
    'F1','F2','F3','F13','F14','F15','F16','F17','F18');

%% Make plots
Fig3(outputfile); % Figure 3
    
%% Remove path
rmpath(ExpDataDir);
rmpath(InputDir);
rmpath(ModelDir);
rmpath(UtilDir);
rmpath(PlotDir);
