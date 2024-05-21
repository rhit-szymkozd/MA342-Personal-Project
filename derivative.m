function dxdt = derivative(x, dt) % returns vector of 2nd order backwards difference derivatives
dxdt = (x(1:(end-2)) - 4*x(2:(end-1)) + 3*x(3:end))/2/dt;
end