function stl_processNeutralObjects()
%% STL_PROCESSNEUTRALOBJECTS - Change the status of neutral object, except for the pos
% 改变敌机的状态(Pos属性除外)
%
%% Usage
% stl_processEnemies(indPlayers)
%
%% Input
%   none
%
%% Output
%   none
%
%% Dependencies 依赖关系:
% -------
% -- Global Variables Created:
%       none
% -- Global Variables Used:
%       queueGlobalPlayers
%       MAX_NUM_PLAYER_OBJ
%
% -- Global Variables Modifed:
%       queueGlobalPlayers
%
% -- Functions Used:
%       stl_addToGlobalImage
%
%% Created by Mingjing Zhang, Stellari Studio, 2011.

%% Update History
%
%  Date                     Updater                 Modifications Made
% --------------            -----------------       --------------------
%  Apr 6, 2011             M. Zhang                wrote it
% --------------            -----------------       --------------------

%% --------------------Code Starts Here -------------------------

%% Declare the Global Variables
global queueGlobalPlayers

global queueImpromptuEnemies
global numImpromptuEnemies
global availGlobalEnemies   % The indices of unused enemy queue elements
global usedGlobalEnemies
global numAvailGlobalEnemies    % The number of unused enemie queue elements
global CurrentFrameNo

global queueNeutralObjects   % The Global Enemy Queue
global availNeutralObjects
global numAvailNeutralObjects
global usedNeutralObjects

global emptyEnemyStruct
global emptyNeutralObjectStruct
global MAX_NUM_ENEMY_OBJ
global MAX_NUM_NEUTRAL_OBJ


%% PLAYER TIMERS
global PLAYER_ANIM
global PLAYER_CONST
global PLAYER_BULLET_ANIM
global PLAYER_SFX
global EXPLO_ANIM
global ENEMY_ANIM
global ENEMY_BULLET_ANIM
global ENEMY_CONST
global ENEMY_BULLET_CONST
global OBJ_GENERIC_CONST

global GAME_RESOLUTION

global ActivePlayers
global MainFigureHdl

%% Enemy Types and IDS
global TYPE_ENEMY_CRAFT
global ID_EC_STACCATO
global ID_EC_LEGATO
global ID_EC_FORTEPIANO
global ID_EC_RONDO

global TYPE_ENEMY_BULLET
global ID_EB_VERDE
global ID_EB_ROSSO

global TYPE_PLAYER_BULLET
global ID_PB_FIRE

global DefaultEnemyStructs
global DefaultEnemyBulletStructs
global DefaultNeutralObjectStructs
global FPS
global FRAME_DURATION


global TYPE_NEUTRAL_TEXT
global TYPE_NEUTRAL_PICT
global ID_CHN_TITLE
global ID_TEXT_PROLOGUE_BLINK

global rotTable
global sinTable

global TextAxesSizeFactor
%% Process every player
% figure(MainFigureHdl);

NeutralObjectToDeleteIndex = false(1, MAX_NUM_NEUTRAL_OBJ);

for i = find(usedNeutralObjects)
    
    % If an object is static, it does not need to be processed at all
    if queueNeutralObjects(i).IsStatic
        continue;
    end
    
    if (queueNeutralObjects(i).Pos(2) > GAME_RESOLUTION(2)*TextAxesSizeFactor+10) ||...
            (queueNeutralObjects(i).Pos(2) < -10) ||...
            (queueNeutralObjects(i).Pos(1) > GAME_RESOLUTION(1)*TextAxesSizeFactor+10) ||...
            (queueNeutralObjects(i).Pos(1) < -10)
        NeutralObjectToDeleteIndex(i) = true;
        continue;
    end
    
    %% Process the fade in\out if the object is still alive
    queueNeutralObjects(i).ElapTimes(OBJ_GENERIC_CONST(queueNeutralObjects(i).ID).TIMER.LIFETIME) = ...
        CurrentFrameNo - queueNeutralObjects(i).Timers(OBJ_GENERIC_CONST(queueNeutralObjects(i).ID).TIMER.LIFETIME);
    
    % If the life of an object ends
    try
    if queueNeutralObjects(i).ElapTimes(OBJ_GENERIC_CONST(queueNeutralObjects(i).ID).TIMER.LIFETIME) > queueNeutralObjects(i).LifeTime
        NeutralObjectToDeleteIndex(i) = true;
        continue;
    elseif queueNeutralObjects(i).ElapTimes(OBJ_GENERIC_CONST(queueNeutralObjects(i).ID).TIMER.LIFETIME) >= queueNeutralObjects(i).FadeInOutTime(1) &&...
            queueNeutralObjects(i).ElapTimes(OBJ_GENERIC_CONST(queueNeutralObjects(i).ID).TIMER.LIFETIME) < (queueNeutralObjects(i).LifeTime - queueNeutralObjects(i).FadeInOutTime(2))
        queueNeutralObjects(i).AlphaFactor = 1;
    elseif queueNeutralObjects(i).ElapTimes(OBJ_GENERIC_CONST(queueNeutralObjects(i).ID).TIMER.LIFETIME) < queueNeutralObjects(i).FadeInOutTime(1)  % If Fading in
        queueNeutralObjects(i).AlphaFactor = queueNeutralObjects(i).ElapTimes(OBJ_GENERIC_CONST(queueNeutralObjects(i).ID).TIMER.LIFETIME)./(queueNeutralObjects(i).FadeInOutTime(1));
        queueNeutralObjects(i).AlphaChangeFlag = true;
    elseif queueNeutralObjects(i).ElapTimes(OBJ_GENERIC_CONST(queueNeutralObjects(i).ID).TIMER.LIFETIME) >= (queueNeutralObjects(i).LifeTime - queueNeutralObjects(i).FadeInOutTime(2))  % Fading out
        queueNeutralObjects(i).AlphaFactor = (queueNeutralObjects(i).LifeTime - queueNeutralObjects(i).ElapTimes(OBJ_GENERIC_CONST(queueNeutralObjects(i).ID).TIMER.LIFETIME))./(queueNeutralObjects(i).FadeInOutTime(2));
        queueNeutralObjects(i).AlphaChangeFlag = true;
    else
        error('stl_processNeutralObject(): are you kidding me?');
    end
    catch
        a = 3
    end
    
    %% Process Blinking

    if queueNeutralObjects(i).Type == TYPE_NEUTRAL_PICT
        if ~isempty(queueNeutralObjects(i).DestPos) 
            DistDiff = queueNeutralObjects(i).DestPos - queueNeutralObjects(i).Pos;
            queueNeutralObjects(i).V = sign(DistDiff).* min(abs(queueNeutralObjects(i).V), abs(DistDiff));
           
        end
       
        
    elseif queueNeutralObjects(i).Type == TYPE_NEUTRAL_TEXT
        if ~isempty(queueNeutralObjects(i).DestPos) 
            DistDiff = queueNeutralObjects(i).DestPos - queueNeutralObjects(i).Pos;
            queueNeutralObjects(i).V = sign(DistDiff).* min(abs(queueNeutralObjects(i).V), abs(DistDiff));
%            SlowDownIndex = abs(queueNeutralObjects(i).V
%            queueNeutralObjects(i).V(SlowDownIndex) = queueNeutralObjects(i).DestPos(SlowDownIndex) - queueNeutralObjects(i).Pos(SlowDownIndex);
            % If the text is blinking
            if queueNeutralObjects(i).ID == ID_TEXT_PROLOGUE_BLINK
                    queueNeutralObjects(i).ElapTimes(OBJ_GENERIC_CONST(queueNeutralObjects(i).ID).TIMER.BLINK) = ...
                         CurrentFrameNo - queueNeutralObjects(i).Timers(OBJ_GENERIC_CONST(queueNeutralObjects(i).ID).TIMER.LIFETIME);
                     thisPeriodStat = mod(queueNeutralObjects(i).ElapTimes(OBJ_GENERIC_CONST(queueNeutralObjects(i).ID).TIMER.BLINK), sum(queueNeutralObjects(i).BlinkOnOffPeriod));
                     
                     if thisPeriodStat < queueNeutralObjects(i).BlinkOnOffPeriod(1)
                        set(queueNeutralObjects(i).ImageHandle, 'Visible', 'on');
                     else
                        set(queueNeutralObjects(i).ImageHandle, 'Visible', 'off');
                     end
            end
        end
    end
    queueNeutralObjects(i).Pos = queueNeutralObjects(i).Pos + queueNeutralObjects(i).V;
    try
    queueNeutralObjects(i).V = queueNeutralObjects(i).V + queueNeutralObjects(i).A;
    catch
        a = 3
    end
end

stl_deleteFromGlobalNeutralObjects(find(NeutralObjectToDeleteIndex));
end