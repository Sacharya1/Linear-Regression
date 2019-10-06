clear all;close all;clc;

% m=csvread('hw1_dataset.csv',2,2)
% disp(m);
load accidents
x(:,1) = ones(size(hwydata(2:51,4),1),1);
x(:,2)=hwydata(2:51,4);
x(:,3)=hwydata(2:51,5);
x(:,4)=hwydata(2:51,6);
x(:,5)=hwydata(2:51,7);
x(:,6)=hwydata(2:51,14);
x(:,7)=hwydata(2:51,15);
% disp(x(:,1));
% disp(x);

y = hwydata(2:51,12); 

% n is Number of columns

n = size(x,2); 
% disp(n);
n2 = 2^n - 1; 
% disp(n2);
for k=1:n2 
    b = dec2bin(k,n); 
    X = x(:,logical(b-'0')); 
    w = ((X)'*(X))^(-1)*(X)'*y ; 
    y_cap = X*w;
   
    J(k)=[immse(y_cap,y)];
   
%     disp(immse(y_cap,y));
end
  J_min= min(J);
disp(J_min);
[J_min min_index] = min(J);
Binary= de2bi(min_index); 
disp(Binary);
% X_min = X(min_index);
disp(min_index);

hold;

plot(x,y_cap,'r')
M=immse(y_cap,y);
figure
plot(y);hold;plot(y_cap,'r');