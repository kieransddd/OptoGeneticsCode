% Initialize variables
LED.intensity = 0; % [uint8]
LED.periods = 0;
LED.offset = 0; % [s]
LED.tInterpulse = 0; % [s]
LED.tPulse = 0; % [s]

phaseData = repmat(LED,1,96);

%% Design experiment
phases = 1;
amplitude = 1*ones(96,1);
periods = 100*ones(96,1);
offset = 2*ones(96,1);
tInterpulse = 3*ones(96,1);
tPulse = 5000*ones(96,1);

%% Format experiment for optoPlate
for i = (1:96)
    phaseData(i).intensity = ones([phases, 1])*amplitude(i) ;
    phaseData(i).periods = ones([phases, 1])*periods(i);
    phaseData(i).offset = ones([phases, 1])*offset(i);
    
    phaseData(i).tInterpulse = ones([phases, 1])*tInterpulse(i);
    phaseData(i).tPulse = ones([phases, 1])*tPulse(i);
end

%% Export experiment file
[file, path] =  uiputfile('*.mat');
 save(fullfile(path,file), 'phaseData');