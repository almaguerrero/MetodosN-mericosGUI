% BusquedaIncremental.m
% Programa que calcula aproximaciones de raices de una funcion
% por el método de Búsqueda por incrementos
% Ing. Miguel Angel Moncada Malagón 20-Ago-2018
function [rootAprox,iter]= BusquedaIncremental(funcion,linf,lsup,inc,imax)
% inc incremento %6 cifras significativas
syms x
rootAprox=0;
f=sym(funcion);
iter=1;
    for t=linf:inc:lsup 
        if(iter>imax)
           break 
        end
        y=double(subs(f,t)*subs(f,t+inc));
        if( y<0 ) 
            rootAprox=(t+(t+inc))/2 ; 
        elseif(y==0)
            rootAprox=t;
        end
        iter=iter+1;
    end
    
end
