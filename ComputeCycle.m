function [T,Y,TE,YE] = ComputeCycle(func, poincare, jacobian, tol, tspan, y0, varargin)
% [T,Y] = ComputeCycle(func, poincare, jacobian, tol, tspan, y0, varargin)
%ComputeCycle(@HR,@HRxmax,@HRjac,1e-2,[1,1000],[0,0,0],b,I,u,s); comanda
%che la chiama
% Esempio:
%
% b = 2.5;
% I = 4;
% u = 1e-2; s = 4;
% [T,Y] = ComputeCycle(@HR,@HRxmax,@HRjac,1e-2,[1,1000],[0,0,0],b,I,u,s);
% figure;
% subplot(1,2,1);
% plot(T,Y(:,1),'k');
% subplot(1,2,2);
% plot3(Y(:,1),Y(:,2),Y(:,3),'k');
% 
% Per salvare il ciclo in modo che possa essere caricato in AUTO:
% cycle = [T,X];
% save -ascii cycle.dat cycle
%

DBG = 0;

opt = odeset('Refine', 16, 'Events', poincare);
if ~ isempty(jacobian)
    opt = odeset(opt, 'Jacobian', jacobian);
end

%[t, y, te, ye] = ode45(func, tspan, y0, opt, varargin{:});
[t, y, te, ye] = ode45(func, tspan, y0,opt);
tb = te(end);
for k=1:numel(te)-1
    if norm(ye(end,:)-ye(end-k,:)) < tol
        break
    end
end
ta = te(end-k);
ind = find(t >= ta & t <= tb);
T = [t(ind) ; t(ind(end)+1)];
Y = [y(ind,:) ; y(ind(1),:)];
TE = te;
YE = ye;
if DBG  %disegna altri grafici non viene utilizzato perché DBG =0
    figure;
    hold on;
    plot3(Y(:,1),Y(:,2),Y(:,3),'k')
    plot3(Y(1,1),Y(1,2),Y(1,3),'ro','MarkerFaceColor','r');
    plot3(Y(end,1),Y(end,2),Y(end,3),'go','MarkerFaceColor','g');
end
