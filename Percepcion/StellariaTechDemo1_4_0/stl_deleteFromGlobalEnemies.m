function stl_deleteFromGlobalEnemies(indexEnemiesToDelete)
%% STL_DELETEFROMGLOBALENEMIES - Delete several enemies from the global enemy
% queue (将数个敌人从全局敌人队列中删除)
%
% 
%% USAGE 用法:
% ------
% stl_deleteFromGlobalEnemies(indexEnemiesToDelete)
% 
%% Input 输入参数：
% ------
% indexEnemiesToDelete: the indices of the enemies to be deleted
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
%       queueGlobalEnemies
%       emptyEnemyStruct
%       numAvailGlobalEnemies
%       availGlobalEnemies
% -- Global Variables Modifed:
%       queueGlobalEnemies
%       emptyEnemyStruct
%       numAvailGlobalEnemies
%       availGlobalEnemies
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
global queueGlobalEnemies
global emptyEnemyStruct
global numAvailGlobalEnemies
global availGlobalEnemies
global usedGlobalEnemies

%% Main Code
% Get the number of the enemies to delete
% 获取要删除元素的个数
nEnemiesToDelete = numel(indexEnemiesToDelete);

if nEnemiesToDelete == 0
    return;
end
% Add the indices to the end of aGE
% 将要删除的元素加入aGE队尾
availGlobalEnemies(numAvailGlobalEnemies+1:...
    numAvailGlobalEnemies+nEnemiesToDelete) = indexEnemiesToDelete;

% Update the nAGE value
% 更新nAGE数组
numAvailGlobalEnemies = numAvailGlobalEnemies + nEnemiesToDelete;

% Delete the data in the enemy queue
stl_deleteFromGlobalImageHandles([queueGlobalEnemies(indexEnemiesToDelete).ImageHandleIndex]);

try
queueGlobalEnemies(indexEnemiesToDelete) = emptyEnemyStruct;
catch
    a = 3;
end

usedGlobalEnemies(indexEnemiesToDelete) = false;


%% Note that the elements in queueGlobalEnemies ARE removed. 
% 注意： 本函数确实删除了queueGlobalEnemies中的元素，并将这些元素标为
% “可用”。
%% --------------- Code Ends Here --------------------------------
return;
