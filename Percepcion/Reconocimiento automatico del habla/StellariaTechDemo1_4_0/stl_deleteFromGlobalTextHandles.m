function stl_deleteFromGlobalTextHandles(indexImagesToDelete)
%% STL_DELETEFROMGLOBALTEXTHANDLES - Delete several images from the global image
% queue (��ͼ�δ�ȫ��ͼ�ζ�����ɾ��)
%
% 
%% USAGE �÷�:
% ------
% stl_deleteFromNeutralImageHandles(indexImagesToDelete)
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
% ��ȡҪɾ��Ԫ�صĸ���
nImagesToDelete = numel(indexImagesToDelete);

if nImagesToDelete == 0
    return;
end
% Add the indices to the end of aGIH
% ��Ҫɾ����Ԫ�ؼ���aGIH��β
availGlobalTextHandles(numAvailGlobalTextHandles+1:...
    numAvailGlobalTextHandles+nImagesToDelete) = indexImagesToDelete;

set(queueGlobalTextHandles(indexImagesToDelete), 'Visible','off');
% Update the nAGIH value
% ����nAGIH����
numAvailGlobalTextHandles = numAvailGlobalTextHandles + nImagesToDelete;

%% Note that the elements in queueGlobalTextHandles are not removed. 
% They are merely labeled as "available" and their old values will disappear
% only when they are overwritten by new values.
% ע�⣺ ��������������ɾ����queueGlobalTextHandles�е�Ԫ�أ����ǽ���ЩԪ�ر�Ϊ
% �����á�����ЩԪ�ض�Ӧ��ͼ�ζ��������ֱ���´���ЩԪ�ر����·���֮ǰ������ı䡣
%% --------------- Code Ends Here --------------------------------
return;


