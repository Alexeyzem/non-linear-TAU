clc;
clear all;
close all;
                  
XMAX = 20;                    
STEP = 0.5;               
TMAX = 95;                  
X0 = -1;
Y0 = -0;
Z0 = 0.5;

dx = @(t, x) funcGrad(t, x);
event_out_of_bounds = @(t, z) outOfBounds(t, z, XMAX+0.01);
plotLocus(X0, Y0, Z0, dx, event_out_of_bounds, TMAX); % строим фазовые траектории

function dxdt = funcGrad(t, x)
gama = 0.87;
alpha = 1.1;
%
%
dxdt(1, :) = x(2,:).*(x(3,:) - 1 + x(1, :).^2) + gama.*x(1, :);
dxdt(2, :) = x(1, :) .* (3.*x(3,: ) + 1 - x(1, :).^2) + gama.*x(2, :);
dxdt(3, :) = -2.*x(3,:) .* (alpha + x(1, :).* x(2, :));
end
