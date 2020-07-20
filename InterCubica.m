

clear all;
clc;
close all;
x = [1:0.01:6];

x0 = 1;
x1 = 4;
x2 = 6;
x3 = 5;

fx0 = log(x0);
fx1 = log(x1);
fx2 = log(x2);
fx3 = log(x3);

fx = log(x);


plot(x,fx)
hold on;
plot(x0,fx0,'o')
hold on;
plot(x1,fx1,'o')
hold on;
plot(x2,fx2,'o')


b0 = fx0;
b1 = (fx1 - fx0)/(x1-x0);
b2 = (((fx2-fx1)/(x2-x1))-((fx1-fx0)/(x1-x0)))/(x2-x0)
b2int = (((fx3-fx2)/(x3-x2))-((fx2-fx1)/(x3-x2)))/(x3-x1)
b3 = (b2int-b2)/(x3-x0);


f2x = b0 + b1*(x-x0)+b2*(x-x0).*(x-x1);

hold on

plot(x, f2x,'r')

f3x = b0 + b1*(x-x0)+b2*(x-x0).*(x-x1)+ b3*(x-x0).*(x-x1).*(x-x2)
hold on
plot(x, f3x,'o')
