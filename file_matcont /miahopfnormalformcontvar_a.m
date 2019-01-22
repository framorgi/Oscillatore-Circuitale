clear all;
close all;
clc;

%% Continuazione dell'equilibrio e individuazione dei punti singolari
% valore dei parametro per cui si ha un solo equilibrio partendo da 1.6 0
% -1.6
global a b cds
a= 7;
b=14;
equil = [1.6;0;-1.6];
p= [a;b];%variabile con i parametri
%seleziono quale parametro variare 
ap =1; %vario a
% ap=2;  %vario b
% inizializzo la continuazione dell'equilibrio partendo da un equilibrio
[x0, v0] = init_EP_EP(@oscillatore, equil, p, ap);
% imposto le opzioni di continuazioni
opt = contset;
% >>>>>>>  singularities = 1 => rileva le biforcazioni
opt = contset(opt,'Singularities',1);
% numero massimo di passi di continuazioni
opt = contset(opt,'MaxNumPoints',1000);
% ampiezza massima del passo di continuazione
opt = contset(opt, 'MaxStepSize', 1e-8);
% direzione;
 % opt = contset(opt, 'backward', 1);
% continuazione vera e propria
[xE,vE,sE,hE,fE] = cont(@equilibrium, x0, v0, opt);

% estendo il calcolo
[xE,vE,sE,hE,fE]=cont(xE,vE,sE,hE,fE,cds);
%   grafico
figure;
cpl(xE,vE,sE,[4 1 3]);
str=sprintf('Continuazione dell''equilibrio %.2f %.2f %.2f al variare di a.parametri iniziali a=%d b=%d',equil, a, b);
title(str);
 xlabel('a'); ylabel('x'); zlabel ('z');
pause
% faccio continuazione backward solo se nella precedente non ha trovato
% nulla se no perdo i dati
% imposto le opzioni di continuazioni aggiungo backward
% % 
% % direzione;
  opt = contset(opt, 'backward', 1);
% % continuazione vera e propria
[xEb,vEb,sEb,hEb,fEb] = cont(@equilibrium, x0, v0, opt);
% % estendo il calcolo
[xEb,vEb,sEb,hEb,fEb]=cont(xEb,vEb,sEb,hEb,fEb,cds);
% %   grafico
% 
cpl(xEb,vEb,sEb,[4 1 3]);
pause
 %% Salvataggio dati
 
 save hopfnormalformcontvar_a.mat4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
% %% Continuazione primo BP  in forward

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
indice =sE(2).index;
x1=xE(1:3,indice);
p(ap)=xE(4,indice);
[x0,v0]=init_BP_EP(@oscillatore,x1,p,sE(2),0.001);

% imposto le opzioni di continuazioni
opt = contset;
% >>>>>>>  singularities = 1 => rileva le biforcazioni
opt = contset(opt,'Singularities',1);
% numero massimo di passi di continuazioni
opt = contset(opt,'MaxNumPoints',100);
% ampiezza massima del passo di continuazione
% opt = contset(opt, 'MaxStepSize', 1e-8);
opt=contset(opt,'InitStepsize',0.0001);
[x1,v1,s1,h1,f1]=cont(@equilibrium,x0,v0,opt);
cpl(x1,v1,s1,[4 1 3]);
opt=contset(opt,'Backward',1);
[x2,v2,s2,h2,f2]=cont(@equilibrium,x0,v0,opt);
cpl(x2,v2,s2,[4 1 3]);
pause
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
% %% Continuazione primo BP  in backward

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
indice =sEb(4).index;
x1=xE(1:3,indice);
p(ap)=xE(4,indice);
[x0,v0]=init_BP_EP(@oscillatore,x1,p,sEb(4),0.001);

% imposto le opzioni di continuazioni
opt = contset;
% >>>>>>>  singularities = 1 => rileva le biforcazioni
opt = contset(opt,'Singularities',1);
% numero massimo di passi di continuazioni
opt = contset(opt,'MaxNumPoints',100);
% ampiezza massima del passo di continuazione
% opt = contset(opt, 'MaxStepSize', 1e-8);
opt=contset(opt,'InitStepsize',0.0001);
[x1,v1,s1,h1,f1]=cont(@equilibrium,x0,v0,opt);
cpl(x1,v1,s1,[4 1 3]);
opt=contset(opt,'Backward',1);
[x2,v2,s2,h2,f2]=cont(@equilibrium,x0,v0,opt);
cpl(x2,v2,s2,[4 1 3]);
%
%
% secondo BP
indice =sEb(5).index;
x1=xE(1:3,indice);
p(ap)=xE(4,indice);
[x0,v0]=init_BP_EP(@oscillatore,x1,p,sEb(5),0.001);

% imposto le opzioni di continuazioni
opt = contset;
% >>>>>>>  singularities = 1 => rileva le biforcazioni
opt = contset(opt,'Singularities',1);
% numero massimo di passi di continuazioni
opt = contset(opt,'MaxNumPoints',100);
% ampiezza massima del passo di continuazione
% opt = contset(opt, 'MaxStepSize', 1e-8);
opt=contset(opt,'InitStepsize',0.0001);
[x1,v1,s1,h1,f1]=cont(@equilibrium,x0,v0,opt);
cpl(x1,v1,s1,[4 1 3]);
opt=contset(opt,'Backward',1);
[x2,v2,s2,h2,f2]=cont(@equilibrium,x0,v0,opt);
cpl(x2,v2,s2,[4 1 3]);
pause
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
% %% Continuazione primo LP  in forward

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
indice =sEb(2).index;
x1=xEb(1:3,indice);
p(ap)=xEb(4,indice);
[x0,v0]=init_LP_LP(@oscillatore,x1,p,[1,2]);

% imposto le opzioni di continuazioni
opt = contset;
% >>>>>>>  singularities = 1 => rileva le biforcazioni
opt = contset(opt,'Singularities',1);
% numero massimo di passi di continuazioni
opt = contset(opt,'MaxNumPoints',100);
% ampiezza massima del passo di continuazione
 opt = contset(opt, 'MaxStepSize', 0.025);
% opt=contset(opt,'InitStepsize',0.0001);
[x3,v3,s3,h3,f3]=cont(@limitpoint,x0,v0,opt);


opt=contset(opt,'Backward',1);
[x3b,v3b,s3b,h3b,f3b]=cont(@limitpoint,x0,v0,opt);
cpl(x3b,v3b,s3b,[4 1 3]);
cpl(x3,v3,s3,[4 1 3]);

% %% Continuazione del ciclo che nasce dalla Hopf
% 
% % indice, nel vettore delle soluzioni, della soluzioni corrispondente alla
% % hopf
% %%ATTENZIONE SE TROVA HOPF NEL BACKWARD I DATI SONO NELLA VARIABILE sE2  E
% %%OCCORRE VARIARE LO SCRIPT
% indice = sE(2).index;
% % coordinate dell'equilibrio nel punto di biforcazione
% ptH = xE(1:3,indice);
% % valore del parametro nel punto di biforcazione
% p(ap) = xE(4,indice);
% % norma iniziale del ciclo (qualsiasi valore "piccolo" va bene)
% h = 1e-4;
% % numero di punti sul ciclo
% ntst = 30;
% % numero di collocazioni tra ogni coppia di punti
% ncol = 4;
% % &%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % opzioni di continuazione
% opt = contset;
% opt = contset(opt, 'MinStepSize', 1e-4);
% opt = contset(opt, 'MaxNumPoints', 200);
% % continuazione dell'HOPF
% [xH,vH]=init_H_H(@oscillatore,ptH,p,[1 2]);
% [x4,v4,s4,h4,f4]=cont(@hopf,xH,vH,opt);
% 
%  figure;
% cpl(x4,v4,s4,[4 1 3]);
% 
% % inizializzo la continuazione del ciclo partendo dalla Hopf
% [x0, v0] = init_H_LC(@oscillatore, ptH, p, ap, h, ntst, ncol);
% % opzioni di continuazione
% opt = contset;
% opt = contset(opt, 'MinStepSize', 1e-4);
% opt = contset(opt, 'MaxNumPoints', 200);
% [xLC,vLC,sLC,hLC,fLC] = cont(@limitcycle, x0, v0, opt);
% %   grafico
% figure;
% plotcycle(xLC,vLC,sLC,[size(xLC,1) 1 2]);
% hold on;
% 
% title('Continuazione del ciclo al variare di $p$.','Interpreter','latex');
% xlabel('$a$','Interpreter','latex');
% ylabel('$x$','Interpreter','latex');
% zlabel('$y$','Interpreter','latex');
% 
 save hopfnormalformcontvar_a.mat4