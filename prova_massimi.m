
% Ora richiedo maggiore precisione all'integratore (interpolazione polinomiale a 32 punti)
%vedere cosa è x0

x0 = [sqrt(16/6) 0 -sqrt(16/6)];
opt = odeset('RelTol', 1.0e-5, ...
             'Events', @HRxmaxy, ...
             'Refine', 2);
[T, X, Te, Xe, Ie] = ode45(@osc, [0 ,100], x0, opt);
% grafici
figure('Name','massimi della soluzione');
plot(T,X(:,1),'b');
hold on;
%plot(Te,X(:,1),'r');
% Questa volta con la procedura grezza va meglio
[p, t] = dsfindpeaks(X(:, 1));
plot(T(p),X(p,1),'ko');
% plot(Te,X(p,1),'r');

