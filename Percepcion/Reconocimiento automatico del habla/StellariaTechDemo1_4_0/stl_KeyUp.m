function stl_KeyUp(hObject, eventdata, handles)

global SpaceKeyPressed;

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

global LeftKeyPressed;
global RightKeyPressed;
global UpKeyPressed;
global DownKeyPressed;
global FireKeyPressed;
global BombKeyPressed;
global PauseKeyPressed;
global StartKeyPressed;
global CoinKeyPressed;

global MainFigureHdl;
global MainAxesHdl;

global LeftKeyEffective;
global RightKeyEffective;
global UpKeyEffective;
global DownKeyEffective;
global FireKeyEffective;
global BombKeyEffective;
global PauseKeyEffective;
global StartKeyEffective;
global CoinKeyEffective;


key = get(hObject,'CurrentKey');
% 
% if strcmp(key, 'space')
%     SpaceKeyPressed = 0;
% end

for i = 1:2
    if strcmp(key, LeftKeyNames{i})
        LeftKeyStatus(i) = false;
    elseif strcmp(key, RightKeyNames{i})
        RightKeyStatus(i) = false;
    elseif strcmp(key, UpKeyNames{i})
        UpKeyStatus(i) = false;
    elseif strcmp(key, DownKeyNames{i})
        DownKeyStatus(i) = false;
    elseif strcmp(key, FireKeyNames{i})
        FireKeyStatus(i) = false;
    elseif strcmp(key, BombKeyNames{i})
        BombKeyEffective(i) = false;
        BombKeyStatus(i) = false;
    elseif strcmp(key, PauseKeyNames{i})
        PauseKeyStatus(i) = false;
        PauseKeyStatus(i) = false;
    elseif strcmp(key, StartKeyNames{i})
        StartKeyStatus(i) = false;
    elseif strcmp(key, CoinKeyNames{i})
        CoinKeyPressed(i) = false;
        CoinKeyStatus(i) = false;
    end
end
% disp(key);