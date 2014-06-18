function stageTableOver = stl_enterEnemies
% STL_ENTERENEMIES - add enemies to this global object queues as described
% in the stage script file.
%
% Usage:
% ------
%   stageTableOver = stl_enterEnemies
% ------
% Input:
% ------
%   None
%
% Output:
% -------
%   stageTableOver - if there are no more objects to be added to the global
%                   queues
%  

global CurrentFrameNo
global thisStageTimeTable;
global thisStageActors;

global TYPE_NEUTRAL_PICT
global TYPE_NEUTRAL_TEXT
global TYPE_ENEMY_CRAFT

% If the TimeTable is empty,
% it means there are no more enemies to be added
if isempty(thisStageTimeTable)
    stageTableOver = true;
    return;
else
    stageTableOver = false;
end

% If it is time one or several enemies should be added to the stage
% ***** Please note that if there are several objects to be added at the same time
% ***** They must be of the same TYPE.
% ***** If not, all objects but the first would be added to the wrong queue.
if CurrentFrameNo == thisStageTimeTable(1)
    enterEnemiesLogicalIndex = (thisStageTimeTable == CurrentFrameNo);
    enemiesToAdd = thisStageActors(enterEnemiesLogicalIndex);
    
    if enemiesToAdd(1).Type == TYPE_ENEMY_CRAFT
        [addedEnemyIndices, nEnemies] = stl_addToGlobalEnemies(enemiesToAdd);     
    else
        [addedEnemyIndices, nEnemies] = stl_addToGlobalNeutralObjects(enemiesToAdd);
    end
    
    % Delete the enemies from the waiting list
    thisStageTimeTable(enterEnemiesLogicalIndex) = [];
    thisStageActors(enterEnemiesLogicalIndex) = [];
end


