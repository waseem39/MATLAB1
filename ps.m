function main
    % Parameters
    
b =1;  % Example value; adjust as needed
d= .5;
B =1;
c=.8;
    a = input('Enter the value of parameter a: ');

    % Initial conditions
    X0 = [0.1, .01, .8];

    % Time span
    tspan = 0:0.5:1000;

    % Solver options
    options = odeset('RelTol',1e-6,'AbsTol',1e-8);

    % Solve the system of ODEs
    [t, X] = ode45(@(t, X) ode_fun(t, X, a, b, c, d, B), tspan, X0, options);

    % Extract results
    x = X(:, 1);
    y = X(:, 2);
    z = X(:, 3);
 

    % Poincaré map resolution
    RES = 10; % Resolution per cycle
    p = 0.5; % Fraction of the total time to start plotting Poincaré section

    % Calculate the Poincaré map
    n = length(t);
    poincare_x = x(round(n*p):RES:end);
    poincare_y = y(round(n*p):RES:end);
    poincare_z = z(round(n*p):RES:end);
   
    % Plot the Poincaré map
    figure;
    plot(poincare_x, poincare_y, 'r*');
    xlabel('x(t)');
    ylabel('z(t)');
    title('Poincare map');
    grid on;
end

function dXdt = ode_fun(~, X, a, b, c, d, B)
    x = X(1);
    y = X(2);
    z = X(3);
   

    dxdt = (x-c)*y;
    dydt = (x-c)*z;
    dzdt = a*y -b*y*z +3*d*y*x^2 +2*B*x*y;
    

    dXdt = [dxdt; dydt; dzdt];
end

% Run the main function
