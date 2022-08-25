% Connect to arduino
a = arduino;
try
    disp(a)
catch
    com_port = input('Specify port (e.g. COM4 for windows): ','s');
    a = arduino(com_port,'Leonardo');
    disp(a)
end
%% Arduino properties : D2-D13,A0-A5, LED = 'D9' heater1 = 'D3', heater2 = 'D5'
% Voltage read functions*
v1a = @(x) readVoltage(a, 'A0');
v2a = @(x) readVoltage(a, 'A2');
v1 = @(n) mean(arrayfun(v1a,ones(n,1)));
v2 = @(n) mean(arrayfun(v2a,ones(n,1)));
% Temperature Calculations as a function of voltage for TMP36
TC = @(V) (V-0.5)*100;              % Celsius
TK = @(V) TC(V)+273.15;             % Kelvin
TF = @(V) TK(V)*9.0/5.0-459.67;     % Fahrenhiet
% Temperature read functions
T1C = @() TC(v1(10));
T2C = @() TC(v2(10));
% LED Function (0 <= level <=1)
led = @(level) writePWMDutyCycle(a,'D9',max(0,min(1,level))); %On
% Heater output (0 <= heater <=100)
% limit to 0-0.9 (0-100%)
h1 = @(level) writePWMDutyCycle(a,'D3',max(0,min(100,level))*0.9/100);
% limit to 0-0.5 (0-100%)
h2 = @(level) writePWMDutyCycle(a,'D5',max(0,min(100,level))*0.5/100);