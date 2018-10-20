function xp = lvol(t,x )
% Sistema di Lotka-Volterra
% modello di due specie in competizione
% per una risorsa condivisa
xp(1) = 7*x(2) - (7/16)*x(1).^3 + (7/6)*x(1);
xp(2) = x(1)- x(2)+x(3);
xp(3)= -14*x(2);
%Devo restituire un vettore colonna per la ode45
xp=xp(:);