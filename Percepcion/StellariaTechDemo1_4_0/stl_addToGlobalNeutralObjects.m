function [addedObjectsIndices, nObjects] = stl_addToNeutralObjects(objectsToAdd)
%% STL_ADDTONEUTRALOBJECTS - Add several neutral objects to the global neutral objects queue
% (将数个中性对象的数据添加至全局中性对象队列中)
%
% * Please note that the word "neutral object" represents mainly texts,
% * It is an object that does not
% * interact with the player craft and bullets
% 
%% USAGE 用法:
% ------
%  [addedObjectsIndices, nObjects] = stl_addToNeutralObjects(ibjectsToAdd)
% 
%% Input 输入参数：
% ------
% objectsToAdd: Contains the object structures to add, an 1 X nObjects struct 
%               that contains fields as can be found in stl_initVariables
%              要添加的敌人数据，为1 x nObjects 大小的结构体数组。域的名称请
%               参见stl_initVariables：
%
%% Output 输出参数:
% -------
% addedObjectsIndices: The indices of the objects added, must be an 1 x nObjects (output)
%                    cell array
%                       在全局对象队列中，那些刚刚被加入的对象的下标. 为
%                       1 x nObjects (输出值)的元胞数组
% nObjects: The actual number of objects added, must be equal or lower than
%           the length of objectsToAdd 
%           被实际加入的对象的个数，必定小于或等于objectsToAdd的长度
% 
%% Dependencies 依赖关系:
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

%% Declare the Global Variables 定义全局变量
global queueNeutralObjects
global availNeutralObjects
global numAvailNeutralObjects
global usedNeutralObjects
global CurrentFrameNo

global ID_CHN_TITLE
global OBJ_GENERIC_CONST
global TYPE_NEUTRAL_TEXT


global AxesResizeFactor

%% Exception Processing 例外处理
% If the number of available enemies is smaller than the number of enemies to
% add, then add only the number of available enemies.
% 如果在全局队列中，可使用的enemy队列数目小于需要添加的敌人数目。那么，就只把全局队列
% 填满为止，多余的敌人将不被显示。
nObjects = min(numel(objectsToAdd), numAvailNeutralObjects);

% If no enemy is added at all, then return immediately with empty return
% values.
% 如果根本没有敌人被添加，那么返回空矩阵
% If not, create the return value with the given size.
% 如果不是这样，那么预创建返回矩阵
if nObjects <= 0
    addedObjectsIndices = [];
    return;
else
    addedObjectsIndices = zeros(1, nObjects);
end

%% Main Code
% Assign image handles to the newly added enemies
% 分配图形对象
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
% 填入的敌人数目不可大于可用的图形对象数目。
nObjects = nImages;

% Put nObjects available handles to a temporary array.
% * Not really necessary here, but may be useful if the mechanism of
% * queueing were to be altered in a future version. 
% 找出前nObjects个可用的Handles，并且将其放置在临时数组中。
% * 其实在这里，这一步不是必须的。但是如果今后的代码中改变了队列的实现方式，
% * 那么这样写可能就是必要的了。
tempGlobalNeutralOBjects = availNeutralObjects(1:nObjects);


% 如果图形队列已全满，则不可以有新的敌人被加入
if nObjects <= 0
    addedObjectsIndices = [];
    return;
end

% Fill the enemy queue.
% 填入敌人队列
try
queueNeutralObjects(tempGlobalNeutralOBjects(1:nObjects)) = objectsToAdd(1:nObjects);
catch
    a = 3;
end

% Save the image handles procured
% 保存获取的image句柄
[queueNeutralObjects(tempGlobalNeutralOBjects(1:nObjects)).ImageHandle] = ...
    addedImageHandle{:};
[queueNeutralObjects(tempGlobalNeutralOBjects(1:nObjects)).ImageHandleIndex] = ...
    addedImageIndices{:};

% Update CurDefBox and CurAttBox
% 更新防守和攻击判定框

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
% 更新可用敌人句柄的数目
numAvailNeutralObjects = numAvailNeutralObjects - nObjects;

% delete the used values, and pad the unused elements with zero.
% 把aGE数组左移以删掉被占用的那些句柄，剩余的元素用零补齐。
availNeutralObjects(1:numAvailNeutralObjects) = ...
    availNeutralObjects((1:numAvailNeutralObjects)+nObjects);
availNeutralObjects(numAvailNeutralObjects+1:end) = 0;
usedNeutralObjects(tempGlobalNeutralOBjects(1:nObjects)) = true;

% Get the indices and number of added enemies
% 更新返回值的信息。
addedObjectsIndices = num2cell(tempGlobalNeutralOBjects(1:nObjects));
% addedEnemies = num2cell(queueGlobalEnemies(tempGlobalEnemies));
    
%% --------------- Code Ends Here --------------------------------
return;
