function u = customPID(e, kp, ki, kd, dt)
dx = derivative(e, dt);
intx = integral(e,dt);
u = kp*e(end) + ki*intx(end) + kd*dx(end);
end