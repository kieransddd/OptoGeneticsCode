 function[y, x] = get_phase(intensity, offset, tPulse, tInterpulse, periods, t0)
    y = ones([1,4*periods+2]);
    x = ones([1,4*periods+2]);
    y(1) = 0;
    x(1) = t0;
    y(2) = 0;
    x(2) = t0 + offset;
    t = t0 + offset;
    
    for i = 1:periods
         [y((i-1)*4+3:i*4+2), x((i-1)*4+3:i*4+2)] = get_points(intensity, tPulse, tInterpulse, t);
         t = t + tPulse + tInterpulse;
    end
 end