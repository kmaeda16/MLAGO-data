function Run_Chassagnole2002_RCGA(seed)
% clearvars;

if ~exist('Results','dir')
    mkdir('Results');
end


%% Directory and file settings
ModelDir = '../Chassagnole2002_Simulation_20220716_1';
UtilDir = '../util';


%% Add path
addpath(genpath(ModelDir));
addpath(UtilDir);


%% RCGA
% ========= Problem Settings ========= %
problem.n_gene = 32; % Number of Decision Variables
problem.n_constraint = 0; % Number of Constraints
problem.fitnessfun = @Fitness_Chassagnole2002; % Fitness Function
problem.decodingfun = @Decoding; % Decoding Function

% ========= Option Settings ========== %
opts.n_population = 200; % Population Size
opts.n_children = 200; % Number of Children per Generation
opts.n_parent = 100; % problem.n_gene + 1; % Number of Parents Used for REXstar
opts.t_rexstar = 6.0; % Step-size Parameter for REXstar
opts.selection_type = 0; % Parameter for JGG (0: Chosen from Children, 1: Chosen from Family)
opts.Pf = 0.45; % Pf
opts.local = 0; % Local Optimizer
% opts.localopts = optimoptions(@fmincon,'ConstraintTolerance',0,'MaxFunctionEvaluations',opts.n_children,'Display','off'); % Options for Local Optimizer
opts.maxgen = inf; % Max Number of Generations
opts.maxtime = 60 * 60 * 30; % Max Time (sec)
opts.maxeval = 5e+5; % Max Number of fitnessfun Evaluations
opts.vtr = -inf; % Value To Be Reached
opts.n_par = 1; % Number of Workers for Parallel Computation
opts.output_intvl = 1; % Output Interval Generation
opts.out_transition = ['Results/Transition_' num2str(seed) '.txt']; % Transition File Name
opts.out_best = ['Results/BestIndividual_' num2str(seed) '.txt']; % Best Individual File Name
opts.out_population = ['Results/FinalPopulation_' num2str(seed) '.txt']; % Final Population File Name
opts.out_report = ['Results/Report_' num2str(seed) '.mat']; % Report File Name
opts.interimreportfun = @RCGAdefaultinterimreportfun; % Interim Report Function
opts.finalreportfun = @RCGAdefaultfinalreportfun; % Final Report Function

% ======= Setting Random Seed ======== %
rng(seed); % Random Seed

% ========== Executing RCGA ========== %
% Results = RCGA_UNDXMGG(problem,opts); % UNDX/MGG
Results = RCGA_REXstarJGG(problem,opts); % REXstar/JGG

% ======== Convergence Curve ========= %
figure;
plot(Results.Transition.time,Results.Transition.f,'LineWidth',2);
set(gca,'FontSize',10,'FontName','Arial');
title('Convergence Curve');
xlabel('Time (sec)');
ylabel('Objective Function');


%% Remove path
rmpath(genpath(ModelDir));
rmpath(UtilDir);
