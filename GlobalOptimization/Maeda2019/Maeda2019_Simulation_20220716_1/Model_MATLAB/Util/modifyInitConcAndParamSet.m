function [y, param] = modifyInitConcAndParamSet(y, param, x, strain_no)

param(1) = strain_no;

switch strain_no
    
    % Yuan, 13-fold upshift--wildtype
    % Yuan, 3-fold upshift--wildtype
    % Yuan, down-shift--wildtype
    case {1 13 15}
        param(3) = 1.5e-3 * x(5); % AmtB
        param(90) = 90 * x(98); % tau0
        y(5) = 2e-3 * x(5) * x(126); % GlnK
        y(9) = 0.007 * x(2); % GS
        
    % Yuan, 13-fold upshift--deltaGDH
    case 2
        param(3) = 1.5e-3 * x(5); % AmtB
        param(61) = 0; % Vgdh
        param(90) = 90 * x(99); % tau0
        y(5) = 2e-3 * x(5) * x(126); % GlnK
        y(9) = 0.007 * x(2); % GS
        
    % Yuan, 13-fold upshift--deltaGOGAT
    % Yuan, 3-fold upshift--deltaGOGAT
    % Yuan, down-shift--deltaGOGAT
    case {3 14 16}
        param(3) = 0; % AmtB
        param(61) = 360 * x(65) * 3.0; % Vgdh
        param(68) = 0; % Vgog
        param(90) = 90 * x(100); % tau0
        y(5) = 0; % GlnK
        y(9) = 0.007 * x(2) * 0.5; % GS
        
    % Kim, WT, NH4ext = 1 mM
    case 4
        param(3) = 6.037146e-05 * x(6); % AmtB
        param(61) = 360 * x(66); % Vgdh
        param(68) = 72 * x(75); % Vgog
        param(90) = 45 * x(101); % tau0
        param(91) = 49.5 * x(103); % Kgrowthglu
        param(92) = 1.77 * x(105); % Kgrowthgln
        param(105) = 7.4; % pHext
        y(5) = 8.049528e-05 * x(6) * x(126); % GlnK
        y(9) = 4.625056e-03 * x(3); % GS
        
    % Kim, WT, NH4ext = 0.07 mM
    case 5
        param(3) = 6.576789e-04 * x(6); % AmtB
        param(61) = 360 * x(66); % Vgdh
        param(68) = 72 * x(75); % Vgog
        param(90) = 45 * x(101); % tau0
        param(91) = 49.5 * x(103); % Kgrowthglu
        param(92) = 1.77 * x(105); % Kgrowthgln
        param(105) = 7.4; % pHext
        y(5) = 8.769053e-04 * x(6) * x(126); % GlnK
        y(9) = 6.078782e-03 * x(3); % GS
        
    % Kim, WT, NH4ext = 0.06 mM
    case 6
        param(3) = 7.623462e-04 * x(6); % AmtB
        param(61) = 360 * x(66); % Vgdh
        param(68) = 72 * x(75); % Vgog
        param(90) = 45 * x(101); % tau0
        param(91) = 49.5 * x(103); % Kgrowthglu
        param(92) = 1.77 * x(105); % Kgrowthgln
        param(105) = 7.4; % pHext
        y(5) = 1.016462e-03 * x(6) * x(126); % GlnK
        y(9) = 6.150407e-03 * x(3); % GS
        
    % Kim, WT, NH4ext = 0.05 mM
    case 7
        param(3) = 8.868186e-04 * x(6); % AmtB
        param(61) = 360 * x(66); % Vgdh
        param(68) = 72 * x(75); % Vgog
        param(90) = 45 * x(101); % tau0
        param(91) = 49.5 * x(103); % Kgrowthglu
        param(92) = 1.77 * x(105); % Kgrowthgln
        param(105) = 7.4; % pHext
        y(5) = 1.182425e-03 * x(6) * x(126); % GlnK
        y(9) = 6.231945e-03 * x(3); % GS
        
    % Kim, WT, NH4ext = 0.02 mM
    case 8
        param(3) = 1.338889e-03 * x(6); % AmtB
        param(61) = 360 * x(66); % Vgdh
        param(68) = 72 * x(75); % Vgog
        param(90) = 45 * x(101); % tau0
        param(91) = 49.5 * x(103); % Kgrowthglu
        param(92) = 1.77 * x(105); % Kgrowthgln
        param(105) = 7.4; % pHext
        y(5) = 1.785185e-03 * x(6) * x(126); % GlnK
        y(9) = 6.586929e-03 * x(3); % GS
        
    % Kim, WT, NH4ext = 0.004 mM
    case 9
        param(3) = 1.500000e-03 * x(6); % AmtB
        param(61) = 360 * x(66); % Vgdh
        param(68) = 72 * x(75); % Vgog
        param(90) = 45 * x(101); % tau0
        param(91) = 49.5 * x(103); % Kgrowthglu
        param(92) = 1.77 * x(105); % Kgrowthgln
        param(105) = 7.4; % pHext
        y(5) = 2.000000e-03 * x(6) * x(126); % GlnK
        y(9) = 7.000000e-03 * x(3); % GS
        
    % Kim, deltaAmtB, NH4ext = 0.04 mM
    case 10
        param(3) = 0; % AmtB
        param(61) = 360 * x(66); % Vgdh
        param(68) = 72 * x(75); % Vgog
        param(90) = 45 * x(101); % tau0
        param(91) = 49.5 * x(103); % Kgrowthglu
        param(92) = 1.77 * x(105); % Kgrowthgln
        param(105) = 7.4; % pHext
        y(5) = 0; % GlnK
        y(9) = 5.482580e-03 * x(3); % GS
        
    % Kim, deltaAmtB, NH4ext = 0.006 mM
    case 11
        param(3) = 0; % AmtB
        param(61) = 360 * x(66); % Vgdh
        param(68) = 72 * x(75); % Vgog
        param(90) = 45 * x(101); % tau0
        param(91) = 49.5 * x(103); % Kgrowthglu
        param(92) = 1.77 * x(105); % Kgrowthgln
        param(105) = 7.4; % pHext
        y(5) = 0; % GlnK
        y(9) = 6.571110e-03 * x(3); % GS
        
    % Radchenko, WT
    case 12
        param(3) = 1.5e-3 * x(7); % AmtB
        param(61) = 360 * x(67); % Vgdh
        param(68) = 72 * x(76); % Vgog
        param(90) = 1e+20; % tau0 (No growth)
        param(99) = 303; % T
        param(104) = 9.09; % pKa
        param(105) = 7.0; % pHext
        y(5) = 2e-3 * x(7) * x(126); % GlnK
        y(9) = 0.007 * x(4); % GS
        
    % Yuan, 13-fold upshift--deltaAT/AR
    case 17
        param(37) = 0; % Vad
        param(45) = 0; % Vdead
        param(3) = 1.5e-3 * x(5); % AmtB
        param(90) = 90 * x(98); % tau0
        y(5) = 2e-3 * x(5) * x(126); % GlnK
        y(9) = 0.007 * x(2); % GS
        
    % Yuan, 13-fold upshift--deltaAmtB
    case 18
        param(3) = 0; % AmtB
        param(90) = 90 * x(98); % tau0
        y(5) = 2e-3 * x(5) * x(126); % GlnK
        y(9) = 0.007 * x(2); % GS
        
    % Radchenko, GlnKY51A
    case 20
        param(21) = 0; % kcatutglnk
        param(3) = 1.5e-3 * x(7); % AmtB
        param(61) = 360 * x(67); % Vgdh
        param(68) = 72 * x(76); % Vgog
        param(90) = 1e+20; % tau0 (No growth)
        param(99) = 303; % T
        param(104) = 9.09; % pKa
        param(105) = 7.0; % pHext
        y(5) = 2e-3 * x(7) * x(126); % GlnK
        y(9) = 0.007 * x(4); % GS
        
    otherwise
        warning('Unexpected Strain Number!');
        y = -1e+10 * ones(size(y));
        param = -1e+10 * ones(size(param));
        
end
