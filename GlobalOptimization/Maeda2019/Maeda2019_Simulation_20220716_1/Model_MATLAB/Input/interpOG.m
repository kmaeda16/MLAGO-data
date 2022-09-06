function OG = interpOG(time, strain_no, kappa, Nintstar, OGbasal, NH4int)

switch strain_no
    
    % Yuan, 13-fold upshift--wildtype
    case 1
        % msb200960-s4.xls training set (fig 4) of Yuan et al., Mol Syst Biol, 2009
        T( 1) =  0;   OGdata( 1) = 11.6;
        T( 2) =  0.1; OGdata( 2) =  6.1;
        T( 3) =  0.2; OGdata( 3) =  4.9;
        T( 4) =  0.3; OGdata( 4) =  4.1;
        T( 5) =  0.5; OGdata( 5) =  3.5;
        T( 6) =  1;   OGdata( 6) =  1.7;
        T( 7) =  2;   OGdata( 7) =  1.2;
        T( 8) =  4;   OGdata( 8) =  0.6;
        T( 9) =  8;   OGdata( 9) =  0.7;
        T(10) = 15;   OGdata(10) =  0.6;
        T(11) = 30;   OGdata(11) =  0.7;
        
        if time < T(1)
            OG = OGdata(1);
        elseif time > T(end)
            OG = OGdata(end);
        else
            OG = interp1(T,OGdata,time);
        end
        
    % Yuan, 13-fold upshift--deltaGDH
    case 2
        % msb200960-s4.xls training set (fig 4) of Yuan et al., Mol Syst Biol, 2009
        T( 1) =  0;   OGdata( 1) = 9.6;
        T( 2) =  0.1; OGdata( 2) = 4.4;
        T( 3) =  0.2; OGdata( 3) = 4.7;
        T( 4) =  0.3; OGdata( 4) = 3.5;
        T( 5) =  0.5; OGdata( 5) = 1.9;
        T( 6) =  1;   OGdata( 6) = 2.0;
        T( 7) =  2;   OGdata( 7) = 1.2;
        T( 8) =  4;   OGdata( 8) = 0.8;
        T( 9) =  8;   OGdata( 9) = 0.7;
        T(10) = 15;   OGdata(10) = 0.9;
        T(11) = 30;   OGdata(11) = 0.7;
        
        if time < T(1)
            OG = OGdata(1);
        elseif time > T(end)
            OG = OGdata(end);
        else
            OG = interp1(T,OGdata,time);
        end
        
    % Yuan, 13-fold upshift--deltaGOGAT
    case 3
        % msb200960-s4.xls training set (fig 4) of Yuan et al., Mol Syst Biol, 2009
        T( 1) =  0;   OGdata( 1) = 15.5;
        T( 2) =  0.1; OGdata( 2) = 11.0;
        T( 3) =  0.2; OGdata( 3) =  6.5;
        T( 4) =  0.3; OGdata( 4) =  4.6;
        T( 5) =  0.5; OGdata( 5) =  3.9;
        T( 6) =  1;   OGdata( 6) =  1.9;
        T( 7) =  2;   OGdata( 7) =  1.3;
        T( 8) =  4;   OGdata( 8) =  0.9;
        T( 9) =  8;   OGdata( 9) =  0.8;
        T(10) = 15;   OGdata(10) =  0.8;
        T(11) = 30;   OGdata(11) =  0.9;
        
        if time < T(1)
            OG = OGdata(1);
        elseif time > T(end)
            OG = OGdata(end);
        else
            OG = interp1(T,OGdata,time);
        end
        
    % Kim
    case {4, 5, 6, 7, 8, 9, 10, 11, 19}
        % Eq. S29 of Kim et al., Mol Syst Biol, 2012
        if NH4int < Nintstar
            OG = kappa * ( 1 - NH4int / Nintstar ) + OGbasal;
        else
            OG = OGbasal;
        end
        
   % Radchenko, WT
    case 12
        % Figure 2A of Radchenko et al., J Biol Chem, 2010
        T( 1) =  0;   OGdata( 1) = 1.40;
        T( 2) =  0.5; OGdata( 2) = 0.50;
        T( 3) =  2;   OGdata( 3) = 0.30;
        T( 4) =  3;   OGdata( 4) = 0.45;
        T( 5) =  5;   OGdata( 5) = 1.05;
        T( 6) = 10;   OGdata( 6) = 1.00;
        T( 7) = 15;   OGdata( 7) = 1.50;
        
        if time < T(1)
            OG = OGdata(1);
        elseif time > T(end)
            OG = OGdata(end);
        else
%             OG = interp1(T,OGdata,time);
            OG = interp1(T,OGdata,time,'pchip');
        end
        
    % 3-fold upshift--wildtype
    case 13
        % msb200960-s4.xls add. perturbations (fig 7) of Yuan et al., Mol Syst Biol, 2009
        T( 1) =  0;   OGdata( 1) = 11.6;
        T( 2) =  0.1; OGdata( 2) =  7.0;
        T( 3) =  0.2; OGdata( 3) =  6.7;
        T( 4) =  0.5; OGdata( 4) =  2.8;
        T( 5) =  1;   OGdata( 5) =  2.0;
        T( 6) =  2;   OGdata( 6) =  1.4;
        T( 7) =  4;   OGdata( 7) =  1.0;
        T( 8) =  8;   OGdata( 8) =  0.9;
        T( 9) = 15;   OGdata( 9) =  1.3;
        T(10) = 30;   OGdata(10) =  1.7;
        
        if time < T(1)
            OG = OGdata(1);
        elseif time > T(end)
            OG = OGdata(end);
        else
            OG = interp1(T,OGdata,time);
        end
        
    % 3-fold upshift--deltaGOGAT
    case 14
        % msb200960-s4.xls add. perturbations (fig 7) of Yuan et al., Mol Syst Biol, 2009
        T( 1) =  0;   OGdata( 1) = 15.5;
        T( 2) =  0.1; OGdata( 2) = 14.0;
        T( 3) =  0.2; OGdata( 3) = 13.3;
        T( 4) =  0.5; OGdata( 4) =  9.9;
        T( 5) =  1;   OGdata( 5) =  5.2;
        T( 6) =  2;   OGdata( 6) =  3.4;
        T( 7) =  4;   OGdata( 7) =  2.6;
        T( 8) =  8;   OGdata( 8) =  2.6;
        T( 9) = 15;   OGdata( 9) =  3.0;
        T(10) = 30;   OGdata(10) =  8.0;
        
        if time < T(1)
            OG = OGdata(1);
        elseif time > T(end)
            OG = OGdata(end);
        else
            OG = interp1(T,OGdata,time);
        end

    % down-shift--wildtype
    case 15
        % msb200960-s4.xls add. perturbations (fig 7) of Yuan et al., Mol Syst Biol, 2009
        T( 1) =  0;   OGdata( 1) = 11.6;
        T( 2) =  0.1; OGdata( 2) = 13.4;
        T( 3) =  0.2; OGdata( 3) =  8.8;
        T( 4) =  0.5; OGdata( 4) = 12.6;
        T( 5) =  1;   OGdata( 5) = 12.9;
        T( 6) =  2;   OGdata( 6) = 18.5;
        T( 7) =  4;   OGdata( 7) = 22.0;
        T( 8) =  8;   OGdata( 8) = 26.3;
        T( 9) = 15;   OGdata( 9) = 29.8;
        T(10) = 30;   OGdata(10) = 32.7;
        
        if time < T(1)
            OG = OGdata(1);
        elseif time > T(end)
            OG = OGdata(end);
        else
            OG = interp1(T,OGdata,time);
        end
        
    % down-shift-deltaGOGAT
    case 16
        % msb200960-s4.xls add. perturbations (fig 7) of Yuan et al., Mol Syst Biol, 2009
        T( 1) =  0;   OGdata( 1) = 15.5;
        T( 2) =  0.1; OGdata( 2) = 12.4;
        T( 3) =  0.2; OGdata( 3) = 13.7;
        T( 4) =  0.5; OGdata( 4) = 15.9;
        T( 5) =  1;   OGdata( 5) = 16.2;
        T( 6) =  2;   OGdata( 6) = 22.5;
        T( 7) =  4;   OGdata( 7) = 30.2;
        T( 8) =  8;   OGdata( 8) = 33.7;
        T( 9) = 15;   OGdata( 9) = 37.4;
        T(10) = 30;   OGdata(10) = 40.0;
        
        if time < T(1)
            OG = OGdata(1);
        elseif time > T(end)
            OG = OGdata(end);
        else
            OG = interp1(T,OGdata,time);
        end

    % 13-fold upshift--deltaAT/AR
    case 17
        % msb200960-s4.xls add. perturbations (fig 7) of Yuan et al., Mol Syst Biol, 2009
        T( 1) =  0;   OGdata( 1) = 13.2;
        T( 2) =  0.1; OGdata( 2) =  7.8;
        T( 3) =  0.2; OGdata( 3) =  5.3;
        T( 4) =  0.3; OGdata( 4) =  4.1;
        T( 5) =  0.5; OGdata( 5) =  2.7;
        T( 6) =  1;   OGdata( 6) =  2.3;
        T( 7) =  2;   OGdata( 7) =  1.1;
        T( 8) =  4;   OGdata( 8) =  0.7;
        T( 9) =  8;   OGdata( 9) =  0.5;
        T(10) = 15;   OGdata(10) =  0.2;
        T(11) = 30;   OGdata(11) =  0.2;
        
        if time < T(1)
            OG = OGdata(1);
        elseif time > T(end)
            OG = OGdata(end);
        else
            OG = interp1(T,OGdata,time);
        end
        
    % 13-fold upshift--deltaAmtB
    case 18
        % Supplementary Figure 5 of Yuan et al., Mol Syst Biol, 2009
        T( 1) =  0;   OGdata( 1) = 8.4;
        T( 2) =  0.1; OGdata( 2) = 9.0;
        T( 3) =  0.2; OGdata( 3) = 2.2;
        T( 4) =  0.3; OGdata( 4) = 2.8;
        T( 5) =  0.5; OGdata( 5) = 2.0;
        T( 6) =  1;   OGdata( 6) = 1.7;
        T( 7) =  2;   OGdata( 7) = 0.4;
        T( 8) =  4;   OGdata( 8) = 0.64;
        T( 9) =  8;   OGdata( 9) = 0.48;
 
        if time < T(1)
            OG = OGdata(1);
        elseif time > T(end)
            OG = OGdata(end);
        else
            OG = interp1(T,OGdata,time);
        end
        
     % Radchenko, GlnKY51A
    case 20
        % No experimental data
        T( 1) =  0;   OGdata( 1) =  9.00;
        T( 2) =  1;   OGdata( 2) =  0.50;
        T( 3) =  2;   OGdata( 3) =  2.00;
        T( 4) =  3;   OGdata( 4) =  4.00;
        T( 5) =  5;   OGdata( 5) =  6.00;
        T( 6) = 10;   OGdata( 6) =  8.00;
        T( 7) = 15;   OGdata( 7) =  9.00;
        
        if time < T(1)
            OG = OGdata(1);
        elseif time > T(end)
            OG = OGdata(end);
        else
%             OG = interp1(T,OGdata,time);
            OG = interp1(T,OGdata,time,'pchip');
        end
        
    otherwise
        warning('Unexpected Strain Number!');
        OG = -1e+10;
        
end
