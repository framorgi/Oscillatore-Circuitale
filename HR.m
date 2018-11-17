function xdot = HindmarshRose(t, x)
%
%   xdot = HindmarshRose(t, x, b, I, u, s)
%
%   Sistema di Hindmarsh-Rose.
%   Argomenti:
%       t   istante di tempo (non utilizzato, il sistema e' autonomo)
%       x   punto in cui si vogliono calcolare le derivate (vettore (3x1))
%       b   parametro b del sistema
%       I   parametro I del sistema
%       u   parametro u del sistema (generalmente nell'intervallo
%           [5e-3,1e-2]
%       s   parametro s del sistema (generalmente nell'intervallo [1,4]
%   Ritorna:
%       xdot    vettore (3x1) contenente il valore delle derivate.
%


xdot = zeros(3,1);
xdot(1,1) = 7*x(2) - (7/16)*x(1).^3 + (7/6)*x(1);
xdot(2,1) = x(1)- x(2)+x(3);
xdot(3,1) =  -14*x(2);

%scrivo isoclina 

y= x.^3/16-x/6;