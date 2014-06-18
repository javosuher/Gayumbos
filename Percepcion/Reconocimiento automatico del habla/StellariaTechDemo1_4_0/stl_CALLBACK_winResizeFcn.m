function stl_CALLBACK_winResizeFcn(hObject, eventdata, handles)
% STL_CALLBACK_WINRESIZEFCN - ResizeFcn for the Main Windows of Stellaria
% Usage:
%   Automatically provoked when the window is resized
% 
% This function makes sure that the aspect ratio of the axes unaltered however 
% the figure is resized. Plus, it changes the size of all texts so that
% they are resized proportionally to the axes.
% 
% Stellari Studio, 2011 

% Update History
% ----------------------------------------------------------------------
% Date                  Programmer                      Modification
% ----                  ----------                      ------------
% 5/5/2011              M. Zhang                        Wrote it
% 5/7/2011              M. Zhang                        Text Resize
% ----                  ----------                      -------------
% ----------------------------------------------------------------------

%% -------------- Start of the function --------------------
global GAME_RESOLUTION
global MainAxesHdl;
global MainFigureHdl;
global MainAxesInitPos;
global AxesResizeFactor;
global MainFigureSize

global queueNeutralObjects
global availNeutralObjects
global numAvailNeutralObjects
global usedNeutralObjects

global TYPE_NEUTRAL_PICT

%% Get the new position of the figure 
%% And calculate the new aspect ratio
currentWinPos = get(MainFigureHdl, 'Position');

currentWinSize = currentWinPos(3:4);

defaultAspectRatio = GAME_RESOLUTION(1)/GAME_RESOLUTION(2); % The old aspect ratio
currentAspectRatio = currentWinSize(1)/currentWinSize(2);   % The new aspect ratio

%% Whether the new figure is 'thinner' or 'fatter' than the original one
if  currentAspectRatio < defaultAspectRatio     % If the new figure is 'thinner'
    
    currentAxesWidth = 1 - MainAxesInitPos(1)*2;    % Keep the width of the axes unaltered
    
    currentAxesHeight = (currentAxesWidth * currentAspectRatio) /defaultAspectRatio;   % Modify the height 
    
    currentAxesPos = [MainAxesInitPos(1) (1-currentAxesHeight)./2];   % Make sure the axes is centered
    
    set(MainAxesHdl, 'Position', [currentAxesPos,currentAxesWidth , currentAxesHeight]);
%     [currentAxesPos,currentAxesWidth , currentAxesHeight]
%     disp('thin');
    
elseif  currentAspectRatio >= defaultAspectRatio  % If the new figure is 'fatter'
    
    currentAxesHeight = 1 - MainAxesInitPos(2)*2;
    
    currentAxesWidth = currentAxesHeight.*defaultAspectRatio/currentAspectRatio;
   
    currentAxesPos = [(1-currentAxesWidth)./2 MainAxesInitPos(2)];
        
    set(MainAxesHdl, 'Position', [currentAxesPos,currentAxesWidth , currentAxesHeight]);
%     [currentAxesPos,currentAxesWidth , currentAxesHeight]
%     disp('fat');
end

%% Figure out how much the axes is resized
%% And change the size of all texts accordingly

% The resize factor
AxesResizeFactor = (currentWinSize(1).*currentAxesWidth) ./(MainFigureSize(1).* (1-MainAxesInitPos(1).*2));

% resize the texts, one at a time.
for i = find(usedNeutralObjects)
    if queueNeutralObjects(i).Type == TYPE_NEUTRAL_PICT
        continue;
    end
    set(queueNeutralObjects(i).ImageHandle, 'FontSize', queueNeutralObjects(i).TextSize.*AxesResizeFactor);
    queueNeutralObjects(i).TextSize
end

return;
%% --------------- End of the function -------------------------

