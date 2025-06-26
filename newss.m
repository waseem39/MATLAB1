function main
    % Parameters
    a =1.5 
    b = 0.21;
    c = 0.15;
    d = 0.4;
    e=   0.9;
    % Initial conditions
    X0 = [.5 , 0, .9, .1];

    % Time span
   tspan = 0: 0.05:10000;
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
    %figure;
    
%     plot3(x,y,w,'r');
%     
%     figure;
%     plot3(y,z,w)
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


end
function dXdt = ode_fun(t, X, a, b, c, d, e)
    x = X(1);
    y = X(2);
    z = X(3);
    w = X(4);

    dxdt =  a * (x + w) - b * y * (y + w) - (c + d) * x;
    dydt = b * x * (y + w) - (c + e + d) * y;
    dzdt =  d * x - b * z * (y + w);
    dwdt = b * w * (y + w) + d * y - e * w;
    dXdt = [dxdt; dydt; dzdt; dwdt];
end
