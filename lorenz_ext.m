% Funzione in cui definisco il sistema di Lorenz e il sistema linearizzato
function f=lorenz_ext(t,X,par)

a = 7;
b= 14;

x=X(1); y=X(2); z=X(3);

Y= [X(4), X(7), X(10);
    X(5), X(8), X(11);
    X(6), X(9), X(12)];
f=zeros(9,1);                                  %vettore con 9 elementi 
f(1)=7*y-(7/16)*x.^3+(7/6)*y; f(2)=x-y+z; f(3)=-14*y;
%f(1)=a*(y-x); f(2)=-x*z+b*x-y; f(3)=x*y-b*z;

Jac=[(-3/16)*a*x^2+(a/6),a,0;1,-1,1;0,-b,0];       %[-sigma,sigma,0; r-z,-1,-x; y, x,-b];

f(4:12)=Jac*Y;