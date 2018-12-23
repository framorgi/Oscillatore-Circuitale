function xp = osc(t,x)
% Sistema Osc1llatore circuitale
%tre eq diff, una per ogni coordinata
%   a=8.3;
%   b=14;
global a b;
xp = zeros(3, 1);
xp(1) = a*x(2) - (a/16)*x(1).^3 + (a/6)*x(1);
xp(2) = x(1)- x(2)+x(3);
xp(3)= -b*x(2);

%Devo restituire un vettore colonna per la ode45
%xp=xp(:);