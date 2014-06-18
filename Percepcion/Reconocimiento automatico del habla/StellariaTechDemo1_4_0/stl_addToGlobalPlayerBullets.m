function [addedBulletIndices, nBullets] = stl_addToGlobalPlayerBullets(bulletsToAdd)
%% STL_ADDTOGLOBALPLAYERBULLETS - Add several bullets to the global bullet
% queue (�������ѷ��ӵ�\���������������ȫ���Ѿ�����������)
%
% * Please note that the word "bullet" represents all friendly projectiles,
% * including bullets and missiles that interact with the hostile crafts
% 
%% USAGE �÷�:
% ------
% [addedBulletIndices, nBullets] = stl_addToGlobalPlayerBullets(bulletsToAdd)
% 
%% Input ���������
% ------
% bulletsToAdd: Contains the bullet structures to add, an 1 X nBullets struct 
%               that contains fields as can be found in stl_initVariables
%              Ҫ��ӵ��ѷ��ӵ����ݣ�Ϊ1 x nBullets ��С�Ľṹ�����顣���������
%               �μ�stl_initVariables��
%
%% Output �������:
% -------
% addedBulletIndices: The indices of the bullets added, must be an 1 x nBullets (output)
%                    cell array
%                       ��ȫ���ѷ��ӵ������У���Щ�ոձ�������ѷ��ӵ����±�. Ϊ
%                       1 x nBullets (���ֵ)��Ԫ������
% nBullets: The actual number of bullets added, must be equal or lower than
%           the length of bulletsToAdd 
%           ��ʵ�ʼ�����ѷ��ӵ��ĸ������ض�С�ڻ����bulletsToAdd�ĳ���
% 
%% Dependencies ������ϵ:
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

%% Declare the Global Variables ����ȫ�ֱ���
global queueGlobalFriendlyFire
global availGlobalFriendlyFire
global numAvailGlobalFriendlyFire
global usedGlobalFriendlyFire

global PLAYER_CONST
global PLAYER_BULLET_ANIM

%% Exception Processing ���⴦��
% If the number of available bullets is smaller than the number of bullets to
% add, then add only the number of available bullets.
% �����ȫ�ֶ����У���ʹ�õ�FriendlyFire��ĿС����Ҫ��ӵ��ӵ���Ŀ����ô����ֻ��ȫ�ֶ���
% ����Ϊֹ��������ӵ���������ӡ�
nBullets = min(numel(bulletsToAdd), numAvailGlobalFriendlyFire);

% If no bullets is added at all, then return immediately with empty return
% values.
% �������û���ӵ�����ӣ���ô���ؿվ���
% If not, create the return value with the given size.
% ���������������ôԤ�������ؾ���
if nBullets <= 0
    addedBulletIndices = [];
    return;
else
    addedBulletIndices = zeros(1, nBullets);
end

%% Main Code
% Assign image handles to the newly added enemies
% ����ͼ�ζ���
 [addedImageIndices addedImageHandle nImages] = stl_addToGlobalImageHandles(nBullets);

% For debugging
if nImages < nBullets
    disp('stl_addToGlobalPlayerBullets(): image queue overflow');
end

% The number of bullets added must not exceed the number of available
% images
% ������ӵ���Ŀ���ɴ��ڿ��õ�ͼ�ζ�����Ŀ��
nBullets = nImages;

% Put nBullets available handles to a temporary array.
% * Not really necessary here, but may be useful if the mechanism of
% * queueing were to be altered in a future version. 
% �ҳ�ǰnBullets�����õ�Handles�����ҽ����������ʱ�����С�
% * ��ʵ�������һ�����Ǳ���ġ�����������Ĵ����иı��˶��е�ʵ�ַ�ʽ��
% * ��ô����д���ܾ��Ǳ�Ҫ���ˡ�
tempGlobalFriendlyFire = availGlobalFriendlyFire(1:nBullets);

% ���ͼ�ζ�����ȫ�����򲻿������µ��ӵ�������
if nBullets <= 0
    addedBulletIndices = [];
    return;
end

% Fill the bullet queue.
% �����ӵ�����
% bulletsToAdd(1:nBullets)
% queueGlobalFriendlyFire(tempGlobalFriendlyFire(1:nBullets))
% tempGlobalFriendlyFire(1:nBullets)
% numAvailGlobalFriendlyFire
queueGlobalFriendlyFire(tempGlobalFriendlyFire(1:nBullets)) = bulletsToAdd(1:nBullets);

% Save the image handles procured
% �����ȡ��image���
[queueGlobalFriendlyFire(tempGlobalFriendlyFire(1:nBullets)).ImageHandle] = ...
    addedImageHandle{:};
[queueGlobalFriendlyFire(tempGlobalFriendlyFire(1:nBullets)).ImageHandleIndex] = ...
    addedImageIndices{:};

for i = tempGlobalFriendlyFire(1:nBullets)
    queueGlobalFriendlyFire(i).CurAttBox(:, 5) = i;
    queueGlobalFriendlyFire(i).CurDefBox(:, 5) = i;
end

% Update the number of available bullet handles
% ���¿����ӵ��������Ŀ
numAvailGlobalFriendlyFire = numAvailGlobalFriendlyFire - nBullets;

% delete the used values, and pad the unused elements with zero.
% ������������ɾ����ռ�õ���Щ�����ʣ���Ԫ�����㲹�롣
availGlobalFriendlyFire(1:numAvailGlobalFriendlyFire) = ...
    availGlobalFriendlyFire((1:numAvailGlobalFriendlyFire)+nBullets);
availGlobalFriendlyFire(numAvailGlobalFriendlyFire+1:end) = 0;
usedGlobalFriendlyFire(tempGlobalFriendlyFire(1:nBullets)) = true;
% Get the indices and number of added enemies
% ���·���ֵ����Ϣ��
addedBulletIndices = num2cell(tempGlobalFriendlyFire(1:nBullets));
% addedEnemies = num2cell(queueGlobalEnemies(tempGlobalEnemies));
    
set([queueGlobalFriendlyFire(tempGlobalFriendlyFire(1:nBullets)).ImageHandle], 'Visible', 'on');

%% --------------- Code Ends Here --------------------------------
return;
