function stl_deleteFromGlobalTextHandles(indexImagesToDelete)
%% STL_DELETEFROMGLOBALTEXTHANDLES - Delete several images from the global image
% queue (将图形从全局图形队列中删除)
%
% 
%% USAGE 用法:
% ------
% stl_deleteFromNeutralImageHandles(indexImagesToDelete)
% 
%% Input 输入参数：
% ------
% indexImagesToDelete: the indices of the images to be deleted
%

%% Output 输出参数:
% -------
% NONE
% 
%% Dependencies 依赖关系:
% -------
% -- Neutral Variables Created:
%       none
% -- Global Variables Used:
%       numAvailGlobalImageHandles
%       availGlobalImageHandles
% -- Global Variables Modifed:
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
% --------------            -----------------       --------------------

%% --------------------Code Starts Here -------------------------

%% Declare the Global Variables
global queueGlobalTextHandles
global numAvailGlobalTextHandles
global availGlobalTextHandles

%% Main Code
% Get the number of the images to delete
% 获取要删除元素的个数
nImagesToDelete = numel(indexImagesToDelete);

if nImagesToDelete == 0
    return;
end
% Add the indices to the end of aGIH
% 将要删除的元素加入aGIH队尾
availGlobalTextHandles(numAvailGlobalTextHandles+1:...
    numAvailGlobalTextHandles+nImagesToDelete) = indexImagesToDelete;

set(queueGlobalTextHandles(indexImagesToDelete), 'Visible','off');
% Update the nAGIH value
% 更新nAGIH数组
numAvailGlobalTextHandles = numAvailGlobalTextHandles + nImagesToDelete;

%% Note that the elements in queueGlobalTextHandles are not removed. 
% They are merely labeled as "available" and their old values will disappear
% only when they are overwritten by new values.
% 注意： 本函数并非真正删除了queueGlobalTextHandles中的元素，而是将这些元素标为
% “可用”。这些元素对应的图形对象的属性直到下次这些元素被重新分配之前都不会改变。
%% --------------- Code Ends Here --------------------------------
return;


