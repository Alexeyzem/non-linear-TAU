function plotLocus(x1, x2, x3, dx, event_fnc, tmax)
% функция построения фазовых траекторий
figure;
hold on;
view(3);
tspan = [0, tmax]; % отрезок времени, на котором моделируем

f0 = [x1, x2, x3];  
        [t, z, ~, ~, ~] = ode23t(dx, tspan, f0, odeset('RelTol',1e-12,...
            'Events', event_fnc)); % задаем параметры солвера
        plot3(z(:, 1), z(:, 2), z(:, 3)); % строим найденное решение
hold off
end