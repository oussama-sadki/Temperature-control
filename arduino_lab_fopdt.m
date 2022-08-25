function TC = arduino_lab_fopdt(heater)

persistent icount a

if (isempty(icount))
    tclab_setup;
    icount = 0;
else
    % Voltage read function
    v1 = @() readVoltage(a,'A0');
    v2 = @() readVoltage(a,'A2');
    
    % Temperature calculations as a function of voltage for TMP36
    TC = @(V) (V-0.5)*100.0;        % Celsius
    TK = @(V) TC(V)+273.15;         % Kelvin
    
    % Temperature read functions
    T1C = @() TC(v1());
    T2C = @() TC(v2());
    
    % LED function (0<= level <= 1)
    led = @(level) writePWMDutyCycle(a,'D9',max(0,min(1,level))); % ON
    
    % Heater Output (0<= level <=1)
    % 0 = 0V and 100 = 5V
    h1 = @(level) writePWMVoltage(a,'D3',max(0,min(100,level))/20);
    h2 = @(level) writePWMVoltage(a,'D5',max(0,min(100,level))/20);
end

% Increment Counter
icount = icount+1;

% read temperature
TC = T1C();
% write heater
h1(heater);
% Indicate high temperature with LED

if TC>40
    led(1)
else
    led(0)
end

end

