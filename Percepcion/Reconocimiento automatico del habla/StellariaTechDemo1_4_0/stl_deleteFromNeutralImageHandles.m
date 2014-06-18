function stl_deleteFromNeutralImageHandles(indexImagesToDelete)
%% STL_DELETEFROMGLOBALTEXTHANDLES - Delete several texts from the global text
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
%       numAvailNeutralImageHandles
%       availNeutralImageHandles
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
global queueNeutralImageHandles
global numAvailNeutralImageHandles
global availNeutralImageHandles

%% Main Code
% Get the number of the images to delete
% ��ȡҪɾ��Ԫ�صĸ���
nImagesToDelete = numel(indexImagesToDelete);

if nImagesToDelete == 0
    return;
end
% Add the indices to the end of aGIH
% ��Ҫɾ����Ԫ�ؼ���aGIH��β
availNeutralImageHandles(numAvailNeutralImageHandles+1:...
    numAvailNeutralImageHandles+nImagesToDelete) = indexImagesToDelete;

set(queueNeutralImageHandles(indexImagesToDelete), 'Visible','off');
% Update the nAGIH value
% ����nAGIH����
numAvailNeutralImageHandles = numAvailNeutralImageHandles + nImagesToDelete;

%% Note that the elements in queueNeutralImageHandles are not removed. 
% They are merely labeled as "available" and their old values will disappear
% only when they are overwritten by new values.
% ע�⣺ ��������������ɾ����queueNeutralImageHandles�е�Ԫ�أ����ǽ���ЩԪ�ر�Ϊ
% �����á�����ЩԪ�ض�Ӧ��ͼ�ζ��������ֱ���´���ЩԪ�ر����·���֮ǰ������ı䡣
%% --------------- Code Ends Here --------------------------------
return;