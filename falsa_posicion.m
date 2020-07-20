function [root, itr, err] = falsa_posicion(f,inicio,final,error)
intervalo = 1;
dominio = inicio:intervalo:final;

syms x;

f=sym(f);
for i=1:length(dominio)-1
    it(i)=i;
    e1(i) = 100;
    x=dominio(i);
    ai = double(subs(f));
    x=dominio(i+1);
    bi = double(subs(f));
    if((ai*bi)<=0)
        break;
    end
end
xi(1) = x-1;
xi(2) = x;
ai = xi(1);
bi = xi(2);
i=2;
e(1)=abs(((xi(i)-(xi(i-1)))/xi(i)))*100;
tic
toc
(abs(((xi(i)-(xi(i-1)))/xi(i)))>error);
it2(1)=0;
while (((abs(((xi(i)-(xi(i-1)))/xi(i)))*100)>error) && (toc<20))
it2(i)=it2(i-1)+1;
i = i + 1;

x = ai;
f_ai = double(subs(f));
x = bi;
f_bi = double(subs(f));

xi(i) = (f_ai*bi - f_bi*ai) / (f_ai-f_bi);

x = xi(i);
f_xi = double(subs(f));
if ((f_xi*f_ai) > 0)
    ai = xi(i);
elseif ((f_xi*f_ai) < 0)
    bi = xi(i);
else
    xi(i);
    break
end
e(i-1)=abs(((xi(i)-(xi(i-1)))/xi(i)))*100;
end

iteraciones = 1:length(it2)+length(it);
et = [e1,e];
format long
root = xi(i);
itr = length(iteraciones);
err = et;
end