 function[y, x] = get_points(intensity, tPulse, tInterpulse, t0)
    y(1) = intensity;
    x(1) = t0;
    y(2) = intensity;
    x(2) = t0 + tPulse;
    y(3) = 0;
    x(3) = t0 + tPulse;
    y(4) = 0;
    x(4) = t0 + tPulse + tInterpulse;
 end