function [addedBulletIndices, nBullets] = stl_addToGlobalPlayerBullets(bulletsToAdd)
%% STL_ADDTOGLOBALPLAYERBULLETS - Add several bullets to the global bullet
% queue (将数个友方子弹\导弹的数据添加至全局友军火力队列中)
%
% * Please note that the word "bullet" represents all friendly projectiles,
% * including bullets and missiles that interact with the hostile crafts
% 
%% USAGE 用法:
% ------
% [addedBulletIndices, nBullets] = stl_addToGlobalPlayerBullets(bulletsToAdd)
% 
%% Input 输入参数：
% ------
% bulletsToAdd: Contains the bullet structures to add, an 1 X nBullets struct 
%               that contains fields as can be found in stl_initVariables
%              要添加的友方子弹数据，为1 x nBullets 大小的结构体数组。域的名称请
%               参见stl_initVariables：
%
%% Output 输出参数:
% -------
% addedBulletIndices: The indices of the bullets added, must be an 1 x nBullets (output)
%                    cell array
%                       在全局友方子弹队列中，那些刚刚被加入的友方子弹的下标. 为
%                       1 x nBullets (输出值)的元胞数组
% nBullets: The actual number of bullets added, must be equal or lower than
%           the length of bulletsToAdd 
%           被实际加入的友方子弹的个数，必定小于或等于bulletsToAdd的长度
% 
%% Dependencies 依赖关系:
% -------
% -- Global Variables Created:
%       none
% -- Global Variables Used:
% global queueGlobalFriendlyFire
% global availGlobalFriendlyFire
% global numAvailGlobalFriendlyFire
% -- Global Variables Modifed:
% global queueGlobalFriendlyFire
% global availGlobalFriendlyFire
% global numAvailGlobalFriendlyFire
% -- Functions Used:
%       stl_addToGlobalImage
%
%% Created by Mingjing Zhang, Stellari Studio, 2011.

%% Update History
%
%  Date                     Updater                 Modifications Made
% --------------            -----------------       --------------------
%  Mar 25, 2011             M. Zhang                wrote it
% --------------            -----------------       --------------------

%% --------------------Code Starts Here -------------------------

%% Declare the Global Variables 定义全局变量
global queueGlobalFriendlyFire
global availGlobalFriendlyFire
global numAvailGlobalFriendlyFire
global usedGlobalFriendlyFire

global PLAYER_CONST
global PLAYER_BULLET_ANIM

%% Exception Processing 例外处理
% If the number of available bullets is smaller than the number of bullets to
% add, then add only the number of available bullets.
% 如果在全局队列中，可使用的FriendlyFire数目小于需要添加的子弹数目。那么，就只把全局队列
% 填满为止，多余的子弹将不被添加。
nBullets = min(numel(bulletsToAdd), numAvailGlobalFriendlyFire);

% If no bullets is added at all, then return immediately with empty return
% values.
% 如果根本没有子弹被添加，那么返回空矩阵
% If not, create the return value with the given size.
% 如果不是这样，那么预创建返回矩阵
if nBullets <= 0
    addedBulletIndices = [];
    return;
else
    addedBulletIndices = zeros(1, nBullets);
end

%% Main Code
% Assign image handles to the newly added enemies
% 分配图形对象
 [addedImageIndices addedImageHandle nImages] = stl_addToGlobalImageHandles(nBullets);

% For debugging
if nImages < nBullets
    disp('stl_addToGlobalPlayerBullets(): image queue overflow');
end

% The number of bullets added must not exceed the number of available
% images
% 填入的子弹数目不可大于可用的图形对象数目。
nBullets = nImages;

% Put nBullets available handles to a temporary array.
% * Not really necessary here, but may be useful if the mechanism of
% * queueing were to be altered in a future version. 
% 找出前nBullets个可用的Handles，并且将其放置在临时数组中。
% * 其实在这里，这一步不是必须的。但是如果今后的代码中改变了队列的实现方式，
% * 那么这样写可能就是必要的了。
tempGlobalFriendlyFire = availGlobalFriendlyFire(1:nBullets);

% 如果图形队列已全满，则不可以有新的子弹被加入
if nBullets <= 0
    addedBulletIndices = [];
    return;
end

% Fill the bullet queue.
% 填入子弹队列
% bulletsToAdd(1:nBullets)
% queueGlobalFriendlyFire(tempGlobalFriendlyFire(1:nBullets))
% tempGlobalFriendlyFire(1:nBullets)
% numAvailGlobalFriendlyFire
queueGlobalFriendlyFire(tempGlobalFriendlyFire(1:nBullets)) = bulletsToAdd(1:nBullets);

% Save the image handles procured
% 保存获取的image句柄
[queueGlobalFriendlyFire(tempGlobalFriendlyFire(1:nBullets)).ImageHandle] = ...
    addedImageHandle{:};
[queueGlobalFriendlyFire(tempGlobalFriendlyFire(1:nBullets)).ImageHandleIndex] = ...
    addedImageIndices{:};

for i = tempGlobalFriendlyFire(1:nBullets)
    queueGlobalFriendlyFire(i).CurAttBox(:, 5) = i;
    queueGlobalFriendlyFire(i).CurDefBox(:, 5) = i;
end

% Update the number of available bullet handles
% 更新可用子弹句柄的数目
numAvailGlobalFriendlyFire = numAvailGlobalFriendlyFire - nBullets;

% delete the used values, and pad the unused elements with zero.
% 把数组左移以删掉被占用的那些句柄，剩余的元素用零补齐。
availGlobalFriendlyFire(1:numAvailGlobalFriendlyFire) = ...
    availGlobalFriendlyFire((1:numAvailGlobalFriendlyFire)+nBullets);
availGlobalFriendlyFire(numAvailGlobalFriendlyFire+1:end) = 0;
usedGlobalFriendlyFire(tempGlobalFriendlyFire(1:nBullets)) = true;
% Get the indices and number of added enemies
% 更新返回值的信息。
addedBulletIndices = num2cell(tempGlobalFriendlyFire(1:nBullets));
% addedEnemies = num2cell(queueGlobalEnemies(tempGlobalEnemies));
    
set([queueGlobalFriendlyFire(tempGlobalFriendlyFire(1:nBullets)).ImageHandle], 'Visible', 'on');

%% --------------- Code Ends Here --------------------------------
return;
