function [f, g] = Fitness_Chassagnole2002(x)

mexfunc = str2func('BIOMD0000000051_url_mex');

% Simulation settings
simopts = struct;
AbsTol = 1e-6;
RelTol = 1e-6;
tspan = [ 0:0.2:1 2:2:40 ];

% CVODE(IQMTools)
simopts.abstol = AbsTol;
simopts.reltol = RelTol;
y0 = mexfunc(); % set initial values
param = mexfunc('parametervalues'); % set reference parameters
param = setModParam_Chassagnole2002(param,x);
[ T, Y ] = RCGAsimulate(mexfunc,tspan,y0,param,2,simopts);
T = real(T);
Y = real(Y);


%% Fitness calculation
if T(end) ~= tspan(end)
    f = 1e+10;
    g = 1e+10;
    return;
end

[T_exp, Y_exp] = ExpData_Chassagnole2002();
BOF = sqrt(calcMSE(T,Y,T_exp,Y_exp)); % BOF

x_pred = getMLpredictedX();
RMSE = sqrt( mean( ( log10(x) - log10(x_pred) ) .^ 2 ) ); % RMSE

% Constrained optimization
f = RMSE;
g = BOF - 2e-2;

% Unconstrained optimization
% f = BOF;


function x_pred = getMLpredictedX()
% Unit: mM
% x_pred( 1): vPGI_KPGIg6p        % KPGI,g6p    % 5.3.1.9   % 668
% x_pred( 2): vPGI_KPGIf6p        % KPGI,f6p    % 5.3.1.9   % 5345
% x_pred( 3): vPGM_KPGMg6p        % KPGM,g6p    % 5.4.2.2   % 92
% x_pred( 4): vPGM_KPGMg1p        % KPGM,g1p    % 5.4.2.2   % 103
% x_pred( 5): vG6PDH_KG6PDHg6p    % KG6PDH,g6p  % 1.1.1.49  % 92
% x_pred( 6): vG6PDH_KG6PDHnadp   % KG6PDH,nadp % 1.1.1.49  % 6
% x_pred( 7): vPFK_KPFKatps       % KPFK,atp,s  % 2.7.1.11  % 2
% x_pred( 8): vPFK_KPFKf6ps       % KPFK,f6p,s  % 2.7.1.11  % 5345
% x_pred( 9): vALDO_kALDOfdp      % KALDO,fdp   % 4.1.2.13  % 354
% x_pred(10): vALDO_kALDOgap      % KALDO,gap   % 4.1.2.13  % 118
% x_pred(11): vALDO_kALDOdhap     % KALDO,dhap  % 4.1.2.13  % 111
% x_pred(12): vGAPDH_KGAPDHgap    % KGAPDH,gap  % 1.2.1.12  % 118
% x_pred(13): vGAPDH_KGAPDHnad    % KGAPDH,nad  % 1.2.1.12  % 3
% x_pred(14): vGAPDH_KGAPDHnadh   % KGAPDH,nadh % 1.2.1.12  % 4
% x_pred(15): vTIS_kTISdhap       % KTIS,dhap   % 5.3.1.1   % 111
% x_pred(16): vTIS_kTISgap        % KTIS,gap    % 5.3.1.1   % 118
% x_pred(17): vPGK_KPGKadp        % KPGK,adp    % 2.7.2.3   % 8
% x_pred(18): vPGK_KPGKatp        % KPGK,atp    % 2.7.2.3   % 2
% x_pred(19): vPGK_KPGKpgp        % KPGK,pgp    % 2.7.2.3   % 236
% x_pred(20): vPGK_KPGKpg3        % KPGK,3pg    % 2.7.2.3   % 197
% x_pred(21): vrpGluMu_KPGluMupg3 % KPGluMu,3pg % 5.4.2.1   % 197
% x_pred(22): vrpGluMu_KPGluMupg2 % KPGluMu,2pg % 5.4.2.1   % 631
% x_pred(23): vENO_KENOpg2        % KENO,2pg    % 4.2.1.11  % 631
% x_pred(24): vENO_KENOpep        % KENO,pep    % 4.2.1.11  % 74
% x_pred(25): vPK_KPKpep          % KPK,pep     % 2.7.1.40  % 74
% x_pred(26): vPK_KPKadp          % KPK,adp     % 2.7.1.40  % 8
% x_pred(27): vDAHPS_KDAHPSe4p    % KDAHPS,e4p  % 2.5.1.54  % 279
% x_pred(28): vDAHPS_KDAHPSpep    % KDAHPS,pep  % 2.5.1.54  % 74
% x_pred(29): vPGDH_KPGDHpg       % KPGDH,6pg   % 1.1.1.44  % 345
% x_pred(30): vPGDH_KPGDHnadp     % KPGDH,nadp  % 1.1.1.44  % 6
% x_pred(31): vG1PAT_KG1PATatp    % KG1PAT,atp  % 2.7.7.27  % 2
% x_pred(32): vG1PAT_KG1PATg1p    % KG1PAT,g1p  % 2.7.7.27  % 103

% /Users/maeda/Desktop/Projects/Km_Prediction/DataForPaper/ML_Results/Analysis/PredictKm_20220721_2/Table_Output.csv
x_pred = [ ...
    0.507604498;
    0.518088643;
    0.228819318;
    0.117366501;
    0.077010738;
    0.024185603;
    0.166959495;
    0.846509218;
    0.02396424;
    0.133256629;
    0.320236099;
    0.16778919;
    0.067382047;
    0.021187297;
    1.242419937;
    0.594069338;
    0.334882324;
    0.653907622;
    0.303780282;
    1.08228601;
    0.608862015;
    0.151270298;
    0.185215229;
    0.263100048;
    0.287842153;
    0.245614215;
    0.083272614;
    0.050980529;
    0.027500597;
    0.029314276;
    0.1680963;
    0.160245652;
    ];

x_pred = x_pred'; % 1 x n --> n x 1
