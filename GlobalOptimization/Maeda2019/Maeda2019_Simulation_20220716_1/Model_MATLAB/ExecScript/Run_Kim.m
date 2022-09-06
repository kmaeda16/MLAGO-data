clearvars;

%% Directory and file settings
RootDir = '../'; % Model_MATLAB
ExpDataDir = strcat(RootDir,'ExpData'); % Model_MATLAB/ExpData
InputDir = strcat(RootDir,'Input'); % Model_MATLAB/Input
ModelDir = strcat(RootDir,'Model'); % Model_MATLAB/Model
UtilDir  = strcat(RootDir,'Util');  % Model_MATLAB/Util
PlotDir  = strcat(RootDir,'Plot');  % Model_MATLAB/Plot
outputfile = 'Kim.mat';

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
span = -50:0.1:0;

%% Set GA results
x = setGAresult;

%% Settings for Kim with varied NH4ext
strain_no = 19;
n_point = 50; % Number of NH4ext points
NH4ext_span = logspace(log10(0.004),log10(1),n_point);

%% Simulation
CarbonSource = 'Glycerol';
fprintf('Carbon Source: %s\n',CarbonSource);
deltaAmtB = 0; % WT
[ y_out_Glycerol_WT, param_out_Glycerol_WT, Y_out_Glycerol_WT, F_out_Glycerol_WT ] = ...
    runSimulation_Kim(NH4ext_span, x, strain_no, deltaAmtB, CarbonSource, ode,odeaux, span, options);
deltaAmtB = 1; % deltaAmtB
[ y_out_Glycerol_deltaAmtB, param_out_Glycerol_deltaAmtB, Y_out_Glycerol_deltaAmtB, F_out_Glycerol_deltaAmtB ] = ...
    runSimulation_Kim(NH4ext_span, x, strain_no, deltaAmtB, CarbonSource, ode,odeaux, span, options);

CarbonSource = 'Glucose';
fprintf('Carbon Source: %s\n',CarbonSource);
deltaAmtB = 0; % WT
[ y_out_Glucose_WT, param_out_Glucose_WT, Y_out_Glucose_WT, F_out_Glucose_WT ] = ...
    runSimulation_Kim(NH4ext_span, x, strain_no, deltaAmtB, CarbonSource, ode,odeaux, span, options);
deltaAmtB = 1; % deltaAmtB
[ y_out_Glucose_deltaAmtB, param_out_Glucose_deltaAmtB, Y_out_Glucose_deltaAmtB, F_out_Glucose_deltaAmtB ] = ...
    runSimulation_Kim(NH4ext_span, x, strain_no, deltaAmtB, CarbonSource, ode,odeaux, span, options);

CarbonSource = 'G6P_Gluconate';
fprintf('Carbon Source: %s\n',CarbonSource);
deltaAmtB = 0; % WT
[ y_out_G6P_Gluconate_WT, param_out_G6P_Gluconate_WT, Y_out_G6P_Gluconate_WT, F_out_G6P_Gluconate_WT ] = ...
    runSimulation_Kim(NH4ext_span, x, strain_no, deltaAmtB, CarbonSource, ode,odeaux, span, options);
deltaAmtB = 1; % deltaAmtB
[ y_out_G6P_Gluconate_deltaAmtB, param_out_G6P_Gluconate_deltaAmtB, Y_out_G6P_Gluconate_deltaAmtB, F_out_G6P_Gluconate_deltaAmtB ] = ...
    runSimulation_Kim(NH4ext_span, x, strain_no, deltaAmtB, CarbonSource, ode,odeaux, span, options);

%% Save simulation results
save(outputfile,...
    'y_out_Glycerol_WT',        'param_out_Glycerol_WT',        'Y_out_Glycerol_WT',        'F_out_Glycerol_WT',...
    'y_out_Glycerol_deltaAmtB', 'param_out_Glycerol_deltaAmtB', 'Y_out_Glycerol_deltaAmtB', 'F_out_Glycerol_deltaAmtB',... 
    'y_out_Glucose_WT',         'param_out_Glucose_WT',         'Y_out_Glucose_WT',         'F_out_Glucose_WT',...
    'y_out_Glucose_deltaAmtB',  'param_out_Glucose_deltaAmtB',  'Y_out_Glucose_deltaAmtB',  'F_out_Glucose_deltaAmtB',...
    'y_out_G6P_Gluconate_WT',        'param_out_G6P_Gluconate_WT',        'Y_out_G6P_Gluconate_WT',        'F_out_G6P_Gluconate_WT',... 
    'y_out_G6P_Gluconate_deltaAmtB', 'param_out_G6P_Gluconate_deltaAmtB', 'Y_out_G6P_Gluconate_deltaAmtB', 'F_out_G6P_Gluconate_deltaAmtB');

%% Make plots
Fig4(outputfile,'Glucose'); % Figure 4abc
Fig4(outputfile,'Glycerol'); % Figure 4def
Fig4(outputfile,'G6P_Gluconate'); % Figure 4ghi

%% Remove path
rmpath(ExpDataDir);
rmpath(InputDir);
rmpath(ModelDir);
rmpath(UtilDir);
rmpath(PlotDir);
