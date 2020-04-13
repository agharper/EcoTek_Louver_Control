function []= setPos(degrees,s)
initialPos = getPos(s,0);
if degrees > 90 || degrees < 0
    display('Cannot move beyond 0-90 degrees')
elseif initialPos < degrees
    currentPos = getPos(s,0);

    while currentPos <= degrees
        currentPos = getPos(s,0)
        
    outputSingleScan(s,[0 1 0]);
    end
        outputSingleScan(s,[1 0 0]); %stop when done

elseif initialPos > degrees
        currentPos = getPos(s,0);

        while currentPos >= degrees
        currentPos = getPos(s,0);
    outputSingleScan(s,[0 0 1]);
        end
        outputSingleScan(s,[1 0 0]); %stop when done

else 
        outputSingleScan(s,[1 0 0]); %stop when done
end
getPos(s,0)    
end
