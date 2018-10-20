
%dati a e b e il vett xeq calcola la jacobiana e gli auovalori

a=7;
b=14;
xeq=[-sqrt(16/6),0,sqrt(16/6)];
J = lvjac(xeq,a,b);

A=eig(J);
