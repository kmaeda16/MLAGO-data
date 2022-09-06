function [T, GlnK, GlnKUMP, GlnKUMP2, GlnKUMP3, GlnKAmtB] = ...
    ExpDataOfRadchenko2014(GlnKY51A)

% Figure 3AB of Radchenko et al., Front Microbiol, 2014

% WT
if GlnKY51A == 0
    T(1,1) =  0.00; GlnK(1,1) = 0.00; GlnKUMP(1,1) = 0.00; GlnKUMP2(1,1) = 0.05; GlnKUMP3(1,1) = 0.95; GlnKAmtB(1,1) = 0.10;
    T(2,1) =  0.50; GlnK(2,1) = 0.09; GlnKUMP(2,1) = 0.27; GlnKUMP2(2,1) = 0.30; GlnKUMP3(2,1) = 0.34; GlnKAmtB(2,1) = 0.46;
    T(3,1) =  1.00; GlnK(3,1) = 0.26; GlnKUMP(3,1) = 0.39; GlnKUMP2(3,1) = 0.16; GlnKUMP3(3,1) = 0.19; GlnKAmtB(3,1) = 0.67;
    T(4,1) =  2.00; GlnK(4,1) = 0.54; GlnKUMP(4,1) = 0.19; GlnKUMP2(4,1) = 0.15; GlnKUMP3(4,1) = 0.12; GlnKAmtB(4,1) = 1.00;
    T(5,1) =  3.00; GlnK(5,1) = 0.39; GlnKUMP(5,1) = 0.23; GlnKUMP2(5,1) = 0.20; GlnKUMP3(5,1) = 0.18; GlnKAmtB(5,1) = 0.70;
    T(6,1) =  5.00; GlnK(6,1) = 0.12; GlnKUMP(6,1) = 0.42; GlnKUMP2(6,1) = 0.27; GlnKUMP3(6,1) = 0.19; GlnKAmtB(6,1) = 0.46;
    T(7,1) = 10.00; GlnK(7,1) = 0.15; GlnKUMP(7,1) = 0.22; GlnKUMP2(7,1) = 0.26; GlnKUMP3(7,1) = 0.37; GlnKAmtB(7,1) = 0.32;
    T(8,1) = 15.00; GlnK(8,1) = 0.14; GlnKUMP(8,1) = 0.15; GlnKUMP2(8,1) = 0.15; GlnKUMP3(8,1) = 0.55; GlnKAmtB(8,1) = 0.09;
end

% GlnKY51A
if GlnKY51A == 1
    T(1,1) =  0.00; GlnK(1,1) = 1.00; GlnKUMP(1,1) = 0.00; GlnKUMP2(1,1) = 0.00; GlnKUMP3(1,1) = 0.00; GlnKAmtB(1,1) = 0.07;
    T(2,1) =  0.50; GlnK(2,1) = 1.00; GlnKUMP(2,1) = 0.00; GlnKUMP2(2,1) = 0.00; GlnKUMP3(2,1) = 0.00; GlnKAmtB(2,1) = 0.57;
    T(3,1) =  1.00; GlnK(3,1) = 1.00; GlnKUMP(3,1) = 0.00; GlnKUMP2(3,1) = 0.00; GlnKUMP3(3,1) = 0.00; GlnKAmtB(3,1) = 1.00;
    T(4,1) =  2.00; GlnK(4,1) = 1.00; GlnKUMP(4,1) = 0.00; GlnKUMP2(4,1) = 0.00; GlnKUMP3(4,1) = 0.00; GlnKAmtB(4,1) = 0.53;
    T(5,1) =  3.00; GlnK(5,1) = 1.00; GlnKUMP(5,1) = 0.00; GlnKUMP2(5,1) = 0.00; GlnKUMP3(5,1) = 0.00; GlnKAmtB(5,1) = 0.38;
    T(6,1) =  5.00; GlnK(6,1) = 1.00; GlnKUMP(6,1) = 0.00; GlnKUMP2(6,1) = 0.00; GlnKUMP3(6,1) = 0.00; GlnKAmtB(6,1) = 0.23;
    T(7,1) = 10.00; GlnK(7,1) = 1.00; GlnKUMP(7,1) = 0.00; GlnKUMP2(7,1) = 0.00; GlnKUMP3(7,1) = 0.00; GlnKAmtB(7,1) = 0.08;
    T(8,1) = 15.00; GlnK(8,1) = 1.00; GlnKUMP(8,1) = 0.00; GlnKUMP2(8,1) = 0.00; GlnKUMP3(8,1) = 0.00; GlnKAmtB(8,1) = 0.04;
end
