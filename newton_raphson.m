%%          NEWTON-RAPHSON          %%
%%% Mario Alberto Alberto Olivares %%%
%%
function [xn,fx,ea,i] = newton_raphson(f,xn,imax,es)
syms x
f=sym(f);%funcion
%xn %punto inicial
df=diff(f,x); %primer derivada
%imax=100; %iteraciones maximas
%es=0.001; %error esperado
xnp=0;
for i=1:imax
    xn=xn-double(subs(f,x,xn)/subs(df,x,xn)); %ecuacion de N-R
    fx=double(subs(f,xn)); %funcion evaluada en la reaiz
    %Calculo de error relativo
    if fx~=0
        ea(i)=100*abs((xn-xnp)/xn); % error aprox
    else
        ea(i)=0;
        break
    end
    % Criterio de paro
    if(ea(i)<=es)
        break
    end
    xnp=xn;
end
end
%disp(['Raiz aproximada= ',num2str(xn),', f(xn)=',num2str(fx)])
 %% Graficacion
% y=[-2:0.01:2];
% fy=subs(f,x,y);
% subplot(1,2,1)
% plot(y,fy,xn,fx,'*');
% title('Funcion')
% xlabel('x')
% ylabel('f(x)')
% legend('x^{10}-1','Raiz')
% grid on
% subplot(1,2,2)
% plot(ea,'-r*')
% title('Error Relativo')
% xlabel('Iteracion')
% ylabel('Error %')
% grid on