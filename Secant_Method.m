clc;
clear all;
close all;
format long

syms x z;
f = input('enter your function :' , 's');
f = evalin(symengine, f);
x1 = input('enter first guess : ');
x1(2) = input('enter second guess : ');
v = subs(f,x,z);
xn = 2;
fs = x - ((x - z)/(f - v )) *f ; 
while true
    x2 = x1(xn);
    x3 = x1(xn-1);
    x1(xn+1) = subs(fs,[x z] , [x2 x3]);
    xn = xn + 1;
    temp = subs(f , x , x1(xn));
    fprintf('n = %d , x%d = %f, f(x%d) = %f \n', xn-2 , xn , x1(xn) , xn , temp);
    if abs(temp) <= 10^-7
        break;
    end
end