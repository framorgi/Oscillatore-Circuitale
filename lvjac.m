function J = vdpjac(x,a,b)
% J = vdpjac(x,p)
% 
% Matrice Jacobiana del modello di van der Pol.
% 
% Argomenti:
%  x - stato del sistema.
%  p - parametro.
% 

% alloco una matrice 2x2
J = zeros(3,3);

J(1,1) = (-3/16)*a*x(1)^2+(a/6);
J(1,2) = a;
J(1,3) = 0;
J(2,1) = 1;
J(2,2) = -1;
J(2,3) = 1;
J(3,1) = 0;
J(3,2) = -b;
J(3,3) = 0;


