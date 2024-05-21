function intxdt = integral(x, dt) % returns vector of cumulative integral
for i = 1:length(x)
intxdt(i) = (x(1)/2 + sum(x(2:i-1)) + x(i)/2)*dt;
end
end
