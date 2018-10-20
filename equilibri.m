
%calcolo le radici del campo vettoriale

%%ehm no,non so farlo,  gliele diamo già fatte a mano  nel vettore xeq

%stabilità degli equilibri- Occhio la jacobiana è parametrica ma gli
%equilibri nel vettore sono stati calcolati usando 
%a=7;
%b=14;
xeq=[-sqrt(16/6),0,sqrt(16/6);sqrt(16/6),0,-sqrt(16/6);0,0,0];

a=7;
b=14;
J = jac(xeq,a,b);
A=zeros (3,3);
%for K=1:size(eq,1)
A(:,1)=eig(J(:,:,1));
A(:,2)=eig(J(:,:,2));
A(:,3)=eig(J(:,:,3));
%end


for k=1:3
figure;
plot (A(:,k),'xb');
ax = gca;
ax.XAxis.Color = 'r';
ax.YAxis.Color = 'r';
ax.XGrid = 'on';

ax.YGrid = 'on';

hold on;
end


