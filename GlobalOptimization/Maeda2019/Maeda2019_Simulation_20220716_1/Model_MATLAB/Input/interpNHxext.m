function NHxext = interpNHxext(time, strain_no, NHxext_Radchenko_before_upshift, NHxext_Radchenko_after_upshift, pHext, pKa)

global NH4ext_global;

Hext = RPowerR(10,-pHext) * 1e+3;
Ka   = RPowerR(10,  -pKa) * 1e+3;

switch strain_no
    
    % Yuan, 13-fold upshift--wildtype
    case 1
        if time < 0
            NHxext = 0.75; % Figure 2B 3h WT of Yuan et al., Mol Syst Biol, 2009
        else
            NHxext = 10; % p.3 of Yuan et al., Mol Syst Biol, 2009
        end
        
    % Yuan, 13-fold upshift--deltaGDH
    case 2
        if time < 0
            NHxext = 0.75; % Assumed to be equal to Figure 2B 3h WT of Yuan et al., Mol Syst Biol, 2009
        else
            NHxext = 10; % p.3 of Yuan et al., Mol Syst Biol, 2009
        end
        
    % Yuan, 13-fold upshift--deltaGOGAT
    case 3
        if time < 0
            NHxext = 1.0; % Figure 2B 3h deltaGOGAT of Yuan et al., Mol Syst Biol, 2009
        else
            NHxext = 10; % p.3 of Yuan et al., Mol Syst Biol, 2009
        end
        
    % Kim, WT, NH4ext = 1 mM
    case 4
        NH4ext = 1.0; % Figure 3 solid triangles of Kim et al., Mol Syst Biol, 2012
        NHxext = NH4ext * ( Ka + Hext ) / Hext;
        
    % Kim, WT, NH4ext = 0.07 mM
    case 5
        NH4ext = 0.07; % Figure 3 solid triangles of Kim et al., Mol Syst Biol, 2012
        NHxext = NH4ext * ( Ka + Hext ) / Hext;
        
    % Kim, WT, NH4ext = 0.06 mM
    case 6
        NH4ext = 0.06; % Figure 3 solid triangles of Kim et al., Mol Syst Biol, 2012
        NHxext = NH4ext * ( Ka + Hext ) / Hext;
        
    % Kim, WT, NH4ext = 0.05 mM
    case 7
        NH4ext = 0.05; % Figure 3 solid triangles of Kim et al., Mol Syst Biol, 2012
        NHxext = NH4ext * ( Ka + Hext ) / Hext;
        
    % Kim, WT, NH4ext = 0.02 mM
    case 8
        NH4ext = 0.02; % Figure 3 solid triangles of Kim et al., Mol Syst Biol, 2012
        NHxext = NH4ext * ( Ka + Hext ) / Hext;
        
    % Kim, WT, NH4ext = 0.004 mM
    case 9
        NH4ext = 0.004; % Figure 3 solid triangles of Kim et al., Mol Syst Biol, 2012
        NHxext = NH4ext * ( Ka + Hext ) / Hext;
        
    % Kim, deltaAmtB, NH4ext = 0.04 mM
    case 10
        NH4ext = 0.04; % Figure 3 open triangles of Kim et al., Mol Syst Biol, 2012
        NHxext = NH4ext * ( Ka + Hext ) / Hext;
        
    % Kim, deltaAmtB, NH4ext = 0.006 mM
    case 11
        NH4ext = 0.006; % Figure 3 open triangles of Kim et al., Mol Syst Biol, 2012
        NHxext = NH4ext * ( Ka + Hext ) / Hext;
        
    % Radchenko, WT and GlnKY51A
    case {12 20}
        if time < 0
            NHxext = NHxext_Radchenko_before_upshift;
        else
            NHxext = NHxext_Radchenko_after_upshift;
        end
        
    % 3-fold upshift--wildtype
    case 13
        if time < 0
            NHxext = 0.75; % Assumed to be equal to Figure 2B 3h WT of Yuan et al., Mol Syst Biol, 2009
        else
            NHxext = 2; % p.14 of Yuan et al., Mol Syst Biol, 2009
        end

    % 3-fold upshift--deltaGOGAT
    case 14
        if time < 0
            NHxext = 1.0; % Assumed to be equal to Figure 2B 3h deltaGOGAT of Yuan et al., Mol Syst Biol, 2009
        else
            NHxext = 2; % p.14 of Yuan et al., Mol Syst Biol, 2009
        end
        
    % down-shift--wildtype
    case 15
        if time < 0
            NHxext = 0.75; % Assumed to be equal to Figure 2B 3h WT of Yuan et al., Mol Syst Biol, 2009
        else
            NHxext = 0.05; % Supplementary Fig 6 of Yuan et al., Mol Syst Biol, 2009
        end
        
    % down-shift-deltaGOGAT
    case 16
        if time < 0
            NHxext = 1.0; % Assumed to be equal to Figure 2B 3h deltaGOGAT of Yuan et al., Mol Syst Biol, 2009
        else
            NHxext = 0.05; % Supplementary Fig 6 of Yuan et al., Mol Syst Biol, 2009
        end
        
    % 13-fold upshift--deltaAT/AR
    case 17
        if time < 0
            NHxext = 0.75; % Assumed to be equal to Figure 2B 3h WT of Yuan et al., Mol Syst Biol, 2009
        else
            NHxext = 10; % p.3 of Yuan et al., Mol Syst Biol, 2009
        end
        
    % 13-fold upshift--deltaAmtB
    case 18
        if time < 0
            NHxext = 0.75; % Assumed to be equal to Figure 2B 3h WT of Yuan et al., Mol Syst Biol, 2009
        else
            NHxext = 10; % p.3 of Yuan et al., Mol Syst Biol, 2009
        end
        
    % Kim NH4ext Variation
    case 19
        NH4ext = NH4ext_global;
        NHxext = NH4ext * ( Ka + Hext ) / Hext;
        
    otherwise
        warning('Unexpected Strain Number!');
        NHxext = -1e+10;
        
end
