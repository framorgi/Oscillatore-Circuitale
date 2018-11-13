function J = HRjac(t, x)
%
%   J = HRjac(t, x, b, I, u, s)
%
%   Calcolo della matrice Jacobiana del sistema di Hindmarsh-Rose.
%   Argomenti:
%       t   istante di tempo (non utilizzato)
%       x   punto in cui si vogliono calcolare le derivate (vettore 3x1)
%       b   parametro b del sistema
%       I   parametro I del sistema
%       u   parametro u del sistema (generalmente nell'intervallo
%           [5e-3,1e-2]
%       s   parametro s del sistema (generalmente nell'intervallo [1,4]
%   Ritorna:
%       J   matrice (3x3) Jacobiana del sistema di Hindmarsh-Rose
%

if numel(x) ~= 3 || numel(b) ~= 1 || numel(I) ~= 1 || numel(u) ~= 1 || numel(s) ~= 1
    error('Errore nelle dimensioni degli argomenti.');
end


J = [ (-3/16)*7*x(1)^2+(7/6) ,  7 , 0 ;
     1              , -1 ,  1 ; 
         0              ,  -14 , 0 ];

