
    % Parameters
     a = 0.8;
    b = 0.2;
    c = 0.6;
    d = 0.12;
    e = .65;

    % Initial conditions
    X0 = [2 , 1, 1, 0.5];
    % Time span
   tspan = 0: 0.1:1000;
    % Solve the system of ODEs
    [t, X] = ode45(@(t, X) ode_fun(t, X, a, b, c, d, e), tspan, X0);

    % Extract results
    x = X(:, 1);
    y = X(:, 2);
    z = X(:, 3);
    w = X(:, 4);

    % Plot the results
    figure;
    plot(t, x, 'g', 'DisplayName', 'x(t)');
    xlabel('Time t');
    ylabel('Values of x');
    legend;
    title('Time Series of x');

    figure;
    plot3(x, y, z,'k');
    xlabel('x');
    ylabel('y');
    zlabel('z');
    title('Phase Plot: x, y, z');
    figure;
    
    plot3(x,y,w,'r');
    
    figure;
    plot3(y,z,w)
%     
%     figure;
% plot(x,y, 'k');
% xlabel( 'x' ); 
% ylabel( 'y' );
% % 
% % 
% % 
% % 
%  figure;
%  plot(x,z, 'm');
% % 
% xlabel( 'x' ); 
% ylabel( 'z' );
% 
%  figure;
%  plot(y,z, 'g');
% xlabel( 'y' ); 
% ylabel( 'z' );



function dXdt = ode_fun(t, X, a, b, c, d, e)
    x = X(1);
    y = X(2);
    z = X(3);
    w = X(4);

    dxdt = d * y - b * x * (z + w);
    dydt = a * (x + z) - b * y * (z + w) - (c + d) * y;
    dzdt = b * y * (z + w) + d * w - e * z;
    dwdt = b * x * (z + w) - (c + e + d) * w;

    dXdt = [dxdt; dydt; dzdt; dwdt];
end
