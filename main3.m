3% Campo vettoriale per il sistema di Lotka-Volterra 

%Definisco la griglia di punti su cui calcolare il campo vettoriale
maxX=3.5; M=15;
maxY=2.5; N=15;
[x,y]=meshgrid(linspace(0,maxX,M),linspace(0,maxY,N));

%Inizializzo i vettori con le componenti del campo vettoriale
xp=zeros(M,N);
yp=zeros(M,N);
%Calcolo il campo vettoriale
xp=x.*(3-x-2*y);
yp=y.*(2-x-y);

%Disegno il campo vettoriale. La funzione di Matlab quiver disegna vettori 
%velocit? come frecce con componenti (xp,yp) nei punti (x,y). Il quinto 
%parametro ? un fattore di scala
figure;
quiver(x,y,xp,yp,3);
xlabel('x');
ylabel('y');