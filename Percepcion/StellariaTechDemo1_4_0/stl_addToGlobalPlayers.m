function stl_addToGlobalPlayers()
%% STL_ADDTOGLOBALPLAYERS - Add ALL players spacecrafts to the 
% global player queue (将数个玩家飞机的数据添加至全局玩家飞机队列中)
%
% * Please note that the word "player" represents ONLY player-controllable 
% * spacecrafts, and the number of "player"s must be equal or lower than 2
% * The global player queue does not include friendly bullets.
% 
%% USAGE 用法:
% ------
% [nPlayers] = stl_addToGlobalPlayers(nPlayers)
% 
%% Input 输入参数：
% ------
% nPlayers:     Number of players to add, maximally 2.
%              要添加的玩家飞机数目，最大值为2
%
%% Output 输出参数:
% -------
% None
% 
%% Dependencies 依赖关系:
% -------
% -- Global Variables Created:
%       none
% -- Global Variables Used:
%       queueGlobalPlayers
%       MAX_NUM_PLAYER_OBJ
%
% -- Global Variables Modifed:
%       queueGlobalPlayers
%
% -- Functions Used:
%       stl_addToGlobalImage
%
%% Special Notes:
% Note that the Image objects for the players are never released and
% reassigned to other sprites. 
% The elements in the global player queue is NOT dynamic. The number of
% elements is equal to the maximum number of players this game allows
% If the actual number of added player is not equal to the expected
% number, then an error will be generated.

%% Created by Mingjing Zhang, Stellari Studio, 2011.

%% Update History
%
%  Date                     Updater                 Modifications Made
% --------------            -----------------       --------------------
%  Mar 18, 2011             M. Zhang                wrote it
% --------------            -----------------       --------------------

%% --------------------Code Starts Here -------------------------

%% Declare the Global Variables 定义全局变量
global queueGlobalPlayers   % The Global Player Queue
global MAX_NUM_PLAYER_OBJ

%% Main Code
% Assign image handles to the newly added enemies
% 分配图形对象
[addedImageIndices addedImageHandle nImages] = stl_addToGlobalImageHandles(MAX_NUM_PLAYER_OBJ);

% For debugging
if nImages ~= MAX_NUM_PLAYER_OBJ
    error('stl_addToGlobalEnemies(): queueGlobalImage overflow. You gotta be kidding me.');
end

% Save the image handles procured
% 保存获取的image句柄
[queueGlobalPlayers(1:MAX_NUM_PLAYER_OBJ).ImageHandle] = ...
    addedImageHandle{:};
[queueGlobalPlayers(1:MAX_NUM_PLAYER_OBJ).ImageHandleIndex] = ...
    addedImageIndices{:};
for i = 1:MAX_NUM_PLAYER_OBJ
    uistack(queueGlobalPlayers(i).ImageHandle, 'top')
end

%% --------------- Code Ends Here --------------------------------
return;
