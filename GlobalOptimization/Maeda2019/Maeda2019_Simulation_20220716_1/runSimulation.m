function [ T, Y ] = runSimulation(ode,odeaux,span,y0,param,options)

f = @(t,x)ode(t,x,param,odeaux);
% [T, Y] = ode15s(f,span,y0,options);
% [T, Y] = ode23s(f,span,y0,options);

options.AbsTol = 1e-6;
options.RelTol = 1e-6;
[T, Y] = odestb(f,span,y0,options);
