function stl_deleteFromGlobalNeutralObjects(indexObjectsToDelete)
%% STL_DELETEFROMGLOBALENEMIES - Delete several enemies from the global enemy
% queue (���������˴�ȫ�ֵ��˶�����ɾ��)
%
% 
%% USAGE �÷�:
% ------
% stl_deleteFromNeutralObjects(indexObjectsToDelete)
% 
%% Input ���������
% ------
% indexObjectsToDelete: the indices of the enemies to be deleted
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
% ��ȡҪɾ��Ԫ�صĸ���
nObjectsToDelete = numel(indexObjectsToDelete);

if nObjectsToDelete == 0
    return;
end
% Add the indices to the end of aGE
% ��Ҫɾ����Ԫ�ؼ���aGE��β
availNeutralObjects(numAvailNeutralObjects+1:...
    numAvailNeutralObjects+nObjectsToDelete) = indexObjectsToDelete;

% Update the nAGE value
% ����nAGE����
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
% ע�⣺ ������ȷʵɾ����queueNeutralObjects�е�Ԫ�أ�������ЩԪ�ر�Ϊ
% �����á���
%% --------------- Code Ends Here --------------------------------
return;
