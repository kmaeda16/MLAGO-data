function [y, param] = modifyInitConcAndParamSet_Kim(y, param, x, strain_no, NH4ext, deltaAmtB, CarbonSource)

if strain_no ~= 19
    error('strain_no must be 19!');
end

param(1) = strain_no;

param(61) = 360 * x(66); % Vgdh
param(68) = 72 * x(75); % Vgog
param(90) = 45 * x(101); % tau0
param(91) = 49.5 * x(103); % Kgrowthglu
param(92) = 1.77 * x(105); % Kgrowthgln
param(105) = 7.4; % pHext


% Parameter changes depending on carbon source
% See Supplementary Figure 5 of Kim et al., Mol Syst Biol, 2012
if strcmp(CarbonSource,'Glycerol')
    param(90) = param(90) * 0.8/0.62; % tau0
    param(109) = 0.019; % Nintstar
end
if strcmp(CarbonSource,'G6P_Gluconate')
    param(90) = param(90) * 0.8/0.9; % tau0
    param(109) = 0.057; % Nintstar
end


NH4ext_star = 0.004;
GlnK_star = 2e-3;
GS_star = 0.007;
AmtB_star = 1.5e-3;


[ GlnKtotal, GStotal, AmtBtotal ] = ...
    getNH4extDependents(NH4ext,NH4ext_star,GlnK_star,GS_star,AmtB_star,deltaAmtB,CarbonSource);


param(3) = AmtBtotal * x(6); % AmtB 
y(5) = GlnKtotal * x(6) * x(126); % GlnK
y(9) = GStotal * x(3); % GS
