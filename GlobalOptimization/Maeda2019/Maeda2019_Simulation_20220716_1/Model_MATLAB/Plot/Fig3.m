function Fig3(filename)

%% Load data
load(filename);

%% Color setting
Blue = [ 0 0.4470 0.7410 ];
Red = [ 0.8500 0.3250 0.0980 ];
Yellow = [ 0.9290 0.6940 0.1250 ];
Green = [ 0.4660 0.6740 0.1880 ];

%% Figure 3a
figure('Position',[100 100 720 300]);

% WT --------------------------------------------------
strain_no = 1;
[ T_exp, GLU_exp, GLU_err, GLN_exp, GLN_err ] = ExpDataOfYuan2009(strain_no);

subplot(2,3,1);
plot(T1,Y1(:,12),'LineWidth',1.5,'Color',Blue);
title('Wild Type');
hold on;
errorbar(T_exp,GLN_exp,GLN_err,'k.');
xlabel('Time (min)','FontSize',11,'FontName','Arial');
ylabel('GLN (mM)','FontSize',11,'FontName','Arial');
xlim([-5 35]);
ylim([0 60]);
set(gca,'XTick',-10:10:40);
set(gca,'YTick',0:20:60);
set(gca,'FontSize',11,'FontName','Arial');
set(gca,'TickLength',[0.04 0.070]);
hold off;
box on;

subplot(2,3,4);
plot(T1,Y1(:,11),'LineWidth',1.5,'Color',Blue);
hold on;
errorbar(T_exp,GLU_exp,GLU_err,'k.');
xlabel('Time (min)','FontSize',11,'FontName','Arial');
ylabel('GLU (mM)','FontSize',11,'FontName','Arial');
xlim([-5 35]);
ylim([0 250]);
set(gca,'XTick',-10:10:40);
set(gca,'YTick',0:100:300);
set(gca,'FontSize',11,'FontName','Arial');
set(gca,'TickLength',[0.04 0.070]);
hold off;
box on;

% deltaGDH --------------------------------------------------
strain_no = 2;
[ T_exp, GLU_exp, GLU_err, GLN_exp, GLN_err ] = ExpDataOfYuan2009(strain_no);

subplot(2,3,2);
plot(T2,Y2(:,12),'LineWidth',1.5,'Color',Red);
title('\DeltaGDH');
hold on;
errorbar(T_exp,GLN_exp,GLN_err,'k.');
xlabel('Time (min)','FontSize',11,'FontName','Arial');
ylabel('GLN (mM)','FontSize',11,'FontName','Arial');
xlim([-5 35]);
ylim([0 60]);
set(gca,'XTick',-10:10:40);
set(gca,'YTick',0:20:60);
set(gca,'FontSize',11,'FontName','Arial');
set(gca,'TickLength',[0.04 0.070]);
hold off;
box on;

subplot(2,3,5);
plot(T2,Y2(:,11),'LineWidth',1.5,'Color',Red);
hold on;
errorbar(T_exp,GLU_exp,GLU_err,'k.');
xlabel('Time (min)','FontSize',11,'FontName','Arial');
ylabel('GLU (mM)','FontSize',11,'FontName','Arial');
xlim([-5 35]);
ylim([0 250]);
set(gca,'XTick',-10:10:40);
set(gca,'YTick',0:100:300);
set(gca,'FontSize',11,'FontName','Arial');
set(gca,'TickLength',[0.04 0.070]);
hold off;
box on;

% deltaGOGAT --------------------------------------------------
strain_no = 3;
[ T_exp, GLU_exp, GLU_err, GLN_exp, GLN_err ] = ExpDataOfYuan2009(strain_no);

subplot(2,3,3);
plot(T3,Y3(:,12),'LineWidth',1.5,'Color',Green);
title('\DeltaGOGAT');
hold on;
errorbar(T_exp,GLN_exp,GLN_err,'k.');
xlabel('Time (min)','FontSize',11,'FontName','Arial');
ylabel('GLN (mM)','FontSize',11,'FontName','Arial');
xlim([-5 35]);
ylim([0 60]);
set(gca,'XTick',-10:10:40);
set(gca,'YTick',0:20:60);
set(gca,'FontSize',11,'FontName','Arial');
set(gca,'TickLength',[0.04 0.070]);
hold off;
box on;

subplot(2,3,6);
plot(T3,Y3(:,11),'LineWidth',1.5,'Color',Green);
hold on;
errorbar(T_exp,GLU_exp,GLU_err,'k.');
xlabel('Time (min)','FontSize',11,'FontName','Arial');
ylabel('GLU (mM)','FontSize',11,'FontName','Arial');
xlim([-5 35]);
ylim([0 250]);
set(gca,'XTick',-10:10:40);
set(gca,'YTick',0:100:300);
set(gca,'FontSize',11,'FontName','Arial');
set(gca,'TickLength',[0.04 0.070]);
hold off;
box on;

%% Figure 3b
figure('Position',[100 100 450 315]);

[ T13_exp, GLU13_exp, GLU13_err, GLN13_exp, GLN13_err ] = ExpDataOfYuan2009(13); % 3-fold upshift--wildtype
[ T14_exp, GLU14_exp, GLU14_err, GLN14_exp, GLN14_err ] = ExpDataOfYuan2009(14); % 3-fold upshift--deltaGOGAT
[ T15_exp, GLU15_exp, GLU15_err, GLN15_exp, GLN15_err ] = ExpDataOfYuan2009(15); % down-shift--wildtype
[ T16_exp, GLU16_exp, GLU16_err, GLN16_exp, GLN16_err ] = ExpDataOfYuan2009(16); % down-shift-deltaGOGAT

%
subplot(2,2,1);
plot(T13,Y13(:,12),'LineWidth',1.5,'Color',Yellow);
title('Wild Type');
hold on;
errorbar(T13_exp,GLN13_exp,GLN13_err,'.','Color',Yellow);
plot(T15,Y15(:,12),'LineWidth',1.5,'Color',Blue);
errorbar(T15_exp,GLN15_exp,GLN15_err,'.','Color',Blue);
xlabel('Time (min)','FontSize',11,'FontName','Arial');
ylabel('GLN (mM)','FontSize',11,'FontName','Arial');
xlim([-5 35]);
ylim([5e-3 1e+2]);
set(gca,'XTick',-10:10:40);
set(gca,'YTick',10.^(-2:2));
set(gca,'FontSize',11,'FontName','Arial');
set(gca,'TickLength',[0.04 0.070]);
text(10,30,'3x N-upshift','FontSize',8,'FontName','Arial','Color',Yellow);
text(10,0.3,'N-depletion','FontSize',8,'FontName','Arial','Color',Blue);
hold off;
set(gca,'Yscale','log');
box on;

%
subplot(2,2,2);
plot(T13,Y13(:,11),'LineWidth',1.5,'Color',Yellow);
title('Wild Type');
hold on;
errorbar(T13_exp,GLU13_exp,GLU13_err,'.','Color',Yellow);
plot(T15,Y15(:,11),'LineWidth',1.5,'Color',Blue);
errorbar(T15_exp,GLU15_exp,GLU15_err,'.','Color',Blue);
xlabel('Time (min)','FontSize',11,'FontName','Arial');
ylabel('GLU (mM)','FontSize',11,'FontName','Arial');
xlim([-5 35]);
ylim([3 300]);
set(gca,'XTick',-10:10:40);
set(gca,'YTick',10.^(1:3));
set(gca,'FontSize',11,'FontName','Arial');
set(gca,'TickLength',[0.04 0.070]);
text(10,15,'3x N-upshift','FontSize',8,'FontName','Arial','Color',Yellow);
text(10,7,'N-depletion','FontSize',8,'FontName','Arial','Color',Blue);
hold off;
set(gca,'Yscale','log');
box on;

%
subplot(2,2,3);
plot(T14,Y14(:,12),'LineWidth',1.5,'Color',Yellow);
title('\DeltaGOGAT');
hold on;
errorbar(T14_exp,GLN14_exp,GLN14_err,'.','Color',Yellow);
plot(T16,Y16(:,12),'LineWidth',1.5,'Color',Blue);
errorbar(T16_exp,GLN16_exp,GLN16_err,'.','Color',Blue);
xlabel('Time (min)','FontSize',11,'FontName','Arial');
ylabel('GLN (mM)','FontSize',11,'FontName','Arial');
xlim([-5 35]);
ylim([10^-1 10^2]);
set(gca,'XTick',-10:10:40);
set(gca,'YTick',10.^(-2:2));
set(gca,'FontSize',11,'FontName','Arial');
set(gca,'TickLength',[0.04 0.070]);
text(10,30,'3x N-upshift','FontSize',8,'FontName','Arial','Color',Yellow);
text(10,1,'N-depletion','FontSize',8,'FontName','Arial','Color',Blue);
hold off;
set(gca,'Yscale','log');
box on;

%
subplot(2,2,4);
plot(T14,Y14(:,11),'LineWidth',1.5,'Color',Yellow);
title('\DeltaGOGAT');
hold on;
errorbar(T14_exp,GLU14_exp,GLU14_err,'.','Color',Yellow);
plot(T16,Y16(:,11),'LineWidth',1.5,'Color',Blue);
errorbar(T16_exp,GLU16_exp,GLU16_err,'.','Color',Blue);
xlabel('Time (min)','FontSize',11,'FontName','Arial');
ylabel('GLU (mM)','FontSize',11,'FontName','Arial');
xlim([-5 35]);
ylim([1 300]);
set(gca,'XTick',-10:10:40);
set(gca,'YTick',10.^(0:3));
set(gca,'FontSize',11,'FontName','Arial');
set(gca,'TickLength',[0.04 0.070]);
text(10,30,'3x N-upshift','FontSize',8,'FontName','Arial','Color',Yellow);
text(10,2.5,'N-depletion','FontSize',8,'FontName','Arial','Color',Blue);
hold off;
set(gca,'Yscale','log');
box on;

%% Figure 3c
figure('Position',[100 100 450 140]);

[ T17_exp, GLU17_exp, GLU17_err, GLN17_exp, GLN17_err ] = ExpDataOfYuan2009(17); % 13-fold upshift--deltaAT/AR
[ T18_exp, GLU18_exp, GLU18_err, GLN18_exp, GLN18_err ] = ExpDataOfYuan2009(18); % 13-fold upshift--deltaAmtB

%
subplot(1,2,1);
plot(T17,Y17(:,12),'LineWidth',1.5,'Color',Green);
hold on;
errorbar(T17_exp,GLN17_exp,GLN17_err,'.','Color',Green);
plot(T18,Y18(:,12),'LineWidth',1.5,'Color',Blue);
errorbar(T18_exp,GLN18_exp,GLN18_err,'.','Color',Blue);
xlabel('Time (min)','FontSize',11,'FontName','Arial');
ylabel('GLN (mM)','FontSize',11,'FontName','Arial');
xlim([-5 35]);
ylim([10^-1 10^3]);
set(gca,'XTick',-10:10:40);
set(gca,'YTick',10.^(-1:1:3));
set(gca,'FontSize',11,'FontName','Arial');
set(gca,'TickLength',[0.04 0.070]);
text(12,50,{'\DeltaATase','(13x N-upshift)'},'FontSize',8,'FontName','Arial','Color',Green);
text(0.5,1,'\DeltaAmtB (13x N-upshift)','FontSize',8,'FontName','Arial','Color',Blue);
hold off;
set(gca,'Yscale','log');
box on;

%
subplot(1,2,2);
plot(T17,Y17(:,11),'LineWidth',1.5,'Color',Green);
hold on;
errorbar(T17_exp,GLU17_exp,GLU17_err,'.','Color',Green);
plot(T18,Y18(:,11),'LineWidth',1.5,'Color',Blue);
errorbar(T18_exp,GLU18_exp,GLU18_err,'.','Color',Blue);
xlabel('Time (min)','FontSize',11,'FontName','Arial');
ylabel('GLU (mM)','FontSize',11,'FontName','Arial');
xlim([-5 35]);
ylim([3 400]);
set(gca,'XTick',-10:10:40);
set(gca,'YTick',10.^(1:3));
set(gca,'FontSize',11,'FontName','Arial');
set(gca,'TickLength',[0.04 0.070]);
text(-2,7,'\DeltaATase (13x N-upshift)','FontSize',8,'FontName','Arial','Color',Green);
text(-2,15,'\DeltaAmtB (13x N-upshift)','FontSize',8,'FontName','Arial','Color',Blue);
hold off;
set(gca,'Yscale','log');
box on;
