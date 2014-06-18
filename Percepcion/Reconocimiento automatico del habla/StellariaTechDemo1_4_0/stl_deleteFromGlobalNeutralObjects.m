function stl_deleteFromGlobalNeutralObjects(indexObjectsToDelete)
%% STL_DELETEFROMGLOBALENEMIES - Delete several enemies from the global enemy
% queue (将数个敌人从全局敌人队列中删除)
%
% 
%% USAGE 用法:
% ------
% stl_deleteFromNeutralObjects(indexObjectsToDelete)
% 
%% Input 输入参数：
% ------
% indexObjectsToDelete: the indices of the enemies to be deleted
%
%% Output 输出参数:
% -------
% NONE
% 
%% Dependencies 依赖关系:
% -------
% -- Global Variables Created:
%       none
% -- Global Variables Used:
%       queueNeutralObjects
%       emptyEnemyStruct
%       numAvailNeutralObjects
%       availNeutralObjects
% -- Global Variables Modifed:
%       queueNeutralObjects
%       emptyEnemyStruct
%       numAvailNeutralObjects
%       availNeutralObjects
% -- Functions Used:
%       none
%
%% Created by Mingjing Zhang, Stellari Studio, 2011.

%% Update History
%
%  Date                     Updater                 Modifications Made
% --------------            -----------------       --------------------
%  Mar 15, 2011             M. Zhang                wrote it
% --------------            -----------------       --------------------

%% --------------------Code Starts Here -------------------------

%% Declare the Global Variables

global emptyNeutralObjectStruct

global queueNeutralObjects
global availNeutralObjects
global numAvailNeutralObjects
global usedNeutralObjects

global TYPE_NEUTRAL_TEXT
global TYPE_NEUTRAL_PICT

%% Main Code
% Get the number of the enemies to delete
% 获取要删除元素的个数
nObjectsToDelete = numel(indexObjectsToDelete);

if nObjectsToDelete == 0
    return;
end
% Add the indices to the end of aGE
% 将要删除的元素加入aGE队尾
availNeutralObjects(numAvailNeutralObjects+1:...
    numAvailNeutralObjects+nObjectsToDelete) = indexObjectsToDelete;

% Update the nAGE value
% 更新nAGE数组
numAvailNeutralObjects = numAvailNeutralObjects + nObjectsToDelete;

% Delete the data in the enemy queue

% Select the picture
IsPictLogical = [queueNeutralObjects(indexObjectsToDelete).Type] == TYPE_NEUTRAL_PICT;


stl_deleteFromNeutralImageHandles([queueNeutralObjects(indexObjectsToDelete(IsPictLogical)).ImageHandleIndex]);
% else
stl_deleteFromGlobalTextHandles([queueNeutralObjects(indexObjectsToDelete(~IsPictLogical)).ImageHandleIndex]);
% end


try
queueNeutralObjects(indexObjectsToDelete) = emptyNeutralObjectStruct;
catch
    a = 3;
end

usedNeutralObjects(indexObjectsToDelete) = false;


%% Note that the elements in queueNeutralObjects ARE removed. 
% 注意： 本函数确实删除了queueNeutralObjects中的元素，并将这些元素标为
% “可用”。
%% --------------- Code Ends Here --------------------------------
return;
