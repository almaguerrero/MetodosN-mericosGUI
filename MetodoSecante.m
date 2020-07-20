%% Clase metodos numericos
% Metodo de la secante


function [root,ea,iteracion] = MetodoSecante(funcion,intervalo, error)

syms x;
f=sym(funcion);
xf(1)=intervalo(1);
xf(2)=intervalo(2);
tol=error;

format long;

f1=subs(f,x,xf(1));
f2=subs(f,x,xf(2));
 
ea(1)=100;
 
i=1;
j=2;
 
while abs(ea(i))>=tol
   xf(j+1)=(xf(j-1)*f2-xf(j)*f1)/(f2-f1);  
   f1=f2; 
   f2=subs(f,x,xf(j+1));
   ea(i+1)=(xf(j+1)-xf(j))/xf(j+1)*100;
   j=j+1;
   i=i+1;     
end
 
% fprintf(' i      xf(i)   Error aprox (i) \n');
% 
% for k=2:j;
%     fprintf('%2d\t%11.7f\t%7.3f\n',k-1,xf(k),abs(ea(k-1)));
% end

% plot(abs(ea));
root=xf(j);
iteracion=j;
end