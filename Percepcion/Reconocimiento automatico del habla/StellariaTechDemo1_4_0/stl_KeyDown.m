function stl_KeyDown(hObject, eventdata, handles)

global SpaceKeyPressed;
global queueGlobalPlayers
%% Key Names
global LeftKeyNames;
global RightKeyNames;
global UpKeyNames;
global DownKeyNames;
global FireKeyNames;
global BombKeyNames;
global PauseKeyNames;
global StartKeyNames;
global CoinKeyNames;

%% Key Status
global LeftKeyStatus;
global RightKeyStatus;
global UpKeyStatus;
global DownKeyStatus;
global FireKeyStatus;
global BombKeyStatus;
global PauseKeyStatus;
global StartKeyStatus;
global CoinKeyStatus;

global LeftKeyEffective;
global RightKeyEffective;
global UpKeyEffective;
global DownKeyEffective;
global FireKeyEffective;
global BombKeyEffective;
global PauseKeyEffective;
global StartKeyEffective;
global CoinKeyEffective;

global MainFigureHdl;
global MainAxesHdl;

key = get(hObject,'CurrentKey');

% if strcmp(key, 'space')
%     SpaceKeyPressed = 1;
% end

for i = 1:2
    if strcmp(key, LeftKeyNames{i})
        LeftKeyEffective(i) = (~LeftKeyStatus(i));
        LeftKeyStatus(i) = true;
    elseif strcmp(key, RightKeyNames{i})
        RightKeyEffective(i) = ~RightKeyStatus(i);
        RightKeyStatus(i) = true;
    elseif strcmp(key, UpKeyNames{i})
        UpKeyStatus(i) = true;
    elseif strcmp(key, DownKeyNames{i})
        DownKeyStatus(i) = true;
    elseif strcmp(key, FireKeyNames{i})
        FireKeyStatus(i) = true;
    elseif strcmp(key, BombKeyNames{i})
        
        % The bombkey is only considered pressed if
        % the Bombkey was not pressed in the last check
        % AND the bomb is ready
        if ~BombKeyStatus(i) && queueGlobalPlayers(i).BombReady
            BombKeyEffective(i) = true;
        end
        BombKeyStatus(i) = true;
    elseif strcmp(key, PauseKeyNames{i})
        if ~PauseKeyStatus(i)
            PauseKeyEffective(i) = true;
        end
        PauseKeyStatus(i) = true;
    elseif strcmp(key, StartKeyNames{i})
        if ~StartKeyStatus(i)
            StartKeyEffective(i) = true;
        end
        StartKeyStatus(i) = true;
    elseif strcmp(key, CoinKeyNames{i})
        if ~CoinKeyStatus(i)
            CoinKeyEffective(i) = true;
        end
        CoinKeyStatus(i) = true;
    end
end

% fprintf('KeyPressed\n');
% disp(key);