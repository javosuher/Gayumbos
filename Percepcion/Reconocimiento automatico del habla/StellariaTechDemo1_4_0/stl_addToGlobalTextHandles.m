function [addedImageIndices, addedImageHandles, nImages] = stl_addToGlobalTextHandles(nImages, imagesToAdd)
%% STL_ADDTOGLOBALTEXTHANDLES - Add several text to the Global Text
% queue (��ͼ�������ȫ��ͼ�ζ�����)
%
% 
%% USAGE �÷�:
% ------
% [addedImageIndices, addedImageHandles] = stl_addToGlobalImageHandles(nImages, imagesToAdd)
% 
%% Input ���������
% ------
% nImages: The number of images to add.d
% imagesToAdd(unused): Contains the graphical content of the images to add, an 1 X
%               nImages struct that contains the following fields
%              Ҫ��ӵ�ͼ�ε����ݣ�Ϊ1 x nImages ��С�Ľṹ�����顣 ����������
%               - CData
%               - AlphaData
%               - XData
%               - YData
%
%% Output �������:
% -------
% addedImageIndices: The indices of the image handles which contain the
%                       added images, must be an 1 x nImages (output) cell array
%                       ��ȫ��ͼ�ζ����У���Щ�ոձ������ͼ�ε��±�. Ϊ
%                       1 x nImages (���ֵ)��Ԫ������
% addedImageHandles: The actual handles of these images�� size and type
%                       ditto
%                        ��Щ�ոձ������ͼ�εľ��ֵ����С������ͬ��
% nImages: The actual number of images added, equal or lower than the input
%           nImages
%           ��ʵ�ʼ����ͼ�εĸ������ض�С�ڻ��������ֵnImages
% 
%% Dependencies ������ϵ:
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

%% Declare the Global Variables ����ȫ�ֱ���
global queueGlobalTextHandles
global numAvailGlobalTextHandles
global availGlobalTextHandles

%% Exception Processing ���⴦��
% If the number of available images is smaller than the number of images to
% add, then add only the number of available images.
% �����ȫ�ֶ����У���ʹ�õ�image��ĿС����Ҫ��ӵ�ͼ����Ŀ����ô����ֻ��ȫ�ֶ���
% ����Ϊֹ�������image��������ʾ��
nImages = min(nImages, numAvailGlobalTextHandles);

% If no image is added at all, then return immediately with empty return
% values.
% �������û��ͼ�α���ӣ���ô���ؿվ���
% If not, create the return value with the given size.
% ���������������ôԤ�������ؾ���
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
% �ҳ�ǰnImages�����õ�Handles�����ҽ����������ʱ�����С�
% * ��ʵ�������һ�����Ǳ���ġ�����������Ĵ����иı��˶��е�ʵ�ַ�ʽ��
% * ��ô����д���ܾ��Ǳ�Ҫ���ˡ�
tempGlobalImageHandles = availGlobalTextHandles(1:nImages);

% -------------- Maybe it is not a good idea to initialize them here ----
% Set the properties of the images, one by one.
% % �������image������
% % for i = 1:nImages
% %     set(queueGlobalTextHandles(tempGlobalImageHandles(i)), ...
% %         'CData', imagesToAdd(i).CData,...
% %         'AlphaData', imagesToAdd(i).AlphaData...
% %         );
% % end

% Get the indices and handles;
% ���·���ֵ����Ϣ��
% addedImageIndices = tempGlobalImageHandles;
% addedImageHandles = queueGlobalTextHandles(tempGlobalImageHandles);

% Turn on the images added
% ʹ�¼ӵ�images�ɼ�
set(queueGlobalTextHandles(tempGlobalImageHandles), 'Visible', 'on');
addedImageIndices = num2cell(tempGlobalImageHandles);
addedImageHandles = num2cell(queueGlobalTextHandles(tempGlobalImageHandles));

% Update the number of available image handles
% ���¿���ͼ�ξ������Ŀ
numAvailGlobalTextHandles = numAvailGlobalTextHandles - nImages;

% delete the used values, and pad the unused elements with zero.
% ��aGIH����������ɾ����ռ�õ���Щ�����ʣ���Ԫ�����㲹�롣
availGlobalTextHandles(1:numAvailGlobalTextHandles) = ...
    availGlobalTextHandles((1:numAvailGlobalTextHandles)+nImages);
availGlobalTextHandles(numAvailGlobalTextHandles+1:end) = 0;
    
%% --------------- Code Ends Here --------------------------------
return;
