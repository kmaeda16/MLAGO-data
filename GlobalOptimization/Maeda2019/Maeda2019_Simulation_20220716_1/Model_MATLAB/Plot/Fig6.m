function Fig6(filename)

%% Load data
load(filename);

%% Color setting
Blue = [ 0 0.4470 0.7410 ];
Red = [ 0.8500 0.3250 0.0980 ];
Yellow = [ 0.9290 0.6940 0.1250 ];

%% Set data
Fout0 = F_out_WT; % WT
Fout1 = F_out_VM; % Virtual Mutant

%% Plot
figure('Position',[100 100 500 400]);

%% NH4ext vs. Flux (WT)
subplot(2,2,1);
plot([3 2e+3],[0 0],'k');
hold on;
plot(Fout0(:,32)*1e+3,[ Fout0(:,18:19) Fout0(:,18)+Fout0(:,19) ],'-','LineWidth',1.75);
ax = gca;
ax.ColorOrderIndex = 1;
plot(Fout1(:,32)*1e+3,[ Fout1(:,18:19) Fout1(:,18)+Fout1(:,19) ],':','LineWidth',1.75);
set(gca,'Xscale','log');
set(gca,'FontSize',11,'FontName','Arial');
xlabel('NH_4^+_{ext} (\muM)','FontSize',11,'FontName','Arial');
ylabel('Flux (mM/min)','FontSize',11,'FontName','Arial');
xlim([3.4 1.2e+3]);
ylim([-2000 2000]);
set(gca,'XTick',10.^(0:3));
set(gca,'YTick',-10000:1000:10000);
set(gca,'TickLength',[0.04 0.070]);
hold off
text(50,700,'v_{amtb}','FontSize',10,'FontName','Arial','Color',Blue);
text(50,-600,'v_{diff}','FontSize',10,'FontName','Arial','Color',Red);
text(300,600,'v_{net}','FontSize',10,'FontName','Arial','Color',Yellow);
title({'Wild Type (Solid Lines)','Virtural Mutant (Dotted Lines)'});

%% NH4ext vs. NH4int
subplot(2,2,2);
plot(Fout0(:,32)*1e+3,Fout0(:,34)*1e+3,'-','LineWidth',1.75);
hold on;
ax = gca;
ax.ColorOrderIndex = 1;
plot(Fout1(:,32)*1e+3,Fout1(:,34)*1e+3,':','LineWidth',1.75);
set(gca,'Xscale','log');
set(gca,'Yscale','log');
set(gca,'FontSize',11,'FontName','Arial');
xlabel('NH_4^+_{ext} (\muM)','FontSize',11,'FontName','Arial');
ylabel('NH_4^+_{int} (\muM)','FontSize',11,'FontName','Arial');
xlim([3.4 1.2e+3]);
ylim([1e+1 1e+3]);
set(gca,'XTick',10.^(0:3));
set(gca,'YTick',10.^(0:3));
set(gca,'TickLength',[0.04 0.070]);
hold off;

%% NH4ext vs. AmtB_{GlnKfree}, GlnKAmtB
subplot(2,2,3);
plot(Fout0(:,32)*1e+3,Fout0(:,45:46)*1e+3,'-','LineWidth',1.75);
hold on;
ax = gca;
ax.ColorOrderIndex = 1;
plot(Fout1(:,32)*1e+3,Fout1(:,45:46)*1e+3,':','LineWidth',1.75);
set(gca,'Xscale','log');
set(gca,'FontSize',11,'FontName','Arial');
xlabel('NH_4^+_{ext} (\muM)','FontSize',11,'FontName','Arial');
ylabel('Conc. (\muM)','FontSize',11,'FontName','Arial');
xlim([3.4 1.2e+3]);
ylim([-0.2 2.0]);
set(gca,'XTick',10.^(0:3));
set(gca,'TickLength',[0.04 0.070]);
hold off;
text(40,0.5,'AmtB_{GlnKfree}','FontSize',10,'FontName','Arial','Color',Blue);
text(40,1.2,'GlnKAmtB','FontSize',10,'FontName','Arial','Color',Red);

%% NH4ext vs. Vamtb^{app}, Vgs^{app}
subplot(2,2,4);
plot(Fout0(:,32)*1e+3,Fout0(:,[58 56]),'-','LineWidth',1.75);
hold on;
ax = gca;
ax.ColorOrderIndex = 1;
plot(Fout1(:,32)*1e+3,Fout1(:,[58 56]),':','LineWidth',1.75);
set(gca,'Xscale','log');
set(gca,'FontSize',11,'FontName','Arial');
xlabel('NH_4^+_{ext} (\muM)','FontSize',11,'FontName','Arial');
ylabel('Flux (mM/min)','FontSize',11,'FontName','Arial');
xlim([3.4 1.2e+3]);
ylim([-100 1500]);
set(gca,'XTick',10.^(0:3));
set(gca,'YTick',0:500:10000);
set(gca,'TickLength',[0.04 0.070]);
hold off;
text(6,1000,'V_{amtb}^{app}','FontSize',10,'FontName','Arial','Color',Blue);
text(100,500,'V_{gs}^{app}','FontSize',10,'FontName','Arial','Color',Red);
