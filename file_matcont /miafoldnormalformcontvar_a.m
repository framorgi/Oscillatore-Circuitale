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
ap =1; %vario a
% ap=2;  %vario b
% inizializzo la continuazione dell'equilibrio partendo da un equilibrio
[x0, v0] = init_EP_EP(@oscillatore, equil, p, ap);
% imposto le opzioni di continuazioni
opt = contset;
% >>>>>>>  singularities = 1 => rileva le biforcazioni
opt = contset(opt,'Singularities',1);
% numero massimo di passi di continuazioni
opt = contset(opt,'MaxNumPoints',500);
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
xlabel('b'); ylabel('x'); zlabel ('z');

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
x1=xE(1:3,sE(2).index);
p(ap)=xE(4,sE(2).index);
[x0,v0]=init_BP_EP(@oscillatore,x1,p,sE(2),0.001);

% imposto le opzioni di continuazioni
opt = contset;
% >>>>>>>  singularities = 1 => rileva le biforcazioni
opt = contset(opt,'Singularities',1);
% numero massimo di passi di continuazioni
opt = contset(opt,'MaxNumPoints',50);
% ampiezza massima del passo di continuazione
% opt = contset(opt, 'MaxStepSize', 1e-8);
opt=contset(opt,'InitStepsize',0.0001);
[x1,v1,s1,h1,f1]=cont(@equilibrium,x0,v0,opt);
cpl(x1,v1,s1,[4 1 3]);
opt=contset(opt,'Backward',1);
[x2,v2,s2,h2,f2]=cont(@equilibrium,x0,v0,opt);
cpl(x2,v2,s2,[4 1 3]);
% continuo limit point LP, x = ( -0.000647 0.000108 0.000755 -0.000000 )
% x3=x2(1:3,s2(2).index);
% p(ap)=x2(4,s2(2).index);
% [x02,v02]=init_BP_BP(@oscillatore_simple,x3,p,[1,2]);
% opt = contset;
% % >>>>>>>  singularities = 1 => rileva le biforcazioni
% opt = contset(opt,'Singularities',1);
% % numero massimo di passi di continuazioni
% opt = contset(opt,'MaxNumPoints',300);
% % ampiezza massima del passo di continuazione
% opt = contset(opt, 'MaxStepSize', 1e-8);
% %opt=contset(opt,'InitStepsize',0.0001);
% opt=contset(opt,'VarTolerance',1e-3);
% opt=contset(opt,'FunTolerance',1e-3);
% 
% [x4,v4,s4,h4,f4]=cont(@branchpoint,x02,v02,opt);
% cpl(x4,v4,s4,[4 1 3]);
%% Salvataggio dati
save foldnormalformcont_vara.mat