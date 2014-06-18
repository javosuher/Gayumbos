function stl_deleteFromGlobalFriendlyFire(indexPlayerFireToDelete)
%% STL_DELETEFROMGLOBALFRIENDLYFIRE - Delete several friendly fire from the 
% global bullet queue (将数个子弹从全局友军队列中删除)
%
% 
%% USAGE 用法:
% ------
% stl_deleteFromGlobalFriendlyFire(indexPlayerFireToDelete)
% 
%% Input 输入参数：
% ------
% indexPlayerFireToDelete: the indices of the bullets to be deleted
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

global emptyEnemyStruct
global queueGlobalFriendlyFire
global availGlobalFriendlyFire
global numAvailGlobalFriendlyFire
global usedGlobalFriendlyFire

global queueGlobalImageHandles          % The Global Image Object Queue
global numAvailGlobalImageHandles       % The number of unused image objects
global availGlobalImageHandles          % The indices of unused image objects

%% Main Code
% Get the number of the bullets to delete
% 获取要删除元素的个数
nBulletsToDelete = numel(indexPlayerFireToDelete);

if nBulletsToDelete <= 0 
    return;
end

% Add the indices to the end of aGFF
% 将要删除的元素加入aGFF队尾
availGlobalFriendlyFire(numAvailGlobalFriendlyFire+1:...
    numAvailGlobalFriendlyFire+nBulletsToDelete) = indexPlayerFireToDelete;

% Update the nAGFF value
% 更新nAGFF数组
numAvailGlobalFriendlyFire = numAvailGlobalFriendlyFire + nBulletsToDelete;

stl_deleteFromGlobalImageHandles([queueGlobalFriendlyFire(indexPlayerFireToDelete).ImageHandleIndex]);
% Delete the data in the bullet queue
queueGlobalFriendlyFire(indexPlayerFireToDelete) = emptyEnemyStruct;

usedGlobalFriendlyFire(indexPlayerFireToDelete) = false;
%% Note that the elements in queueGlobalFriendlyFire ARE removed. 
% 注意： 本函数确实删除了queueGlobalFriendlyFire中的元素，并将这些元素标为
% “可用”。
%% --------------- Code Ends Here --------------------------------
return;
