%% Initial Step: Discover Analog Devices
devices = daq.getDevices;  % This will list all connected devices                              
s = daq.createSession('ni'); % Assign the session to variable 's'
deviceID = 'Dev1';  % <-- Fill this in. It's usually something like 'Dev3'
measurementtype = 'Position'; 
channel =0;   % <-- Fill this in. I think it has to be a number.                        
ch1 = addCounterInputChannel(s, deviceID, channel,measurementtype);
ch0 = addDigitalChannel(s, deviceID,'Port1/Line0','OutputOnly');
ch2 = addDigitalChannel(s, deviceID,'Port1/Line2','OutputOnly');
ch3 = addDigitalChannel(s, deviceID,'Port1/Line3','OutputOnly');
ch1.TerminalA;
ch1.TerminalB;
ch1.TerminalZ;
ch1.ZResetEnable = false;
%ch1.ZResetCondition = 'BothHigh';
%ch1.ZResetValue = 0;





