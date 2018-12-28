clear all;
close all;
clc;

%% Continuazione dell'equilibrio e individuazione della biforcazione fold

% valore dei parametro per cui si ha un solo equilibrio
global a b
a= 1;
b=14;
equil = [0;0;0 ];
p= [a;b];
%seleziono quale parametro variare 
ap =1; %vario a
% ap=2;  %vario b
% inizializzo la continuazione dell'equilibrio partendo da un equilibrio
[x0, v0] = init_EP_EP(@foldnormalform, equil, p, ap);
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
%   grafico
figure;
cpl(xE,vE,sE,[4 1 3]);
str=sprintf('Continuazione dell''equilibrio %.2f %.2f %.2f al variare di a.',equil);
title(str);
xlabel('a'); ylabel('x'); zlabel ('z');

% faccio continuazione backward
% imposto le opzioni di continuazioni
opt = contset;
% >>>>>>>  singularities = 1 => rileva le biforcazioni
opt = contset(opt,'Singularities',1);
% numero massimo di passi di continuazioni
opt = contset(opt,'MaxNumPoints',300);
% ampiezza massima del passo di continuazione
opt = contset(opt, 'MaxStepSize', 1e-8);
% direzione;
  opt = contset(opt, 'backward', 1);
% continuazione vera e propria
[xE,vE,sE,hE,fE] = cont(@equilibrium, x0, v0, opt);
%   grafico

cpl(xE,vE,sE,[4 1 3]);

%% Salvataggio dati
save foldnormalformcont.mat
%%prova continuazione Branch point
x1=xE(1:3,sE(2).index);
p(ap)=xE(4,sE(2).index);
[x0,v0]=init_BP_EP(@foldnormalform,x1,p,sE(2),0.01);
opt=contset(opt,'InitStepsize',0.0001);
[x1,v1,s1,h1,f1]=cont(@equilibrium,x0,v0,opt);
cpl(x1,v1,s1,[4 1 3]);
opt=contset(opt,'Backward',1);
[x2,v2,s2,h2,f2]=cont(@equilibrium,x0,v0,opt);
cpl(x2,v2,s2,[4 1 3]);