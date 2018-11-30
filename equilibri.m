
%calcolo le radici del campo vettoriale

%%ehm no,non so farlo,  gliele diamo già fatte a mano  nel vettore xeq

%stabilità degli equilibri- Occhio la jacobiana è parametrica ma gli
%equilibri nel vettore sono stati calcolati usando 
%a=7;
%b=14;


clear all;
close all;
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%+++++++++++++++++++ GRAFICI DEGLI AUTOVALORI - Uno per ogni equilibrio +++++++++++++++++++++ 
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% xeq=[-sqrt(16/6),0,sqrt(16/6);sqrt(16/6),0,-sqrt(16/6);0,0,0];
% 
% a=7;
% b=14;
% J = jac(xeq,a,b);
% 
% 
% A=zeros (3,3);
% for K=1:size(xeq,3)
% A(:,1)=eig(J(:,:,1)); % una volta per ogni punto di eq
% A(:,2)=eig(J(:,:,2));
% A(:,3)=eig(J(:,:,3));
% end
% 
% 
% for k=1:3
% figure;
% plot (A(:,k),'ob','MarkerSize', 10);
% ax = gca;
% ax.XAxisLocation= 'origin';
% ax.YAxisLocation= 'origin';
% ax.XAxis.Color = 'r';
% ax.YAxis.Color = 'r';
% ax.XGrid = 'on';
% ax.YGrid = 'on';
% ax.XAxis.LineWidth=2;
% ax.YAxis.LineWidth=2;
% 
% hold on;
% end
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%+++++++++++++++++++ GRAFICO PARAMETRICI DEGLI AUTOVALORI - Uno per equilibrio ++++++++++++++
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

xeq=[0,0,0];
b=14;

a=-20;

J=jac(xeq,a,14)  ; 
plot (eig(J(:,:,1)),'og','MarkerSize',10);
ax = gca;
ax.XAxisLocation= 'origin';
ax.YAxisLocation= 'origin';
ax.XAxis.Color = 'r';
ax.YAxis.Color = 'r';
ax.XGrid = 'on';
ax.YGrid = 'on';
ax.XAxis.LineWidth=2;
ax.YAxis.LineWidth=2;
hold on
for a=a:40
 J=jac(xeq,a,14)  ; 
plot (eig(J(:,:,1)),'xb','MarkerSize',7);

if a==0 
    plot(eig(J(:,:,1)),'xr','MarkerSize',14);
end
ax = gca;
ax.XAxisLocation= 'origin';
ax.YAxisLocation= 'origin';
ax.XAxis.Color = 'r';
ax.YAxis.Color = 'r';
ax.XGrid = 'on';
ax.YGrid = 'on';
ax.XAxis.LineWidth=2;
ax.YAxis.LineWidth=2;
hold on
end