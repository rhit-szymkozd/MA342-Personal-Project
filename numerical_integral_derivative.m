clc
clear variables
close all

%% Numerical Integral and Derivative
dt = 0.1;
t = 0:dt:1;
n = length(t);
r = ones(1, n);
x = t.^3;
a_dx = 3*t.^2;
a_intx = 1/4*t.^4;

plot(t,x)
title("x")

dx = derivative(x, dt);
intx = integral(x, dt);

figure
plot(t(3:end),dx,'r.', t, a_dx, 'b-');
title("derivative")

figure
plot(t, intx, 'r.', t, a_intx, 'b-');
title("integral")
