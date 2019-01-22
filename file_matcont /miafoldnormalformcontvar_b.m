clear all;
close all;
clc;

%% Continuazione dell'equilibrio e individuazione dei punti singolari
% valore dei parametro per cui si ha un solo equilibrio  funziona solo con
% partenza  0 0 0
global a b cds
a= 7;
b=14;
equil = [0;1;0 ];
p= [a;b];
%seleziono quale parametro variare 
% ap =1; %vario a
ap=2;  %vario b
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
%  opt = contset(opt, 'backward', 1);
% continuazione vera e propria
[xE,vE,sE,hE,fE] = cont(@equilibrium, x0, v0, opt);

% estendo il calcolo
[xE,vE,sE,hE,fE]=cont(xE,vE,sE,hE,fE,cds);
% estendo il calcolo
[xE,vE,sE,hE,fE]=cont(xE,vE,sE,hE,fE,cds);
%   grafico
figure;
cpl(xE,vE,sE,[4 1 3]);
str=sprintf('Continuazione dell''equilibrio %.2f %.2f %.2f al variare di a. valori di partenza a= %d b= %d' ,equil, a, b);
title(str);
xlabel('b'); ylabel('x'); %zlabel ('z');

% faccio continuazione backward solo se nel primo giro non ha individuato
% BP
% imposto le opzioni di continuazioni aggiungo backward
% 
% direzione;
  opt = contset(opt, 'backward', 1);
% continuazione vera e propria
[xEb,vEb,sEb,hEb,fEb] = cont(@equilibrium, x0, v0, opt);
% estendo il calcolo
[xEb,vEb,sEb,hEb,fEb]=cont(xEb,vEb,sEb,hEb,fEb,cds);
% estendo il calcolo
[xEb,vEb,sEb,hEb,fEb]=cont(xEb,vEb,sEb,hEb,fEb,cds);
%   grafico

cpl(xEb,vEb,sEb,[4 1 3]);

%% Salvataggio dati
save foldnormalformcont.mat
pause
%%prova continuazione Branch point   
x1=xEb(1:3,sEb(2).index);
p(ap)=xEb(4,sEb(2).index);
[x0,v0]=init_BP_EP(@oscillatore,x1,p,sEb(2),0.001);

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

%% Salvataggio dati
save foldnormalformcont_varb.mat