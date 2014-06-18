function [addedImageIndices, addedImageHandles, nImages] = stl_addToGlobalTextHandles(nImages, imagesToAdd)
%% STL_ADDTOGLOBALTEXTHANDLES - Add several text to the Global Text
% queue (将图形添加至全局图形队列中)
%
% 
%% USAGE 用法:
% ------
% [addedImageIndices, addedImageHandles] = stl_addToGlobalImageHandles(nImages, imagesToAdd)
% 
%% Input 输入参数：
% ------
% nImages: The number of images to add.d
% imagesToAdd(unused): Contains the graphical content of the images to add, an 1 X
%               nImages struct that contains the following fields
%              要添加的图形的内容，为1 x nImages 大小的结构体数组。 包括下列域：
%               - CData
%               - AlphaData
%               - XData
%               - YData
%
%% Output 输出参数:
% -------
% addedImageIndices: The indices of the image handles which contain the
%                       added images, must be an 1 x nImages (output) cell array
%                       在全局图形队列中，那些刚刚被加入的图形的下标. 为
%                       1 x nImages (输出值)的元胞数组
% addedImageHandles: The actual handles of these images， size and type
%                       ditto
%                        那些刚刚被加入的图形的句柄值，大小和类型同上
% nImages: The actual number of images added, equal or lower than the input
%           nImages
%           被实际加入的图形的个数，必定小于或等于输入值nImages
% 
%% Dependencies 依赖关系:
% -------
% -- Global Variables Created:
%       none
% -- Global Variables Used:
%       queueGlobalTextHandles
%       numAvailGlobalTextHandles
%       availGlobalTextHandles
% -- Global Variables Modifed:
%       queueGlobalTextHandles
%       numAvailGlobalTextHandles
%       availGlobalTextHandles
% -- Functions Used:
%       none
%
%% Created by Mingjing Zhang, Stellari Studio, 2011.

%% Update History
%
%  Date                     Updater                 Modifications Made
% --------------            -----------------       --------------------
%  Mar 13, 2011             M. Zhang                wrote it
%  Mar 15, 2011             M. Zhang                made imagesToAdd obsolete
% --------------            -----------------       --------------------

%% --------------------Code Starts Here -------------------------

%% Declare the Global Variables 定义全局变量
global queueGlobalTextHandles
global numAvailGlobalTextHandles
global availGlobalTextHandles

%% Exception Processing 例外处理
% If the number of available images is smaller than the number of images to
% add, then add only the number of available images.
% 如果在全局队列中，可使用的image数目小于需要添加的图形数目。那么，就只把全局队列
% 填满为止，多余的image将不被显示。
nImages = min(nImages, numAvailGlobalTextHandles);

% If no image is added at all, then return immediately with empty return
% values.
% 如果根本没有图形被添加，那么返回空矩阵
% If not, create the return value with the given size.
% 如果不是这样，那么预创建返回矩阵
if nImages <= 0
    addedImageIndices = [];
    addedImageHandles = [];
    return;
else
    addedImageIndices = zeros(1, nImages);
    addedImageHandles = zeros(1, nImages);
end

%% Main Code

% Put nImages available handles to a temporary array.
% * Not really necessary here, but may be useful if the mechanism of
% * queueing were to be altered in a future version. 
% 找出前nImages个可用的Handles，并且将其放置在临时数组中。
% * 其实在这里，这一步不是必须的。但是如果今后的代码中改变了队列的实现方式，
% * 那么这样写可能就是必要的了。
tempGlobalImageHandles = availGlobalTextHandles(1:nImages);

% -------------- Maybe it is not a good idea to initialize them here ----
% Set the properties of the images, one by one.
% % 逐个设置image的属性
% % for i = 1:nImages
% %     set(queueGlobalTextHandles(tempGlobalImageHandles(i)), ...
% %         'CData', imagesToAdd(i).CData,...
% %         'AlphaData', imagesToAdd(i).AlphaData...
% %         );
% % end

% Get the indices and handles;
% 更新返回值的信息。
% addedImageIndices = tempGlobalImageHandles;
% addedImageHandles = queueGlobalTextHandles(tempGlobalImageHandles);

% Turn on the images added
% 使新加的images可见
set(queueGlobalTextHandles(tempGlobalImageHandles), 'Visible', 'on');
addedImageIndices = num2cell(tempGlobalImageHandles);
addedImageHandles = num2cell(queueGlobalTextHandles(tempGlobalImageHandles));

% Update the number of available image handles
% 更新可用图形句柄的数目
numAvailGlobalTextHandles = numAvailGlobalTextHandles - nImages;

% delete the used values, and pad the unused elements with zero.
% 把aGIH数组左移以删掉被占用的那些句柄，剩余的元素用零补齐。
availGlobalTextHandles(1:numAvailGlobalTextHandles) = ...
    availGlobalTextHandles((1:numAvailGlobalTextHandles)+nImages);
availGlobalTextHandles(numAvailGlobalTextHandles+1:end) = 0;
    
%% --------------- Code Ends Here --------------------------------
return;
