

clear all;

clc;

%a=12;
%a=0.60
  b = 0.2;
    c = 0.6;
    d = 0.12;
    e = .65;
    
    
    
N=100;

st=0.2; st1 = 1.5;

%et=16;  et1 = 0.1

a=linspace(st,st1,N);
 %c = linspace(st1,et1,N)

x0 = [2 , 1, 1, 0.5];
 
 tspan=0:.1:100;
 
 
 SS=size(tspan);
 
 M=SS(2);
 
 A=zeros(N,M);
 
LEX=zeros(1,N);

LEY=zeros(1,N);

LEZ=zeros(1,N);
 
LEW=zeros(1,N);

 for i=1:N
     
   f = @(t,x) [d* x(2) - b* x(1) * (x(3) + x(4)); a(i)*(x(1) + x(3)) - b*x(2)*(x(3) + x(4))-(c+d)*x(2); 
        b*x(1)*(x(3) + x(4) ) + d* x(4) - e*x(3); b*x(2)*( x(3) + x(4)) - (c+e+d)*x(4)];
 
    [t,x] = ode45(f,tspan,x0);
    
    
    
   LEX(i)=lyapunovExponent(x(:,1));
    
    
    LEY(i)=lyapunovExponent(x(:,2));
    
    
    LEZ(i)=lyapunovExponent(x(:,3));;
 
    LEW(i)= lyapunovExponent(x(:,3));
 end
 
 
 