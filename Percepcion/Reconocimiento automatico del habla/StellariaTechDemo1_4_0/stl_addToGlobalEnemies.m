function [addedEnemyIndices, nEnemies] = stl_addToGlobalEnemies(enemiesToAdd)
%% STL_ADDTOGLOBALENEMIES - Add several enemies to the global enemy
% queue (���������˵�����������ȫ�ֵ��˶�����)
%
% * Please note that the word "enemy" represents all hostile vessels,
% * bullets and even bonus objects. In a word, an "enemy" is an object that
% * interacts with the player craft and bullets
% 
%% USAGE �÷�:
% ------
% [addedEnemyIndices, nEnemies] = stl_addToGlobalEnemies(enemiesToAdd)
% 
%% Input ���������
% ------
% enemiesToAdd: Contains the enemy structures to add, an 1 X nEnemies struct 
%               that contains fields as can be found in stl_initVariables
%              Ҫ���ӵĵ������ݣ�Ϊ1 x nEnemies ��С�Ľṹ�����顣���������
%               �μ�stl_initVariables��
%
%% Output �������:
% -------
% addedEnemyIndices: The indices of the enemy added, must be an 1 x nEnemies (output)
%                    cell array
%                       ��ȫ�ֵ��˶����У���Щ�ոձ�����ĵ��˵��±�. Ϊ
%                       1 x nEnemies (���ֵ)��Ԫ������
% nEnemies: The actual number of enemies added, must be equal or lower than
%           the length of enemiesToAdd 
%           ��ʵ�ʼ���ĵ��˵ĸ������ض�С�ڻ����enemiesToAdd�ĳ���
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
%  Mar 15, 2011             M. Zhang                wrote it
% --------------            -----------------       --------------------

%% --------------------Code Starts Here -------------------------

%% Declare the Global Variables ����ȫ�ֱ���
global queueGlobalEnemies   % The Global Enemy Queue
global availGlobalEnemies   % The indices of unused enemy queue elements
global numAvailGlobalEnemies    % The number of unused enemie queue elements
global usedGlobalEnemies

%% Exception Processing ���⴦��
% If the number of available enemies is smaller than the number of enemies to
% add, then add only the number of available enemies.
% �����ȫ�ֶ����У���ʹ�õ�enemy������ĿС����Ҫ���ӵĵ�����Ŀ����ô����ֻ��ȫ�ֶ���
% ����Ϊֹ������ĵ��˽�������ʾ��
nEnemies = min(numel(enemiesToAdd), numAvailGlobalEnemies);

% If no enemy is added at all, then return immediately with empty return
% values.
% �������û�е��˱����ӣ���ô���ؿվ���
% If not, create the return value with the given size.
% ���������������ôԤ�������ؾ���
if nEnemies <= 0
    addedEnemyIndices = [];
    return;
else
    addedEnemyIndices = zeros(1, nEnemies);
end

%% Main Code
% Assign image handles to the newly added enemies
% ����ͼ�ζ���
[addedImageIndices addedImageHandle nImages] = stl_addToGlobalImageHandles(nEnemies);

% For debugging
if nImages < nEnemies
    disp('stl_addToGlobalEnemies(): image queue overflow');
end

% The number of enemies added must not exceed the number of available
% images
% ����ĵ�����Ŀ���ɴ��ڿ��õ�ͼ�ζ�����Ŀ��
nEnemies = nImages;

% Put nEnemies available handles to a temporary array.
% * Not really necessary here, but may be useful if the mechanism of
% * queueing were to be altered in a future version. 
% �ҳ�ǰnEnemies�����õ�Handles�����ҽ����������ʱ�����С�
% * ��ʵ�������һ�����Ǳ���ġ�����������Ĵ����иı��˶��е�ʵ�ַ�ʽ��
% * ��ô����д���ܾ��Ǳ�Ҫ���ˡ�
tempGlobalEnemies = availGlobalEnemies(1:nEnemies);


% ���ͼ�ζ�����ȫ�����򲻿������µĵ��˱�����
if nEnemies <= 0
    addedEnemyIndices = [];
    return;
end

% Fill the enemy queue.
% ������˶���
try
queueGlobalEnemies(tempGlobalEnemies(1:nEnemies)) = enemiesToAdd(1:nEnemies);
catch
    a = 3;
end

% Save the image handles procured
% �����ȡ��image���
[queueGlobalEnemies(tempGlobalEnemies(1:nEnemies)).ImageHandle] = ...
    addedImageHandle{:};
[queueGlobalEnemies(tempGlobalEnemies(1:nEnemies)).ImageHandleIndex] = ...
    addedImageIndices{:};

% Update CurDefBox and CurAttBox
% ���·��غ͹����ж���

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
% ���¿��õ��˾������Ŀ
numAvailGlobalEnemies = numAvailGlobalEnemies - nEnemies;

% delete the used values, and pad the unused elements with zero.
% ��aGE����������ɾ����ռ�õ���Щ�����ʣ���Ԫ�����㲹�롣
availGlobalEnemies(1:numAvailGlobalEnemies) = ...
    availGlobalEnemies((1:numAvailGlobalEnemies)+nEnemies);
availGlobalEnemies(numAvailGlobalEnemies+1:end) = 0;
usedGlobalEnemies(tempGlobalEnemies(1:nEnemies)) = true;

% Get the indices and number of added enemies
% ���·���ֵ����Ϣ��
addedEnemyIndices = num2cell(tempGlobalEnemies(1:nEnemies));
% addedEnemies = num2cell(queueGlobalEnemies(tempGlobalEnemies));
    
%% --------------- Code Ends Here --------------------------------
return;