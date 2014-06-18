function stl_deleteFromGlobalImageHandles(indexImagesToDelete)
%% STL_DELETEFROMGLOBALIMAGEHANDLES - Delete several images from the global image
% queue (��ͼ�δ�ȫ��ͼ�ζ�����ɾ��)
%
% 
%% USAGE �÷�:
% ------
% stl_deleteFromGlobalImageHandles(indexImagesToDelete)
% 
%% Input ���������
% ------
% indexImagesToDelete: the indices of the images to be deleted
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
%       numAvailGlobalImageHandles
%       availGlobalImageHandles
% -- Global Variables Modifed:
%       numAvailGlobalImageHandles
%       availGlobalImageHandles
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
global queueGlobalImageHandles
global numAvailGlobalImageHandles
global availGlobalImageHandles

%% Main Code
% Get the number of the images to delete
% ��ȡҪɾ��Ԫ�صĸ���
nImagesToDelete = numel(indexImagesToDelete);

% Add the indices to the end of aGIH
% ��Ҫɾ����Ԫ�ؼ���aGIH��β
availGlobalImageHandles(numAvailGlobalImageHandles+1:...
    numAvailGlobalImageHandles+nImagesToDelete) = indexImagesToDelete;

set(queueGlobalImageHandles(indexImagesToDelete), 'Visible','off');
% Update the nAGIH value
% ����nAGIH����
numAvailGlobalImageHandles = numAvailGlobalImageHandles + nImagesToDelete;

%% Note that the elements in queueGlobalImageHandles are not removed. 
% They are merely labeled as "available" and their old values will disappear
% only when they are overwritten by new values.
% ע�⣺ ��������������ɾ����queueGlobalImageHandles�е�Ԫ�أ����ǽ���ЩԪ�ر�Ϊ
% �����á�����ЩԪ�ض�Ӧ��ͼ�ζ��������ֱ���´���ЩԪ�ر����·���֮ǰ������ı䡣
%% --------------- Code Ends Here --------------------------------
return;

