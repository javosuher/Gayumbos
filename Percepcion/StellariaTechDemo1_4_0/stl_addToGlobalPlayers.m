function stl_addToGlobalPlayers()
%% STL_ADDTOGLOBALPLAYERS - Add ALL players spacecrafts to the 
% global player queue (��������ҷɻ������������ȫ����ҷɻ�������)
%
% * Please note that the word "player" represents ONLY player-controllable 
% * spacecrafts, and the number of "player"s must be equal or lower than 2
% * The global player queue does not include friendly bullets.
% 
%% USAGE �÷�:
% ------
% [nPlayers] = stl_addToGlobalPlayers(nPlayers)
% 
%% Input ���������
% ------
% nPlayers:     Number of players to add, maximally 2.
%              Ҫ��ӵ���ҷɻ���Ŀ�����ֵΪ2
%
%% Output �������:
% -------
% None
% 
%% Dependencies ������ϵ:
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

%% Declare the Global Variables ����ȫ�ֱ���
global queueGlobalPlayers   % The Global Player Queue
global MAX_NUM_PLAYER_OBJ

%% Main Code
% Assign image handles to the newly added enemies
% ����ͼ�ζ���
[addedImageIndices addedImageHandle nImages] = stl_addToGlobalImageHandles(MAX_NUM_PLAYER_OBJ);

% For debugging
if nImages ~= MAX_NUM_PLAYER_OBJ
    error('stl_addToGlobalEnemies(): queueGlobalImage overflow. You gotta be kidding me.');
end

% Save the image handles procured
% �����ȡ��image���
[queueGlobalPlayers(1:MAX_NUM_PLAYER_OBJ).ImageHandle] = ...
    addedImageHandle{:};
[queueGlobalPlayers(1:MAX_NUM_PLAYER_OBJ).ImageHandleIndex] = ...
    addedImageIndices{:};
for i = 1:MAX_NUM_PLAYER_OBJ
    uistack(queueGlobalPlayers(i).ImageHandle, 'top')
end

%% --------------- Code Ends Here --------------------------------
return;
