function [Glycerol, Glucose, G6P_Gluconate] = ExpDataOfKim2012Fig3C()

%%
% % From Fig 3C (solid circle) of Kim et al, Mol Syst Biol, 2012
% % Unit: microM for NH4ext and NH4int
% Glycerol.WT.NH4ext( 1,1) =   4; Glycerol.WT.NH4int( 1,1) =  16;
% Glycerol.WT.NH4ext( 2,1) =   6; Glycerol.WT.NH4int( 2,1) =  16;
% Glycerol.WT.NH4ext( 3,1) =   8; Glycerol.WT.NH4int( 3,1) =  16;
% Glycerol.WT.NH4ext( 4,1) =  12; Glycerol.WT.NH4int( 4,1) =  15;
% Glycerol.WT.NH4ext( 5,1) =  20; Glycerol.WT.NH4int( 5,1) =  16;
% Glycerol.WT.NH4ext( 6,1) =  30; Glycerol.WT.NH4int( 6,1) =  18;
% Glycerol.WT.NH4ext( 7,1) =  43; Glycerol.WT.NH4int( 7,1) =  25;
% Glycerol.WT.NH4ext( 8,1) =  85; Glycerol.WT.NH4int( 8,1) =  50;
% Glycerol.WT.NH4ext( 9,1) = 160; Glycerol.WT.NH4int( 9,1) =  90;
% Glycerol.WT.NH4ext(10,1) = 300; Glycerol.WT.NH4int(10,1) = 190;
% Glycerol.WT.NH4ext(11,1) = 600; Glycerol.WT.NH4int(11,1) = 400;
% 
% % From Fig 3C (open circle) of Kim et al, Mol Syst Biol, 2012
% % Unit: microM for NH4ext and NH4int
% Glycerol.deltaAmtB.NH4ext( 1,1) =   8; Glycerol.deltaAmtB.NH4int( 1,1) =   3.6;
% Glycerol.deltaAmtB.NH4ext( 2,1) =  10; Glycerol.deltaAmtB.NH4int( 2,1) =   4.5;
% Glycerol.deltaAmtB.NH4ext( 3,1) =  13; Glycerol.deltaAmtB.NH4int( 3,1) =   5.7;
% Glycerol.deltaAmtB.NH4ext( 4,1) =  15; Glycerol.deltaAmtB.NH4int( 4,1) =   6.5;
% Glycerol.deltaAmtB.NH4ext( 5,1) =  19; Glycerol.deltaAmtB.NH4int( 5,1) =   9;
% Glycerol.deltaAmtB.NH4ext( 6,1) =  20; Glycerol.deltaAmtB.NH4int( 6,1) =   9;
% Glycerol.deltaAmtB.NH4ext( 7,1) =  29; Glycerol.deltaAmtB.NH4int( 7,1) =  16;
% Glycerol.deltaAmtB.NH4ext( 8,1) =  44; Glycerol.deltaAmtB.NH4int( 8,1) =  25;
% Glycerol.deltaAmtB.NH4ext( 9,1) =  60; Glycerol.deltaAmtB.NH4int( 9,1) =  34;
% Glycerol.deltaAmtB.NH4ext(10,1) =  85; Glycerol.deltaAmtB.NH4int(10,1) =  50;
% Glycerol.deltaAmtB.NH4ext(11,1) = 160; Glycerol.deltaAmtB.NH4int(11,1) =  92;
% Glycerol.deltaAmtB.NH4ext(12,1) = 300; Glycerol.deltaAmtB.NH4int(12,1) = 200;
% 
% % From Fig 3C (solid triangle) of Kim et al, Mol Syst Biol, 2012
% % Unit: microM for NH4ext and NH4int
% Glucose.WT.NH4ext( 1,1) =   4; Glucose.WT.NH4int( 1,1) =  22;
% Glucose.WT.NH4ext( 2,1) =   7; Glucose.WT.NH4int( 2,1) =  22;
% Glucose.WT.NH4ext( 3,1) =  12; Glucose.WT.NH4int( 3,1) =  22;
% Glucose.WT.NH4ext( 4,1) =  20; Glucose.WT.NH4int( 4,1) =  24;
% Glucose.WT.NH4ext( 5,1) =  33; Glucose.WT.NH4int( 5,1) =  26;
% Glucose.WT.NH4ext( 6,1) =  53; Glucose.WT.NH4int( 6,1) =  32;
% Glucose.WT.NH4ext( 7,1) =  83; Glucose.WT.NH4int( 7,1) =  50;
% Glucose.WT.NH4ext( 8,1) = 200; Glucose.WT.NH4int( 8,1) = 130;
% Glucose.WT.NH4ext( 9,1) = 500; Glucose.WT.NH4int( 9,1) = 320;
% 
% % From Fig 3C (open triangle) of Kim et al, Mol Syst Biol, 2012
% % Unit: microM for NH4ext and NH4int
% Glucose.deltaAmtB.NH4ext( 1,1) =  10; Glucose.deltaAmtB.NH4int( 1,1) =   4;
% Glucose.deltaAmtB.NH4ext( 2,1) =  14; Glucose.deltaAmtB.NH4int( 2,1) =   5.6;
% Glucose.deltaAmtB.NH4ext( 3,1) =  20; Glucose.deltaAmtB.NH4int( 3,1) =   8.2;
% Glucose.deltaAmtB.NH4ext( 4,1) =  32; Glucose.deltaAmtB.NH4int( 4,1) =  16;
% Glucose.deltaAmtB.NH4ext( 5,1) =  45; Glucose.deltaAmtB.NH4int( 5,1) =  24;
% Glucose.deltaAmtB.NH4ext( 6,1) =  80; Glucose.deltaAmtB.NH4int( 6,1) =  46;
% Glucose.deltaAmtB.NH4ext( 7,1) = 160; Glucose.deltaAmtB.NH4int( 7,1) =  95;
% Glucose.deltaAmtB.NH4ext( 8,1) = 300; Glucose.deltaAmtB.NH4int( 8,1) = 200;
% 
% % From Fig 3C (solid square) of Kim et al, Mol Syst Biol, 2012
% % Unit: microM for NH4ext and NH4int
% G6P_Gluconate.WT.NH4ext( 1,1) =   4; G6P_Gluconate.WT.NH4int( 1,1) =  36;
% G6P_Gluconate.WT.NH4ext( 2,1) =   7; G6P_Gluconate.WT.NH4int( 2,1) =  40;
% G6P_Gluconate.WT.NH4ext( 3,1) =  12; G6P_Gluconate.WT.NH4int( 3,1) =  35;
% G6P_Gluconate.WT.NH4ext( 4,1) =  19; G6P_Gluconate.WT.NH4int( 4,1) =  40;
% G6P_Gluconate.WT.NH4ext( 5,1) =  40; G6P_Gluconate.WT.NH4int( 5,1) =  45;
% G6P_Gluconate.WT.NH4ext( 6,1) =  50; G6P_Gluconate.WT.NH4int( 6,1) =  46;
% G6P_Gluconate.WT.NH4ext( 7,1) =  64; G6P_Gluconate.WT.NH4int( 7,1) =  50;
% G6P_Gluconate.WT.NH4ext( 8,1) = 100; G6P_Gluconate.WT.NH4int( 8,1) =  60;
% G6P_Gluconate.WT.NH4ext( 9,1) = 200; G6P_Gluconate.WT.NH4int( 9,1) = 130;
% G6P_Gluconate.WT.NH4ext(10,1) = 500; G6P_Gluconate.WT.NH4int(10,1) = 300;
% 
% % From Fig 3C (open square) of Kim et al, Mol Syst Biol, 2012
% % Unit: microM for NH4ext and NH4int
% G6P_Gluconate.deltaAmtB.NH4ext( 1,1) =  19; G6P_Gluconate.deltaAmtB.NH4int( 1,1) =   8;
% G6P_Gluconate.deltaAmtB.NH4ext( 2,1) =  30; G6P_Gluconate.deltaAmtB.NH4int( 2,1) =  14;
% G6P_Gluconate.deltaAmtB.NH4ext( 3,1) =  40; G6P_Gluconate.deltaAmtB.NH4int( 3,1) =  20;
% G6P_Gluconate.deltaAmtB.NH4ext( 4,1) =  54; G6P_Gluconate.deltaAmtB.NH4int( 4,1) =  29;
% G6P_Gluconate.deltaAmtB.NH4ext( 5,1) =  79; G6P_Gluconate.deltaAmtB.NH4int( 5,1) =  44;
% G6P_Gluconate.deltaAmtB.NH4ext( 6,1) = 100; G6P_Gluconate.deltaAmtB.NH4int( 6,1) =  60;
% G6P_Gluconate.deltaAmtB.NH4ext( 7,1) = 200; G6P_Gluconate.deltaAmtB.NH4int( 7,1) = 130;
% G6P_Gluconate.deltaAmtB.NH4ext( 8,1) = 400; G6P_Gluconate.deltaAmtB.NH4int( 8,1) = 250;
% G6P_Gluconate.deltaAmtB.NH4ext( 9,1) = 500; G6P_Gluconate.deltaAmtB.NH4int( 9,1) = 320;

%% Data Correction 
% From Fig 3C (solid circle) of Kim et al, Mol Syst Biol, 2012
% Unit: microM for NH4ext and NH4int
% Original NH4int (VdivA = 1.8e-7, pKa = 9.25),
% Corrected NH4int (VdivA = 2.15e-18/9.18e-12, pKa = 8.95)
Glycerol.WT.NH4ext( 1,1) =   4; Glycerol.WT.NH4int( 1,1) =  16 * 15.15 / 14.09;
Glycerol.WT.NH4ext( 2,1) =   6; Glycerol.WT.NH4int( 2,1) =  16 * 15.18 / 14.12;
Glycerol.WT.NH4ext( 3,1) =   8; Glycerol.WT.NH4int( 3,1) =  16 * 15.22 / 14.16;
Glycerol.WT.NH4ext( 4,1) =  12; Glycerol.WT.NH4int( 4,1) =  15 * 15.46 / 14.40;
Glycerol.WT.NH4ext( 5,1) =  20; Glycerol.WT.NH4int( 5,1) =  16 * 16.42 / 15.34;
Glycerol.WT.NH4ext( 6,1) =  30; Glycerol.WT.NH4int( 6,1) =  18 * 18.49 / 17.42;
% Glycerol.WT.NH4ext( x,1) =  35; Glycerol.WT.NH4int( x,1) =  19 * 19.50 / 18.70; // (Table S5 of Kim 2012)
Glycerol.WT.NH4ext( 7,1) =  43; Glycerol.WT.NH4int( 7,1) =  25 * 25.13 / 24.05; % For > Next* microM, correction factor for deltaAmtB must be used.
Glycerol.WT.NH4ext( 8,1) =  85; Glycerol.WT.NH4int( 8,1) =  50 * 51.70 / 50.66;
Glycerol.WT.NH4ext( 9,1) = 160; Glycerol.WT.NH4int( 9,1) =  90 * 98.99 / 97.93;
Glycerol.WT.NH4ext(10,1) = 300; Glycerol.WT.NH4int(10,1) = 190 * 187.21 / 186.10;
Glycerol.WT.NH4ext(11,1) = 600; Glycerol.WT.NH4int(11,1) = 400 * 376.50 / 375.35;

% From Fig 3C (open circle) of Kim et al, Mol Syst Biol, 2012
% Unit: microM for NH4ext and NH4int
% Original NH4int (VdivA = 1.8e-7, pKa = 9.25),
% Corrected NH4int (VdivA = 2.15e-18/9.18e-12, pKa = 8.95)
Glycerol.deltaAmtB.NH4ext( 1,1) =   8; Glycerol.deltaAmtB.NH4int( 1,1) =   3.6 * 4.14 / 3.66;
Glycerol.deltaAmtB.NH4ext( 2,1) =  10; Glycerol.deltaAmtB.NH4int( 2,1) =   4.5 * 5.14 / 4.51;
Glycerol.deltaAmtB.NH4ext( 3,1) =  13; Glycerol.deltaAmtB.NH4int( 3,1) =   5.7 * 6.87 / 6.16;
Glycerol.deltaAmtB.NH4ext( 4,1) =  15; Glycerol.deltaAmtB.NH4int( 4,1) =   6.5 * 7.95 / 7.15;
Glycerol.deltaAmtB.NH4ext( 5,1) =  19; Glycerol.deltaAmtB.NH4int( 5,1) =   9 * 10.15 / 9.17;
Glycerol.deltaAmtB.NH4ext( 6,1) =  20; Glycerol.deltaAmtB.NH4int( 6,1) =   9 * 10.71 / 9.69;
Glycerol.deltaAmtB.NH4ext( 7,1) =  29; Glycerol.deltaAmtB.NH4int( 7,1) =  16 * 16.30 / 15.23;
Glycerol.deltaAmtB.NH4ext( 8,1) =  44; Glycerol.deltaAmtB.NH4int( 8,1) =  25 * 25.76 / 24.68;
Glycerol.deltaAmtB.NH4ext( 9,1) =  60; Glycerol.deltaAmtB.NH4int( 9,1) =  34 * 35.72 / 34.57;
Glycerol.deltaAmtB.NH4ext(10,1) =  85; Glycerol.deltaAmtB.NH4int(10,1) =  50 * 51.70 / 50.66;
Glycerol.deltaAmtB.NH4ext(11,1) = 160; Glycerol.deltaAmtB.NH4int(11,1) =  92 * 98.99 / 97.93;
Glycerol.deltaAmtB.NH4ext(12,1) = 300; Glycerol.deltaAmtB.NH4int(12,1) = 200 * 187.21 / 186.10;

% From Fig 3C (solid triangle) of Kim et al, Mol Syst Biol, 2012
% Unit: microM for NH4ext and NH4int
% Original NH4int (VdivA = 2.0e-7, pKa = 9.25),
% Corrected NH4int (VdivA = 2.15e-18/9.18e-12, pKa = 8.95)
Glucose.WT.NH4ext( 1,1) =   4; Glucose.WT.NH4int( 1,1) =  22 * 22.50 / 20.64;
Glucose.WT.NH4ext( 2,1) =   7; Glucose.WT.NH4int( 2,1) =  22 * 22.61 / 20.74;
Glucose.WT.NH4ext( 3,1) =  12; Glucose.WT.NH4int( 3,1) =  22 * 22.90 / 21.04;
Glucose.WT.NH4ext( 4,1) =  20; Glucose.WT.NH4int( 4,1) =  24 * 23.55 / 21.68;
Glucose.WT.NH4ext( 5,1) =  33; Glucose.WT.NH4int( 5,1) =  26 * 25.03 / 23.14;
Glucose.WT.NH4ext( 6,1) =  53; Glucose.WT.NH4int( 6,1) =  32 * 27.82 / 25.94;
% Glucose.WT.NH4ext( x,1) =  60; Glucose.WT.NH4int( x,1) =  33 * 28.47 / 26.96; // (Table S5 of Kim 2012)
Glucose.WT.NH4ext( 7,1) =  83; Glucose.WT.NH4int( 7,1) =  50 * 49.83 / 48.03; % For > Next* microM, correction factor for deltaAmtB must be used.
Glucose.WT.NH4ext( 8,1) = 200; Glucose.WT.NH4int( 8,1) = 130 * 123.66 / 121.86;
Glucose.WT.NH4ext( 9,1) = 500; Glucose.WT.NH4int( 9,1) = 320 * 312.92 / 311.04;

% From Fig 3C (open triangle) of Kim et al, Mol Syst Biol, 2012
% Unit: microM for NH4ext and NH4int
% Original NH4int (VdivA = 2.0e-7, pKa = 9.25),
% Corrected NH4int (VdivA = 2.15e-18/9.18e-12, pKa = 8.95)
Glucose.deltaAmtB.NH4ext( 1,1) =  10; Glucose.deltaAmtB.NH4int( 1,1) =   4 * 4.93 / 3.96;
Glucose.deltaAmtB.NH4ext( 2,1) =  14; Glucose.deltaAmtB.NH4int( 2,1) =   5.6 * 6.82 / 5.40;
Glucose.deltaAmtB.NH4ext( 3,1) =  20; Glucose.deltaAmtB.NH4int( 3,1) =   8.2 * 10.44 / 8.90;
Glucose.deltaAmtB.NH4ext( 4,1) =  32; Glucose.deltaAmtB.NH4int( 4,1) =  16 * 17.62 / 15.81;
Glucose.deltaAmtB.NH4ext( 5,1) =  45; Glucose.deltaAmtB.NH4int( 5,1) =  24 * 25.72 / 23.83;
Glucose.deltaAmtB.NH4ext( 6,1) =  80; Glucose.deltaAmtB.NH4int( 6,1) =  46 * 47.93 / 46.14;
Glucose.deltaAmtB.NH4ext( 7,1) = 160; Glucose.deltaAmtB.NH4int( 7,1) =  95 * 98.43 / 96.63;
Glucose.deltaAmtB.NH4ext( 8,1) = 300; Glucose.deltaAmtB.NH4int( 8,1) = 200 * 186.71 / 184.89;

% From Fig 3C (solid square) of Kim et al, Mol Syst Biol, 2012
% Unit: microM for NH4ext and NH4int
% Original NH4int (VdivA = 2.3e-7;, pKa = 9.25),
% Corrected NH4int (VdivA = 2.15e-18/9.18e-12, pKa = 8.95)
G6P_Gluconate.WT.NH4ext( 1,1) =   4; G6P_Gluconate.WT.NH4int( 1,1) =  36 * 37.84 / 34.97;
G6P_Gluconate.WT.NH4ext( 2,1) =   7; G6P_Gluconate.WT.NH4int( 2,1) =  40 * 38.24 / 35.38;
G6P_Gluconate.WT.NH4ext( 3,1) =  12; G6P_Gluconate.WT.NH4int( 3,1) =  35 * 39.17 / 36.31;
G6P_Gluconate.WT.NH4ext( 4,1) =  19; G6P_Gluconate.WT.NH4int( 4,1) =  40 * 40.92 / 38.05;
G6P_Gluconate.WT.NH4ext( 5,1) =  40; G6P_Gluconate.WT.NH4int( 5,1) =  45 * 48.25 / 45.34;
G6P_Gluconate.WT.NH4ext( 6,1) =  50; G6P_Gluconate.WT.NH4int( 6,1) =  46 * 52.49 / 49.56;
G6P_Gluconate.WT.NH4ext( 7,1) =  64; G6P_Gluconate.WT.NH4int( 7,1) =  50 * 59.00 / 56.03;
% G6P_Gluconate.WT.NH4ext( x,1) =  100; G6P_Gluconate.WT.NH4int( x,1) =  57 * 59.58 / 57.04; // (Table S5 of Kim 2012)
G6P_Gluconate.WT.NH4ext( 8,1) = 100; G6P_Gluconate.WT.NH4int( 8,1) =  60 * 60.03 / 57.07; % For > Next* microM, correction factor for deltaAmtB must be used.
G6P_Gluconate.WT.NH4ext( 9,1) = 200; G6P_Gluconate.WT.NH4int( 9,1) = 130 * 123.21 / 120.31;
G6P_Gluconate.WT.NH4ext(10,1) = 500; G6P_Gluconate.WT.NH4int(10,1) = 300 * 312.56 / 309.73;

% From Fig 3C (open square) of Kim et al, Mol Syst Biol, 2012
% Unit: microM for NH4ext and NH4int
% Original NH4int (VdivA = 2.3e-7;, pKa = 9.25),
% Corrected NH4int (VdivA = 2.15e-18/9.18e-12, pKa = 8.95)
G6P_Gluconate.deltaAmtB.NH4ext( 1,1) =  19; G6P_Gluconate.deltaAmtB.NH4int( 1,1) =   8 * 10.02 / 8.13;
G6P_Gluconate.deltaAmtB.NH4ext( 2,1) =  30; G6P_Gluconate.deltaAmtB.NH4int( 2,1) =  14 * 16.68 / 14.52;
G6P_Gluconate.deltaAmtB.NH4ext( 3,1) =  40; G6P_Gluconate.deltaAmtB.NH4int( 3,1) =  20 * 23.02 / 20.89;
G6P_Gluconate.deltaAmtB.NH4ext( 4,1) =  54; G6P_Gluconate.deltaAmtB.NH4int( 4,1) =  29 * 31.13 / 28.29;
G6P_Gluconate.deltaAmtB.NH4ext( 5,1) =  79; G6P_Gluconate.deltaAmtB.NH4int( 5,1) =  44 * 46.84 / 43.94;
G6P_Gluconate.deltaAmtB.NH4ext( 6,1) = 100; G6P_Gluconate.deltaAmtB.NH4int( 6,1) =  60 * 60.03 / 57.07;
G6P_Gluconate.deltaAmtB.NH4ext( 7,1) = 200; G6P_Gluconate.deltaAmtB.NH4int( 7,1) = 130 * 123.21 / 120.31;
G6P_Gluconate.deltaAmtB.NH4ext( 8,1) = 400; G6P_Gluconate.deltaAmtB.NH4int( 8,1) = 250 * 249.24 / 246.17;
G6P_Gluconate.deltaAmtB.NH4ext( 9,1) = 500; G6P_Gluconate.deltaAmtB.NH4int( 9,1) = 320 * 312.56 / 309.73;

%%
Glycerol.WT.NH4ext = Glycerol.WT.NH4ext * 1e-3; % NH4ext in mM
Glycerol.WT.NH4int = Glycerol.WT.NH4int * 1e-3; % NH4int in mM
Glycerol.deltaAmtB.NH4ext = Glycerol.deltaAmtB.NH4ext * 1e-3; % NH4ext in mM
Glycerol.deltaAmtB.NH4int = Glycerol.deltaAmtB.NH4int * 1e-3; % NH4int in mM

Glucose.WT.NH4ext = Glucose.WT.NH4ext * 1e-3; % NH4ext in mM
Glucose.WT.NH4int = Glucose.WT.NH4int * 1e-3; % NH4int in mM
Glucose.deltaAmtB.NH4ext = Glucose.deltaAmtB.NH4ext * 1e-3; % NH4ext in mM
Glucose.deltaAmtB.NH4int = Glucose.deltaAmtB.NH4int * 1e-3; % NH4int in mM

G6P_Gluconate.WT.NH4ext = G6P_Gluconate.WT.NH4ext * 1e-3; % NH4ext in mM
G6P_Gluconate.WT.NH4int = G6P_Gluconate.WT.NH4int * 1e-3; % NH4int in mM
G6P_Gluconate.deltaAmtB.NH4ext = G6P_Gluconate.deltaAmtB.NH4ext * 1e-3; % NH4ext in mM
G6P_Gluconate.deltaAmtB.NH4int = G6P_Gluconate.deltaAmtB.NH4int * 1e-3; % NH4int in mM
