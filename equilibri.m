
%calcolo le radici del campo vettoriale

%%ehm no,non so farlo,  gliele diamo già fatte a mano  nel vettore xeq

%stabilità degli equilibri- Occhio la jacobiana è parametrica ma gli
%equilibri nel vettore sono stati calcolati usando 
%a=7;
%b=14;


clear all;
close all;

%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%+++++++++++++++++++ GRAFICI DEGLI AUTOVALORI - Uno per ogni equilibrio +++++++++++++++++++++ 
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% xeq=[-sqrt(16/6),0,sqrt(16/6);sqrt(16/6),0,-sqrt(16/6);0,0,0];
% 
% a=7;
% b=14;
% J = jac(xeq,a,b);
% 
% 
% A=zeros (3,3);
% for K=1:size(xeq,3)
% A(:,1)=eig(J(:,:,1)); % una volta per ogni punto di eq
% A(:,2)=eig(J(:,:,2));
% A(:,3)=eig(J(:,:,3));
% end
% 
% 
% for k=1:3
% figure;
% plot (A(:,k),'ob','MarkerSize', 10);
% ax = gca;
% ax.XAxisLocation= 'origin';
% ax.YAxisLocation= 'origin';
% ax.XAxis.Color = 'r';
% ax.YAxis.Color = 'r';
% ax.XGrid = 'on';
% ax.YGrid = 'on';
% ax.XAxis.LineWidth=2;
% ax.YAxis.LineWidth=2;
% 
% hold on;
% end
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%+++++++++++++++++++ GRAFICO PARAMETRICI DEGLI AUTOVALORI - Uno per equilibrio ++++++++++++++
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
figure ('Name','autovalori con punto equilibrio 0,0,0  al variare del parametro a b=14')

          
xeq=[0,0,0];
b=14;

a=-20;

J=jac(xeq,a,b)  ; 
plot (eig(J(:,:,1)),'og','MarkerSize',10);
ax = gca;
ax.XAxisLocation= 'origin';
ax.YAxisLocation= 'origin';
ax.XAxis.Color = 'r';
ax.YAxis.Color = 'r';
ax.XGrid = 'on';
ax.YGrid = 'on';
ax.XAxis.LineWidth=2;
ax.YAxis.LineWidth=2;
str = 'autovalori con punto equilibrio= 0,0,0 al variare del parametro a, b=14';
          title(str);
hold on

for a=a:40
 J=jac(xeq,a,14)  ; 
plot (eig(J(:,:,1)),'xb','MarkerSize',7);
%trovo valore del parametro che annulla autovalore;
uffa=eig(J(:,:,1));

if  (uffa (1) ==0)
      str1 = ['a per autovalore =0[a=',num2str(a),' '']'];
   
      text (-3,2.5,str1)
        plot(uffa(1),uffa(1),'xr','MarkerSize',14);
end
if  (uffa (2) ==0) 
      str1 = ['a per autovalore =0[a=',num2str(a),' '']'];
    text (-3,2.5,str1)
        plot(uffa(2),uffa(2),'xr','MarkerSize',14);
end
if  (uffa (3) ==0)
      str1 = ['a per autovalore =0[a=',num2str(a),' '']'];
    text (-3,2.5,str1)
        plot(uffa(3),uffa(3),'xr','MarkerSize',14);
end
% if a==0 
%     plot(eig(J(:,:,1)),'xr','MarkerSize',14);
end
ax = gca;
ax.XAxisLocation= 'origin';
ax.YAxisLocation= 'origin';
ax.XAxis.Color = 'r';
ax.YAxis.Color = 'r';
ax.XGrid = 'on';
ax.YGrid = 'on';
ax.XAxis.LineWidth=2;
ax.YAxis.LineWidth=2;
hold on


%
%
%%
%secondo equilibrio 

figure ('Name','autovalori con punto equilibrio SQRT(16/6),0, -SQRT (16/6) al variare del parametro a b=14');
xeq=[sqrt(16/6),0,-sqrt(16/6)];
b=14;

a=-20;

J=jac(xeq,a,b)  ; 
plot (eig(J(:,:,1)),'og','MarkerSize',10);
ax = gca;
ax.XAxisLocation= 'origin';
ax.YAxisLocation= 'origin';
ax.XAxis.Color = 'r';
ax.YAxis.Color = 'r';
ax.XGrid = 'on';
ax.YGrid = 'on';
ax.XAxis.LineWidth=2;
ax.YAxis.LineWidth=2;
str = 'autovalori con punto equilibrio= SQRT(16/6),0, -SQRT (16/6) al variare del parametro a, b=14';
          title(str);
hold on

for a=a:40
 J=jac(xeq,a,14)  ; 
plot (eig(J(:,:,1)),'xb','MarkerSize',7);
%%trovo valore del parametro che annulla autovalore;

uffa=eig(J(:,:,1));
%calcolo valore precedente per vedere cambio di segno
 J=jac(xeq,a-1,14); 
uffa_prec = eig(J(:,:,1));

%%if (imag(uffa(1))== 0)% numero reale primo autovalore 
   
   cont= real (uffa (1))*real(uffa_prec(1));                %prende la parte reale del numero con partee im =0 
    if  cont<=0  %cambio  segno
       x= real (uffa(1));
       y= imag (uffa(1));
      str1 = ['cambio segno autovalore 1 per valore parametro a=',num2str(a),' '']'];
        text (x,y,str1)
    end
% secondo autovalore  terzo autovalore è simmetrico
    cont= real (uffa (2))*real(uffa_prec(2));
    if  cont<=0  %cambio  segno
       x= real (uffa(2));
       y= imag (uffa(2));
      str1 = ['cambio segno autovalore 2 per valore parametro a=',num2str(a),' '']'];
        text (x,y,str1)
    end 
    
     cont= real (uffa (3))*real(uffa_prec(3));
    if  cont <=0  %cambio  segno
       x= real (uffa(3));
       y= imag (uffa(3));
      str1 = ['cambio segno autovalore 3 per valore parametro a=',num2str(a),' '']'];
        text (x,y,str1)
        % plot(cont,cont,'xr','MarkerSize',14);
    end 
    
    
    
     cont= real (uffa (3))*real(uffa_prec(3));
    if  cont ==0  %cambio  segno
       x= real (uffa(3));
       y= imag (uffa(3));
      str1 = ['cambio segno autovalore 3 per valore parametro a=',num2str(a),' '']'];
        text (1,1,str1)
         plot(cont,cont,'xr','MarkerSize',14);
    end 
    cont= real (uffa (1))*real(uffa_prec(1));
    if  cont ==0  %cambio  segno
       x= real (uffa(1));
       y= imag (uffa(1));
      str1 = ['cambio segno autovalore 1 per valore parametro a=',num2str(a),' '']'];
        text (1,1,str1)
         plot(cont,cont,'xr','MarkerSize',14);
    end 
    cont= real (uffa (2))*real(uffa_prec(2));
    if  cont ==0  %cambio  segno
       x= real (uffa(2));
       y= imag (uffa(2));
      str1 = ['cambio segno autovalore 2 per valore parametro a=',num2str(a),' '']'];
        text (1,1,str1)
         plot(cont,cont,'xr','MarkerSize',14);
    end 
    
    
%%fine calcolo parametro che annulla autovalore
% if a==1 
%     plot(eig(J(:,:,1)),'xr','MarkerSize',14);
% end
ax = gca;
ax.XAxisLocation= 'origin';
ax.YAxisLocation= 'origin';
ax.XAxis.Color = 'r';
ax.YAxis.Color = 'r';
ax.XGrid = 'on';
ax.YGrid = 'on';
ax.XAxis.LineWidth=2;
ax.YAxis.LineWidth=2;
hold on
end


%%

%%


%%grafici facendo variare b con a fisso =7
figure ('Name','autovalori con punto equilibrio 0,0,0  al variare del parametro b a=7');

xeq=[0,0,0];
a=7;

b0=-20;

J=jac(xeq,a,7);
%plot (eig(J(:,:,1)),'og','MarkerSize',10);
plot (-5.603,0,'og','MarkerSize',10);
hold on 
plot (0.85,0,'og','MarkerSize',10);
hold on 
plot (4.92,0,'og','MarkerSize',10);
hold on 
ax = gca;
ax.XAxisLocation= 'origin';
ax.YAxisLocation= 'origin';
ax.XAxis.Color = 'r';
ax.YAxis.Color = 'r';
ax.XGrid = 'on';
ax.YGrid = 'on';
ax.XAxis.LineWidth=2;
ax.YAxis.LineWidth=2;
str = 'autovalori con punto equilibrio= 0,0,0 al variare del parametro b a=7';
          title(str);
          hold on
N=1;
for b=b0:20  %200
 J=jac(xeq,7,b)  ; 
 
 ee = eig(J(:,:,1));
 
 for i=1:3
   if isreal(ee)
         plot(ee(i),0,'xb','MarkerSize',7);
         
         
         uffa=eig(J(:,:,1));
%calcolo valore precedente per vedere cambio di segno
 J=jac(xeq,7,b-1); 
uffa_prec = eig(J(:,:,1));

%%if (imag(uffa(1))== 0)% numero reale primo autovalore 
   
   cont= real (uffa (1))*real(uffa_prec(1));                %prende la parte reale del numero con partee im =0 
    if  cont==0  %cambio  segno
       x= real (uffa(1));
       y= imag (uffa(1));
      str1 = ['passaggio per lo zero autovalore 1 b=',num2str(b),' '']'];
        text (1,1,str1)
        plot(ee(1),'xr','MarkerSize',14);
    end
% secondo autovalore  terzo autovalore è simmetrico
    cont= real (uffa (2))*real(uffa_prec(2));
    if  cont==0  %cambio  segno
       x= real (uffa(2));
       y= imag (uffa(2));
      str1 = ['passaggio per lo zero autovalore 1  b=',num2str(b),' '']'];
        text (1,1,str1)
       plot(e(2),'xr','MarkerSize',14);
    end 
    % terzo autovalore  terzo autovalore è simmetrico
    cont= real (uffa (3))*real(uffa_prec(3));
    if  cont==0  %cambio  segno
       x= real (uffa(3));
       y= imag (uffa(3));
      str1 = ['passaggio per lo zero autovalore 3  b=',num2str(b),' '']'];
        text (1,0.4,str1)
        plot(cont,cont,'xr','MarkerSize',14);
    end     
     else
     plot (real(ee(i)),imag(ee(i)),'xb','MarkerSize',7);
     
%%%immagininari
%%%si va ad identificare gli autovalori che diventano complessi coniugati 

J=jac(xeq,7,b)  ; 
plot (eig(J(:,:,1)),'xb','MarkerSize',7); 
if N==1
  plot (eig(J(:,:,1)),'xr','MarkerSize',10);
   str1 = ['dagli autovalori reali si è passati a una coppia di autovalori complessi coniugati b=',num2str(b),' '']'];
   
        text (-4,2,str1)
        
        N=N-1;
        else
end
   end
 end
end
ax = gca;
ax.XAxisLocation= 'origin';
ax.YAxisLocation= 'origin';
ax.XAxis.Color = 'r';
ax.YAxis.Color = 'r';
ax.XGrid = 'on';
ax.YGrid = 'on';
ax.XAxis.LineWidth=2;
ax.YAxis.LineWidth=2;
hold on




%%


%secondo equilibrio

figure ('Name','autovalori con punto equilibrio SQRT(16/6),0, -SQRT (16/6) al variare del parametro b a=7');
xeq=[sqrt(16/6),0,-sqrt(16/6)];
a=7;

b=-20;
N=1;
J=jac(xeq,a,b)  ; 
% plot (eig(J(:,:,1)),'og','MarkerSize',10);
plot (-6.12,0,'og','MarkerSize',10);
hold on 
plot (-1.7,0,'og','MarkerSize',10);
hold on 
plot (4.485,0,'og','MarkerSize',10);
hold on 
ax = gca;
ax.XAxisLocation= 'origin';
ax.YAxisLocation= 'origin';
ax.XAxis.Color = 'r';
ax.YAxis.Color = 'r';
ax.XGrid = 'on';
ax.YGrid = 'on';
ax.XAxis.LineWidth=2;
ax.YAxis.LineWidth=2;
str = 'autovalori punto equilibrio= [sqrt(16/6),0,-sqrt(16/6)] al variare del parametro b a=7';
          title(str);
hold on
for b=b:20
 J=jac(xeq,7,b)  ; 

 ee = eig(J(:,:,1));
 
 for i=1:3
     if isreal(ee)
         plot(ee(i),0,'xb','MarkerSize',7);
       
         
         
             % uffa=eig(J(:,:,1));
%calcolo valore precedente per vedere cambio di segno
 J=jac(xeq,7,b-1); 
ee_prec = eig(J(:,:,1));

%%if (imag(uffa(1))== 0)% numero reale primo autovalore 
   
   cont= real (ee(1))*real(ee_prec(1));                %prende la parte reale del numero con partee im =0 
    if  cont==0  %cambio  segno
       x= real (ee(1));
       y= imag (ee(1));
      str1 = ['passaggio per lo zero autovalore 1 b=',num2str(b),' '']'];
        text (1,1,str1)
        plot(ee(1),'xr','MarkerSize',14);
    end
% secondo autovalore  terzo autovalore è simmetrico
    cont= real (ee (2))*real(ee_prec(2));
    if  cont==0  %cambio  segno
       x= real (ee(2));
       y= imag (ee(2));
      str1 = ['passaggio per lo zero autovalore 1  b=',num2str(b),' '']'];
        text (1,1,str1)
       plot(ee(2),'xr','MarkerSize',14);
    end 
    % terzo autovalore  terzo autovalore è simmetrico
    cont= real (ee (3))*real(ee_prec(3));
    if  cont==0  %cambio  segno
       x= real (ee(3));
       y= imag (ee(3));
      str1 = ['passaggio per lo zero per autovalore 3  b=',num2str(b),' '']'];
        text (1,0.4,str1)
        plot(cont,cont,'xr','MarkerSize',14);
    end 

    
    
    %caso di immaginari
     else    
    plot (real(ee(i)),imag(ee(i)),'xb','MarkerSize',7);
    j=jac(xeq,7,b); 
    if N==1
    plot (eig(J(:,:,1)),'xr','MarkerSize',10);
      str1 = ['autovalori complessi coniugati b=',num2str(b),' '']'];
        text (-6,1,str1)
        
        N=N-1;
    else
        %rilevazuine del cambio di segno della parte reale della coppia di
        %complessi coniugati 
        ee=eig(J(:,:,1));
        J=jac(xeq,a,b-1);
        ee_prec=eig(J(:,:,1));
          cont= real (ee (1))*real(ee_prec(1));                %prende la parte reale del numero con partee im =0 
   %prio autovalore che attraversa l'asse im
          if  cont<0  %cambio  segno
       x= real (ee(1));
       y= imag (ee(1));
      str1 = ['cambio segno autovalore 1 per valore parametro b=',num2str(b),' '']'];
        text (3,3,str1)
          end
    %secondo autovalore che attraversa l'asse im
    cont= real (ee (2))*real(ee_prec(2));
    if  cont<0  %cambio  segno
       x= real (ee(2));
       y= imag (ee(2));
      str1 = ['cambio segno autovalore 2 per valore parametro b=',num2str(b),' '']'];
        text (3,2,str1)
    end 
    %terzo autovalore che ha passato l'asse im
      cont= real (ee (3))*real(ee_prec(3));
    if  cont <0  %cambio  segno
       x= real (ee(3));
       y= imag (ee(3));
      str1 = ['cambio segno autovalore 3 per valore parametro b=',num2str(b),' '']'];
        text (-6,2.5,str1)
     %    plot(cont,cont,'xr','MarkerSize',14);
    end 
    
    end  
   
     end      %%342
 end %% 341
% if b==0 
%     plot(eig(J(:,:,1)),'xr','MarkerSize',14);
% end
ax = gca;
ax.XAxisLocation= 'origin';
ax.YAxisLocation= 'origin';
ax.XAxis.Color = 'r';
ax.YAxis.Color = 'r';
ax.XGrid = 'on';
ax.YGrid = 'on';
ax.XAxis.LineWidth=2;
ax.YAxis.LineWidth=2;
hold on
end


