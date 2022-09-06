function [Glycerol, Glucose, G6P_Gluconate] = ExpDataOfKim2012Fig2E()

% From Fig 2E of Kim et al, Mol Syst Biol, 2012
% Unit: microM for NH4ext, M/h for Flux
Glycerol.NH4ext(1,1) =   4; Glycerol.Jamtb(1,1) =  9;   Glycerol.Jdiff(1,1) = -7.5;  Glycerol.Jnet(1,1) = 1.9;
Glycerol.NH4ext(2,1) =   6; Glycerol.Jamtb(2,1) =  8.5; Glycerol.Jdiff(2,1) = -6.9;  Glycerol.Jnet(2,1) = 1.7;
Glycerol.NH4ext(3,1) =   8; Glycerol.Jamtb(3,1) =  8;   Glycerol.Jdiff(3,1) = -6.1;  Glycerol.Jnet(3,1) = 2;
Glycerol.NH4ext(4,1) =  12; Glycerol.Jamtb(4,1) =  6;   Glycerol.Jdiff(4,1) = -4;    Glycerol.Jnet(4,1) = 2;
Glycerol.NH4ext(5,1) =  20; Glycerol.Jamtb(5,1) =  3.8; Glycerol.Jdiff(5,1) = -1.9;  Glycerol.Jnet(5,1) = 2;
Glycerol.NH4ext(6,1) =  30; Glycerol.Jamtb(6,1) =  1.2; Glycerol.Jdiff(6,1) =  0.7;  Glycerol.Jnet(6,1) = 2;
Glycerol.NH4ext(7,1) =  43; Glycerol.Jamtb(7,1) =  0.7; Glycerol.Jdiff(7,1) =  1.1;  Glycerol.Jnet(7,1) = 1.9;
Glycerol.NH4ext(8,1) =  83; Glycerol.Jamtb(8,1) =  1.1; Glycerol.Jdiff(8,1) =  0.7;  Glycerol.Jnet(8,1) = 1.9;
Glycerol.NH4ext(9,1) = 160; Glycerol.Jamtb(9,1) = -1.2; Glycerol.Jdiff(9,1) =  3;    Glycerol.Jnet(9,1) = 2;

% % Jamtb from Fig 3D of Kim et al, Mol Syst Biol, 2012
% % Jnet from Fig 3A of Kim et al, Mol Syst Biol, 2012
% % Unit: microM for NH4ext, M/h for Flux
% Glucose.NH4ext( 1,1) =    4; Glucose.Jamtb( 1,1) =     13; Glucose.Jdiff( 1,1) = -1e+20; Glucose.Jnet( 1,1) = 0.80 * 3;
% Glucose.NH4ext( 2,1) =    7; Glucose.Jamtb( 2,1) = -1e+20; Glucose.Jdiff( 2,1) = -1e+20; Glucose.Jnet( 2,1) = 0.82 * 3;
% Glucose.NH4ext( 3,1) =   12; Glucose.Jamtb( 3,1) = -1e+20; Glucose.Jdiff( 3,1) = -1e+20; Glucose.Jnet( 3,1) = 0.82 * 3;
% Glucose.NH4ext( 4,1) =   20; Glucose.Jamtb( 4,1) = -1e+20; Glucose.Jdiff( 4,1) = -1e+20; Glucose.Jnet( 4,1) = 0.84 * 3;
% Glucose.NH4ext( 5,1) =   34; Glucose.Jamtb( 5,1) = -1e+20; Glucose.Jdiff( 5,1) = -1e+20; Glucose.Jnet( 5,1) = 0.82 * 3;
% Glucose.NH4ext( 6,1) =   56; Glucose.Jamtb( 6,1) = -1e+20; Glucose.Jdiff( 6,1) = -1e+20; Glucose.Jnet( 6,1) = 0.80 * 3;
% Glucose.NH4ext( 7,1) =   80; Glucose.Jamtb( 7,1) = -1e+20; Glucose.Jdiff( 7,1) = -1e+20; Glucose.Jnet( 7,1) = 0.78 * 3;
% Glucose.NH4ext( 8,1) =  200; Glucose.Jamtb( 8,1) = -1e+20; Glucose.Jdiff( 8,1) = -1e+20; Glucose.Jnet( 8,1) = 0.82 * 3;
% Glucose.NH4ext( 9,1) =  500; Glucose.Jamtb( 9,1) = -1e+20; Glucose.Jdiff( 9,1) = -1e+20; Glucose.Jnet( 9,1) = 0.79 * 3;
% Glucose.NH4ext(10,1) =  700; Glucose.Jamtb(10,1) = -1e+20; Glucose.Jdiff(10,1) = -1e+20; Glucose.Jnet(10,1) = 0.80 * 3;
% Glucose.NH4ext(11,1) = 1000; Glucose.Jamtb(11,1) = -1e+20; Glucose.Jdiff(11,1) = -1e+20; Glucose.Jnet(11,1) = 0.82 * 3;
% 
% G6P_Gluconate.NH4ext( 1,1) =    4; G6P_Gluconate.Jamtb( 1,1) =      19; G6P_Gluconate.Jdiff( 1,1) = -1e+20; G6P_Gluconate.Jnet( 1,1) = 0.82 * 3;
% G6P_Gluconate.NH4ext( 2,1) =    7; G6P_Gluconate.Jamtb( 2,1) =  -1e+20; G6P_Gluconate.Jdiff( 2,1) = -1e+20; G6P_Gluconate.Jnet( 2,1) = 0.86 * 3;
% G6P_Gluconate.NH4ext( 3,1) =   12; G6P_Gluconate.Jamtb( 3,1) =  -1e+20; G6P_Gluconate.Jdiff( 3,1) = -1e+20; G6P_Gluconate.Jnet( 3,1) = 0.85 * 3;
% G6P_Gluconate.NH4ext( 4,1) =   20; G6P_Gluconate.Jamtb( 4,1) =  -1e+20; G6P_Gluconate.Jdiff( 4,1) = -1e+20; G6P_Gluconate.Jnet( 4,1) = 0.88 * 3;
% G6P_Gluconate.NH4ext( 5,1) =   40; G6P_Gluconate.Jamtb( 5,1) =  -1e+20; G6P_Gluconate.Jdiff( 5,1) = -1e+20; G6P_Gluconate.Jnet( 5,1) = 0.92 * 3;
% G6P_Gluconate.NH4ext( 6,1) =   50; G6P_Gluconate.Jamtb( 6,1) =  -1e+20; G6P_Gluconate.Jdiff( 6,1) = -1e+20; G6P_Gluconate.Jnet( 6,1) = 0.88 * 3;
% G6P_Gluconate.NH4ext( 7,1) =   63; G6P_Gluconate.Jamtb( 7,1) =  -1e+20; G6P_Gluconate.Jdiff( 7,1) = -1e+20; G6P_Gluconate.Jnet( 7,1) = 0.90 * 3;
% G6P_Gluconate.NH4ext( 8,1) =  100; G6P_Gluconate.Jamtb( 8,1) =  -1e+20; G6P_Gluconate.Jdiff( 8,1) = -1e+20; G6P_Gluconate.Jnet( 8,1) = 0.92 * 3;
% G6P_Gluconate.NH4ext( 9,1) =  200; G6P_Gluconate.Jamtb( 9,1) =  -1e+20; G6P_Gluconate.Jdiff( 9,1) = -1e+20; G6P_Gluconate.Jnet( 9,1) = 0.88 * 3;
% G6P_Gluconate.NH4ext(10,1) =  500; G6P_Gluconate.Jamtb(10,1) =  -1e+20; G6P_Gluconate.Jdiff(10,1) = -1e+20; G6P_Gluconate.Jnet(10,1) = 0.93 * 3;
% G6P_Gluconate.NH4ext(11,1) =  700; G6P_Gluconate.Jamtb(11,1) =  -1e+20; G6P_Gluconate.Jdiff(11,1) = -1e+20; G6P_Gluconate.Jnet(11,1) = 0.90 * 3;
% G6P_Gluconate.NH4ext(12,1) = 1000; G6P_Gluconate.Jamtb(12,1) =  -1e+20; G6P_Gluconate.Jdiff(12,1) = -1e+20; G6P_Gluconate.Jnet(12,1) = 0.97 * 3;

% Maeda got the data for Glucose and G6P+Gluconate from Minsu Kim.
% Unit: microM for NH4ext, M/h for Flux
Glucose.NH4ext(1,1) =  4; Glucose.Jamtb(1,1) = 12.56028385; Glucose.Jdiff(1,1) = -10.20619908; Glucose.Jnet(1,1) = 2.354084764;
Glucose.NH4ext(2,1) =  7; Glucose.Jamtb(2,1) = 12.06448317; Glucose.Jdiff(2,1) = -9.618081355; Glucose.Jnet(2,1) = 2.446401814;
Glucose.NH4ext(3,1) = 12; Glucose.Jamtb(3,1) = 10.57708113; Glucose.Jdiff(3,1) = -8.13067932;  Glucose.Jnet(3,1) = 2.446401814;
Glucose.NH4ext(4,1) = 19; Glucose.Jamtb(4,1) = 8.593878421; Glucose.Jdiff(4,1) = -6.098548571; Glucose.Jnet(4,1) = 2.49532985;
Glucose.NH4ext(5,1) = 34; Glucose.Jamtb(5,1) = 4.958006782; Glucose.Jdiff(5,1) = -2.511604968; Glucose.Jnet(5,1) = 2.446401814;
Glucose.NH4ext(6,1) = 54; Glucose.Jamtb(6,1) = 1.322135142; Glucose.Jdiff(6,1) =  1.077220483; Glucose.Jnet(6,1) = 2.399355625;

G6P_Gluconate.NH4ext(1,1) =  4; G6P_Gluconate.Jamtb(1,1) = 18.21608418; G6P_Gluconate.Jdiff(1,1) = -15.76968236; G6P_Gluconate.Jnet(1,1) = 2.446401814;
G6P_Gluconate.NH4ext(2,1) =  7; G6P_Gluconate.Jamtb(2,1) = 18.80369979; G6P_Gluconate.Jdiff(2,1) = -16.20439787; G6P_Gluconate.Jnet(2,1) = 2.599301927;
G6P_Gluconate.NH4ext(3,1) = 12; G6P_Gluconate.Jamtb(3,1) = 15.27800608; G6P_Gluconate.Jdiff(3,1) = -12.73175113; G6P_Gluconate.Jnet(3,1) = 2.546254949;
G6P_Gluconate.NH4ext(4,1) = 19; G6P_Gluconate.Jamtb(4,1) = 14.98419827; G6P_Gluconate.Jdiff(4,1) = -12.32959205; G6P_Gluconate.Jnet(4,1) = 2.654606223;
G6P_Gluconate.NH4ext(5,1) = 39; G6P_Gluconate.Jamtb(5,1) = 12.33992799; G6P_Gluconate.Jdiff(5,1) = -9.567339268; G6P_Gluconate.Jnet(5,1) = 2.772588722;
G6P_Gluconate.NH4ext(6,1) = 49; G6P_Gluconate.Jamtb(6,1) = 9.989465516; G6P_Gluconate.Jdiff(6,1) = -7.334859292; G6P_Gluconate.Jnet(6,1) = 2.654606223;
G6P_Gluconate.NH4ext(7,1) = 64; G6P_Gluconate.Jamtb(7,1) = 6.463771804; G6P_Gluconate.Jdiff(7,1) = -3.751456750; G6P_Gluconate.Jnet(7,1) = 2.712315054;


Glycerol.NH4ext = Glycerol.NH4ext * 1e-3; % NH4ext in mM
Glycerol.Jamtb = Glycerol.Jamtb * 1e+3 / 60; % Jamtb in mM/min
Glycerol.Jdiff = Glycerol.Jdiff * 1e+3 / 60; % Jdiff in mM/min
Glycerol.Jnet  = Glycerol.Jnet * 1e+3 / 60;  % Jnet in mM/min
Glucose.NH4ext = Glucose.NH4ext * 1e-3;      % NH4ext in mM
Glucose.Jamtb = Glucose.Jamtb * 1e+3 / 60;   % Jamtb in mM/min
Glucose.Jdiff = Glucose.Jdiff * 1e+3 / 60; % Jdiff in mM/min
Glucose.Jnet = Glucose.Jnet * 1e+3 / 60;   % Jnet in mM/min
G6P_Gluconate.NH4ext = G6P_Gluconate.NH4ext * 1e-3;     % NH4ext in mM
G6P_Gluconate.Jamtb = G6P_Gluconate.Jamtb * 1e+3 / 60; % Jamtb in mM/min
G6P_Gluconate.Jdiff = G6P_Gluconate.Jdiff * 1e+3 / 60; % Jdiff in mM/min
G6P_Gluconate.Jnet = G6P_Gluconate.Jnet * 1e+3 / 60; % Jnet in mM/min

%% Data Correction
% factor = Corrected vamtb (VdivA = 2.15e-18/9.18e-12, pKa = 8.95) / Original vamtb (VdivA = x, pKa = 9.25)
% Glycerol: factor = 216.3/140.7, x = 1.8e-7
% Glucose: factor = 337.2/198.2, x = 2.0e-7
% G6P_Gluconate: factor = 566.4/287.4, x = 2.3e-7

Glycerol.Jamtb = Glycerol.Jamtb * 216.3/140.7;
Glycerol.Jdiff = Glycerol.Jnet - Glycerol.Jamtb;
Glucose.Jamtb = Glucose.Jamtb * 337.2/198.2;
Glucose.Jdiff = Glucose.Jnet - Glucose.Jamtb;
G6P_Gluconate.Jamtb = G6P_Gluconate.Jamtb * 566.4/287.4;
G6P_Gluconate.Jdiff = G6P_Gluconate.Jnet - G6P_Gluconate.Jamtb;
