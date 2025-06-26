

clear all;

clc;
%a=0.60
  b = 0.2;
    c = 0.6;
    d = 0.12;
    e = .65;
    
    
    
N=100;

st=0.2;

et=1.5;

a=linspace(st,et,N);


x0 = [2 , 1, 1, 0.5];

tspan=0:.5:100;
 
SS=size(tspan);
 
M=SS(2);
 
A=zeros(N,M);
 
  
 

 for i=1:N
     
    f = @(t,x) [d* x(2) - b* x(1) * (x(3) + x(4)); a(i)*(x(1) + x(3)) - b*x(2)*(x(3) + x(4))-(c+d)*x(2); 
        b*x(1)*(x(3) + x(4) ) + d* x(4) - e*x(3); b*x(2)*( x(3) + x(4)) - (c+e+d)*x(4)];
 
    [t,x] = ode45(f,tspan,x0);
    
    
    
    A(i,:)=x(:,1);
 
    
 end
 
 
 B=A(:,M-49:M);
 
 
figure
plot(a,B)
axis tight
