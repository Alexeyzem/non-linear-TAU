clc;
clear all;
close all;
                   

XMAX = 12;                    
STEP = 1;               
TMAX = 10;                  

[x1, x2] = meshgrid(-XMAX: STEP: XMAX); 

%Для основного задания
dx = @(t, x) funcGrad(t, x);
event_out_of_bounds = @(t, z) outOfBounds(t, z, XMAX+0.01);
plotLocus(x1, x2, dx, event_out_of_bounds, TMAX); % строим фазовые траектории
plotQuiver(x1, x2, dx); % строим стрелочки

%в окрестности первой особой точки(0.2;0)
%[x1, x2] = meshgrid(0: 0.1: 0.4,  -0.2: 0.1: 0.2); 
%plotLocus(x1, x2, dx, event_out_of_bounds, TMAX); 
%plotQuiver(x1, x2, dx); 

%в окрестности второй особой точки(1.47;0)
%[x1, x2] = meshgrid(1: 0.1: 2, -1: 0.1: 1); 
%plotLocus(x1, x2, dx, event_out_of_bounds, TMAX);
%plotQuiver(x1, x2, dx); 

%в окрестности второй особой точки(-1.67;0)
%[x1, x2] = meshgrid(-2.2: 0.1: -1.2, -0.5: 0.1: 0.5); 
%plotLocus(x1, x2, dx, event_out_of_bounds, TMAX); 
%plotQuiver(x1, x2, dx); 

[x1, x2] = meshgrid(-XMAX: STEP: XMAX); 
%Для пункта Б - континуум особых точек 
%dx = @(t, x) ContinuumFuncGrad(t, x);
%plotLocus(x1, x2, dx, event_out_of_bounds, TMAX); 
%plotQuiver(x1, x2, dx); 
 
%Для пункта А - вырожденная особая точка
%dx = @(t, x) SpecialDotFuncGrad(t, x);
%plotLocus(x1, x2, dx, event_out_of_bounds, TMAX); 
%plotQuiver(x1, x2, dx);

function dxdt = funcGrad(t, x)
dxdt(1, :) = x(1, :).^3 + x(2, :);
dxdt(2, :) = 8.*x(1, :) + x(1, :).* x(2, :);
end


function dxdt = SpecialDotFuncGrad(t, x)
dxdt(1, :) = x(2, :);
dxdt(2, :) = (sin(x(1, :)) .* x(2, :) + log2(1 + x(1, :).^2));
end

function dxdt = ContinuumFuncGrad(t, x)
dxdt(1, :) = x(2, :);
dxdt(2, :) = (x(2, :).^4 .* x(1, :) + x(2, :));
end
