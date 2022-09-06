function Fig5(filename,GlnKY51A)

%% Load data
load(filename);

%% Color setting
Blue = [ 0 0.4470 0.7410 ];
Red = [ 0.8500 0.3250 0.0980 ];
Yellow = [ 0.9290 0.6940 0.1250 ];
Purple = [ 0.4940 0.1840 0.5560 ];

%% Different strains
switch GlnKY51A
    
    case 0 % WT (Fig5a-f)
        param = param_WT;
        T = T_WT;
        Y = Y_WT;
        F = F_WT;
        
    case 1 % GlnK Y51A (Fig5g-l)
        param = param_GlnKY51A;
        T = T_GlnKY51A;
        Y = Y_GlnKY51A;
        F = F_GlnKY51A;
        
    otherwise
        error('Unexpected GlnKY51A!');
        
end

%% Plot
figure('Position',[100 100 700 300]);

[ T_exp, GlnK_exp, GlnKUMP_exp, GlnKUMP2_exp, GlnKUMP3_exp, GlnKAmtB_exp ] = ...
    ExpDataOfRadchenko2014(GlnKY51A);

subplot(2,3,1);
GlnKUMPx_cyt = sum([F(:,47) Y(:,6:8)],2);
GlnKUMP0_cyt = F(:,47);
plot(T,[GlnKUMP0_cyt Y(:,6)]./repmat(GlnKUMPx_cyt,1,2),'LineWidth',2);
hold on;
ax = gca; ax.ColorOrderIndex = 1;
plot(T_exp,[GlnK_exp, GlnKUMP_exp],'o','LineWidth',2,'markers',4);
xlabel('Time (min)','FontSize',10,'FontName','Arial');
ylabel('Rel. to GlnK_{cyt}','FontSize',10,'FontName','Arial');
xlim([-5 20]);
ylim([-0.1 1.5]);
set(gca,'XTick',-20:5:30);
set(gca,'YTick',0:0.5:5);
set(gca,'FontSize',10,'FontName','Arial');
set(gca,'TickLength',[0.03 0.070]);
box on;
switch GlnKY51A
    case 0
        text(-2,1.1,'GlnKUMP_{0}OG_{x,cyt}','FontSize',10,'FontName','Arial','Color',Blue);
        text(-2,0.75,'GlnKUMP_{1}OG_{x}','FontSize',10,'FontName','Arial','Color',Red);
    case 1
        text(-2,1.25,'GlnKUMP_{0}OG_{x,cyt}','FontSize',10,'FontName','Arial','Color',Blue);
        text(-2,0.25,'GlnKUMP_{1}OG_{x}','FontSize',10,'FontName','Arial','Color',Red);
    otherwise
        error('Unexpected GlnKY51A!');
end

subplot(2,3,2);
GlnKUMPx_cyt = sum([F(:,47) Y(:,6:8)],2);
hold on;
ax = gca; ax.ColorOrderIndex = 3;
plot(T,Y(:,7:8)./repmat(GlnKUMPx_cyt,1,2),'LineWidth',2);
ax = gca; ax.ColorOrderIndex = 3;
plot(T_exp,[GlnKUMP2_exp, GlnKUMP3_exp],'o','LineWidth',2,'markers',4);
xlabel('Time (min)','FontSize',10,'FontName','Arial');
ylabel('Rel. to GlnK_{cyt}','FontSize',10,'FontName','Arial');
xlim([-5 20]);
ylim([-0.1 1.5]);
set(gca,'XTick',-20:5:30);
set(gca,'YTick',0:0.5:5);
set(gca,'FontSize',10,'FontName','Arial');
set(gca,'TickLength',[0.03 0.070]);
box on;
switch GlnKY51A
    case 0
        text(2,1.2,'GlnKUMP_{2}OG_{x}','FontSize',10,'FontName','Arial','Color',Yellow);
        text(2,0.9,'GlnKUMP_{3}OG_{x}','FontSize',10,'FontName','Arial','Color',Purple);
        title('Wild Type');
    case 1
        text(0,0.6,'GlnKUMP_{2}OG_{x}','FontSize',10,'FontName','Arial','Color',Yellow);
        text(0,0.25,'GlnKUMP_{3}OG_{x}','FontSize',10,'FontName','Arial','Color',Purple);
        title('GlnK Y51A');
    otherwise
        error('Unexpected GlnKY51A!');
end

subplot(2,3,3);
plot(T,F(:,46)./param(3),'LineWidth',2);
hold on;
ax = gca; ax.ColorOrderIndex = 1;
plot(T_exp,GlnKAmtB_exp,'o','LineWidth',2,'markers',4);
xlabel('Time (min)','FontSize',10,'FontName','Arial');
ylabel('Rel. to AmtB_{total}','FontSize',10,'FontName','Arial');
xlim([-5 20]);
ylim([0 1.5]);
set(gca,'XTick',-20:5:30);
set(gca,'FontSize',10,'FontName','Arial');
set(gca,'TickLength',[0.03 0.070]);
box on;
text(6,0.75,'GlnKAmtB','FontSize',10,'FontName','Arial','Color',Blue);


subplot(2,3,4);
plot(T,F(:,37),':','LineWidth',2);
xlabel('Time (min)','FontSize',10,'FontName','Arial');
ylabel('Conc. (mM)','FontSize',10,'FontName','Arial');
xlim([-5 20]);
set(gca,'XTick',-20:5:30);
if GlnKY51A == 0
    ylim([0 2]); % WT
    set(gca,'YTick',-20:1:30);
else
    ylim([0 15]); % GlnK Y51A
    set(gca,'YTick',-20:5:30);
end
set(gca,'FontSize',10,'FontName','Arial');
set(gca,'TickLength',[0.03 0.070]);
box on;
switch GlnKY51A
    case 0
        text(5,1.5,'OG','FontSize',10,'FontName','Arial','Color',Blue);
    case 1
        text(3,10,'OG','FontSize',10,'FontName','Arial','Color',Blue);
    otherwise
        error('Unexpected GlnKY51A!');
end

subplot(2,3,5);
plot(T, F(:,41:44)*1e+3,'LineWidth',2);
xlabel('Time (min)','FontSize',10,'FontName','Arial');
ylabel('Conc. (\muM)','FontSize',10,'FontName','Arial');
xlim([-5 20]);
ylim([0 2]);
set(gca,'XTick',-20:5:30);
set(gca,'YTick',0:1:2);
set(gca,'FontSize',10,'FontName','Arial');
set(gca,'TickLength',[0.03 0.070]);
box on;
switch GlnKY51A
    case 0
        text(5,1.7,'GlnKUMP_{0}OG_{0}','FontSize',10,'FontName','Arial','Color',Blue);
        text(5,1.35,'GlnKUMP_{0}OG_{1}','FontSize',10,'FontName','Arial','Color',Red);
        text(5,1.0,'GlnKUMP_{0}OG_{2}','FontSize',10,'FontName','Arial','Color',Yellow);
        text(5,0.65,'GlnKUMP_{0}OG_{3}','FontSize',10,'FontName','Arial','Color',Purple);
    case 1
        text(2.5,2.11,'GlnKUMP_{0}OG_{0}','FontSize',10,'FontName','Arial','Color',Blue);
        text(2.5,1.76,'GlnKUMP_{0}OG_{1}','FontSize',10,'FontName','Arial','Color',Red);
        text(2.5,1.41,'GlnKUMP_{0}OG_{2}','FontSize',10,'FontName','Arial','Color',Yellow);
        text(2.5,1.06,'GlnKUMP_{0}OG_{3}','FontSize',10,'FontName','Arial','Color',Purple);
    otherwise
        error('Unexpected GlnKY51A!');
end

subplot(2,3,6);
semilogy(T,[F(:,25) Y(:,13)]*1e+3,'LineWidth',2);
xlabel('Time (min)','FontSize',10,'FontName','Arial');
ylabel('Conc. (\muM)','FontSize',10,'FontName','Arial');
xlim([-5 20]);
ylim([10^-3 10^3]);
set(gca,'XTick',-20:5:30);
set(gca,'YTick',10.^(-11:2:10));
set(gca,'FontSize',10,'FontName','Arial');
set(gca,'TickLength',[0.03 0.070]);
box on;
switch GlnKY51A
    case 0
        text(10,0.08,'NH_{x,ext}','FontSize',10,'FontName','Arial','Color',Blue);
        text(10,2,'NH_{x,int}','FontSize',10,'FontName','Arial','Color',Red);
    case 1
        text(10,0.06,'NH_{x,ext}','FontSize',10,'FontName','Arial','Color',Blue);
        text(10,2,'NH_{x,int}','FontSize',10,'FontName','Arial','Color',Red);
    otherwise
        error('Unexpected GlnKY51A!');
end
