function [ T, Y, F ] = runSimulation(ode,odeaux,span,y0,param,options)

f = @(t,x)ode(t,x,param,odeaux);
[T, Y] = ode15s(f,span,y0,options);

n = length(T);
for i = 1:n
    F(i,:) = odeaux(T(i),Y(i,:),param);
end
