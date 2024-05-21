clc
clear variables
close all

%% Pendulum with control moment
col = DefineColor();

tEnd = 5;

kp = 5;
ki = 5;
kd = 3;

dt = 0.02;
g = 9.81;
L = 1;  % m
m = 1;  % kg
J = 1/12*m*L^2;

M(1) = 0;
r = pi/2;          % set point
v = [pi/2;0];   % initial conditions
e(1) = r - v(1,1);
t = 0;
i = 2;
while t(end) < tEnd
t(i) = i*dt;
v(:,i) = v(:, i - 1) + dt*[v(2, i - 1);(M(end)-m*g*L/2*sin(v(1, i-1)))];
if(i>3)
e(i) = r - v(1,i);
M(i) = customPID(e, kp, ki, kd, dt);
end
i = i + 1;

end

theta = v(1,:);
% plot(t,theta);
% grid on
xy = L*[sin(theta); -cos(theta)];

[OS, xss] = performanceCriteria(theta)

% plot(r(1,:),r(2,:))
% axis equal

ax  = [-1 1 -1 1];
figure; hold on; axis equal; grid on
set(gcf,'Position',[0 300 600 450])
title("Pendulum")
for i = 1:length(xy)
cla
plot([0;xy(1,i)],[0;xy(2,i)],'LineWidth',4,'Color', 'r');
text(0, 0.8, "Time " + t(i));
axis equal
axis(ax)
drawnow
exportgraphics(gcf,'PIDnonzero.gif','Append',true);
end

figure
plot(t,theta*180/pi)
xlabel("Time (sec)")
ylabel("Theta (deg)")
title("Response")
% yline(r*180/pi)