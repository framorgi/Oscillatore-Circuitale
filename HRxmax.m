function [value,isterminal,direction] = HRxmax(t,x)

value =x(1)-x(2)+x(3);
isterminal = 0;
direction = -1;
% funzione che trova i massimi nella direzione -1