clearvars; clc; close all
% Initialize variables
LED.intensity = 0; % [uint8]
LED.periods = 0;
LED.offset = 0; % [s]
LED.tInterpulse = 0; % [s]
LED.tPulse = 0; % [s]

phaseData = repmat(LED,1,96);

%%
amp_step = zeros(1,12);
amp_step(2:2:12) = [8 16 32 64 128 255];
amp_step = repmat(amp_step,8,1);
amp_step = reshape(amp_step',96,1);

%% Design experiment
phases = 1;
amplitude = 40*ones(96,1); amplitude = amp_step;
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