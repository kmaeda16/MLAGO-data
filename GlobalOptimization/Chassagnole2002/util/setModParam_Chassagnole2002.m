function param = setModParam_Chassagnole2002(param,x)
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

index = [ ...
      9,  10,  15,  16,  18, ...
     20,  23,  25,  42,  43, ...
     45,  49,  51,  52,  55, ...
     56,  62,  63,  64,  65, ...
     70,  71,  74,  75,  77, ...
     83,  95,  96, 102, 103, ...
    115, 116 ];

% % Check parameters
% paramname = BIOMD0000000051_url_mex('parameters');
% for i = 1 : length(index)
%     fprintf('param(%d) = x(%d) %% %s\n',index(i),i,char(paramname(index(i))));
% end

param(index) = x;
