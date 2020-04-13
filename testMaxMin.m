function [] = testMaxMin(s,n) %s is the device, x is number of times to open and close (1 = open then close)
outputSingleScan(s,[0 0 1]); %Open Should start open
%outputSingleScan(s,[0 1 0]); %Close
topPos = zeros(1,n);
bottomPos = zeros(1,n);
currPos = 100;
lastPos = -1;
disp('Pause 10 seconds to allow Louvers to Open')
pause(10); %let the louvers open all the way before starting
even = 1; %changes from pos to neg every cycle
disp('Starting Cycles')

for n = 1:n
    currPos = 100;
    lastPos = -1;
    counter = 0;
    if even == -1 %each cycle through we need to change the direction of the louvers
        outputSingleScan(s,[0 0 1]); %Open Should start open
        even = even*(-1);
        disp(['Open Louvers. Starting Cycle Number: ', num2str(n)])
    else
        outputSingleScan(s,[0 1 0]); %Close
        even = even*(-1); 
        disp(['Close Louvers. Starting Cycle Number: ', num2str(n)])
        disp(num2str(counter))
    end

while lastPos ~= currPos %check to see if the current position is the same as the last one i.e. it has stopped
    counter = counter + 1;

    lastPos = currPos; %set pos equal to the last reading
    pause(0.35)
    currPos = getPos(s,0); %take new reading
    if counter == 1
        if even == 1
            bottomPos(n) = currPos
        else
            topPos(n) = currPos
        end
    end
    disp(['Last position: ', num2str(lastPos), ', Current position: ', num2str(currPos)]);
end
if even == -1
    bottomPos(n) = currPos
else
    topPos(n) = currPos
end

end
topAvg = mean(topPos);
bottomAvg = mean(bottomPos);
topVar = max(abs(topPos)) - min(abs(topPos));
bottomVar = max(abs(bottomPos)) - min(abs(bottomPos));
topSTD = std(topPos);
bottomSTD = std(bottomPos);
disp(['Average bottom pos :', num2str(bottomAvg), ' with max delta: ', num2str(bottomVar), ' and std of: ', num2str(bottomSTD)])
disp(['Average top pos :', num2str(topAvg), ' with max delta: ', num2str(topVar), ' and std of: ', num2str(topSTD)])
disp(num2str(topPos))
disp(num2str(bottomPos))
csvwrite('top.txt',transpose(topPos))
csvwrite('bottom.txt',transpose(bottomPos))
end