clearvars;

%% Directory and file settings
RootDir = '../'; % Model_MATLAB
ExpDataDir = strcat(RootDir,'ExpData'); % Model_MATLAB/ExpData
InputDir = strcat(RootDir,'Input'); % Model_MATLAB/Input
ModelDir = strcat(RootDir,'Model'); % Model_MATLAB/Model
UtilDir  = strcat(RootDir,'Util');  % Model_MATLAB/Util
PlotDir  = strcat(RootDir,'Plot');  % Model_MATLAB/Plot
outputfile = 'Radchenko.mat';

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
span = -1000:0.1:30;

%% Set GA results
x = setGAresult;

%% WT
strain_no = 12;
y_WT = setInitConc();
param_WT = setParamSet(x);
[ y_WT, param_WT ] = modifyInitConcAndParamSet(y_WT, param_WT, x, strain_no);
[ T_WT, Y_WT, F_WT ] = runSimulation(ode,odeaux,span,y_WT,param_WT,options);
% printParamValues(y_WT,param_WT); % Use this line to print initial condition and parameter values.

%% GlnKY51A
strain_no = 20;
y_GlnKY51A = setInitConc();
param_GlnKY51A = setParamSet(x);
[ y_GlnKY51A, param_GlnKY51A ] = modifyInitConcAndParamSet(y_GlnKY51A, param_GlnKY51A, x, strain_no);
[ T_GlnKY51A, Y_GlnKY51A, F_GlnKY51A ] = runSimulation(ode,odeaux,span,y_GlnKY51A,param_GlnKY51A,options);
% printParamValues(y_GlnKY51A,param_GlnKY51A); % Use this line to print initial condition and parameter values.

%% Save simulation results
save(outputfile,...
    'y_WT', 'param_WT', 'T_WT', 'Y_WT', 'F_WT', ...
    'y_GlnKY51A', 'param_GlnKY51A', 'T_GlnKY51A', 'Y_GlnKY51A', 'F_GlnKY51A');

%% Make plots
Fig5(outputfile,0); % Figure 5a-f
Fig5(outputfile,1); % Figure 5g-l

%% Remove path
rmpath(ExpDataDir);
rmpath(InputDir);
rmpath(ModelDir);
rmpath(UtilDir);
rmpath(PlotDir);
