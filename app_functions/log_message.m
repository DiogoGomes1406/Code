function log_message(textArea, message)
%LOG_MESSAGE logs a message into the text area

    % Get the current time
    timestamp = string(datetime("now")).extractAfter(12);
    
    % Append message with timestamp
    textArea.Value = [textArea.Value; timestamp + "  -  " + message];
    
    % Scroll to the bottom
    scroll(textArea, 'bottom');
end
