clc;
clear all;
close all;

tic;                                    % запуск секундомера

XMAX = 5;                               % размер сетки рисования
STEP = 0.5;                             % шаг сетки
TMAX = 10;                              % время моделирования
MAINSYSNAME = "FullModel";         % название модели
SUBSYSNAME = "MyModel";                % название подмодели


simInitSet(TMAX, MAINSYSNAME, SUBSYSNAME);                  % инициализация параметров системы
plotLocus(XMAX, STEP, MAINSYSNAME, SUBSYSNAME);             % построение фазовых портретов

toc;                                    % остановка секундомера
