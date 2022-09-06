function [ y_out, param_out, Y_out, F_out ] = ...
    runSimulation_Kim(NH4ext_span, x, strain_no, deltaAmtB, CarbonSource, ode, odeaux, span, options)

global NH4ext_global;

n_point = length(NH4ext_span);

y_out = zeros(n_point,14);
param_out = zeros(n_point,112);
Y_out = zeros(n_point,14);
F_out = zeros(n_point,66);

for i = 1:n_point
    fprintf('Now simulating %d/%d ...\n',i,n_point);
    NH4ext_global = NH4ext_span(i);
    y = setInitConc();
    param = setParamSet(x);
    [y, param] = modifyInitConcAndParamSet_Kim(y, param, x, strain_no, NH4ext_global, deltaAmtB, CarbonSource);
    [ ~, Y, F ] = runSimulation(ode,odeaux,span,y,param,options);
    y_out(i,:) = y';
    param_out(i,:) = param';
    Y_out(i,:) = Y(end,:);
    F_out(i,:) = F(end,:);
%     printParamValues(y,param); % Use this line to print initial condition and parameter values.
end
