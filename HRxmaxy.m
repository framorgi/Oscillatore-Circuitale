function [value,isterminal,direction] = HRxmaxy(t,x,b, I, u, s)

%INSERISCO L'EQUAZIONE DEL SISTEMA COSÌ COME È

%value =x(1)-x(2)+x(3);
value = x(1)- x(2)+x(3);
isterminal = 0;
direction = -1;
% funzione che trova i massimi nella direzione -1