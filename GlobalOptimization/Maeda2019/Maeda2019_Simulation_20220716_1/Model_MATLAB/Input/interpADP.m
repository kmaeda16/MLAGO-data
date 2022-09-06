function ADP = interpADP(time, strain_no)

switch strain_no
    
    % Yuan and Kim
    case {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 13, 14, 15, 16, 17, 18, 19}
        ADP = 0.56; % Table 1 of Bennett et al., Nat Chem Biol, 2009
        
    % Radchenko, WT and GlnKY51A
    case {12 20}
        % Figure 3A of Radchenko et al., J Biol Chem, 2010
        T( 1) =  0;   ADPdata( 1) = 0.3;
        T( 2) =  0.5; ADPdata( 2) = 0.6;
        T( 3) =  1;   ADPdata( 3) = 0.6;
        T( 4) =  2;   ADPdata( 4) = 0.4;
        T( 5) =  3;   ADPdata( 5) = 0.3;
        T( 6) =  5;   ADPdata( 6) = 0.4;
        T( 7) = 10;   ADPdata( 7) = 0.5;
        T( 8) = 15;   ADPdata( 8) = 0.5;
        
        if time < T(1)
            ADP = ADPdata(1);
        elseif time > T(end)
            ADP = ADPdata(end);
        else
            ADP = interp1(T,ADPdata,time);
        end
        
    otherwise
        warning('Unexpected Strain Number!');
        ADP = -1e+10;
        
end
