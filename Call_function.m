clear all
close all
clc
%Fopdt parameters
params = load('params.csv');
kp = params(1);
theta = params(2);
tau = params(3);
lambda = 10;
% P Controller
kc = tau/(kp*(theta+lambda));
Ti = tau;
% Simulation time
simulation_time = 600;
