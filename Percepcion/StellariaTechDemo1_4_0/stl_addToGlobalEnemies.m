function [addedEnemyIndices, nEnemies] = stl_addToGlobalEnemies(enemiesToAdd)
%% STL_ADDTOGLOBALENEMIES - Add several enemies to the global enemy
% queue (将数个敌人的数据添加至全局敌人队列中)
%
% * Please note that the word "enemy" represents all hostile vessels,
% * bullets and even bonus objects. In a word, an "enemy" is an object that
% * interacts with the player craft and bullets
% 
%% USAGE 用法:
% ------
% [addedEnemyIndices, nEnemies] = stl_addToGlobalEnemies(enemiesToAdd)
% 
%% Input 输入参数：
% ------
% enemiesToAdd: Contains the enemy structures to add, an 1 X nEnemies struct 
%               that contains fields as can be found in stl_initVariables
%              要添加的敌人数据，为1 x nEnemies 大小的结构体数组。域的名称请
%               参见stl_initVariables：
%
%% Output 输出参数:
% -------
% addedEnemyIndices: The indices of the enemy added, must be an 1 x nEnemies (output)
%                    cell array
%                       在全局敌人队列中，那些刚刚被加入的敌人的下标. 为
%                       1 x nEnemies (输出值)的元胞数组
% nEnemies: The actual number of enemies added, must be equal or lower than
%           the length of enemiesToAdd 
%           被实际加入的敌人的个数，必定小于或等于enemiesToAdd的长度
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
%  Mar 15, 2011             M. Zhang                wrote it
% --------------            -----------------       --------------------

%% --------------------Code Starts Here -------------------------

%% Declare the Global Variables 定义全局变量
global queueGlobalEnemies   % The Global Enemy Queue
global availGlobalEnemies   % The indices of unused enemy queue elements
global numAvailGlobalEnemies    % The number of unused enemie queue elements
global usedGlobalEnemies

%% Exception Processing 例外处理
% If the number of available enemies is smaller than the number of enemies to
% add, then add only the number of available enemies.
% 如果在全局队列中，可使用的enemy队列数目小于需要添加的敌人数目。那么，就只把全局队列
% 填满为止，多余的敌人将不被显示。
nEnemies = min(numel(enemiesToAdd), numAvailGlobalEnemies);

% If no enemy is added at all, then return immediately with empty return
% values.
% 如果根本没有敌人被添加，那么返回空矩阵
% If not, create the return value with the given size.
% 如果不是这样，那么预创建返回矩阵
if nEnemies <= 0
    addedEnemyIndices = [];
    return;
else
    addedEnemyIndices = zeros(1, nEnemies);
end

%% Main Code
% Assign image handles to the newly added enemies
% 分配图形对象
[addedImageIndices addedImageHandle nImages] = stl_addToGlobalImageHandles(nEnemies);

% For debugging
if nImages < nEnemies
    disp('stl_addToGlobalEnemies(): image queue overflow');
end

% The number of enemies added must not exceed the number of available
% images
% 填入的敌人数目不可大于可用的图形对象数目。
nEnemies = nImages;

% Put nEnemies available handles to a temporary array.
% * Not really necessary here, but may be useful if the mechanism of
% * queueing were to be altered in a future version. 
% 找出前nEnemies个可用的Handles，并且将其放置在临时数组中。
% * 其实在这里，这一步不是必须的。但是如果今后的代码中改变了队列的实现方式，
% * 那么这样写可能就是必要的了。
tempGlobalEnemies = availGlobalEnemies(1:nEnemies);


% 如果图形队列已全满，则不可以有新的敌人被加入
if nEnemies <= 0
    addedEnemyIndices = [];
    return;
end

% Fill the enemy queue.
% 填入敌人队列
try
queueGlobalEnemies(tempGlobalEnemies(1:nEnemies)) = enemiesToAdd(1:nEnemies);
catch
    a = 3;
end

% Save the image handles procured
% 保存获取的image句柄
[queueGlobalEnemies(tempGlobalEnemies(1:nEnemies)).ImageHandle] = ...
    addedImageHandle{:};
[queueGlobalEnemies(tempGlobalEnemies(1:nEnemies)).ImageHandleIndex] = ...
    addedImageIndices{:};

% Update CurDefBox and CurAttBox
% 更新防守和攻击判定框

% [queueGlobalEnemies(tempGlobalEnemies(1:nEnemies)).CurAttBox] = deal(queueGlobalEnemies(tempGlobalEnemies(1:nEnemies)).OriAttBox);
% [queueGlobalEnemies(tempGlobalEnemies(1:nEnemies)).CurDefBox] = deal(queueGlobalEnemies(tempGlobalEnemies(1:nEnemies)).OriDefBox);

for i = tempGlobalEnemies(1:nEnemies)
    if ~isempty(queueGlobalEnemies(i).CurAttBox)
        queueGlobalEnemies(i).CurAttBox(:, 5) = i;
    end
    %     queueGlobalEnemies(i).CurAttBox(:, 6) = queueGlobalEnemies(i).EffAttBox(:);
    if ~isempty(queueGlobalEnemies(i).CurDefBox) 
        queueGlobalEnemies(i).CurDefBox(:, 5) = i;
    end
    %     queueGlobalEnemies(i).CurDefBox(:, 6) = queueGlobalEnemies(i).EffDefBox(:);
    queueGlobalEnemies(i).OriPos = queueGlobalEnemies(i).Pos;
end

% Update the number of available enemy handles
% 更新可用敌人句柄的数目
numAvailGlobalEnemies = numAvailGlobalEnemies - nEnemies;

% delete the used values, and pad the unused elements with zero.
% 把aGE数组左移以删掉被占用的那些句柄，剩余的元素用零补齐。
availGlobalEnemies(1:numAvailGlobalEnemies) = ...
    availGlobalEnemies((1:numAvailGlobalEnemies)+nEnemies);
availGlobalEnemies(numAvailGlobalEnemies+1:end) = 0;
usedGlobalEnemies(tempGlobalEnemies(1:nEnemies)) = true;

% Get the indices and number of added enemies
% 更新返回值的信息。
addedEnemyIndices = num2cell(tempGlobalEnemies(1:nEnemies));
% addedEnemies = num2cell(queueGlobalEnemies(tempGlobalEnemies));
    
%% --------------- Code Ends Here --------------------------------
return;
