clear all;
close all;
clc;

%% Continuazione dell'equilibrio e individuazione dei punti singolari
% valore dei parametro per cui si ha un solo equilibrio  funziona solo con
% partenza  0 0 0
global a b cds
a= 1;
b=14;
equil = [0;0;0 ];
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
opt = contset(opt,'MaxNumPoints',300);
% ampiezza massima del passo di continuazione
opt = contset(opt, 'MaxStepSize', 1e-8);
% direzione;
%  opt = contset(opt, 'backward', 1);
% continuazione vera e propria
[xE,vE,sE,hE,fE] = cont(@equilibrium, x0, v0, opt);

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
[xE,vE,sE,hE,fE] = cont(@equilibrium, x0, v0, opt);
% estendo il calcolo
[xE,vE,sE,hE,fE]=cont(xE,vE,sE,hE,fE,cds);
%   grafico

cpl(xE,vE,sE,[4 1 3]);

%% Salvataggio dati
save foldnormalformcont.mat
pause
% *************************************************************************
%%prova continuazione Branch point   
x1=xE(1:3,sE(2).index);
p1=p;
p1(ap)=xE(4,sE(2).index);
[x0,v0]=init_BP_EP(@oscillatore,x1,p1,sE(2),0.001);

% imposto le opzioni di continuazioni  del BP
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
% *************************************************************************
%continuazione primo LP
% p2=p;
% x3=x1(1:3,s1(3).index);
% p2(ap)=x1(end,s1(3).index);
% [x0,v0]=init_LP_LP(@oscillatore,x3,p2,[1 2 ],ap);
% opt=contset(opt,'MaxNumPoints',300);
% [x2,v2,s2,h2,f2]=cont(@limitpoint,x0,v0,opt);
% cpl(x2,v2,s2,[4,1 3]);
% *************************************************************************
% continuazione level 2 BP
index=s1(4).index;
x3=x1(1:3,index);
p(1)=x1(4,index);
[x0,v0]=init_BP_BP(@oscillatore,x3,p,[1 2],[1 2]);
opt=contset(opt,'Backward',1);
[x4,v4,s4,h4,f4]=cont(@branchpoint,x0,[],opt);
f
hold on;
cpl(x4,v4,s4,[4,1,3]);
