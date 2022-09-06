function ATP = interpATP(time, strain_no)

switch strain_no
    
    % Yuan and Kim
    case {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 13, 14, 15, 16, 17, 18, 19}
        ATP = 9.6; % Table 1 of Bennett et al., Nat Chem Biol, 2009
        
    % Radchenko, WT and GlnKY51A
    case {12 20}
        % Figure 3A of Radchenko et al., J Biol Chem, 2010
        T( 1) =  0;   ATPdata( 1) = 2.0;
        T( 2) =  0.5; ATPdata( 2) = 1.8;
        T( 3) =  1;   ATPdata( 3) = 1.9;
        T( 4) =  2;   ATPdata( 4) = 2.1;
        T( 5) =  3;   ATPdata( 5) = 2.4;
        T( 6) =  5;   ATPdata( 6) = 3.0;
        T( 7) = 10;   ATPdata( 7) = 3.8;
        T( 8) = 15;   ATPdata( 8) = 4.1;
        
        if time < T(1)
            ATP = ATPdata(1);
        elseif time > T(end)
            ATP = ATPdata(end);
        else
            ATP = interp1(T,ATPdata,time);
        end
        
    otherwise
        warning('Unexpected Strain Number!');
        ATP = -1e+10;
        
end
