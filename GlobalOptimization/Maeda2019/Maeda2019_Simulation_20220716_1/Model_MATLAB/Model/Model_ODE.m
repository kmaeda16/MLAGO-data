function dydt = Model_ODE(t,y,param,odeaux)

Flux = odeaux(t,y,param);

vutglnb1 = Flux(1);
vurglnb1 = Flux(2);
vutglnb2 = Flux(3);
vurglnb2 = Flux(4);
vutglnb3 = Flux(5);
vurglnb3 = Flux(6);
vutglnk1 = Flux(7);
vurglnk1 = Flux(8);
vutglnk2 = Flux(9);
vurglnk2 = Flux(10);
vutglnk3 = Flux(11);
vurglnk3 = Flux(12);
vad = Flux(13);
vdead = Flux(14);
vgdh = Flux(15);
vgog = Flux(16);
vgs = Flux(17);
vamtb = Flux(18);
vdiff = Flux(19);
vgludemn = Flux(20);
vgludemf = Flux(21);
vglndemn = Flux(22);
vglndemf = Flux(23);
vdemnhxext = Flux(24);

%********** MODEL STATES
GlnB_dot     = - vutglnb1 + vurglnb1;
GlnBUMP_dot  = + vutglnb1 - vurglnb1 - vutglnb2 + vurglnb2;
GlnBUMP2_dot = + vutglnb2 - vurglnb2 - vutglnb3 + vurglnb3;
GlnBUMP3_dot = + vutglnb3 - vurglnb3;
GlnK_dot     = - vutglnk1 + vurglnk1;
GlnKUMP_dot  = + vutglnk1 - vurglnk1 - vutglnk2 + vurglnk2;
GlnKUMP2_dot = + vutglnk2 - vurglnk2 - vutglnk3 + vurglnk3;
GlnKUMP3_dot = + vutglnk3 - vurglnk3;
GS_dot       = - vad + vdead;
GSAMP_dot    = + vad - vdead;
GLU_dot      = + vgdh + 2*vgog - vgs - vgludemn - vgludemf + vglndemn;
GLN_dot      = - vgog + vgs - vglndemn - vglndemf;
NHxint_dot   = + vamtb + vdiff - vgdh - vgs;
NHxext_Radchenko_after_upshift_dot = - vdemnhxext;

dydt = [ GlnB_dot; GlnBUMP_dot; GlnBUMP2_dot; GlnBUMP3_dot; GlnK_dot;
    GlnKUMP_dot; GlnKUMP2_dot; GlnKUMP3_dot; GS_dot; GSAMP_dot;
    GLU_dot; GLN_dot; NHxint_dot; NHxext_Radchenko_after_upshift_dot; ];
