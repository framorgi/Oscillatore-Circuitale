

clear all;
close all;
clc;

%calcolo sezioni di poincare al variare dei parametri trovati 

%Integro numericamente il sistema a partire dalle condizioni
%iniziali contenute nella matrice I0, che deve essere nel workspace.
load I0;
 I0(1,1)= 0;
 I0(1,2)= 0.1;
 I0(1,3)= 0;
% I0(2,1)= sqrt(16/6);
% I0(2,2)= 0;
  I0(3,1)= -sqrt(16/6);
  I0(3,2)= 0;
  I0(3,3)= sqrt(16/6);

%Inizializzo un tensore in cui memorizzero' le traiettorie (5000 punti
%ciascuna) a partire dalle diverse condizioni iniziali contenute nella
%matrice I0. Ciascuna traiettoria ha 3 componenti (x e y e z)
x=zeros([5000 3 size(I0,1)]);
%a=;
%b=14;
%Lascio le opzioni di default per l'integratore e itero al variare della
%condizione iniziale
for k=1:size(I0,1)
    [t,x(:,:,k)]=ode45('osc',linspace(0,100,5000),I0(k,:));
end


%Ora disegno tutte le traiettorie nello SPAZIO DI STATO

figure('Name','TRAIETTORIE NELLO SPAZIO DI STATO 3');
for k=1:size(I0,1)
 
   plot3(x(:,1,k),x(:,2,k),x(:,3,k),'-',... 
   x(1,1,k),x(1,2,k),x(1,3,k),'og',...
   x(end,1,k),x(end,2,k),x(end,3,k),'ob',...
   'LineWidth',1);

 %titoli e labels
   str = ('TRAIETTORIE NELLO SPAZIO DI STATO ');
   title(str);
   xlabel('x1');
   ylabel('x2');
   zlabel('x3');
  %axis setting        
   ax = gca;
   ax.ZGrid = 'on';
   ax.XGrid = 'on';
   ax.YGrid = 'on';
   box on;
   hold on;
   
   
   


end
figure('Name','TRAIETTORIE NELLO SPAZIO DI STATO con paincare');
for k=1:size(I0,1)
 
%  

 %titoli e labels
   str = ('TRAIETTORIE NELLO SPAZIO DI STATO con piani di poincare con dZ=0');
   title(str);
   xlabel('x1');
   ylabel('x2');
   zlabel('x3');
  %axis setting        
   ax = gca;
   ax.ZGrid = 'on';
   ax.XGrid = 'on';
   ax.YGrid = 'on';
   box on;
   hold on;
   
   
   
%DISEGNO POINCARRÉ per terza equazione
[ t,cycle,TE,XE] = ComputeCycle(@osc,@HRxmaxy,@jac,1e-2,[1,1000],I0(1,:));
[xp,zp] = meshgrid(linspace(min(cycle(:,1))*1.1,max(cycle(:,1))*1.1,100),...
linspace(min(cycle(:,3))*1.1,max(cycle(:,3))*1.1,100)); 

%yp = (1/16) * xp.^3 - xp/16;
% yp= xp.^3/16-xp/6;
yp = zp+xp;
%yp=0;
 
surf(xp,yp,zp,'FaceColor','g','EdgeColor','r');
plot3(cycle(:,1),cycle(:,2),cycle(:,3),'k','LineWidth',3);  


%     val= [ I0(1,:)];
% disp (val);   
% val1= [ I0(2,:)];
% disp (val1);

end
prova_massimi;
%Grafico i picchi 
% figure;
% [f,e]= dsfindpeaks(cycle(:,2));
% plot(t,cycle(:,2),'r',TE,XE(:,2),'*'); 

 