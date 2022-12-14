function param = setReferenceParamSet()

param = zeros(112,1);

%********** MODEL PARAMETERS
param(1) = 1; % strain_no
param(2) = 0.0006; % UTase % http://identifiers.org/ec-code/2.7.7.59
param(3) = 1.5e-3; % AmtB % http://identifiers.org/interpro/IPR001905
param(4) = 8.3; % UTP % http://identifiers.org/kegg.compound/C00075
param(5) = 0.01; % UMP % http://identifiers.org/kegg.compound/C00105
param(6) = 0.05; % PPi % http://identifiers.org/kegg.compound/C00013
param(7) = 10; % Pi % http://identifiers.org/kegg.compound/C00009
param(8) = 0.12; % NADPH % http://identifiers.org/kegg.compound/C00005
param(9) = 0.076; % NADP % http://identifiers.org/kegg.compound/C00006
param(10) = 137; % kcatutglnb
param(11) = 0.07; % Kutgln
param(12) = 0.0018; % Kutiglnb
param(13) = 0.003; % Kutglnb
param(14) = 0.0035; % Kutiglnbump
param(15) = 0.04; % Kututp
param(16) = 0.1135; % Kutippi
param(17) = 5.5; % kcaturglnb
param(18) = 0.0023; % Kurglnbump
param(19) = 8.4; % Kurump
param(20) = 0.07; % Kurgln
param(21) = 137; % kcatutglnk
param(22) = 0.0018; % Kutiglnk
param(23) = 0.003; % Kutglnk
param(24) = 0.0035; % Kutiglnkump
param(25) = 5.5; % kcaturglnk
param(26) = 0.0023; % Kurglnkump
param(27) = 0.005; % Kglnbog1
param(28) = 0.15; % Kglnbog2
param(29) = 0.15; % Kglnbog3
param(30) = 0.025; % Kglnbumpog1
param(31) = 0.15; % Kglnbumpog2
param(32) = 0.15; % Kglnbumpog3
param(33) = 5; % Kglnkog1
param(34) = 5; % Kglnkog2
param(35) = 5; % Kglnkog3
param(36) = 5e-6; % Kglnkamtb
param(37) = 0.5; % Vad % ATase: http://identifiers.org/ec-code/2.7.7.42
param(38) = 0.001703; % Kadgs
param(39) = 1.052e-005; % Kadglnbog
param(40) = 0.9714; % Kadgln
param(41) = 1e-022; % a1
param(42) = 0.5166; % b1
param(43) = 0.5974; % c1
param(44) = 0.0387; % d1
param(45) = 0.5; % Vdead % ATase: http://identifiers.org/ec-code/2.7.7.42
param(46) = 0.0002015; % Kdeadgsamp
param(47) = 2.274e-006; % Kdeadglnbog
param(48) = 0.04444; % Kdeadgln
param(49) = 1.805e-005; % Kdeadglnbump
param(50) = 1e-022; % e1
param(51) = 2.766; % f1
param(52) = 3.323; % g1
param(53) = 0.2148; % h1
param(54) = 1e-022; % i1
param(55) = 1e-022; % j1
param(56) = 1e-022; % k1
param(57) = 0.02316; % l1
param(58) = 0.8821; % m1
param(59) = 8.491; % n1
param(60) = 0.8791; % o1
param(61) = 360; % Vgdh % GDH: http://identifiers.org/ec-code/1.4.1.4
param(62) = 0.32; % Kgdhog
param(63) = 1.1; % Kgdhnh
param(64) = 10; % Kgdhglu
param(65) = 0.04; % Kgdhnadph
param(66) = 0.042; % Kgdhnadp
param(67) = 1290; % Kgdheq
param(68) = 72; % Vgog % GOGAT: http://identifiers.org/ec-code/1.4.1.13
param(69) = 0.175; % Kgoggln
param(70) = 0.007; % Kgogog
param(71) = 0.0015; % Kgognadph
param(72) = 11; % Kgogglu
param(73) = 0.0037; % Kgognadp
param(74) = 38571; % kcatgs
param(75) = 0.35; % Kgsatp
param(76) = 4.1; % Kgsglu
param(77) = 0.1; % Kgsnh
param(78) = 0.0585; % Kgsadp
param(79) = 3.7; % Kgspi
param(80) = 5.65; % Kgsgln
param(81) = 460; % Kgseq
param(82) = 10; % aamp
param(83) = 2.3667; % bamp
param(84) = 0.1012; % camp
param(85) = 10.8688; % damp
param(86) = 1.1456; % n1amp
param(87) = 19.2166; % n2amp
param(88) = 4.86e+05; % kcatamtb
param(89) = 5e-3; % Kamtbnh
param(90) = 90; % tau0
param(91) = 49.5; % Kgrowthglu
param(92) = 1.77; % Kgrowthgln
param(93) = 2132; % GLUdemn
param(94) = 318; % GLUdemf
param(95) = 542; % GLNdemn
param(96) = 75; % GLNdemf
param(97) = -0.150; % Dpsi
param(98) = 8.314; % R
param(99) = 310; % T
param(100) = 96485; % F
param(101) = 7.7e-02; % Pcm
param(102) = 2.15e-18; % Vcell
param(103) = 9.18e-12; % Acell
param(104) = 8.95; % pKa
param(105) = 7.0; % pHext
param(106) = 7.6; % pHint
param(107) = 12.7; % kdb
param(108) = 10.9; % kappa
param(109) = 0.033; % Nintstar
param(110) = 0.7; % OGbasal
param(111) = 6.7e-16; % Vmedium
param(112) = 1e-4; % NHxext_Radchenko_before_upshift
