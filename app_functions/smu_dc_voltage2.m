function smu_dc_voltage2(smu, channel, voltage, currProt)
%SMU_DC_VOLTAGE2 Set a channel to DC voltage mode,
% apply voltage, and set compliance


% Ensure output is in DC voltage (fixed) mode
fprintf(smu, [':SOUR', num2str(channel), ':FUNC:MODE VOLT']);
fprintf(smu, [':SOUR', num2str(channel), ':VOLT:MODE FIX']);

% Set the actual voltage value
fprintf(smu, [':SOUR', num2str(channel), ':VOLT ', num2str(voltage)]);

% Apply compliance
fprintf(smu, [':SENS', num2str(channel), ':CURR:PROT ', num2str(currProt)]);

% Configure to measure current on this channel
fprintf(smu, [':SENS', num2str(channel), ':FUNC "CURR"']);

% Check errors
fprintf(smu, ':SYSTEM:ERROR?');
err = readline(smu);
if ~contains(err, '0,"No error"')
    warning('Error setting DC voltage (Ch %d = %.3f V, Prot=%.3g A): %s', channel, voltage, currProt, err);
end
end
