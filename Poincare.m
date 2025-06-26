function main
    % Parameters
    
    b = 0.2;
    c = 0.6;
    d = 0.12;
    e=0.65
    a = input('Enter the value of parameter a: ');

    % Initial conditions
    X0 = [2 , 0, 1, 0];;

    % Time span
    tspan = 0:0.1:1000;

    % Solver options
    options = odeset('RelTol',1e-6,'AbsTol',1e-8);

    % Solve the system of ODEs
    [t, X] = ode45(@(t, X) ode_fun(t, X, a, b, c, d, e), tspan, X0, options);

    % Extract results
    x = X(:, 1);
    y = X(:, 2);
    z = X(:, 3);
    w = X(:, 4);

    % Poincaré map resolution
    RES = 10; % Resolution per cycle
    p = 0.5; % Fraction of the total time to start plotting Poincaré section

    % Calculate the Poincaré map
    n = length(t);
    poincare_x = x(round(n*p):RES:end);
    poincare_y = y(round(n*p):RES:end);
    poincare_z = z(round(n*p):RES:end);
    poincare_w = w(round(n*p):RES:end);
    % Plot the Poincaré map
    figure;
    plot(poincare_x, poincare_y, 'r*');
    xlabel('x(t)');
    ylabel('z(t)');
    title('Poincare map');
    grid on;
end

function dXdt = ode_fun(~, X, a, b, c, d, e)
    x = X(1);
    y = X(2);
    z = X(3);
    w = X(4);

    dxdt = d * y - b * x * (z + w);
    dydt = a * (x + z) - b * y * (z + w) - (c + d) * y;
    dzdt = b * x * (z + w) + d * w - e * z;
    dwdt = b * y * (z + w) - (c + e + d) * w;

    dXdt = [dxdt; dydt; dzdt; dwdt];
end

% Run the main function
