function f = calcMSE(T_sim,Y_sim,T_exp,Y_exp)

Y_sim = interp1(T_sim,Y_sim,T_exp);
f = mean( mean( ( ( Y_sim - Y_exp ) ./ Y_exp ) .^ 2 ) );
