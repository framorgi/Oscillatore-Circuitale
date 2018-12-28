function out = foldnormalform
%
% Odefile of for the normal form of the Cusp bifurcation
%
out{1} = @init;
out{2} = @fun_eval;
out{3} = @jacobian;
out{4} = [];
out{5} = [];
out{6} = [];
out{7} = [];
out{8} = [];
out{9} = [];
%
% -------------------------------------------------------------------------
function [tspan,y0,options] = init
tspan = [0; 100];
y0 = zeros(1);
handles = feval(@foldnormalform);
options = odeset('Jacobian', handles(3));
%
% -------------------------------------------------------------------------
           
function dfdt = fun_eval(t, x, a,b)
%
dfdt = zeros(3,1);
dfdt(1) = a*x(2) - (a/16)*x(1).^3 + (a/6)*x(1);
dfdt(2) =  x(1)- x(2)+x(3);
dfdt(3) =  -b*x(2);
% -------------------------------------------------------------------------

function jac = jacobian(t, x, a, b)
jac = zeros(3);
jac(1,1) =  - a*(3/16)*x(1)^2 + (a/6);
jac(1,2) = a;
jac(1,3) = 0;
jac(2,1) = 1;
jac(2,2) = -1;
jac(2,3) = 1;
jac(3,1) = 0;
jac(3,2) =-b;
jac(3,3) = 0;
%
% -------------------------------------------------------------------------

