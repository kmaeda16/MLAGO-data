% This script was derived from RCGAToolbox-master/doc/benchmark/sim/simulateModel.m
% (RCGAToolbox)

clear all;
diary('diary.txt');


%% Make ODE and MEX files

% BIOMD0000000051_url.xml was downloaded from BioModels
% https://www.ebi.ac.uk/biomodels/BIOMD0000000051
SBMLfilename = 'BIOMD0000000051_url.xml';

% disp('Removing reserved words in the SBML file ...');
% SBMLfilename = RCGAreplaceWords(SBMLfilename);
% fprintf('%s created.\n',SBMLfilename);

disp('Making an ODE file (IQM Tools format) ...');
odefilename = RCGAcreateODEfile(SBMLfilename);
fprintf('%s.m created.\n',odefilename);
odefunc = str2func(odefilename);

disp('Making a MEX model ...');
mexfilename = RCGAmakeMEXmodel(SBMLfilename);
fprintf('%s.c created.\n',mexfilename);
fprintf('%s.h created.\n',mexfilename);
fprintf('%s.%s created.\n',mexfilename,mexext);
mexfunc = str2func(mexfilename);


%% Simulation
fprintf('Simulating ...\n');

% Simulation settings
simopts = struct;
AbsTol = 1e-6;
RelTol = 1e-6;
tspan = [ 0:0.2:1 2:2:40 ];

% ODE15s(MATLABbuilt-in)
simopts.AbsTol = AbsTol;
simopts.RelTol = RelTol;
simopts.Method = 'ode15s';
simopts.BDF = 'on';
y0 = odefunc(); % set initial values
param = odefunc('parametervalues'); % set reference parameters
[ T_ode, Y_ode ] = RCGAsimulate(odefunc,tspan,y0,param,0,simopts);

% CVODE(IQMTools)
simopts.abstol = AbsTol;
simopts.reltol = RelTol;
y0 = mexfunc(); % set initial values
param = mexfunc('parametervalues'); % set reference parameters
[ T_mex, Y_mex ] = RCGAsimulate(mexfunc,tspan,y0,param,2,simopts);


%% Compare ODE15s(MATLABbuilt-in) and CVODE(IQMTools)
fprintf('----- ODE15s(MATLABbuilt-in) vs CVODE(IQMTools) -----\n');
RMSE = sqrt(calcMSE(T_ode,Y_ode,T_mex,Y_mex)); % RMSE
fprintf('RMSE = %e\n',RMSE);
fprintf('\n');


%% Make quasi-experimental data
fprintf('Making quasi-experimental data ...\n');
ExpDatafilename = 'ExpData_Chassagnole2002.m';
ExpDataFunc = makeExpData_Chassagnole2002(T_mex,Y_mex,ExpDatafilename);


%% Compare simulation results with quasi-experimental data
[T_exp, Y_exp] = ExpDataFunc();

fprintf('----- ODE15s(MATLABbuilt-in) vs Quasi-experimental data -----\n');
RMSE = sqrt(calcMSE(T_ode,Y_ode,T_exp,Y_exp)); % RMSE
fprintf('RMSE = %e\n',RMSE);
fprintf('\n');

fprintf('----- CVODE(IQMTools) vs Quasi-experimental data -----\n');
RMSE = sqrt(calcMSE(T_mex,Y_mex,T_exp,Y_exp)); % RMSE
fprintf('RMSE = %e\n',RMSE);
fprintf('\n');


%% Make figures
fprintf('Making figures ...\n');

% To plot dynamics for t < 0
% T_mex = [ -10; T_mex ];
% Y_mex = [ Y_mex(1,:); Y_mex ];
% Y_mex([1,2],2) = 0;
% T_exp = [ -10; T_exp ];
% Y_exp = [ Y_exp(1,:); Y_exp ];
% Y_exp([1,2],2) = 0;

% All metabolites
figure;
plot(T_mex,Y_mex);
hold on;
ax = gca;
ax.ColorOrderIndex = 1;
plot(T_exp,Y_exp,'o');
hold off;
grid;
xlabel('Time (s)','FontName','Helvetica','FontSize',14);
ylabel('Conc. (mM)','FontName','Helvetica','FontSize',14);
set(gca,'FontName','Helvetica','FontSize',14);
legend(mexfunc('states'),'FontName','Helvetica','FontSize',14);

saveas(gcf,'Chassagnole2002_Simulation_All.fig');


% Figure 5 of Chasagnole 2002
% BioModels: https://www.ebi.ac.uk/biomodels/BIOMD0000000051#Curation
figure;
index = [2, 8, 6, 3, 1, 4, 5, 10, 7];
name = mexfunc('states');

for i = 1 : length(index)
    subplot(3,3,i);
    plot(T_mex,Y_mex(:,index(i)));
    hold on;
    ax = gca;
    ax.ColorOrderIndex = 1;
    plot(T_exp,Y_exp(:,index(i)),'o');
    hold off;
    grid;
    xlabel('Time (s)','FontName','Helvetica','FontSize',12);
    ylabel('Conc. (mM)','FontName','Helvetica','FontSize',12);
    set(gca,'FontName','Helvetica','FontSize',12);
    title(name(index(i)),'FontName','Helvetica','FontSize',12);
    if i <= 3
        ylim([0 3.5]);
        yticks(0:3);
    elseif i <= 6
        ylim([0 7]);
        yticks(0:2:6);
    else
        ylim([0 1.4]);
        yticks(0:0.4:1.2);
    end
end

saveas(gcf,'Chassagnole2002_Simulation_Figure5.fig');


%%
diary off;
