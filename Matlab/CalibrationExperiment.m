led.intensity = 0;
led.duration = 0;
phaseData = repmat(led,1,96);
width = 1;
exposureTime = 2;

for i = (1:96)
    phaseData(i).intensity = ones([width, 1])*255;
    phaseData(i).periods = ones([width, 1])*1;
    phaseData(i).offset = ones([width, 1])*(5 + i*(exposureTime+1)) ;
    phaseData(i).tInterpulse = ones([width, 1])*1;
    phaseData(i).tPulse = ones([width, 1])*exposureTime;
end

 save('phaseData.mat', 'phaseData');