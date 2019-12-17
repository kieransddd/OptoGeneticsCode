function[y, x] = phaseData_to_xy(phaseData)
    t = 0;
    y = 0;
    x = 0;
    for i = 1:length(phaseData.intensity)
        [y_temp, x_temp] = get_phase(phaseData.intensity(i), phaseData.offset(i), phaseData.tPulse(i), phaseData.tInterpulse(i), phaseData.periods(i), t);
        t = x_temp(end);
        y = [y, y_temp];
        x = [x, x_temp];
    end
end