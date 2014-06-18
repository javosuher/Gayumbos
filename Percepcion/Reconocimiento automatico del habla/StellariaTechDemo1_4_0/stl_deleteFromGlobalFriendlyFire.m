function stl_deleteFromGlobalFriendlyFire(indexPlayerFireToDelete)
%% STL_DELETEFROMGLOBALFRIENDLYFIRE - Delete several friendly fire from the 
% global bullet queue (�������ӵ���ȫ���Ѿ�������ɾ��)
%
% 
%% USAGE �÷�:
% ------
% stl_deleteFromGlobalFriendlyFire(indexPlayerFireToDelete)
% 
%% Input ���������
% ------
% indexPlayerFireToDelete: the indices of the bullets to be deleted
%
%% Output �������:
% -------
% NONE
% 
%% Dependencies ������ϵ:
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
% ��ȡҪɾ��Ԫ�صĸ���
nBulletsToDelete = numel(indexPlayerFireToDelete);

if nBulletsToDelete <= 0 
    return;
end

% Add the indices to the end of aGFF
% ��Ҫɾ����Ԫ�ؼ���aGFF��β
availGlobalFriendlyFire(numAvailGlobalFriendlyFire+1:...
    numAvailGlobalFriendlyFire+nBulletsToDelete) = indexPlayerFireToDelete;

% Update the nAGFF value
% ����nAGFF����
numAvailGlobalFriendlyFire = numAvailGlobalFriendlyFire + nBulletsToDelete;

stl_deleteFromGlobalImageHandles([queueGlobalFriendlyFire(indexPlayerFireToDelete).ImageHandleIndex]);
% Delete the data in the bullet queue
queueGlobalFriendlyFire(indexPlayerFireToDelete) = emptyEnemyStruct;

usedGlobalFriendlyFire(indexPlayerFireToDelete) = false;
%% Note that the elements in queueGlobalFriendlyFire ARE removed. 
% ע�⣺ ������ȷʵɾ����queueGlobalFriendlyFire�е�Ԫ�أ�������ЩԪ�ر�Ϊ
% �����á���
%% --------------- Code Ends Here --------------------------------
return;
