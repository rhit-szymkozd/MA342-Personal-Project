function [OS, xss] = performanceCriteria(x)
% find xp and its index in xdata
[xp, ~] = max(x);    
% find steady state position
xss = x(end);                               % m
% calculate overshoot proportion (not %)
OS = (xp-xss)/xss;                              % unitless
end