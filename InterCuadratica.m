

clear all;
clc;
close all;
x = [1:0.01:6];

x0 = 1;
x1 = 4;
x2 = 6;

fx0 = log(x0);
fx1 = log(x1);
fx2 = log(x2);

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

b2 = (((fx2-fx1)/(x2-x1))-((fx1-fx0)/(x1-x0)))/(x2-x0);

f2x = b0 + b1*(x-x0)+b2*(x-x0).*(x-x1);
hold on
plot(x, f2x,'r')
