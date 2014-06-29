function [addedObjectsIndices, nObjects] = stl_addToNeutralObjects(objectsToAdd)
%% STL_ADDTONEUTRALOBJECTS - Add several neutral objects to the global neutral objects queue
% (���������Զ��������������ȫ�����Զ��������)
%
% * Please note that the word "neutral object" represents mainly texts,
% * It is an object that does not
% * interact with the player craft and bullets
% 
%% USAGE �÷�:
% ------
%  [addedObjectsIndices, nObjects] = stl_addToNeutralObjects(ibjectsToAdd)
% 
%% Input ���������
% ------
% objectsToAdd: Contains the object structures to add, an 1 X nObjects struct 
%               that contains fields as can be found in stl_initVariables
%              Ҫ���ӵĵ������ݣ�Ϊ1 x nObjects ��С�Ľṹ�����顣���������
%               �μ�stl_initVariables��
%
%% Output �������:
% -------
% addedObjectsIndices: The indices of the objects added, must be an 1 x nObjects (output)
%                    cell array
%                       ��ȫ�ֶ�������У���Щ�ոձ�����Ķ�����±�. Ϊ
%                       1 x nObjects (���ֵ)��Ԫ������
% nObjects: The actual number of objects added, must be equal or lower than
%           the length of objectsToAdd 
%           ��ʵ�ʼ���Ķ���ĸ������ض�С�ڻ����objectsToAdd�ĳ���
% 
%% Dependencies ������ϵ:
% -------
% -- Global Variables Created:
%       none
% -- Global Variables Used:
%       queueGlobalEnemies
%       availGlobalEnemies
%       numAvailGlobalEnemies
% -- Global Variables Modifed:
%       queueGlobalEnemies
%       availGlobalEnemies
%       numAvailGlobalEnemies
% -- Functions Used:
%       stl_addToGlobalImage
%
%% Created by Mingjing Zhang, Stellari Studio, 2011.

%% Update History
%
%  Date                     Updater                 Modifications Made
% --------------            -----------------       --------------------
%  Apr 25, 2011             M. Zhang                wrote it
% --------------            -----------------       --------------------

%% --------------------Code Starts Here -------------------------

%% Declare the Global Variables ����ȫ�ֱ���
global queueNeutralObjects
global availNeutralObjects
global numAvailNeutralObjects
global usedNeutralObjects
global CurrentFrameNo

global ID_CHN_TITLE
global OBJ_GENERIC_CONST
global TYPE_NEUTRAL_TEXT


global AxesResizeFactor

%% Exception Processing ���⴦��
% If the number of available enemies is smaller than the number of enemies to
% add, then add only the number of available enemies.
% �����ȫ�ֶ����У���ʹ�õ�enemy������ĿС����Ҫ���ӵĵ�����Ŀ����ô����ֻ��ȫ�ֶ���
% ����Ϊֹ������ĵ��˽�������ʾ��
nObjects = min(numel(objectsToAdd), numAvailNeutralObjects);

% If no enemy is added at all, then return immediately with empty return
% values.
% �������û�е��˱����ӣ���ô���ؿվ���
% If not, create the return value with the given size.
% ���������������ôԤ�������ؾ���
if nObjects <= 0
    addedObjectsIndices = [];
    return;
else
    addedObjectsIndices = zeros(1, nObjects);
end

%% Main Code
% Assign image handles to the newly added enemies
% ����ͼ�ζ���
if objectsToAdd(1).Type == TYPE_NEUTRAL_TEXT
    [addedImageIndices addedImageHandle nImages] = stl_addToGlobalTextHandles(nObjects);
else
    [addedImageIndices addedImageHandle nImages] = stl_addToNeutralImageHandles(nObjects);
end

% For debugging
if nImages < nObjects
    disp('stl_addToGlobalEnemies(): image queue overflow');
end

% The number of enemies added must not exceed the number of available
% images
% ����ĵ�����Ŀ���ɴ��ڿ��õ�ͼ�ζ�����Ŀ��
nObjects = nImages;

% Put nObjects available handles to a temporary array.
% * Not really necessary here, but may be useful if the mechanism of
% * queueing were to be altered in a future version. 
% �ҳ�ǰnObjects�����õ�Handles�����ҽ����������ʱ�����С�
% * ��ʵ�������һ�����Ǳ���ġ�����������Ĵ����иı��˶��е�ʵ�ַ�ʽ��
% * ��ô����д���ܾ��Ǳ�Ҫ���ˡ�
tempGlobalNeutralOBjects = availNeutralObjects(1:nObjects);


% ���ͼ�ζ�����ȫ�����򲻿������µĵ��˱�����
if nObjects <= 0
    addedObjectsIndices = [];
    return;
end

% Fill the enemy queue.
% ������˶���
try
queueNeutralObjects(tempGlobalNeutralOBjects(1:nObjects)) = objectsToAdd(1:nObjects);
catch
    a = 3;
end

% Save the image handles procured
% �����ȡ��image���
[queueNeutralObjects(tempGlobalNeutralOBjects(1:nObjects)).ImageHandle] = ...
    addedImageHandle{:};
[queueNeutralObjects(tempGlobalNeutralOBjects(1:nObjects)).ImageHandleIndex] = ...
    addedImageIndices{:};

% Update CurDefBox and CurAttBox
% ���·��غ͹����ж���

% [queueGlobalEnemies(tempGlobalEnemies(1:nObjects)).CurAttBox] = deal(queueGlobalEnemies(tempGlobalEnemies(1:nObjects)).OriAttBox);
% [queueGlobalEnemies(tempGlobalEnemies(1:nObjects)).CurDefBox] = deal(queueGlobalEnemies(tempGlobalEnemies(1:nObjects)).OriDefBox);

for i = tempGlobalNeutralOBjects(1:nObjects)
    queueNeutralObjects(i).Timers(OBJ_GENERIC_CONST(queueNeutralObjects(i).ID).TIMER.LIFETIME) = CurrentFrameNo;  % Get the current Frame
%     if queueNeutralObjects(i).Type == TYPE_NEUTRAL_TEXT && AxesResizeFactor~=1
%         queueNeutralObjects(i).TextSize = queueNeutralObjects(i).TextSize.* AxesResizeFactor;
%        
%     end
end

% Update the number of available enemy handles
% ���¿��õ��˾������Ŀ
numAvailNeutralObjects = numAvailNeutralObjects - nObjects;

% delete the used values, and pad the unused elements with zero.
% ��aGE����������ɾ����ռ�õ���Щ�����ʣ���Ԫ�����㲹�롣
availNeutralObjects(1:numAvailNeutralObjects) = ...
    availNeutralObjects((1:numAvailNeutralObjects)+nObjects);
availNeutralObjects(numAvailNeutralObjects+1:end) = 0;
usedNeutralObjects(tempGlobalNeutralOBjects(1:nObjects)) = true;

% Get the indices and number of added enemies
% ���·���ֵ����Ϣ��
addedObjectsIndices = num2cell(tempGlobalNeutralOBjects(1:nObjects));
% addedEnemies = num2cell(queueGlobalEnemies(tempGlobalEnemies));
    
%% --------------- Code Ends Here --------------------------------
return;