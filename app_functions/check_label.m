function [new_label,uniqueness] = check_label(label,array)
%check_label Gets passed a label and an array of existing labels 
% and checks if the label exists or not.

cleanedLabels = cellfun(@(s) split(s, '('), array, 'UniformOutput', false);
cleanedLabels = cellfun(@(s) s{1}, cleanedLabels, 'UniformOutput', false);



if ismember(label, cleanedLabels) % if used already
    % check if in format
    if contains(label,"--") % in format
        splited_label = split(label,"--");
        name = splited_label(1);
        counter = str2double(splited_label(2))+1;
        new_label = name +"--"+counter;
    else % not in format
        new_label = label + "--1";
    end

    % keeps going until a unique label is found
    [new_label,~] = check_label(new_label,array);
    uniqueness=0;
else
    new_label = convertCharsToStrings(label);
    uniqueness=1;
end
