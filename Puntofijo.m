%METODO DE PUNTO FIJO
function [Xn, Error, ea, Cont ]= Puntofijo(funcion,funcion2,inicio,error, imax)
%format long permite utilizar la máxima capacidad del computador 

Xo=inicio;
Iter=imax;
Tol=error;

%El comando inline permite hacer la asignación posterior de variables en
%una función.
f=inline(funcion);
g=inline(funcion2);

Yn=f(Xo);
Error=Tol+1;
Cont=0;
Z1=[Cont,Xo,Yn,Error];
%La sentencia While ejecuta todas las órdenes mientras la expresión sea
%verdadera.
Z=[Cont,Xo,Yn,Error];
while Yn~=0 & Error>Tol & Cont<Iter 
    Xn=g(Xo); 
    Yn=f(Xn); 
    Error=abs((Xn-Xo)/Xn);
    Cont=Cont+1; 
    ea(Cont)=Error;
    Z(Cont,1)=Cont; 
    Z(Cont,2)=Xn; 
    Z(Cont,3)=Yn; 
    Z(Cont,4)=Error; 
    %las z son las posiciones asignadas en la tabla a los resultados que se
    % observarán
    Xo=Xn; 
end
end
