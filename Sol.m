 % Parameters
    a = 1.1;
    b = 0.045;
    c = 0.25;
    d = 0.06;
    e = .5;

    % Initial conditions
    X0 = [7 , 4, 1, 10];

    % Time span
   tspan = 0: 0.05:100;
    % Solve the system of ODEs
    [t, X] = ode45(@(t, X) ODE(t, X, a, b, c, d, e), tspan, X0);

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


