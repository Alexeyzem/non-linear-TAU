clc;
clear all;
close all;

tic;                     

XMAX = 5;                   
STEP = 0.5;               
TMAX = 10;                  

[x1, x2] = meshgrid(-XMAX: STEP: XMAX); 

dx = @(t, x) funcGrad(t, x);
event_out_of_bounds = @(t, z) outOfBounds(t, z, XMAX+0.01);

plotLocus(x1, x2, dx, event_out_of_bounds, TMAX); % строим фазовые траектории
plotQuiver(x1, x2, dx); % строим стрелочки

toc; tic; % остановка  и запуск секундомера

function dxdt = funcGrad(t, x)
dxdt(1, :) = x(2, :);
dxdt(2, :) = x(2, :).*x(1, :) + 2.*x(1, :).^3 - 5.*x(1, :) + 1;
end