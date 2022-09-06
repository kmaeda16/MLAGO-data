function [ GlnK, GS, AmtB ] = getNH4extDependents(NH4ext,NH4ext_star,GlnK_star,GS_star,AmtB_star,deltaAmtB,CarbonSource)

% NH4ext_star = 0.004;
% AmtB_star = 1.5e-3;
% GlnK_star = 6e-3;
% GS_star   = 0.014;

Pstd_AmtB_star = 6.300000e+00; H_AmtB_star = 1.887396e+00; K_AmtB_star = 5.835946e+01*1e-3; f_AmtB_star = 2.816878e+01;
Pstd_GS_star   = 2.350000e+01; H_GS_star   = 5.019218e-01; K_GS_star   = 4.160026e+02*1e-3; f_GS_star   = 2.611712e+00;


switch deltaAmtB
    
    case 0 % WT
        
        switch CarbonSource
            case 'Glycerol'
                P_AmtB_std = 1.300000e+00; H_AmtB = 2.839180e+00; K_AmtB = 3.174068e+01*1e-3; f_AmtB = 1.027642e+02;
                P_GS_std   = 1.380000e+01; H_GS   = 1.150890e+00; K_GS   = 6.175712e+01*1e-3; f_GS   = 6.078519e+00;
                
            case 'Glucose'
                P_AmtB_std = 6.300000e+00; H_AmtB = 1.887396e+00; K_AmtB = 5.835946e+01*1e-3; f_AmtB = 2.816878e+01;
                P_GS_std   = 2.350000e+01; H_GS   = 5.019223e-01; K_GS   = 4.160039e+02*1e-3; f_GS   = 2.611711e+00;
                
            case 'G6P_Gluconate'
                P_AmtB_std = 1.160000e+01; H_AmtB = 1.620902e+00; K_AmtB = 7.921964e+01*1e-3; f_AmtB = 2.280229e+01;
                P_GS_std   = 2.890000e+01; H_GS   = 3.733831e-01; K_GS   = 4.886744e+00*1e-3; f_GS   = 2.921959e+00;
                
            otherwise
                error('Unexpected CarbonSource!');
        end
        
    case 1 % deltaAmtB
        
        switch CarbonSource
            case 'Glycerol'
                P_AmtB_std = 7.000000e-01; H_AmtB = 4.228398e+00; K_AmtB = 2.138609e+01*1e-3; f_AmtB = 7.093500e+02;
                P_GS_std   = 1.320000e+01; H_GS   = 1.199997e+00; K_GS   = 6.258563e+01*1e-3; f_GS   = 6.715296e+00;
                
            case 'Glucose'
                P_AmtB_std = 5.000000e+00; H_AmtB = 4.137371e+00; K_AmtB = 3.374577e+01*1e-3; f_AmtB = 1.035738e+02;
                P_GS_std   = 2.700000e+01; H_GS   = 4.702911e-01; K_GS   = 2.467638e+01*1e-3; f_GS   = 2.540359e+00;
                
            case 'G6P_Gluconate'
                P_AmtB_std = 1.030000e+01; H_AmtB = 1.582616e+00; K_AmtB = 3.429615e+01*1e-3; f_AmtB = 9.237547e+01;
                P_GS_std   = 2.710000e+01; H_GS   = 3.501279e-01; K_GS   = 5.461399e-01*1e-3; f_GS   = 5.364947e+00;
                
            otherwise
                error('Unexpected CarbonSource!');
        end
        
    otherwise
        error('Unexpected deltaAmtB!');
        
end
      
%%

AmtB = AmtB_star * Pfun(P_AmtB_std,H_AmtB,K_AmtB,f_AmtB,NH4ext) / Pfun(Pstd_AmtB_star,H_AmtB_star,K_AmtB_star,f_AmtB_star,NH4ext_star);
GlnK = GlnK_star * Pfun(P_AmtB_std,H_AmtB,K_AmtB,f_AmtB,NH4ext) / Pfun(Pstd_AmtB_star,H_AmtB_star,K_AmtB_star,f_AmtB_star,NH4ext_star);
GS = GS_star * Pfun(P_GS_std,H_GS,K_GS,f_GS,NH4ext) / Pfun(Pstd_GS_star,H_GS_star,K_GS_star,f_GS_star,NH4ext_star);

if deltaAmtB == 1
    AmtB = 0;
    GlnK = 0;
end
