clc
clear variables
close all

%% Pendulum
col = DefineColor();

dt = 0.01;
g = 9.81;
L = 1;

v = [pi/4;0];
t = 0;
for i = 2:200
t(i) = i*dt;
v(:,i) = v(:, i - 1) + dt*[v(2, i - 1);-g/L*sin(v(1,i-1))];
end

theta = v(1,:);
% plot(t,theta);
% grid on
r = L*[sin(theta); -cos(theta)];

% plot(r(1,:),r(2,:))
% axis equal

ax  = [-1 1 -1.5 0];
figure; hold on; axis equal; grid on
set(gcf,'Position',[0 300 600 450])
title("Pendulum")
for i = 1:length(r)
cla
plot([0;r(1,i)],[0;r(2,i)],'LineWidth',4,'Color', 'r');
axis equal
axis(ax)
drawnow
end