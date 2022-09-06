clearvars;

%% Directory and file settings
RootDir = '../'; % Model_MATLAB
ExpDataDir = strcat(RootDir,'ExpData'); % Model_MATLAB/ExpData
InputDir = strcat(RootDir,'Input'); % Model_MATLAB/Input
ModelDir = strcat(RootDir,'Model'); % Model_MATLAB/Model
UtilDir  = strcat(RootDir,'Util');  % Model_MATLAB/Util
PlotDir  = strcat(RootDir,'Plot');  % Model_MATLAB/Plot
outputfile = 'Kim_VirtualMutant.mat';

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
span = -100:0.1:0;

%% Set GA results
x = setGAresult;

%% NH4ext and strain settings
deltaAmtB = 0; % WT (Note that the virtual mutant is almost WT except for GlnK)
CarbonSource = 'Glucose';
global NH4ext_global;
strain_no = 19;
n_point = 50; % Number of NH4ext points
NH4ext_span = logspace(log10(0.004),log10(1),n_point);

%% Simulation with NH4ext = 4 microM
NH4ext_global = 0.004;
y0 = setInitConc();
param0 = setParamSet(x);
[y0, param0] = modifyInitConcAndParamSet_Kim(y0, param0, x, strain_no, NH4ext_global, deltaAmtB, CarbonSource);
[ T0, Y0, F0 ] = runSimulation(ode,odeaux,span,y0,param0,options);
y0 = Y0(end,:);

%% Simulation with varied NH4ext
% WT
fprintf('----- Wild Type -----\n');
y_out_WT = zeros(n_point,14);
param_out_WT = zeros(n_point,112);
Y_out_WT = zeros(n_point,14);
F_out_WT = zeros(n_point,66);
for i = 1:n_point
    fprintf('Now simulating %d/%d ...\n',i,n_point);
    NH4ext_global = NH4ext_span(i);
    y = y0;
    param = param0;
    [ ~, Y, F ] = runSimulation(ode,odeaux,span,y,param,options);
    y_out_WT(i,:) = y';
    param_out_WT(i,:) = param';
    Y_out_WT(i,:) = Y(end,:);
    F_out_WT(i,:) = F(end,:);
%     printParamValues(y,param); % Use this line to print initial condition and parameter values.
end

% Virtual mutant (GlnK removed)
fprintf('----- Virtual Mutant -----\n');
y_out_VM = zeros(n_point,14);
param_out_VM = zeros(n_point,112);
Y_out_VM = zeros(n_point,14);
F_out_VM = zeros(n_point,66);
for i = 1:n_point
    fprintf('Now simulating %d/%d ...\n',i,n_point);
    NH4ext_global = NH4ext_span(i);
    y = y0;
    param = param0;
    y(5:8) = zeros(4,1); % GlnKtotal = zero
    [ ~, Y, F ] = runSimulation(ode,odeaux,span,y,param,options);
    y_out_VM(i,:) = y';
    param_out_VM(i,:) = param';
    Y_out_VM(i,:) = Y(end,:);
    F_out_VM(i,:) = F(end,:);
%     printParamValues(y,param); % Use this line to print initial condition and parameter values.
end

%% Save simulation results
save(outputfile,...
    'y_out_WT', 'param_out_WT', 'Y_out_WT', 'F_out_WT',...
    'y_out_VM', 'param_out_VM', 'Y_out_VM', 'F_out_VM');

%% Make plots
Fig6(outputfile); % Figure 6

%% Remove path
rmpath(ExpDataDir);
rmpath(InputDir);
rmpath(ModelDir);
rmpath(UtilDir);
rmpath(PlotDir);
