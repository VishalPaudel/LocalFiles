clear all; close all; clc

R = 1/10;
L = 1;
C = 1;

f = @(t,Y) [0 * Y(1) + Y(2); (-1 / (L * C)) * Y(1) - (R / L) * Y(2)];

y1 = linspace(-2,8,20);
y2 = linspace(-2,2,20);

% creates two matrices one for all the x-values on the grid, and one for
% all the y-values on the grid. Note that x and y are matrices of the same
% size and shape, in this case 20 rows and 20 columns
[x,y] = meshgrid(y1,y2);

u = zeros(size(x));
v = zeros(size(x));
for i = 1:numel(x)
    Yprime = f(i,[x(i); y(i)]);
    u(i) = Yprime(1);
    v(i) = Yprime(2);
end

quiver(x,y,u,v,'r'); figure(gcf)
xlabel('y_1')
ylabel('y_2')
axis tight equal;

hold on
for y20 = [0 0.5 1 1.5 2 2.5]
    [ts,ys] = ode45(f,[0,50],[0;y20]);
    plot(ys(:,1),ys(:,2))
    plot(ys(1,1),ys(1,2),'bo') % starting point
    plot(ys(end,1),ys(end,2),'ks') % ending point
end
hold off