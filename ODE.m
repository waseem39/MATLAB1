function dydt = ODE(t,X,a,b,c,d,e)
    % Constants
    
    
    % Equations
    dydt = zeros(4, 1);
    dydt(1) = d*X(2) - b*X(1)*(X(3) + X(4));
    dydt(2) = a*(X(1) + X(3)) - b*X(2)*((X(3) + X(4))) - (c+d)*X(1);
    dydt(3) = b*X(2)*((X(3) + X(4))) - (c+d+e)*X(4);
    dydt(4) = b*X(1)*((X(3) + X(4))) + d*X(4)- e*X(3);
end
