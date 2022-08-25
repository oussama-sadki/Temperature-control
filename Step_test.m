clear all
close all
clc
n = 10*60; % 5 minutes
Q = linspace(0,n,n+1);
Q(1:20) = 0;
Q(20:end) = 80; % 80% Of the maximum heater power
T = [];
tclab_setup;
for i=1:n
    h1(Q(i));
    disp(['T =' num2str(T1C()),'deg']);
    t1 = T1C();
    T = [T,t1];
    pause(1);
end
disp('Turn off heater');
h1(0);
step_test = [Q',T'];
csvwrite('step_test.csv',step_test)
    
