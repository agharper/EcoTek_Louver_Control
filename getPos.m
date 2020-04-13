function [pos] = getPos(s,x) %s is the device, x = 0: one reading, x = 1:continuous reading
if x == 1
    while x == 1
    %outputSingleScan(s,[0 0 0]); %allow for manual control
    deg = convertDeg(inputSingleScan(s));   % degree is an unsigned 32bit int    
    encoderCPR =2500;        % <-- Fill this in.
    pos = deg * 360/encoderCPR;
    display(pos)
    pause(0.5)
    end
elseif x == 0
    %outputSingleScan(s,[0 0 0]);
    deg = convertDeg(inputSingleScan(s));
    encoderCPR =2500;        % <-- Fill this in.
    pos = deg * 360/encoderCPR ;
 end
end

function deg = convertDeg(deg)
    deg = uint32(deg);
    isNegative = bitget(deg,32);
    deg = int32(bitset(deg,32,0)) + intmin('int32')*int32(isNegative);
    deg = cast(deg,'double');
end