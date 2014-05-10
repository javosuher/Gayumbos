function stl_deleteFromGlobalEnemies(indexEnemiesToDelete)
%% STL_DELETEFROMGLOBALENEMIES - Delete several enemies from the global enemy
% queue (���������˴�ȫ�ֵ��˶�����ɾ��)
%
% 
%% USAGE �÷�:
% ------
% stl_deleteFromGlobalEnemies(indexEnemiesToDelete)
% 
%% Input ���������
% ------
% indexEnemiesToDelete: the indices of the enemies to be deleted
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
global queueGlobalEnemies
global emptyEnemyStruct
global numAvailGlobalEnemies
global availGlobalEnemies
global usedGlobalEnemies

%% Main Code
% Get the number of the enemies to delete
% ��ȡҪɾ��Ԫ�صĸ���
nEnemiesToDelete = numel(indexEnemiesToDelete);

if nEnemiesToDelete == 0
    return;
end
% Add the indices to the end of aGE
% ��Ҫɾ����Ԫ�ؼ���aGE��β
availGlobalEnemies(numAvailGlobalEnemies+1:...
    numAvailGlobalEnemies+nEnemiesToDelete) = indexEnemiesToDelete;

% Update the nAGE value
% ����nAGE����
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
% ע�⣺ ������ȷʵɾ����queueGlobalEnemies�е�Ԫ�أ�������ЩԪ�ر�Ϊ
% �����á���
%% --------------- Code Ends Here --------------------------------
return;