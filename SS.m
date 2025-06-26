function main
    % Parameters
    a = 1;
    b = 0.2;
    c = 0.6;
    d = 0.12;
    e = .65;

    % Time span
    tspan = 0:0.5:100;

    % Solver options
    

    % First initial condition
    X0 = [2 , 0, 1., 0];
    [t, X0_sol] = ode45(@(t, X) ode_fun(t, X, a, b, c, d, e), tspan, X0);

    % Second initial condition
    X1 = [2. , 0.5 1, 0.];;
    [t, X1_sol] = ode45(@(t, X) ode_fun(t, X, a, b, c, d, e), tspan, X1);

    % Extract results
    x0 = X0_sol(:, 1);
    x1 = X1_sol(:, 1);

    % Plot the results
    figure;
    plot(t, x0, '-b', 'MarkerSize', 1, 'DisplayName', 'x(t) with I.C [7, 4, 1, 10]');
    hold on;
    plot(t, x1, '-r', 'LineWidth', 1, 'DisplayName', 'x(t) with I.C [7.5, 4, 1, 10]');
    xlabel('Time t');
    ylabel('Values of x');
    legend;
    title('Time Series of x with Different Initial Conditions');
    hold off;
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
