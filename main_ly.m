% Programma per il calcolo degli esponenti di Lyapunov

% Dimensione del vettore di stato
n = 3;
% Istanti iniziale e finale
tstart = 0;
tend = 200;
% Passo sulla variabile t per la procedura di rinormalizzazione di
% Gram-Schmidt
stept = 0.5;
%for k = 1:7 % calcolo nei te punti equilibrio togliere il commento da
%questa  riga, dall'ultima "end" e commentare quella sotto 
k=5;
    % Condizione iniziale per la traiettoria
X0 = I0(k,:);
% Passo di stampa sulla finestra di comando
ioutp = 10;
a= 7;
b = 14;
c=0;    % per inganno

par = [a,b,c];

% Chiamo la funzione che effettua l'integrazione numerica e il calcolo
% degli esponenti di Lyapunov dalla traiettoria calcolata
[T1,Res]=lyapunov(n,@lorenz_ext,@ode45,tstart,stept,tend,X0,ioutp,par);

% integrazione numerica
opt = odeset('RelTol', 1.0e-5, ...
             'Refine', 32);
[T2, X] = ode45(@osc, [0 100], X0, opt, par);

% Grafico degli esponenti di Lyapunov al variare del tempo
figure ('Name','Grafico degli esponenti di Lyapunov');
%for k=1:3
    %subplot(3,1,1);
% plot(T1,Res, 'DisplayName','RES');

plot(T1,Res(:,1),'r',T1,Res(:,2),'g',T1,Res(:,3),'b' ); 
str = ('Grafico degli esponenti di Lyapunov al variare del tempo');
   title(str);
   xlabel('time');
   ylabel('value');
hold on;
plot([tstart tend],[0,0],'k');
%plot ('displayName', ' red res1');
%end
% Grafico della traiettoria nello spazio di stato
%subplot(3,1,2);
figure('Name','TRAIETTORIE NELLO SPAZIO DI STATO');

plot3(X(:,1),X(:,2),X(:,3),'b');
str = ('TRAIETTORIE NELLO SPAZIO DI STATO');
   title(str);
   xlabel('X');
   ylabel('Y');
   zlabel ('Z');
hold on;

% Grafico di x(t) nel tempo
%subplot(3,1,3);
figure('Name','grafico di x(t) nel tempo');
plot(T2, X(:,1),'b');
str = ('grafico di x(t) nel tempo');
   title(str);
   xlabel('time');
   ylabel('value')
%end