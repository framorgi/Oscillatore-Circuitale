function J = jac(x,a,b)
% J = vdpjac(x,p)
% 
% Matrice Jacobiana del modello di van der Pol.
% 
% Argomenti:
%  x - stato del sistema.
%  a,b - parametri.
% 

% alloco un tensore  3x3x3 (voglio 3 jacobiane perchè linearizzo attorno 3 punti
% di equilibrio
J = zeros(3,3,3);
for k=1:size(x,1)
J(1,1,k) = (-3/16)*a*x(1,k)^2+(a/6);
J(1,2,k) = a;
J(1,3,k) = 0;
J(2,1,k) = 1;
J(2,2,k) = -1;
J(2,3,k) = 1;
J(3,1,k) = 0;
J(3,2,k) = -b;
J(3,3,k) = 0;
end