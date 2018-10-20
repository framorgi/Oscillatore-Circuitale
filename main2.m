fa%Sapendo che i punti di equilibrio del sistema di Lotka-Volterra sono
%(0,0), (0,2), (3,0) e (1,1), determino il tipo di stabilità per ciascuno
%di essi.

%Disegno le curve significative sul piano (Delta,tau)
figure;
hold on;
plot([0 0],[-6 6],'r','linewidth',2);
plot([0 8],[0 0],'b','linewidth',2);
tau=linspace(0,6,100);
delta=tau.^2/4;
plot(delta,tau,'g','linewidth',2);
plot(delta,-tau,'g','linewidth',2);

%Ricavo tau e delta per la matrice Jacobiana calcolata negli equilibri e
%disegno il punto sul piano (Delta,tau)
eq=[0 0;
    0 2;
    3 0;
    1 1];
color=['r' 'b' 'g' 'm'];
for k=1:size(eq,1)
    Tau(k)=trace(lvjac(eq(k,:)));
    Delta(k)=det(lvjac(eq(k,:)));
    plot(Delta(k),Tau(k),'o','color',color(k));
end;
axis([-2 8 -6 6]);
xlabel('Delta');
ylabel('tau');