phaseDataIn = phaseData(1);

function[y, x] = getPhases(phaseDataIn)
    t = 0;
    y = 0;
    x= 0;
    
    for i = 1:length(phaseDataIn.intensity)
        [tempY, x0] = getPhase(phaseDataIn.intensity(i), phaseDataIn.offset(i), phaseDataIn.tPulse(i), phaseDataIn.tInterpulse(i), phaseDataIn.periods(i), t);
        t = x0(end);
        y(i) = tempY;
        x(i) = x0;
    end
    
end
 
 function[plotterPointsY, plotterPointsX] = getPhase(intensity, offset, tPulse, tInterpulse, periods, t0)
    plotterPointsY = ones([1,4*periods+2]);
    plotterPointsX = ones([1,4*periods+2]);
    plotterPointsY(1) = 0;
    plotterPointsX(1) = t0;
    plotterPointsY(2) = 0;
    plotterPointsX(2) = t0 + offset;
    t = t0 + offset;
    for i = 1:periods
         [plotterPointsY((i-1)*4+3:i*4+2), plotterPointsX((i-1)*4+3:i*4+2)] = getplotterPoints(intensity, tPulse, tInterpulse, t);
         t = t + tPulse + tInterpulse;
    end
 end
 
 function[plotterPointsY, plotterPointsX] = getplotterPoints(intensity, tPulse, tInterpulse, t0)
    plotterPointsY(1) = intensity;
    plotterPointsX(1) = t0;
    plotterPointsY(2) = intensity;
    plotterPointsX(2) = t0 + tPulse;
    plotterPointsY(3) = 0;
    plotterPointsX(3) = t0 + tPulse;
    plotterPointsY(4) = 0;
    plotterPointsX(4) = t0 + tPulse + tInterpulse;
 end