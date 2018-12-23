

clear all;
close all;
clc;
global a b
a=7;
b=14;

%Studio numerico del modello di Lotka-Volterra che descrive la competizione
%tra due specie (p.es., x conigli, y pecore) per una risorsa condivisa
%(p.es. erba).

%Integro numericamente il sistema a partire dalle condizioni
%iniziali contenute nella matrice I0, che deve essere nel workspace.
load I0;
% I0(1,1)= sqrt(16/6);
% I0(1,2)= 0;
% I0(1,3)= sqrt(16/6);
% I0(2,1)= sqrt(16/6);
% I0(2,2)= 0;
% I0(2,3)= -sqrt(16/6);
% I0(3,1)= -sqrt(16/6);
% I0(3,3)= sqrt(16/6);

%Inizializzo un tensore in cui memorizzero' le traiettorie (5000 punti
%ciascuna) a partire dalle diverse condizioni iniziali contenute nella
%matrice I0. Ciascuna traiettoria ha 3 componenti (x e y e z)
x=zeros([5000 3 size(I0,1)]);
% a=7;
% b=15;
% %Lascio le opzioni di default per l'integratore e itero al variare della
%condizione iniziale
for k=1:size(I0,1)
    [t,x(:,:,k)]=ode45('osc',linspace(0,100,5000),I0(k,:));
end

%SOLUZIONE NEL TEMPO per ogni coordinata di stato
figure('Name','EVOLUZIONE NEL TEMPO PER OGNI COMPONENTE DI STATO');
 for k=1:size(I0,1)
    
          subplot(size(I0,1),1,k);
          %hold on;
          plot(t,x(:,1,k),'r',t,x(:,2,k),'g',t,x(:,3,k),'b' ); 
          
          %titoli e labels
          str = ['CI [x1=',num2str(x(1,1,k)),' x2=',num2str(x(1,2,k)),' x=',num2str(x(1,3,k)),']'];
          title(str);
          xlabel('Tempo');
          ylabel('Componenti di stato ');
          %axis setting
          
          ax = gca;
          ax.YGrid = 'on';
          ax.XGrid = 'on';
 end
%Ora disegno tutte le traiettorie nello SPAZIO DI STATO


figure('Name','TRAIETTORIE NELLO SPAZIO DI STATO 3');
for k=1:size(I0,1)
 
%    plot3(x(:,1,k),x(:,2,k),x(:,3,k),'-',... 
%    x(1,1,k),x(1,2,k),x(1,3,k),'og',...
%    x(end,1,k),x(end,2,k),x(end,3,k),'ob',...
%    'LineWidth',1);

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
% [ t,cycle,TE,XE] = ComputeCycle(@osc,@HRxmaxy,@jac,1e-2,[1,1000],I0(1,:));
% [xp,zp] = meshgrid(linspace(min(cycle(:,1))*1.1,max(cycle(:,1))*1.1,100),...
% linspace(min(cycle(:,3))*1.1,max(cycle(:,3))*1.1,100)); 

%yp = (1/16) * xp.^3 - xp/16;
%yp= xp.^3/16-xp/6;
% yp = zp+xp;
% %yp=0;
%  
% surf(xp,yp,zp,'FaceColor','g','EdgeColor','r');
% plot3(cycle(:,1),cycle(:,2),cycle(:,3),'k','LineWidth',3);  
% 



 
 %%plot3(cycle(:,1),cycle(:,2),cycle(:,3),'k','LineWidth',3); 

end

%Grafico i picchi 
% figure;
% [f,e]= dsfindpeaks(cycle(:,2));
% plot(t,cycle(:,2),'r',TE,XE(:,2),'*'); 

 