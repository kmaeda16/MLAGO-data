function Flux = Model_Flux(t,y,param)

GlnB     = y(1);
GlnBUMP  = y(2);
GlnBUMP2 = y(3);
GlnBUMP3 = y(4);
GlnK     = y(5);
GlnKUMP  = y(6);
GlnKUMP2 = y(7);
GlnKUMP3 = y(8);
GS       = y(9);
GSAMP    = y(10);
GLU      = y(11);
GLN      = y(12);
NHxint   = y(13);
NHxext_Radchenko_after_upshift = y(14);

%********** MODEL PARAMETERS
strain_no = param(1);
UTase = param(2); % http://identifiers.org/ec-code/2.7.7.59
AmtB = param(3); % http://identifiers.org/interpro/IPR001905
UTP = param(4); % http://identifiers.org/kegg.compound/C00075
UMP = param(5); % http://identifiers.org/kegg.compound/C00105
PPi = param(6); % http://identifiers.org/kegg.compound/C00013
Pi = param(7); % http://identifiers.org/kegg.compound/C00009
NADPH = param(8); % http://identifiers.org/kegg.compound/C00005
NADP = param(9); % http://identifiers.org/kegg.compound/C00006
kcatutglnb = param(10);
Kutgln = param(11);
Kutiglnb = param(12);
Kutglnb = param(13);
Kutiglnbump = param(14);
Kututp = param(15);
Kutippi = param(16);
kcaturglnb = param(17);
Kurglnbump = param(18);
Kurump = param(19);
Kurgln = param(20);
kcatutglnk = param(21);
Kutiglnk = param(22);
Kutglnk = param(23);
Kutiglnkump = param(24);
kcaturglnk = param(25);
Kurglnkump = param(26);
Kglnbog1 = param(27);
Kglnbog2 = param(28);
Kglnbog3 = param(29);
Kglnbumpog1 = param(30);
Kglnbumpog2 = param(31);
Kglnbumpog3 = param(32);
Kglnkog1 = param(33);
Kglnkog2 = param(34);
Kglnkog3 = param(35);
Kglnkamtb = param(36);
Vad = param(37); % ATase: http://identifiers.org/ec-code/2.7.7.42
Kadgs = param(38);
Kadglnbog = param(39);
Kadgln = param(40);
a1 = param(41);
b1 = param(42);
c1 = param(43);
d1 = param(44);
Vdead = param(45); % ATase: http://identifiers.org/ec-code/2.7.7.42
Kdeadgsamp = param(46);
Kdeadglnbog = param(47);
Kdeadgln = param(48);
Kdeadglnbump = param(49);
e1 = param(50);
f1 = param(51);
g1 = param(52);
h1 = param(53);
i1 = param(54);
j1 = param(55);
k1 = param(56);
l1 = param(57);
m1 = param(58);
n1 = param(59);
o1 = param(60);
Vgdh = param(61); % GDH: http://identifiers.org/ec-code/1.4.1.4
Kgdhog = param(62);
Kgdhnh = param(63);
Kgdhglu = param(64);
Kgdhnadph = param(65);
Kgdhnadp = param(66);
Kgdheq = param(67);
Vgog = param(68); % GOGAT: http://identifiers.org/ec-code/1.4.1.13
Kgoggln = param(69);
Kgogog = param(70);
Kgognadph = param(71);
Kgogglu = param(72);
Kgognadp = param(73);
kcatgs = param(74);
Kgsatp = param(75);
Kgsglu = param(76);
Kgsnh = param(77);
Kgsadp = param(78);
Kgspi = param(79);
Kgsgln = param(80);
Kgseq = param(81);
aamp = param(82);
bamp = param(83);
camp = param(84);
damp = param(85);
n1amp = param(86);
n2amp = param(87);
kcatamtb = param(88);
Kamtbnh = param(89);
tau0 = param(90);
Kgrowthglu = param(91);
Kgrowthgln = param(92);
GLUdemn = param(93);
GLUdemf = param(94);
GLNdemn = param(95);
GLNdemf = param(96);
Dpsi = param(97);
R    = param(98);
T    = param(99);
F    = param(100);
Pcm = param(101);
Vcell = param(102);
Acell = param(103);
pKa = param(104);
pHext = param(105);
pHint = param(106);
kdb = param(107);
kappa = param(108);
Nintstar = param(109);
OGbasal = param(110);
Vmedium = param(111);
NHxext_Radchenko_before_upshift = param(112);


%********** MODEL VARIABLES
NHxext = interpNHxext(t,strain_no,NHxext_Radchenko_before_upshift,NHxext_Radchenko_after_upshift,pHext,pKa); % Model Input % http://identifiers.org/kegg.compound/C01342, http://identifiers.org/kegg.compound/C00014
ATP = interpATP(t,strain_no); % Model Input % http://identifiers.org/kegg.compound/C00002
ADP = interpADP(t,strain_no); % Model Input % http://identifiers.org/kegg.compound/C00008

kdiff = Pcm*Acell/Vcell;
Ka = RPowerR(10,-pKa)*1e+3;
Hext = RPowerR(10,-pHext)*1e+3; % http://identifiers.org/kegg.compound/C00080
Hint = RPowerR(10,-pHint)*1e+3; % http://identifiers.org/kegg.compound/C00080
NH4ext = NHxext*Hext/(Ka+Hext); % http://identifiers.org/kegg.compound/C01342
NH3ext = NHxext*Ka/(Ka+Hext);   % http://identifiers.org/kegg.compound/C00014
NH4int = NHxint*Hint/(Ka+Hint); % http://identifiers.org/kegg.compound/C01342
NH3int = NHxint*Ka/(Ka+Hint);   % http://identifiers.org/kegg.compound/C00014
phi = exp(-F*Dpsi/(R*T)); % Active Transport
% phi = Hint / Hext; % Passive Transport

OG = interpOG(t,strain_no,kappa,Nintstar,OGbasal,NH4int); % Model Input % http://identifiers.org/kegg.compound/C00026

GlnB_OGfree = GlnB/(1+3*OG/Kglnbog1+3*RPowerR(OG,2)/(Kglnbog1*Kglnbog2)+RPowerR(OG,3)/(Kglnbog1*Kglnbog2*Kglnbog3));
GlnBOG1 = 3*GlnB*OG/Kglnbog1/(1+3*OG/Kglnbog1+3*RPowerR(OG,2)/(Kglnbog1*Kglnbog2)+RPowerR(OG,3)/(Kglnbog1*Kglnbog2*Kglnbog3));
GlnBUMP3OG3 = GlnBUMP3*RPowerR(OG,3)/(Kglnbumpog1*Kglnbumpog2*Kglnbumpog3)/(1+3*OG/Kglnbumpog1+3*RPowerR(OG,2)/(Kglnbumpog1*Kglnbumpog2)+RPowerR(OG,3)/(Kglnbumpog1*Kglnbumpog2*Kglnbumpog3));
GlnK_OGfree = GlnK/(1+3*OG/Kglnkog1+3*RPowerR(OG,2)/(Kglnkog1*Kglnkog2)+RPowerR(OG,3)/(Kglnkog1*Kglnkog2*Kglnkog3));
GlnKOG1 = 3*GlnK*OG/Kglnkog1 /(1+3*OG/Kglnkog1+3*RPowerR(OG,2)/(Kglnkog1*Kglnkog2)+RPowerR(OG,3)/(Kglnkog1*Kglnkog2*Kglnkog3));
GlnKOG2 = 3*GlnK*RPowerR(OG,2)/(Kglnkog1*Kglnkog2) /(1+3*OG/Kglnkog1+3*RPowerR(OG,2)/(Kglnkog1*Kglnkog2)+RPowerR(OG,3)/(Kglnkog1*Kglnkog2*Kglnkog3));
GlnKOG3 = GlnK*RPowerR(OG,3)/(Kglnkog1*Kglnkog2*Kglnkog3) /(1+3*OG/Kglnkog1+3*RPowerR(OG,2)/(Kglnkog1*Kglnkog2)+RPowerR(OG,3)/(Kglnkog1*Kglnkog2*Kglnkog3));
AmtB_GlnKfree = calcAmtB_GlnKfree(GlnK_OGfree, AmtB, Kglnkamtb);
GlnKAmtB = AmtB - AmtB_GlnKfree;
GlnK_AmtBfree = GlnK - GlnKAmtB;
theta_ad = (a1*GlnBOG1/Kadglnbog+b1*GLN/Kadgln+c1*GlnBOG1*GLN/(Kadglnbog*Kadgln))/(1+GlnBOG1/Kadglnbog+GLN/Kadgln+GlnBOG1*GLN/(d1*Kadglnbog*Kadgln));
Vad_app = theta_ad*Vad;
theta_dead = (e1*GlnBOG1/Kdeadglnbog+f1*GLN/Kdeadgln+g1*GlnBUMP3OG3/Kdeadglnbump+h1*GlnBOG1*GLN/(Kdeadglnbog*Kdeadgln)+i1*GlnBOG1*GlnBUMP3OG3/(Kdeadglnbog*Kdeadglnbump)+j1*GLN*GlnBUMP3OG3/(Kdeadgln*Kdeadglnbump)+k1*GlnBOG1*GLN*GlnBUMP3OG3/(Kdeadglnbog*Kdeadgln*Kdeadglnbump))/(1+GlnBOG1/Kdeadglnbog+GLN/Kdeadgln+GlnBUMP3OG3/Kdeadglnbump+GlnBOG1*GLN/(l1*Kdeadglnbog*Kdeadgln)+GlnBOG1*GlnBUMP3OG3/(m1*Kdeadglnbog*Kdeadglnbump)+GLN*GlnBUMP3OG3/(n1*Kdeadgln*Kdeadglnbump)+GlnBOG1*GLN*GlnBUMP3OG3/(o1*Kdeadglnbog*Kdeadgln*Kdeadglnbump));
Vdead_app = theta_dead*Vdead;
GStotal = GS + GSAMP;
nAMP = 12*GSAMP/GStotal;
theta_gs = aamp/(1+RPowerR(nAMP/bamp,n1amp)) * camp/(1+RPowerR(nAMP/damp,n2amp));
Vgs = kcatgs * GStotal;
Vgs_app = theta_gs * Vgs;
Vamtb = kcatamtb * AmtB;
Vamtb_app = kcatamtb * AmtB_GlnKfree;
tau = tau0*(1+RPowerR(Kgrowthglu/GLU,2)+RPowerR(Kgrowthgln/GLN,2));
mu = log(2)/tau;

if strain_no <= 3 || ( 13 <= strain_no && strain_no <= 18) % Yuan
    [ NHxsurf, vdb_tmp, vamtb_tmp, vdiff_tmp ] = calcNHxsurf( NHxext, NHxint, Hext, Hint, Ka, Vamtb_app, Kamtbnh, phi, kdiff, kdb );
else % Kim and Radchenko
    NHxsurf = NHxext; % http://identifiers.org/kegg.compound/C01342, http://identifiers.org/kegg.compound/C00014
    vdb_tmp = 1e+10;
    vamtb_tmp = 1e+10;
    vdiff_tmp = 1e+10;
end
NH4surf = NHxsurf*Hext/(Ka+Hext); % http://identifiers.org/kegg.compound/C01342
NH3surf = NHxsurf*Ka/(Ka+Hext);   % http://identifiers.org/kegg.compound/C00014

%********** MODEL REACTIONS
vutglnb1 = kcatutglnb*UTase*GlnB*UTP/((1+GLN/Kutgln)*(Kutiglnb*Kututp+Kututp*(GlnB+GlnBUMP+GlnBUMP2)+Kutglnb*UTP+(GlnB+GlnBUMP+GlnBUMP2)*UTP+Kutglnb*UTP*(GlnBUMP+GlnBUMP2+GlnBUMP3)/Kutiglnbump+(GlnB+GlnBUMP+GlnBUMP2)*UTP*PPi/Kutippi));
vurglnb1 = kcaturglnb*UTase*GlnBUMP/((1+Kurgln/GLN)*(Kurglnbump+(1+UMP/Kurump)*(GlnBUMP+GlnBUMP2+GlnBUMP3)));
vutglnb2 = kcatutglnb*UTase*GlnBUMP*UTP/((1+GLN/Kutgln)*(Kutiglnb*Kututp+Kututp*(GlnB+GlnBUMP+GlnBUMP2)+Kutglnb*UTP+(GlnB+GlnBUMP+GlnBUMP2)*UTP+Kutglnb*UTP*(GlnBUMP+GlnBUMP2+GlnBUMP3)/Kutiglnbump+(GlnB+GlnBUMP+GlnBUMP2)*UTP*PPi/Kutippi));
vurglnb2 = kcaturglnb*UTase*GlnBUMP2/((1+Kurgln/GLN)*(Kurglnbump+(1+UMP/Kurump)*(GlnBUMP+GlnBUMP2+GlnBUMP3)));
vutglnb3 = kcatutglnb*UTase*GlnBUMP2*UTP/((1+GLN/Kutgln)*(Kutiglnb*Kututp+Kututp*(GlnB+GlnBUMP+GlnBUMP2)+Kutglnb*UTP+(GlnB+GlnBUMP+GlnBUMP2)*UTP+Kutglnb*UTP*(GlnBUMP+GlnBUMP2+GlnBUMP3)/Kutiglnbump+(GlnB+GlnBUMP+GlnBUMP2)*UTP*PPi/Kutippi));
vurglnb3 = kcaturglnb*UTase*GlnBUMP3/((1+Kurgln/GLN)*(Kurglnbump+(1+UMP/Kurump)*(GlnBUMP+GlnBUMP2+GlnBUMP3)));
vutglnk1 = kcatutglnk*UTase*GlnK_AmtBfree*UTP/((1+GLN/Kutgln)*(Kutiglnk*Kututp+Kututp*(GlnK_AmtBfree+GlnKUMP+GlnKUMP2)+Kutglnk*UTP+(GlnK_AmtBfree+GlnKUMP+GlnKUMP2)*UTP+Kutglnk*UTP*(GlnKUMP+GlnKUMP2+GlnKUMP3)/Kutiglnkump+(GlnK_AmtBfree+GlnKUMP+GlnKUMP2)*UTP*PPi/Kutippi));
vurglnk1 = kcaturglnk*UTase*GlnKUMP/((1+Kurgln/GLN)*(Kurglnkump+(1+UMP/Kurump)*(GlnKUMP+GlnKUMP2+GlnKUMP3)));
vutglnk2 = kcatutglnk*UTase*GlnKUMP*UTP/((1+GLN/Kutgln)*(Kutiglnk*Kututp+Kututp*(GlnK_AmtBfree+GlnKUMP+GlnKUMP2)+Kutglnk*UTP+(GlnK_AmtBfree+GlnKUMP+GlnKUMP2)*UTP+Kutglnk*UTP*(GlnKUMP+GlnKUMP2+GlnKUMP3)/Kutiglnkump+(GlnK_AmtBfree+GlnKUMP+GlnKUMP2)*UTP*PPi/Kutippi));
vurglnk2 = kcaturglnk*UTase*GlnKUMP2/((1+Kurgln/GLN)*(Kurglnkump+(1+UMP/Kurump)*(GlnKUMP+GlnKUMP2+GlnKUMP3)));
vutglnk3 = kcatutglnk*UTase*GlnKUMP2*UTP/((1+GLN/Kutgln)*(Kutiglnk*Kututp+Kututp*(GlnK_AmtBfree+GlnKUMP+GlnKUMP2)+Kutglnk*UTP+(GlnK_AmtBfree+GlnKUMP+GlnKUMP2)*UTP+Kutglnk*UTP*(GlnKUMP+GlnKUMP2+GlnKUMP3)/Kutiglnkump+(GlnK_AmtBfree+GlnKUMP+GlnKUMP2)*UTP*PPi/Kutippi));
vurglnk3 = kcaturglnk*UTase*GlnKUMP3/((1+Kurgln/GLN)*(Kurglnkump+(1+UMP/Kurump)*(GlnKUMP+GlnKUMP2+GlnKUMP3)));
vad = Vad_app*GS/(Kadgs+GS);
vdead = Vdead_app*GSAMP/(Kdeadgsamp+GSAMP);
vgdh = Vgdh/(Kgdhog*Kgdhnh*Kgdhnadph)*(OG*NH4int*NADPH-GLU*NADP/Kgdheq)/((1+NH4int/Kgdhnh)*(1+OG/Kgdhog+GLU/Kgdhglu)*(1+NADPH/Kgdhnadph+NADP/Kgdhnadp));
vgog = Vgog*GLN*OG*NADPH/(Kgoggln*Kgogog*Kgognadph)/((1+GLN/Kgoggln+GLU/Kgogglu)*(1+OG/Kgogog+GLU/Kgogglu)*(1+NADPH/Kgognadph+NADP/Kgognadp));
vgs = Vgs_app/(Kgsatp*Kgsnh*Kgsglu)*(ATP*NH4int*GLU-ADP*GLN*Pi/Kgseq)/((1+ATP/Kgsatp+ADP/Kgsadp+Pi/Kgspi+ADP*Pi/(Kgsadp*Kgspi))*(1+NH4int/Kgsnh+GLN/Kgsgln+GLU/Kgsglu+GLN*NH4int/(Kgsgln*Kgsnh)+GLU*NH4int/(Kgsglu*Kgsnh)));
vamtb = Vamtb_app * ( NH4surf - NH4int/phi ) / ( Kamtbnh + NH4surf );
vdiff = kdiff*(NH3surf - NH3int);
vgludemn = mu*GLUdemn;
vgludemf = mu*GLUdemf;
vglndemn = mu*GLNdemn;
vglndemf = mu*GLNdemf;

if strain_no == 12 || strain_no == 20 % Radchenko
    if  t < 0
        vdemnhxext = 0;
    else
        vdemnhxext = ( vamtb + vdiff ) * Vcell / Vmedium;
    end
else % Yuan and Kim
    vdemnhxext = 0;
end

Flux = [ vutglnb1, vurglnb1, vutglnb2, vurglnb2, vutglnb3, ... %  1 -- 5
    vurglnb3, vutglnk1, vurglnk1, vutglnk2, vurglnk2, ... % 6 -- 10
    vutglnk3, vurglnk3, vad, vdead, vgdh, ... % 11 -- 15
    vgog, vgs, vamtb, vdiff, vgludemn, ... % 16 -- 20
    vgludemf, vglndemn, vglndemf, vdemnhxext, NHxext, ... % 21 -- 25
    ATP, ADP, kdiff, Ka, Hext, ... % 26 -- 30
    Hint, NH4ext, NH3ext, NH4int, NH3int, ... % 31 -- 35
    phi, OG, GlnB_OGfree, GlnBOG1, GlnBUMP3OG3, ... % 36 -- 40
    GlnK_OGfree, GlnKOG1, GlnKOG2, GlnKOG3, AmtB_GlnKfree, ... % 41 -- 45
    GlnKAmtB, GlnK_AmtBfree, theta_ad, Vad_app, theta_dead, ... % 46 -- 50
    Vdead_app, GStotal, nAMP, theta_gs, Vgs, ... % 51 -- 55
    Vgs_app, Vamtb, Vamtb_app, tau, mu, ... % 56 -- 60
    NHxsurf, vdb_tmp, vamtb_tmp, vdiff_tmp, NH4surf, ... % 61 -- 65
    NH3surf ]; % 66
