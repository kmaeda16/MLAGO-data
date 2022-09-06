% This script was derived from Model_MATLAB/ExecScript/Run_Yuan.m
% (SI of Maeda, npj Syst Biol Appl, 2019)

clear all;
diary('diary.txt');


%% Directory and file settings
addpath(genpath('Model_MATLAB'));


%% Simulation settings
options = odeset('RelTol',1e-6,'AbsTol',ones(1,14)*1e-6);
ode = @Model_ODE;
odeaux = @Model_Flux;
% span = -50:0.1:50; % original
span = [ -50, -15, -8, -4, 0, 0.1, 0.2, 0.3, 0.5, 1, 2, 4, 8, 15, 30 ]; % for making quasi-experimental data


%% Set GA results
x = setGAresult();

%% Simulation

% 13-fold upshift--wildtype
strain_no = 1;
y1 = setInitConc();
param1 = setParamSet(x);
[y1, param1] = modifyInitConcAndParamSet(y1, param1, x, strain_no);
[ T1, Y1 ] = runSimulation(ode,odeaux,span,y1,param1,options);
% printParamValues(y1,param1); % Use this line to print initial condition and parameter values.

% 13-fold upshift--deltaGDH
strain_no = 2;
y2 = setInitConc();
param2 = setParamSet(x);
[y2, param2] = modifyInitConcAndParamSet(y2, param2, x, strain_no);
[ T2, Y2 ] = runSimulation(ode,odeaux,span,y2,param2,options);
% printParamValues(y2,param2); % Use this line to print initial condition and parameter values.

% 13-fold upshift--deltaGOGAT
strain_no = 3;
y3 = setInitConc();
param3 = setParamSet(x);
[y3, param3] = modifyInitConcAndParamSet(y3, param3, x, strain_no);
[ T3, Y3 ] = runSimulation(ode,odeaux,span,y3,param3,options);
% printParamValues(y3,param3); % Use this line to print initial condition and parameter values.


%% Compare simulation results by this script and those with the original Maeda model
fprintf('----- This script (CVODE(SundialsTB)) vs Original Maeda model -----\n');
T1_sim = T1;
Y1_sim = Y1;
T2_sim = T2;
Y2_sim = Y2;
T3_sim = T3;
Y3_sim = Y3;

% Yuan.mat contains the simulation results by the original Maeda model
load('Yuan.mat','T1','Y1','T2','Y2','T3','Y3');

T1_original = T1;
Y1_original = Y1;
T2_original = T2;
Y2_original = Y2;
T3_original = T3;
Y3_original = Y3;

clearvars T1 Y1 T2 Y2 T3 Y3;

RMSE = sqrt(calcMSE(T1_original,Y1_original(:,11:12),T1_sim,Y1_sim(:,11:12))); % RMSE
fprintf('WT        : RMSE = %e\n',RMSE);

RMSE = sqrt(calcMSE(T2_original,Y2_original(:,11:12),T2_sim,Y2_sim(:,11:12))); % RMSE
fprintf('deltaGDH  : RMSE = %e\n',RMSE);

RMSE = sqrt(calcMSE(T3_original,Y3_original(:,11:12),T3_sim,Y3_sim(:,11:12))); % RMSE
fprintf('deltaGOGAT: RMSE = %e\n',RMSE);


%% Make quasi-experimental data
fprintf('Making quasi-experimental data ...\n');
ExpDatafilename = 'ExpData_Maeda2019.m';
ExpDataFunc = makeExpData_Maeda2019( ...
    T1_sim(2:end), Y1_sim(2:end,:), ... % ignore t = -50
    T2_sim(2:end), Y2_sim(2:end,:), ... % ignore t = -50
    T3_sim(2:end), Y3_sim(2:end,:), ... % ignore t = -50
    ExpDatafilename );


%% Compare simulation results with quasi-experimental data
fprintf('----- This script (CVODE(SundialsTB)) vs Quasi-experimental data -----\n');
MSE = zeros(3,1);
for strain_no = 1 : 3
    % eval(sprintf('T_sim = T%d_original;',strain_no));
    % eval(sprintf('Y_sim = Y%d_original;',strain_no));
    eval(sprintf('T_sim = T%d_sim;',strain_no));
    eval(sprintf('Y_sim = Y%d_sim;',strain_no));
    [ T_exp, GLU_exp, GLN_exp ] = ExpDataFunc(strain_no);
    MSE(strain_no) = calcMSE(T_sim,Y_sim(:,11:12),T_exp,[GLU_exp,GLN_exp]); % MSE
end
RMSE = sqrt(mean(MSE));
fprintf('RMSE = %e\n',RMSE);


%% Make figures
fprintf('Making figures ...\n');

figure;
strain_name = {'Wild Type','\DeltaGDH','\DeltaGOGAT'};

for strain_no = 1 : 3
%     eval(sprintf('T_sim = T%d_original;',strain_no));
%     eval(sprintf('Y_sim = Y%d_original;',strain_no));
    eval(sprintf('T_sim = T%d_sim;',strain_no));
    eval(sprintf('Y_sim = Y%d_sim;',strain_no));
    [ T_exp, GLU_exp, GLN_exp ] = ExpDataFunc(strain_no);
    
    subplot(2,3,strain_no);
    plot(T_sim,Y_sim(:,12));
    hold on;
    ax = gca;
    ax.ColorOrderIndex = 1;
    plot(T_exp,GLN_exp,'o');
    hold off;
    grid;
    xlabel('Time (min)','FontName','Helvetica','FontSize',12);
    ylabel('Conc. (mM)','FontName','Helvetica','FontSize',12);
    set(gca,'FontName','Helvetica','FontSize',12);
    legend('GLN','FontName','Helvetica','FontSize',12);
    title(strain_name(strain_no),'FontName','Helvetica','FontSize',12);
    xlim([-5 35]);
    ylim([0 60]);
    xticks(0:10:30);
    yticks(0:20:60);
    
    subplot(2,3,3+strain_no);
    plot(T_sim,Y_sim(:,11));
    hold on;
    ax = gca;
    ax.ColorOrderIndex = 1;
    plot(T_exp,GLU_exp,'o');
    hold off;
    grid;
    xlabel('Time (min)','FontName','Helvetica','FontSize',12);
    ylabel('Conc. (mM)','FontName','Helvetica','FontSize',12);
    set(gca,'FontName','Helvetica','FontSize',12);
    legend('GLU','FontName','Helvetica','FontSize',12);
    title(strain_name(strain_no),'FontName','Helvetica','FontSize',12);
    xlim([-5 35]);
    ylim([0 250]);
    xticks(0:10:30);
    yticks(0:100:200);
    
end

saveas(gcf,'Maeda2019_Simulation_Fig3a.fig');


%% Remove path
rmpath(genpath('Model_MATLAB'));
diary off;
