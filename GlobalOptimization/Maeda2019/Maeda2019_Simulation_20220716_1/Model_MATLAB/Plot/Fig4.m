function Fig4(filename,CarbonSource)

%% Load data
load(filename);

%% Color setting
Blue = [ 0 0.4470 0.7410 ];
Red = [ 0.8500 0.3250 0.0980 ];
Yellow = [ 0.9290 0.6940 0.1250 ];
Black = [ 0 0 0 ];

%% Different carbon sources
switch CarbonSource
    
    case 'Glycerol' % Fig4def
        Fout0 = F_out_Glycerol_WT;
        Fout1 = F_out_Glycerol_deltaAmtB;
        
    case 'Glucose' % Fig4abc
        Fout0 = F_out_Glucose_WT;
        Fout1 = F_out_Glucose_deltaAmtB;
        
    case 'G6P_Gluconate' % Fig4ghi
       Fout0 = F_out_G6P_Gluconate_WT;
       Fout1 = F_out_G6P_Gluconate_deltaAmtB;
       
    otherwise
        error('Unexpected CarbonSource!');
        
end

%% Plot
figure('Position',[100 40 220 580]);

%% NH4ext vs. mu
subplot(3,1,1);
plot(Fout0(:,32)*1e+3,Fout0(:,60)*60,Fout1(:,32)*1e+3,Fout1(:,60)*60,'LineWidth',1.75);
hold on;
ax = gca;
ax.ColorOrderIndex = 1;
[Glycerol, Glucose, G6P_Gluconate] = ExpDataOfKim2012Fig3A();
switch CarbonSource
    case 'Glycerol'
        plot(Glycerol.WT.NH4ext*1e+3,Glycerol.WT.mu*60,'o',Glycerol.deltaAmtB.NH4ext*1e+3,Glycerol.deltaAmtB.mu*60,'o','LineWidth',1,'markers',4);
        title('Glycerol');
        text(5,0.8,'WT','FontSize',10,'FontName','Arial','Color',Blue);
        text(10,0.2,'\DeltaAmtB','FontSize',10,'FontName','Arial','Color',Red);
    case 'Glucose'
        plot(Glucose.WT.NH4ext([2:3 5:end-1])*1e+3,Glucose.WT.mu([2:3 5:end-1])*60,'o',Glucose.deltaAmtB.NH4ext([1:5 7:end])*1e+3,Glucose.deltaAmtB.mu([1:5 7:end])*60,'o','LineWidth',1,'markers',4);
        title('Glucose');
        ax.ColorOrderIndex = 1;
        plot([Glucose.WT.NH4ext([1 4 end]); 0.060]*1e+3,[Glucose.WT.mu([1 4 end]); 0.0133]*60,'x',Glucose.deltaAmtB.NH4ext(6)*1e+3,Glucose.deltaAmtB.mu(6)*60,'x','LineWidth',2,'markers',8);
        text(5,1,'WT','FontSize',10,'FontName','Arial','Color',Blue);
        text(20,0.3,'\DeltaAmtB','FontSize',10,'FontName','Arial','Color',Red);
    case 'G6P_Gluconate'
        plot(G6P_Gluconate.WT.NH4ext*1e+3,G6P_Gluconate.WT.mu*60,'o',G6P_Gluconate.deltaAmtB.NH4ext*1e+3,G6P_Gluconate.deltaAmtB.mu*60,'o','LineWidth',1,'markers',4);
        title('G6P + Gluconate');
        text(5,1.05,'WT','FontSize',10,'FontName','Arial','Color',Blue);
        text(20,0.3,'\DeltaAmtB','FontSize',10,'FontName','Arial','Color',Red);
    otherwise
        error('Unexpected CarbonSource!');
end
set(gca,'Xscale','log');
set(gca,'FontSize',11,'FontName','Arial');
xlabel('NH_4^+_{ext} (\muM)','FontSize',11,'FontName','Arial');
ylabel('\mu (h^{-1})','FontSize',11,'FontName','Arial');
% legend('WT','\DeltaAmtB');
xlim([3.4 1.2e+3]);
ylim([0 1.2]);
set(gca,'XTick',10.^(0:3));
set(gca,'YTick',0:0.4:1.2);
set(gca,'TickLength',[0.04 0.070]);
hold off;

%% NH4ext vs. NH4int
subplot(3,1,2);
plot(Fout0(:,32)*1e+3,Fout0(:,34)*1e+3,Fout1(:,32)*1e+3,Fout1(:,34)*1e+3,'LineWidth',1.75);
hold on;
ax = gca;
ax.ColorOrderIndex = 1;
[Glycerol, Glucose, G6P_Gluconate] = ExpDataOfKim2012Fig3C();
switch CarbonSource
    case 'Glycerol'
        plot(Glycerol.WT.NH4ext*1e+3,Glycerol.WT.NH4int*1e+3,'o',Glycerol.deltaAmtB.NH4ext*1e+3,Glycerol.deltaAmtB.NH4int*1e+3,'o','LineWidth',1,'markers',4);
        text(5,40,'WT','FontSize',10,'FontName','Arial','Color',Blue);
        text(15,4,'\DeltaAmtB','FontSize',10,'FontName','Arial','Color',Red);
    case 'Glucose'
        plot(Glucose.WT.NH4ext([2:3 5:end])*1e+3,Glucose.WT.NH4int([2:3 5:end])*1e+3,'o',Glucose.deltaAmtB.NH4ext*1e+3,Glucose.deltaAmtB.NH4int*1e+3,'o','LineWidth',1,'markers',4);
        ax.ColorOrderIndex = 1;
        plot([ Glucose.WT.NH4ext([1 4]); 0.060 ]*1e+3,[ Glucose.WT.NH4int([1 4]); 0.035 ]*1e+3,'x','LineWidth',2,'markers',8);
        text(5,50,'WT','FontSize',10,'FontName','Arial','Color',Blue);
        text(15,4,'\DeltaAmtB','FontSize',10,'FontName','Arial','Color',Red);
    case 'G6P_Gluconate'
        plot(G6P_Gluconate.WT.NH4ext*1e+3,G6P_Gluconate.WT.NH4int*1e+3,'o',G6P_Gluconate.deltaAmtB.NH4ext*1e+3,G6P_Gluconate.deltaAmtB.NH4int*1e+3,'o','LineWidth',1,'markers',4);
        text(10,90,'WT','FontSize',10,'FontName','Arial','Color',Blue);
        text(15,4,'\DeltaAmtB','FontSize',10,'FontName','Arial','Color',Red);
    otherwise
        error('Unexpected CarbonSource!');
end
set(gca,'Xscale','log');
set(gca,'Yscale','log');
set(gca,'FontSize',11,'FontName','Arial');
xlabel('NH_4^+_{ext} (\muM)','FontSize',11,'FontName','Arial');
ylabel('NH_4^+_{int} (\muM)','FontSize',11,'FontName','Arial');
% legend('WT','\DeltaAmtB');
xlim([3.4 1.2e+3]);
ylim([1e+0 1e+3]);
set(gca,'XTick',10.^(0:3));
set(gca,'YTick',10.^(0:3));
set(gca,'TickLength',[0.04 0.070]);
hold off;

%% NH4ext vs. Flux (WT)
subplot(3,1,3);
plot([3 2e+3],[0 0],'k');
hold on;
plot(Fout0(:,32)*1e+3,Fout0(:,18:19),'-','LineWidth',1.75);
plot(Fout0(:,32)*1e+3,Fout0(:,18)+Fout0(:,19),'--','LineWidth',1.75);
ax = gca;
ax.ColorOrderIndex = 1;
[Glycerol, Glucose, G6P_Gluconate] = ExpDataOfKim2012Fig2E();
switch CarbonSource
    case 'Glycerol'
        plot(Glycerol.NH4ext*1e+3,[Glycerol.Jamtb Glycerol.Jdiff Glycerol.Jnet],'o','LineWidth',1,'markers',4);
        text(5,450,'v_{amtb}','FontSize',10,'FontName','Arial','Color',Blue);
        text(5,-400,'v_{diff}','FontSize',10,'FontName','Arial','Color',Red);
        text(30,300,'v_{net}','FontSize',10,'FontName','Arial','Color',Yellow);
    case 'Glucose'
        plot(Glucose.NH4ext([2,3,5:end])*1e+3,Glucose.Jamtb([2,3,5:end]),'o','LineWidth',1,'markers',4);
        plot(Glucose.NH4ext*1e+3,Glucose.Jdiff,'o','LineWidth',1,'markers',4);
        plot(Glucose.NH4ext*1e+3,Glucose.Jnet,'o','LineWidth',1,'markers',4);
        ax.ColorOrderIndex = 1;
        plot([ Glucose.NH4ext([1,4]); 0.06 ]*1e+3,[Glucose.Jamtb([1,4]); 4],'x','LineWidth',2,'markers',8);
        text(5,600,'v_{amtb}','FontSize',10,'FontName','Arial','Color',Blue);
        text(5,-500,'v_{diff}','FontSize',10,'FontName','Arial','Color',Red);
        text(50,300,'v_{net}','FontSize',10,'FontName','Arial','Color',Yellow);
    case 'G6P_Gluconate'
        plot(G6P_Gluconate.NH4ext*1e+3,[G6P_Gluconate.Jamtb G6P_Gluconate.Jdiff G6P_Gluconate.Jnet],'o','LineWidth',1,'markers',4);
        text(50,500,'v_{amtb}','FontSize',10,'FontName','Arial','Color',Blue);
        text(50,-500,'v_{diff}','FontSize',10,'FontName','Arial','Color',Red);
        text(300,300,'v_{net}','FontSize',10,'FontName','Arial','Color',Yellow);
    otherwise
        error('Unexpected CarbonSource!');
end
set(gca,'Xscale','log');
set(gca,'FontSize',11,'FontName','Arial');
xlabel('NH_4^+_{ext} (\muM)','FontSize',11,'FontName','Arial');
ylabel('Flux (mM/min)','FontSize',11,'FontName','Arial');
xlim([3.4 1.2e+3]);
ylim([-800 800]);
set(gca,'XTick',10.^(0:3));
set(gca,'YTick',-1200:400:1200);
% legend('v_{amtb}','v_{diff}','v_{net}');
set(gca,'TickLength',[0.04 0.070]);
hold off
text(300,600,'WT','FontSize',10,'FontName','Arial','Color',Black);
