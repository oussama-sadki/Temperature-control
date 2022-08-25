clear all
close all
clc
%% Import data
yr = load('yr.csv');
y = load('y.csv');
y_wu = load('y_wu.csv');
u_sat = load('u_sat.csv');
u_wu = load('u_wu.csv');
yr(end-3:end) = [];
y(end-3:end) = [];
u_sat(end-3:end) = [];
time = 0:length(yr)-1;
%% Results presentation
green = [0.4940, 0.1840, 0.5560];
subplot(211)
plot(time/1000,yr,'b',time/1000,y,'r',time/1000,y_wu,'m','LineWidth',1.5);grid minor
xlabel('time(s)');
ylabel('Response');
xlim([0,2000]);
ylim([30,65]);
legend('Reference Tracking','IMC-PI','IMC-PI-Windup')
title('Comparaison between IMC-PI and IMC-PI with anti windup')
subplot(212)
plot(time/1000,u_sat,'b',time/1000,u_wu,'r','LineWidth',1); grid minor
xlabel('time(s)');
ylabel('Control signal')
xlim([0,2000]);
ylim([-10,120]);
legend('IMC-PI','IMC-PI-Windup')
title('Comparaison between IMC-PI and IMC-PI with anti windup')


