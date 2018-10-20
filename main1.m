
clear all;

%Studio numerico del modello di Lotka-Volterra che descrive la competizione
%tra due specie (p.es., x conigli, y pecore) per una risorsa condivisa
%(p.es. erba).

%Integro numericamente il sistema a partire dalle condizioni
%iniziali contenute nella matrice I0, che deve essere nel workspace.
load I0;
%Inizializzo un tensore in cui memorizzero' le traiettorie (5000 punti
%ciascuna) a partire dalle diverse condizioni iniziali contenute nella
%matrice I0. Ciascuna traiettoria ha 3 componenti (x e y e z)
x=zeros([5000 3 size(I0,1)]);
a=7;
b=14;
%Lascio le opzioni di default per l'integratore e itero al variare della
%condizione iniziale
for k=1:size(I0,1)
    [t,x(:,:,k)]=ode45('lvol',linspace(0,10,5000),I0(k,:));
end

%Ora disegno tutte le traiettorie sul piano di stato, per avere un'idea del
%quadro di stato

for k=1:size(I0,1)
    
   plot3(x(:,1,k),x(:,2,k),x(:,3,k),'-',... 
   x(1,1,k),x(1,2,k),x(1,3,k),'og',...
   x(end,1,k),x(end,2,k),x(end,3,k),'ob',...
   'LineWidth',1);

 
ax = gca;
ax.ZGrid = 'on';
ax.XGrid = 'on';
ax.YGrid = 'on';
   hold on;

end

 