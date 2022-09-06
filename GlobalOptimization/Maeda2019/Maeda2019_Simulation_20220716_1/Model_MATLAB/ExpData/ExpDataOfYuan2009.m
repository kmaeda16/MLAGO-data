function [ T_exp, GLU_exp, GLU_err, GLN_exp, GLN_err ] ...
    = ExpDataOfYuan2009(strain_no)

switch strain_no

    % 13-fold upshift--wildtype
    case 1
        % msb200960-s4.xls training set (fig 4) of Yuan et al., Mol Syst Biol, 2009
        T_exp( 1) = -15.0; GLU_exp( 1) =  76.6; GLU_err( 1) = 11.6; GLN_exp( 1) =  1.9; GLN_err( 1) = 0.3;
        T_exp( 2) = - 8.0; GLU_exp( 2) =  76.6; GLU_err( 2) = 11.6; GLN_exp( 2) =  1.9; GLN_err( 2) = 0.3;
        T_exp( 3) = - 4.0; GLU_exp( 3) =  76.6; GLU_err( 3) = 11.6; GLN_exp( 3) =  1.9; GLN_err( 3) = 0.3;
        T_exp( 4) =   0.0; GLU_exp( 4) =  76.6; GLU_err( 4) = 11.6; GLN_exp( 4) =  1.9; GLN_err( 4) = 0.3;
        T_exp( 5) =   0.1; GLU_exp( 5) =  57.5; GLU_err( 5) =  8.7; GLN_exp( 5) = 14.6; GLN_err( 5) = 2.3;
        T_exp( 6) =   0.2; GLU_exp( 6) =  51.7; GLU_err( 6) =  7.8; GLN_exp( 6) = 26.2; GLN_err( 6) = 4.1;
        T_exp( 7) =   0.3; GLU_exp( 7) =  46.6; GLU_err( 7) = 10.4; GLN_exp( 7) = 35.0; GLN_err( 7) = 5.4;
        T_exp( 8) =   0.5; GLU_exp( 8) =  48.3; GLU_err( 8) =  7.3; GLN_exp( 8) = 39.1; GLN_err( 8) = 6.1;
        T_exp( 9) =   1.0; GLU_exp( 9) =  87.4; GLU_err( 9) = 13.2; GLN_exp( 9) = 45.2; GLN_err( 9) = 7.0;
        T_exp(10) =   2.0; GLU_exp(10) = 146.7; GLU_err(10) = 22.2; GLN_exp(10) = 28.2; GLN_err(10) = 4.4;
        T_exp(11) =   4.0; GLU_exp(11) = 163.3; GLU_err(11) = 24.7; GLN_exp(11) = 15.8; GLN_err(11) = 2.4;
        T_exp(12) =   8.0; GLU_exp(12) = 141.9; GLU_err(12) = 21.5; GLN_exp(12) = 12.2; GLN_err(12) = 2.1;
        T_exp(13) =  15.0; GLU_exp(13) = 159.9; GLU_err(13) = 24.2; GLN_exp(13) =  9.2; GLN_err(13) = 1.4;
        T_exp(14) =  30.0; GLU_exp(14) = 169.5; GLU_err(14) = 25.6; GLN_exp(14) = 10.5; GLN_err(14) = 1.7;

    % 13-fold upshift--deltaGDH
    case 2
        % msb200960-s4.xls training set (fig 4) of Yuan et al., Mol Syst Biol, 2009
        T_exp( 1) = -15.0; GLU_exp( 1) =  78.9; GLU_err( 1) = 16.2; GLN_exp( 1) =  2.1; GLN_err( 1) =  0.4;
        T_exp( 2) = - 8.0; GLU_exp( 2) =  78.9; GLU_err( 2) = 16.2; GLN_exp( 2) =  2.1; GLN_err( 2) =  0.4;
        T_exp( 3) = - 4.0; GLU_exp( 3) =  78.9; GLU_err( 3) = 16.2; GLN_exp( 3) =  2.1; GLN_err( 3) =  0.4;
        T_exp( 4) =   0.0; GLU_exp( 4) =  78.9; GLU_err( 4) = 16.2; GLN_exp( 4) =  2.1; GLN_err( 4) =  0.4;
        T_exp( 5) =   0.1; GLU_exp( 5) =  81.6; GLU_err( 5) = 16.7; GLN_exp( 5) = 24.6; GLN_err( 5) = 11.2;
        T_exp( 6) =   0.2; GLU_exp( 6) =  61.3; GLU_err( 6) = 12.6; GLN_exp( 6) = 19.4; GLN_err( 6) =  5.6;
        T_exp( 7) =   0.3; GLU_exp( 7) =  47.2; GLU_err( 7) =  9.7; GLN_exp( 7) = 29.1; GLN_err( 7) =  6.2;
        T_exp( 8) =   0.5; GLU_exp( 8) =  70.0; GLU_err( 8) = 14.4; GLN_exp( 8) = 39.4; GLN_err( 8) = 10.7;
        T_exp( 9) =   1.0; GLU_exp( 9) =  74.7; GLU_err( 9) = 15.3; GLN_exp( 9) = 44.0; GLN_err( 9) =  9.3;
        T_exp(10) =   2.0; GLU_exp(10) = 131.3; GLU_err(10) = 52.7; GLN_exp(10) = 39.1; GLN_err(10) =  8.3;
        T_exp(11) =   4.0; GLU_exp(11) = 158.9; GLU_err(11) = 32.6; GLN_exp(11) = 19.6; GLN_err(11) =  4.2;
        T_exp(12) =   8.0; GLU_exp(12) = 162.7; GLU_err(12) = 33.4; GLN_exp(12) = 19.0; GLN_err(12) =  4.0;
        T_exp(13) =  15.0; GLU_exp(13) = 177.8; GLU_err(13) = 39.3; GLN_exp(13) = 12.2; GLN_err(13) =  2.6;
        T_exp(14) =  30.0; GLU_exp(14) = 130.3; GLU_err(14) = 52.8; GLN_exp(14) = 10.7; GLN_err(14) =  2.5;

    % 13-fold upshift--deltaGOGAT
    case 3
        % msb200960-s4.xls training set (fig 4) of Yuan et al., Mol Syst Biol, 2009
        T_exp( 1) = -15.0; GLU_exp( 1) =  43.4; GLU_err( 1) =  7.2; GLN_exp( 1) = 13.0; GLN_err( 1) = 2.7;
        T_exp( 2) = - 8.0; GLU_exp( 2) =  43.4; GLU_err( 2) =  7.2; GLN_exp( 2) = 13.0; GLN_err( 2) = 2.7;
        T_exp( 3) = - 4.0; GLU_exp( 3) =  43.4; GLU_err( 3) =  7.2; GLN_exp( 3) = 13.0; GLN_err( 3) = 2.7;
        T_exp( 4) =   0.0; GLU_exp( 4) =  43.4; GLU_err( 4) =  7.2; GLN_exp( 4) = 13.0; GLN_err( 4) = 2.7;
        T_exp( 5) =   0.1; GLU_exp( 5) =  60.2; GLU_err( 5) = 10.0; GLN_exp( 5) = 15.9; GLN_err( 5) = 6.0;
        T_exp( 6) =   0.2; GLU_exp( 6) =  60.6; GLU_err( 6) = 12.4; GLN_exp( 6) = 14.5; GLN_err( 6) = 6.2;
        T_exp( 7) =   0.3; GLU_exp( 7) =  89.4; GLU_err( 7) = 14.8; GLN_exp( 7) = 14.2; GLN_err( 7) = 6.8;
        T_exp( 8) =   0.5; GLU_exp( 8) =  93.7; GLU_err( 8) = 18.3; GLN_exp( 8) = 12.1; GLN_err( 8) = 4.3;
        T_exp( 9) =   1.0; GLU_exp( 9) = 113.6; GLU_err( 9) = 19.1; GLN_exp( 9) =  6.2; GLN_err( 9) = 2.4;
        T_exp(10) =   2.0; GLU_exp(10) = 127.7; GLU_err(10) = 25.8; GLN_exp(10) =  6.3; GLN_err(10) = 1.3;
        T_exp(11) =   4.0; GLU_exp(11) = 120.5; GLU_err(11) = 35.2; GLN_exp(11) =  7.6; GLN_err(11) = 1.6;
        T_exp(12) =   8.0; GLU_exp(12) = 113.2; GLU_err(12) = 25.8; GLN_exp(12) =  6.8; GLN_err(12) = 2.0;
        T_exp(13) =  15.0; GLU_exp(13) = 125.7; GLU_err(13) = 20.8; GLN_exp(13) =  9.1; GLN_err(13) = 3.7;
        T_exp(14) =  30.0; GLU_exp(14) = 118.6; GLU_err(14) = 19.9; GLN_exp(14) =  7.6; GLN_err(14) = 2.4;

    % 3-fold upshift--wildtype
    case 13
         % msb200960-s4.xls add. perturbations (fig 7) of Yuan et al., Mol Syst Biol, 2009
        T_exp( 1) = -15.0; GLU_exp( 1) =  76.6; GLU_err( 1) = 11.6; GLN_exp( 1) =  1.9; GLN_err( 1) = 0.3;
        T_exp( 2) =   0.0; GLU_exp( 2) =  76.6; GLU_err( 2) = 11.6; GLN_exp( 2) =  1.9; GLN_err( 2) = 0.3;
        T_exp( 3) =   0.1; GLU_exp( 3) =  76.7; GLU_err( 3) = 11.6; GLN_exp( 3) =  3.9; GLN_err( 3) = 0.6;
        T_exp( 4) =   0.2; GLU_exp( 4) =  65.3; GLU_err( 4) = 21.4; GLN_exp( 4) =  7.1; GLN_err( 4) = 1.1;
        T_exp( 5) =   0.5; GLU_exp( 5) =  67.2; GLU_err( 5) = 10.2; GLN_exp( 5) = 12.1; GLN_err( 5) = 1.9;
        T_exp( 6) =   1.0; GLU_exp( 6) =  69.4; GLU_err( 6) = 12.8; GLN_exp( 6) = 16.8; GLN_err( 6) = 2.6;
        T_exp( 7) =   2.0; GLU_exp( 7) = 103.7; GLU_err( 7) = 15.7; GLN_exp( 7) = 15.0; GLN_err( 7) = 2.7;
        T_exp( 8) =   4.0; GLU_exp( 8) = 104.4; GLU_err( 8) = 15.8; GLN_exp( 8) =  7.7; GLN_err( 8) = 1.2;
        T_exp( 9) =   8.0; GLU_exp( 9) = 131.0; GLU_err( 9) = 19.8; GLN_exp( 9) =  7.0; GLN_err( 9) = 1.6;
        T_exp(10) =  15.0; GLU_exp(10) = 151.9; GLU_err(10) = 23.0; GLN_exp(10) =  7.5; GLN_err(10) = 1.2;
        T_exp(11) =  30.0; GLU_exp(11) = 164.2; GLU_err(11) = 24.8; GLN_exp(11) =  5.9; GLN_err(11) = 0.9;

    % 3-fold upshift--deltaGOGAT
    case 14
        % msb200960-s4.xls add. perturbations (fig 7) of Yuan et al., Mol Syst Biol, 2009
        T_exp( 1) = -15.0; GLU_exp( 1) =  43.4; GLU_err( 1) =  7.2; GLN_exp( 1) = 13.0; GLN_err( 1) = 2.7;
        T_exp( 2) =   0.0; GLU_exp( 2) =  43.4; GLU_err( 2) =  7.2; GLN_exp( 2) = 13.0; GLN_err( 2) = 2.7;
        T_exp( 3) =   0.1; GLU_exp( 3) =  40.7; GLU_err( 3) = 10.5; GLN_exp( 3) = 14.6; GLN_err( 3) = 3.0;
        T_exp( 4) =   0.2; GLU_exp( 4) =  53.8; GLU_err( 4) =  8.9; GLN_exp( 4) = 17.8; GLN_err( 4) = 3.7;
        T_exp( 5) =   0.5; GLU_exp( 5) =  61.4; GLU_err( 5) = 10.2; GLN_exp( 5) = 15.4; GLN_err( 5) = 3.3;
        T_exp( 6) =   1.0; GLU_exp( 6) =  80.9; GLU_err( 6) = 13.4; GLN_exp( 6) = 14.0; GLN_err( 6) = 2.9;
        T_exp( 7) =   2.0; GLU_exp( 7) =  98.4; GLU_err( 7) = 16.3; GLN_exp( 7) = 11.8; GLN_err( 7) = 2.4;
        T_exp( 8) =   4.0; GLU_exp( 8) = 107.6; GLU_err( 8) = 17.8; GLN_exp( 8) = 12.7; GLN_err( 8) = 2.6;
        T_exp( 9) =   8.0; GLU_exp( 9) =  89.0; GLU_err( 9) = 18.0; GLN_exp( 9) = 12.6; GLN_err( 9) = 2.6;
        T_exp(10) =  15.0; GLU_exp(10) = 101.8; GLU_err(10) = 16.8; GLN_exp(10) = 12.4; GLN_err(10) = 2.5;
        T_exp(11) =  30.0; GLU_exp(11) =  92.2; GLU_err(11) = 15.3; GLN_exp(11) = 16.8; GLN_err(11) = 3.5;

    % down-shift--wildtype
    case 15
        % msb200960-s4.xls add. perturbations (fig 7) of Yuan et al., Mol Syst Biol, 2009
        T_exp( 1) = -15.0; GLU_exp( 1) = 76.6; GLU_err( 1) = 11.6; GLN_exp( 1) = 1.9;  GLN_err( 1) = 0.6;
        T_exp( 2) =   0.0; GLU_exp( 2) = 76.6; GLU_err( 2) = 11.6; GLN_exp( 2) = 1.9;  GLN_err( 2) = 0.6;
        T_exp( 3) =   0.1; GLU_exp( 3) = 81.5; GLU_err( 3) = 17.7; GLN_exp( 3) = 1.8;  GLN_err( 3) = 1.3;
        T_exp( 4) =   0.2; GLU_exp( 4) = 76.4; GLU_err( 4) = 11.6; GLN_exp( 4) = 1.8;  GLN_err( 4) = 1.5;
        T_exp( 5) =   0.5; GLU_exp( 5) = 95.7; GLU_err( 5) = 24.2; GLN_exp( 5) = 1.1;  GLN_err( 5) = 1.0;
        T_exp( 6) =   1.0; GLU_exp( 6) = 80.8; GLU_err( 6) = 20.1; GLN_exp( 6) = 0.5;  GLN_err( 6) = 0.4;
        T_exp( 7) =   2.0; GLU_exp( 7) = 66.4; GLU_err( 7) = 16.6; GLN_exp( 7) = 0.09; GLN_err( 7) = 0.07;
        T_exp( 8) =   4.0; GLU_exp( 8) = 48.9; GLU_err( 8) =  8.2; GLN_exp( 8) = 0.06; GLN_err( 8) = 0.02;
        T_exp( 9) =   8.0; GLU_exp( 9) = 43.2; GLU_err( 9) =  6.5; GLN_exp( 9) = 0.04; GLN_err( 9) = 0.01;
        T_exp(10) =  15.0; GLU_exp(10) = 35.2; GLU_err(10) =  5.3; GLN_exp(10) = 0.06; GLN_err(10) = 0.01;
        T_exp(11) =  30.0; GLU_exp(11) = 34.6; GLU_err(11) =  5.2; GLN_exp(11) = 0.03; GLN_err(11) = 0.02;

    % down-shift-deltaGOGAT
    case 16
        % msb200960-s4.xls add. perturbations (fig 7) of Yuan et al., Mol Syst Biol, 2009
        T_exp( 1) = -15.0; GLU_exp( 1) = 43.4; GLU_err( 1) =  7.2; GLN_exp( 1) = 13.0; GLN_err( 1) = 2.7;
        T_exp( 2) =   0.0; GLU_exp( 2) = 43.4; GLU_err( 2) =  7.2; GLN_exp( 2) = 13.0; GLN_err( 2) = 2.7;
        T_exp( 3) =   0.1; GLU_exp( 3) = 45.5; GLU_err( 3) =  9.2; GLN_exp( 3) = 13.0; GLN_err( 3) = 2.7;
        T_exp( 4) =   0.2; GLU_exp( 4) = 36.3; GLU_err( 4) =  6.8; GLN_exp( 4) = 15.5; GLN_err( 4) = 3.3;
        T_exp( 5) =   0.5; GLU_exp( 5) = 36.4; GLU_err( 5) = 10.9; GLN_exp( 5) = 14.8; GLN_err( 5) = 3.0;
        T_exp( 6) =   1.0; GLU_exp( 6) = 22.6; GLU_err( 6) =  3.7; GLN_exp( 6) = 15.8; GLN_err( 6) = 3.2;
        T_exp( 7) =   2.0; GLU_exp( 7) = 14.0; GLU_err( 7) =  2.5; GLN_exp( 7) = 14.6; GLN_err( 7) = 3.0;
        T_exp( 8) =   4.0; GLU_exp( 8) =  9.3; GLU_err( 8) =  2.8; GLN_exp( 8) = 11.6; GLN_err( 8) = 2.4;
        T_exp( 9) =   8.0; GLU_exp( 9) =  8.5; GLU_err( 9) =  3.1; GLN_exp( 9) =  7.6; GLN_err( 9) = 1.6;
        T_exp(10) =  15.0; GLU_exp(10) =  5.2; GLU_err(10) =  1.3; GLN_exp(10) =  4.1; GLN_err(10) = 0.8;
        T_exp(11) =  30.0; GLU_exp(11) =  3.4; GLU_err(11) =  0.8; GLN_exp(11) =  2.1; GLN_err(11) = 0.4;

    % 13-fold upshift--deltaAT/AR
    case 17
        % msb200960-s4.xls add. perturbations (fig 7) of Yuan et al., Mol Syst Biol, 2009
        T_exp( 1) = -15.0; GLU_exp( 1) =  76.4; GLU_err( 1) = 16.8; GLN_exp( 1) =   2.7; GLN_err( 1) =   0.6;
        T_exp( 2) = - 8.0; GLU_exp( 2) =  76.4; GLU_err( 2) = 16.8; GLN_exp( 2) =   2.7; GLN_err( 2) =   0.6;
        T_exp( 3) = - 4.0; GLU_exp( 3) =  76.4; GLU_err( 3) = 16.8; GLN_exp( 3) =   2.7; GLN_err( 3) =   0.6;
        T_exp( 4) =   0.0; GLU_exp( 4) =  76.4; GLU_err( 4) = 16.8; GLN_exp( 4) =   2.7; GLN_err( 4) =   0.6;
        T_exp( 5) =   0.1; GLU_exp( 5) =  75.6; GLU_err( 5) = 16.6; GLN_exp( 5) =  21.8; GLN_err( 5) =   6.6;
        T_exp( 6) =   0.2; GLU_exp( 6) =  77.2; GLU_err( 6) = 18.1; GLN_exp( 6) =  24.6; GLN_err( 6) =   9.0;
        T_exp( 7) =   0.3; GLU_exp( 7) =  50.9; GLU_err( 7) = 14.1; GLN_exp( 7) =  41.5; GLN_err( 7) =  17.4;
        T_exp( 8) =   0.5; GLU_exp( 8) =  41.5; GLU_err( 8) =  9.1; GLN_exp( 8) =  50.2; GLN_err( 8) =  15.9;
        T_exp( 9) =   1.0; GLU_exp( 9) =  36.2; GLU_err( 9) =  8.0; GLN_exp( 9) =  57.0; GLN_err( 9) =  22.0;
        T_exp(10) =   2.0; GLU_exp(10) =  55.5; GLU_err(10) = 19.2; GLN_exp(10) = 164.7; GLN_err(10) =  61.2;
        T_exp(11) =   4.0; GLU_exp(11) =  48.0; GLU_err(11) = 10.6; GLN_exp(11) = 193.8; GLN_err(11) =  87.1;
        T_exp(12) =   8.0; GLU_exp(12) =  69.9; GLU_err(12) = 20.3; GLN_exp(12) = 323.8; GLN_err(12) = 111.2;
        T_exp(13) =  15.0; GLU_exp(13) = 104.4; GLU_err(13) = 34.4; GLN_exp(13) = 341.9; GLN_err(13) = 116.1;
        T_exp(14) =  30.0; GLU_exp(14) = 113.0; GLU_err(14) = 58.1; GLN_exp(14) = 340.5; GLN_err(14) =  82.3;
        
    % 13-fold upshift--deltaAmtB
    case 18
        % Supplementary Figure 5 of Yuan et al., Mol Syst Biol, 2009
        T_exp( 1) = - 4.0; GLU_exp( 1) =  86.0; GLU_err( 1) = 13.0; GLN_exp( 1) =  2.2; GLN_err( 1) =  0.5;
        T_exp( 2) =   0.0; GLU_exp( 2) =  86.0; GLU_err( 2) = 13.0; GLN_exp( 2) =  2.2; GLN_err( 2) =  0.5;
        T_exp( 3) =   0.1; GLU_exp( 3) =  74.0; GLU_err( 3) = 11.0; GLN_exp( 3) = 17.0; GLN_err( 3) =  3.0;
        T_exp( 4) =   0.2; GLU_exp( 4) =  72.0; GLU_err( 4) = 12.0; GLN_exp( 4) = 28.0; GLN_err( 4) =  4.0;
        T_exp( 5) =   0.3; GLU_exp( 5) =  73.0; GLU_err( 5) = 37.0; GLN_exp( 5) = 37.0; GLN_err( 5) =  5.0;
        T_exp( 6) =   0.5; GLU_exp( 6) =  78.0; GLU_err( 6) = 38.0; GLN_exp( 6) = 42.0; GLN_err( 6) =  7.0;
        T_exp( 7) =   1.0; GLU_exp( 7) = 110.0; GLU_err( 7) = 20.0; GLN_exp( 7) = 70.0; GLN_err( 7) = 16.0;
        T_exp( 8) =   2.0; GLU_exp( 8) = 170.0; GLU_err( 8) = 50.0; GLN_exp( 8) = 36.0; GLN_err( 8) = 18.0;
        T_exp( 9) =   4.0; GLU_exp( 9) = 230.0; GLU_err( 9) = 30.0; GLN_exp( 9) = 17.0; GLN_err( 9) =  4.0;
        T_exp(10) =   8.0; GLU_exp(10) = 200.0; GLU_err(10) = 80.0; GLN_exp(10) = 16.0; GLN_err(10) =  4.0;

    otherwise
        error('Unexpected Strain Number!');

end
