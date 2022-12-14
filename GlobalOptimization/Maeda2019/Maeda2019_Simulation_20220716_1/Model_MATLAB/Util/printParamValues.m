function printParamValues(y,param)

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

strain_no = param(1);
UTase = param(2);
AmtB = param(3);
UTP = param(4);
UMP = param(5);
PPi = param(6);
Pi = param(7);
NADPH = param(8);
NADP = param(9);
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
Vad = param(37);
Kadgs = param(38);
Kadglnbog = param(39);
Kadgln = param(40);
a1 = param(41);
b1 = param(42);
c1 = param(43);
d1 = param(44);
Vdead = param(45);
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
Vgdh = param(61);
Kgdhog = param(62);
Kgdhnh = param(63);
Kgdhglu = param(64);
Kgdhnadph = param(65);
Kgdhnadp = param(66);
Kgdheq = param(67);
Vgog = param(68);
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

fprintf('------------ Initial Condition ------------\n');
fprintf('%s\t=\t%.5f\n','GlnB',GlnB);
fprintf('%s\t=\t%.5f\n','GlnBUMP',GlnBUMP);
fprintf('%s\t=\t%.5f\n','GlnBUMP2',GlnBUMP2);
fprintf('%s\t=\t%.5f\n','GlnBUMP3',GlnBUMP3);
fprintf('%s\t=\t%.4f\n','GlnK',GlnK);
fprintf('%s\t=\t%.4f\n','GlnKUMP',GlnKUMP);
fprintf('%s\t=\t%.4f\n','GlnKUMP2',GlnKUMP2);
fprintf('%s\t=\t%.4f\n','GlnKUMP3',GlnKUMP3);
fprintf('%s\t=\t%.3f\n','GS',GS);
fprintf('%s\t=\t%.3f\n','GSAMP',GSAMP);
fprintf('%s\t=\t%.0f\n','GLU',GLU);
fprintf('%s\t=\t%.0f\n','GLN',GLN);
fprintf('%s\t=\t%.2f\n','NHxint',NHxint);
fprintf('%s\t=\t%.1f\n','NHxext_Radchenko_after_upshift',NHxext_Radchenko_after_upshift);

fprintf('------------ Parameter Values -------------\n');
fprintf('%s\t=\t%d\n','strain_no',strain_no);
fprintf('%s\t=\t%.4f\n','UTase',UTase);
fprintf('%s\t=\t%.4f\n','AmtB',AmtB);
fprintf('%s\t=\t%.1f\n','UTP',UTP);
fprintf('%s\t=\t%.2f\n','UMP',UMP);
fprintf('%s\t=\t%.2f\n','PPi',PPi);
fprintf('%s\t=\t%.0f\n','Pi',Pi);
fprintf('%s\t=\t%.2f\n','NADPH',NADPH);
fprintf('%s\t=\t%.3f\n','NADP',NADP);
fprintf('%s\t=\t%.0f\n','kcatutglnb',kcatutglnb);
fprintf('%s\t=\t%.2f\n','Kutgln',Kutgln);
fprintf('%s\t=\t%.4f\n','Kutiglnb',Kutiglnb);
fprintf('%s\t=\t%.3f\n','Kutglnb',Kutglnb);
fprintf('%s\t=\t%.4f\n','Kutiglnbump',Kutiglnbump);
fprintf('%s\t=\t%.2f\n','Kututp',Kututp);
fprintf('%s\t=\t%.4f\n','Kutippi',Kutippi);
fprintf('%s\t=\t%.1f\n','kcaturglnb',kcaturglnb);
fprintf('%s\t=\t%.4f\n','Kurglnbump',Kurglnbump);
fprintf('%s\t=\t%.1f\n','Kurump',Kurump);
fprintf('%s\t=\t%.2f\n','Kurgln',Kurgln);
fprintf('%s\t=\t%.0f\n','kcatutglnk',kcatutglnk);
fprintf('%s\t=\t%.4f\n','Kutiglnk',Kutiglnk);
fprintf('%s\t=\t%.3f\n','Kutglnk',Kutglnk);
fprintf('%s\t=\t%.4f\n','Kutiglnkump',Kutiglnkump);
fprintf('%s\t=\t%.1f\n','kcaturglnk',kcaturglnk);
fprintf('%s\t=\t%.4f\n','Kurglnkump',Kurglnkump);
fprintf('%s\t=\t%.3f\n','Kglnbog1',Kglnbog1);
fprintf('%s\t=\t%.2f\n','Kglnbog2',Kglnbog2);
fprintf('%s\t=\t%.2f\n','Kglnbog3',Kglnbog3);
fprintf('%s\t=\t%.3f\n','Kglnbumpog1',Kglnbumpog1);
fprintf('%s\t=\t%.2f\n','Kglnbumpog2',Kglnbumpog2);
fprintf('%s\t=\t%.2f\n','Kglnbumpog3',Kglnbumpog3);
fprintf('%s\t=\t%.0f\n','Kglnkog1',Kglnkog1);
fprintf('%s\t=\t%.0f\n','Kglnkog2',Kglnkog2);
fprintf('%s\t=\t%.0f\n','Kglnkog3',Kglnkog3);
fprintf('%s\t=\t%.0e\n','Kglnkamtb',Kglnkamtb);
fprintf('%s\t=\t%.1f\n','Vad',Vad);
fprintf('%s\t=\t%.3e\n','Kadgs',Kadgs);
fprintf('%s\t=\t%.3e\n','Kadglnbog',Kadglnbog);
fprintf('%s\t=\t%.4f\n','Kadgln',Kadgln);
fprintf('%s\t=\t%.0e\n','a1',a1);
fprintf('%s\t=\t%.4f\n','b1',b1);
fprintf('%s\t=\t%.4f\n','c1',c1);
fprintf('%s\t=\t%.4f\n','d1',d1);
fprintf('%s\t=\t%.1f\n','Vdead',Vdead);
fprintf('%s\t=\t%.3e\n','Kdeadgsamp',Kdeadgsamp);
fprintf('%s\t=\t%.3e\n','Kdeadglnbog',Kdeadglnbog);
fprintf('%s\t=\t%.5f\n','Kdeadgln',Kdeadgln);
fprintf('%s\t=\t%.3e\n','Kdeadglnbump',Kdeadglnbump);
fprintf('%s\t=\t%.0e\n','e1',e1);
fprintf('%s\t=\t%.3f\n','f1',f1);
fprintf('%s\t=\t%.3f\n','g1',g1);
fprintf('%s\t=\t%.4f\n','h1',h1);
fprintf('%s\t=\t%.0e\n','i1',i1);
fprintf('%s\t=\t%.0e\n','j1',j1);
fprintf('%s\t=\t%.0e\n','k1',k1);
fprintf('%s\t=\t%.5f\n','l1',l1);
fprintf('%s\t=\t%.4f\n','m1',m1);
fprintf('%s\t=\t%.3f\n','n1',n1);
fprintf('%s\t=\t%.4f\n','o1',o1);
fprintf('%s\t=\t%.0f\n','Vgdh',Vgdh);
fprintf('%s\t=\t%.2f\n','Kgdhog',Kgdhog);
fprintf('%s\t=\t%.1f\n','Kgdhnh',Kgdhnh);
fprintf('%s\t=\t%.0f\n','Kgdhglu',Kgdhglu);
fprintf('%s\t=\t%.2f\n','Kgdhnadph',Kgdhnadph);
fprintf('%s\t=\t%.3f\n','Kgdhnadp',Kgdhnadp);
fprintf('%s\t=\t%.0f\n','Kgdheq',Kgdheq);
fprintf('%s\t=\t%.0f\n','Vgog',Vgog);
fprintf('%s\t=\t%.3f\n','Kgoggln',Kgoggln);
fprintf('%s\t=\t%.3f\n','Kgogog',Kgogog);
fprintf('%s\t=\t%.4f\n','Kgognadph',Kgognadph);
fprintf('%s\t=\t%.0f\n','Kgogglu',Kgogglu);
fprintf('%s\t=\t%.4f\n','Kgognadp',Kgognadp);
fprintf('%s\t=\t%.0f\n','kcatgs',kcatgs);
fprintf('%s\t=\t%.2f\n','Kgsatp',Kgsatp);
fprintf('%s\t=\t%.1f\n','Kgsglu',Kgsglu);
fprintf('%s\t=\t%.1f\n','Kgsnh',Kgsnh);
fprintf('%s\t=\t%.4f\n','Kgsadp',Kgsadp);
fprintf('%s\t=\t%.1f\n','Kgspi',Kgspi);
fprintf('%s\t=\t%.2f\n','Kgsgln',Kgsgln);
fprintf('%s\t=\t%.0f\n','Kgseq',Kgseq);
fprintf('%s\t=\t%.0f\n','aamp',aamp);
fprintf('%s\t=\t%.4f\n','bamp',bamp);
fprintf('%s\t=\t%.4f\n','camp',camp);
fprintf('%s\t=\t%.4f\n','damp',damp);
fprintf('%s\t=\t%.4f\n','n1amp',n1amp);
fprintf('%s\t=\t%.4f\n','n2amp',n2amp);
fprintf('%s\t=\t%.2e\n','kcatamtb',kcatamtb);
fprintf('%s\t=\t%.3f\n','Kamtbnh',Kamtbnh);
fprintf('%s\t=\t%.0f\n','tau0',tau0);
fprintf('%s\t=\t%.1f\n','Kgrowthglu',Kgrowthglu);
fprintf('%s\t=\t%.2f\n','Kgrowthgln',Kgrowthgln);
fprintf('%s\t=\t%.0f\n','GLUdemn',GLUdemn);
fprintf('%s\t=\t%.0f\n','GLUdemf',GLUdemf);
fprintf('%s\t=\t%.0f\n','GLNdemn',GLNdemn);
fprintf('%s\t=\t%.0f\n','GLNdemf',GLNdemf);
fprintf('%s\t=\t%.2f\n','Dpsi',Dpsi);
fprintf('%s\t=\t%.3f\n','R   ',R   );
fprintf('%s\t=\t%.0f\n','T   ',T   );
fprintf('%s\t=\t%.0f\n','F   ',F   );
fprintf('%s\t=\t%.3f\n','Pcm',Pcm);
fprintf('%s\t=\t%.2e\n','Vcell',Vcell);
fprintf('%s\t=\t%.2e\n','Acell',Acell);
fprintf('%s\t=\t%.2f\n','pKa',pKa);
fprintf('%s\t=\t%.1f\n','pHext',pHext);
fprintf('%s\t=\t%.1f\n','pHint',pHint);
fprintf('%s\t=\t%.1f\n','kdb',kdb);
fprintf('%s\t=\t%.1f\n','kappa',kappa);
fprintf('%s\t=\t%.3f\n','Nintstar',Nintstar);
fprintf('%s\t=\t%.1f\n','OGbasal',OGbasal);
fprintf('%s\t=\t%.1e\n','Vmedium',Vmedium);
fprintf('%s\t=\t%.1e\n','NHxext_Radchenko_before_upshift',NHxext_Radchenko_before_upshift);
