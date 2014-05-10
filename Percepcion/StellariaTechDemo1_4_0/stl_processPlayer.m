function stl_processPlayer()
%% STL_PROCESSPLAYER - Change the status of player craft, except for the Pos.
% 改变玩家飞机的状态(Pos属性除外)
% 
%% Usage
% stl_processPlayer
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
%  Mar 18, 2011             M. Zhang                wrote it
% --------------            -----------------       --------------------

%% --------------------Code Starts Here -------------------------

%% Declare the Global Variables
global queueGlobalPlayers
global DefaultGlobalPlayers
global queueGlobalFriendlyFire
global usedGlobalFriendlyFire
global CurrentFrameNo
global emptyEnemyStruct
global MAX_NUM_FRIENDLYFIRE_OBJ

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

global BombKeyEffective
global indexGlobalBomb

%% PLAYER TIMERS
global PLAYER_ANIM
global PLAYER_CONST
global PLAYER_BULLET_ANIM
global EXPLO_ANIM
global ENEMY_ANIM

global ActivePlayers
global GAME_RESOLUTION

global DefaultBulletStructs

global ID_PB_FIRE
global ID_PB_BOMB

global MainFigureHdl;
global MainAxesHdl;

global SPECIAL_FLAG
global thisStageTimeTable
global usedGlobalEnemies

global FPS

%% Process every player
% figure(MainFigureHdl);



for i = 1:numel(ActivePlayers)
    if queueGlobalPlayers(i).LivesLeft < 0
        ActivePlayers(i) = false;
    end
    if ~ActivePlayers(i)
        continue;
    end
    
    if queueGlobalPlayers(i).CurHP <= 0 && ~queueGlobalPlayers(i).IsExploding
        queueGlobalPlayers(i).BeingDestroyed = true;
    end
    
    % If the player is being destroyed
    if queueGlobalPlayers(i).BeingDestroyed
        queueGlobalPlayers(i).Timers(PLAYER_CONST.EXPLO_ANIM_TIMER_NO) = CurrentFrameNo;
        queueGlobalPlayers(i).IsExploding = true;
        queueGlobalPlayers(i).BeingDestroyed = false;
        queueGlobalPlayers(i).ExplosionFrame = 1;
%         queueGlobalPlayers(i).ExplosionStat = 1;
%         queueGlobalPlayers(i).Explosiontype = 1;
        queueGlobalPlayers(i).CurDefBox = [];
        queueGlobalPlayers(i).CurAttBox = [];
    end
    
    if queueGlobalPlayers(i).IsExploding
            queueGlobalPlayers(i).ElapTimes(PLAYER_CONST.EXPLO_ANIM_TIMER_NO) = ...
            CurrentFrameNo - queueGlobalPlayers(i).Timers(PLAYER_CONST.EXPLO_ANIM_TIMER_NO);
            if (queueGlobalPlayers(i).ElapTimes(PLAYER_CONST.EXPLO_ANIM_TIMER_NO) > ...
                    EXPLO_ANIM(queueGlobalPlayers(i).ExplosionType).AnimDur{queueGlobalPlayers(i).ExplosionStat}(queueGlobalPlayers(i).ExplosionFrame))
                queueGlobalPlayers(i).ExplosionFrame = queueGlobalPlayers(i).ExplosionFrame + 1;
            end
            % If the explosion is already over
            if queueGlobalPlayers(i).ExplosionFrame > EXPLO_ANIM(queueGlobalPlayers(i).ExplosionType).NumFrame(queueGlobalPlayers(i).ExplosionStat)
                queueGlobalPlayers(i).ExplosionFrame = 0;
                queueGlobalPlayers(i).IsExploding = false;
                queueGlobalPlayers(i).BeingBorn = true;               
            else
                continue;
            end
            
    end
    % If the player is being reborn
    % 如果玩家飞机处于“正在重生”状态
    if queueGlobalPlayers(i).BeingBorn
        % Reset the Timers
        queueGlobalPlayers(i).CurHP = PLAYER_CONST.HP;
        queueGlobalPlayers(i).LivesLeft = queueGlobalPlayers(i).LivesLeft - 1;
        
        queueGlobalPlayers(i).Timers(PLAYER_CONST.INVUL_TIMER_NO) = CurrentFrameNo;
        queueGlobalPlayers(i).Timers(PLAYER_CONST.BLINK_TIMER_NO) = CurrentFrameNo;
        queueGlobalPlayers(i).Timers(PLAYER_CONST.FLYTODEST_TIMER_NO) = CurrentFrameNo;
        queueGlobalPlayers(i).Timers(PLAYER_CONST.CUR_ANIM_TIMER_NO) = CurrentFrameNo;
        
        queueGlobalPlayers(i).BulletReady = true;
        queueGlobalPlayers(i).CurAnimFrame = 1;
        queueGlobalPlayers(i).CurAnimStat = 1;
        queueGlobalPlayers(i).Invulnerable = true;
%         set(queueGlobalPlayers(i).ImageHandle, 'CData', ...
%                 PLAYER_ANIM(i).AnimSeq{queueGlobalPlayers(i).CurAnimStat}{queueGlobalPlayers(i).CurAnimFrame}(:,:,1:3));
%         set(queueGlobalPlayers(i).ImageHandle, 'AlphaData', ...
%                 PLAYER_ANIM(i).AnimSeq{queueGlobalPlayers(i).CurAnimStat}{queueGlobalPlayers(i).CurAnimFrame}(:,:,4));
        if queueGlobalPlayers(i).LivesLeft >= 0
            set(queueGlobalPlayers(i).ImageHandle, 'Visible', 'on')
        else
            set(queueGlobalPlayers(i).ImageHandle, 'Visible', 'off')
        end
            %         Prevent the re-processing of BeingBorn property
        queueGlobalPlayers(i).BeingBorn = false;
        
        % The player is not controllable if it is being reborn
        queueGlobalPlayers(i).Controllable = false;
        queueGlobalPlayers(i).FlyToDestTime = PLAYER_CONST.RESPAWN_FLYTODEST_TIME;
        % Set the initial position of the player
        queueGlobalPlayers(i).Pos = [PLAYER_CONST.RESPAWN_INI_X.*i, PLAYER_CONST.RESPAWN_INI_Y];
        queueGlobalPlayers(i).V = [0, -PLAYER_CONST.SPEED];
        queueGlobalPlayers(i).DestPos = [PLAYER_CONST.RESPAWN_INI_X.*i, PLAYER_CONST.RESPAWN_DES_Y];
        if queueGlobalPlayers(i).LivesLeft < 0 
%             ActivePlayers(i) = false;
            continue;
        end
    end
    
    queueGlobalPlayers(i).ElapTimes(PLAYER_CONST.CUR_ANIM_TIMER_NO) = ...
            CurrentFrameNo - queueGlobalPlayers(i).Timers(PLAYER_CONST.CUR_ANIM_TIMER_NO);
    
        % If it is time to change animation frame
    if queueGlobalPlayers(i).ElapTimes(PLAYER_CONST.CUR_ANIM_TIMER_NO) >= ...
            PLAYER_ANIM(i).AnimDur{queueGlobalPlayers(i).CurAnimStat}(queueGlobalPlayers(i).CurAnimFrame)
        queueGlobalPlayers(i).CurAnimFrame = queueGlobalPlayers(i).CurAnimFrame + 1;
        if queueGlobalPlayers(i).CurAnimFrame > PLAYER_ANIM(i).NumFrame(queueGlobalPlayers(i).CurAnimStat) 
            queueGlobalPlayers(i).CurAnimFrame = 1;
        end
        
%         % If there are more than one 
%         if PLAYER_ANIM(i).NumFrame(queueGlobalPlayers(i).CurAnimStat)~=1
%             set(queueGlobalPlayers(i).ImageHandle, 'CData', ...
%                 PLAYER_ANIM(i).AnimSeq{queueGlobalPlayers(i).CurAnimStat}{queueGlobalPlayers(i).CurAnimFrame}(:,:,1:3));
%             set(queueGlobalPlayers(i).ImageHandle, 'AlphaData', ...
%                 PLAYER_ANIM(i).AnimSeq{queueGlobalPlayers(i).CurAnimStat}{queueGlobalPlayers(i).CurAnimFrame}(:,:,4));
%         end
        queueGlobalPlayers(i).Timers(PLAYER_CONST.CUR_ANIM_TIMER_NO) = CurrentFrameNo;
    end
        
    
    % if the player is currently "invulnerable"
    if queueGlobalPlayers(i).Invulnerable
        % Get the elapsed time
        queueGlobalPlayers(i).ElapTimes(PLAYER_CONST.INVUL_TIMER_NO) = ...
            CurrentFrameNo - queueGlobalPlayers(i).Timers(PLAYER_CONST.INVUL_TIMER_NO);

        % If the Timers should be stopped
        if (queueGlobalPlayers(i).ElapTimes(PLAYER_CONST.INVUL_TIMER_NO) >= queueGlobalPlayers(i).NewBornInvulnerableTime)
            queueGlobalPlayers(i).Invulnerable = false;
            queueGlobalPlayers(i).Visible = true;
            set(queueGlobalPlayers(i).ImageHandle, 'Visible', 'on');
        else
            queueGlobalPlayers(i).Visible = ...
                logical(mod(ceil(queueGlobalPlayers(i).ElapTimes(PLAYER_CONST.INVUL_TIMER_NO)./PLAYER_CONST.BLINK_INTERVAL), 2));
            
            % Set the visibility of the players
%             if queueGlobalPlayers(i).Visible
%                 set(queueGlobalPlayers(i).ImageHandle, 'Visible', 'on');
%             else
%                 set(queueGlobalPlayers(i).ImageHandle, 'Visible', 'off');
%             end
        end
        %         queueGlobalPlayers(i).Timers
    end
    % If the player is currently uncontrollable 
    if ~queueGlobalPlayers(i).Controllable
        queueGlobalPlayers(i).ElapTimes(PLAYER_CONST.FLYTODEST_TIMER_NO) = ...
            CurrentFrameNo - queueGlobalPlayers(i).Timers(PLAYER_CONST.FLYTODEST_TIMER_NO);
        if queueGlobalPlayers(i).ElapTimes(PLAYER_CONST.FLYTODEST_TIMER_NO) >= ...
                queueGlobalPlayers(i).FlyToDestTime
            queueGlobalPlayers(i).DestReached = true;
        end
        
        if queueGlobalPlayers(i).DestReached
            queueGlobalPlayers(i).DestReached = false;
            queueGlobalPlayers(i).Controllable = true;
            queueGlobalPlayers(i).FlyToDestTime = 0;
            BombKeyEffective(i) = false;
        else
            if queueGlobalPlayers(i).ElapTimes(PLAYER_CONST.FLYTODEST_TIMER_NO) ~= 0
                queueGlobalPlayers(i).V = (queueGlobalPlayers(i).DestPos - queueGlobalPlayers(i).Pos) ./ ...
                    (queueGlobalPlayers(i).FlyToDestTime - queueGlobalPlayers(i).ElapTimes(PLAYER_CONST.FLYTODEST_TIMER_NO));
            else
                queueGlobalPlayers(i).V = [0 0];
            end
            
            queueGlobalPlayers(i).Pos = queueGlobalPlayers(i).Pos + queueGlobalPlayers(i).V;
%             queueGlobalPlayers(i).Pos
            
            continue;
             % If the player is not cotrollable, then skip the key processing routine
            
            %             queueGlobalPlayers(i).Speed(1) =
            %             if queueGlobalPlayers(i).Pos(2) < queueGlobalPlayers(i).DestY
            %                 queueGlobalPlayers(i).Speed = [0 -SPEED];
            %             else
            %                 queueGlobalPlayers(i).Speed = [0 0];
            %                 queueGlobalPlayers(i).Controllable = true;
            %             end
        end
        
    end
    
    % Process direction keys
    queueGlobalPlayers(i).V(1) = (RightKeyStatus(i) - LeftKeyStatus(i)) .* ...
        PLAYER_CONST.SPEED;
    queueGlobalPlayers(i).V(2) = (DownKeyStatus(i) - UpKeyStatus(i)) .* ...
        PLAYER_CONST.SPEED;
    
    % Make sure the players cannot move out of the playing field
    if queueGlobalPlayers(i).Pos(1) + queueGlobalPlayers(i).V(1) < 0 
        queueGlobalPlayers(i).V(1) = 0 - queueGlobalPlayers(i).Pos(1);
    elseif queueGlobalPlayers(i).Pos(1) + queueGlobalPlayers(i).V(1) > GAME_RESOLUTION(1)
        queueGlobalPlayers(i).V(1) = GAME_RESOLUTION(1) - queueGlobalPlayers(i).Pos(1);
    end
    if queueGlobalPlayers(i).Pos(2) + queueGlobalPlayers(i).V(2) < 0 
        queueGlobalPlayers(i).V(2) = 0 - queueGlobalPlayers(i).Pos(2);
    elseif queueGlobalPlayers(i).Pos(2) + queueGlobalPlayers(i).V(2) > GAME_RESOLUTION(2)
        queueGlobalPlayers(i).V(2) = GAME_RESOLUTION(2) - queueGlobalPlayers(i).Pos(2);
    end
    
    if SPECIAL_FLAG.STAGE_OVER
        queueGlobalPlayers(i).Controllable = false;
        queueGlobalPlayers(i).DestReached = false;
        queueGlobalPlayers(i).FlyToDestTime = 3.5.*FPS;
        queueGlobalPlayers(i).DestPos = [queueGlobalPlayers(i).Pos(1) -70];
        queueGlobalPlayers(i).Timers(PLAYER_CONST.FLYTODEST_TIMER_NO) = CurrentFrameNo;
        continue;
    end
    
        % If the player is ready to fire
    if FireKeyStatus(i) && queueGlobalPlayers(i).BulletReady
       bulletsToAdd = repmat(DefaultBulletStructs(ID_PB_FIRE),1,queueGlobalPlayers(i).BulletLevel);
       bulletPosY = queueGlobalPlayers(i).Pos(2);
       bulletPosX = queueGlobalPlayers(i).Pos(1) + ...
           PLAYER_CONST.BULLET_INI_X(PLAYER_CONST.AVAIL_CANNON(queueGlobalPlayers(i).BulletLevel,:));
       bulletPos = zeros(queueGlobalPlayers(i).BulletLevel, 2);
       bulletPos(:,1) = bulletPosX;
       bulletPos(:,2) = bulletPosY;
       bulletPosCell =  mat2cell(bulletPos, ones(1,queueGlobalPlayers(i).BulletLevel), 2);
       [bulletsToAdd.Pos] = bulletPosCell{:};
%        [bulletsToAdd.Pos(2)] = queueGlobalPlayers(i).Pos(2);
%        bulletsCell = num2cell(queueGlobalPlayers(i).Pos(1) + ...
%            PLAYER_CONST.BULLET_INI_X(PLAYER_CONST.AVAIL_CANNON(queueGlobalPlayers(i).BulletLevel,:)));
%        [bulletsToAdd.Pos(1)] = bulletsCell{:};

%        bulletVX = 0;
%        bulletVY = PLAYER_CONST.BULLET_V;
%        bulletV = zeros(queueGlobalPlayers(i).BulletLevel, 2);
%        bulletV(:,1) = bulletVX;
%        bulletV(:,2) = bulletVY;
%        bulletVCell = mat2cell(bulletV, ones(1,queueGlobalPlayers(i).BulletLevel), 2);
%        [bulletsToAdd.V] =  bulletVCell{:};

%        
%        bulletAX = 0;
%        bulletAY = 
%        
%        [bulletsToAdd.CurAnimStat] = deal(1);
%        [bulletsToAdd.CurAnimFrame] = deal(1);
%        [bulletsToAdd.Visible] = deal(true);
       [addedBulletIndices, nBullets] = stl_addToGlobalPlayerBullets(bulletsToAdd);
       for iBullets = 1:nBullets
           currentFrame =  PLAYER_BULLET_ANIM(1).AnimSeq{bulletsToAdd(iBullets).CurAnimStat}{bulletsToAdd(iBullets).CurAnimFrame};
%            currentFrame(:,:,1:3)
           set(queueGlobalFriendlyFire(addedBulletIndices{iBullets}).ImageHandle, 'CData', currentFrame(:,:,1:3), 'AlphaData', 1);
       end

        queueGlobalPlayers(i).BulletReady = false;
        queueGlobalPlayers(i).Timers(PLAYER_CONST.BULLET_TIMER_NO) = CurrentFrameNo;
    end
    
    % If the bullet is being reloaded
    if ~queueGlobalPlayers(i).BulletReady
        queueGlobalPlayers(i).ElapTimes(PLAYER_CONST.BULLET_TIMER_NO) = ...
            CurrentFrameNo - queueGlobalPlayers(i).Timers(PLAYER_CONST.BULLET_TIMER_NO);
        if queueGlobalPlayers(i).ElapTimes(PLAYER_CONST.BULLET_TIMER_NO) >= PLAYER_CONST.BULLET_RELOAD_TIME
            queueGlobalPlayers(i).BulletReady = true;
        end
    end
    
%       % If the player is ready to drop a bomb
    if BombKeyEffective(i) && queueGlobalPlayers(i).BombReady
        
       bombToAdd = repmat(DefaultBulletStructs(ID_PB_BOMB),1, 1);
       bombToAdd.Pos = queueGlobalPlayers(i).Pos - [0 GAME_RESOLUTION(2)./3];
       if bombToAdd.Pos(2) < 0
            bombToAdd.Pos(2) = 0;
       end
       bombToAdd.V =  [0 0];
       bombToAdd.CurAnimStat = 1;
       bombToAdd.CurAnimFrame = 1;
       bombToAdd.Visible = true;
       bombToAdd.LaunchedBy = i;
       [addedBombIndices, nBomb] = stl_addToGlobalPlayerBullets(bombToAdd);
        indexGlobalBomb(i) = cell2mat(addedBombIndices);
%        currentFrame =  PLAYER_BULLET_ANIM(ID_PB_BOMB).AnimSeq{bombToAdd.CurAnimStat}{bombToAdd.CurAnimFrame};
%            currentFrame(:,:,1:3)
%        set(queueGlobalFriendlyFire(addedBulletIndices{iBullets}).ImageHandle, 'CData', currentFrame(:,:,1:3));
%        end
%        wavplay(PLAYER_SFX.DATA(3000:6000,:), PLAYER_SFX.FS, 'async')
        queueGlobalPlayers(i).BombReady = false;
        BombKeyEffective(i) = false;
        queueGlobalFriendlyFire(indexGlobalBomb(i)).Timers(PLAYER_CONST.BOMB_TIMER_NO) = CurrentFrameNo;
        queueGlobalPlayers(i).Timers(PLAYER_CONST.BOMB_TIMER_NO) = CurrentFrameNo;
         SPECIAL_FLAG.BOMB_EXIST(i) = true;
    end
    
    if ~queueGlobalPlayers(i).BombReady
        queueGlobalPlayers(i).ElapTimes(PLAYER_CONST.BOMB_TIMER_NO) = ...
            CurrentFrameNo - queueGlobalPlayers(i).Timers(PLAYER_CONST.BOMB_TIMER_NO);
        if queueGlobalPlayers(i).ElapTimes(PLAYER_CONST.BOMB_TIMER_NO) >= PLAYER_CONST.BOMB_RELOAD_TIME
            queueGlobalPlayers(i).BombReady = true;
        end
    end
    
    queueGlobalPlayers(i).Pos = queueGlobalPlayers(i).Pos + queueGlobalPlayers(i).V;
end

friendlyfireToDelete = false(1, MAX_NUM_FRIENDLYFIRE_OBJ);

for i = 1:MAX_NUM_FRIENDLYFIRE_OBJ
    if ~usedGlobalFriendlyFire(i)
        continue;
    end
    if queueGlobalFriendlyFire(i).ID == ID_PB_BOMB
        
        queueGlobalFriendlyFire(i).ElapTimes(PLAYER_CONST.BOMB_TIMER_NO) = ...
            CurrentFrameNo - queueGlobalFriendlyFire(i).Timers(PLAYER_CONST.BOMB_TIMER_NO);
        if queueGlobalFriendlyFire(i).ElapTimes(PLAYER_CONST.BOMB_TIMER_NO) > ...
                PLAYER_CONST.BOMB_LASTING_TIME
            SPECIAL_FLAG.BOMB_EXIST(queueGlobalFriendlyFire(i).LaunchedBy) = false;
            friendlyfireToDelete(i) = true;
            set(MainAxesHdl, 'Color', [0 0 0]);
        end
        
        queueGlobalFriendlyFire(i).ElapTimes(PLAYER_CONST.CUR_ANIM_TIMER_NO) = ...
            CurrentFrameNo - queueGlobalFriendlyFire(i).Timers(PLAYER_CONST.CUR_ANIM_TIMER_NO);
        if (queueGlobalFriendlyFire(i).ElapTimes(PLAYER_CONST.CUR_ANIM_TIMER_NO) > ...
                PLAYER_BULLET_ANIM(queueGlobalFriendlyFire(i).ID).AnimDur{queueGlobalFriendlyFire(i).CurAnimStat}(queueGlobalFriendlyFire(i).CurAnimFrame))
            queueGlobalFriendlyFire(i).CurAnimFrame = queueGlobalFriendlyFire(i).CurAnimFrame + 1;
            
            if queueGlobalFriendlyFire(i).CurAnimFrame > ...
                    PLAYER_BULLET_ANIM(queueGlobalFriendlyFire(i).ID).NumFrame(queueGlobalFriendlyFire(i).CurAnimStat)
                
                queueGlobalFriendlyFire(i).CurAnimFrame = 1;
                % If the bomb starts to explode
                if queueGlobalFriendlyFire(i).CurAnimStat == 1
                    queueGlobalFriendlyFire(i).CurAnimStat = 2;
                   
                end
                
            end
            if mod(queueGlobalFriendlyFire(i).CurAnimFrame,2)==0
                set(MainAxesHdl, 'Color', [0.7 0.7 0.4]);
            else
                set(MainAxesHdl, 'Color', [0 0 0]);
            end
            % Reset the timer;
            queueGlobalFriendlyFire(i).Timers(PLAYER_CONST.CUR_ANIM_TIMER_NO) = CurrentFrameNo;
        end
        continue;
        
    end
    
    if queueGlobalFriendlyFire(i).CurHP <= 0 && ~queueGlobalFriendlyFire(i).IsExploding
        queueGlobalFriendlyFire(i).BeingDestroyed = true;
    end
    
    if queueGlobalFriendlyFire(i).BeingDestroyed 
        queueGlobalFriendlyFire(i).Timers(PLAYER_CONST.EXPLO_ANIM_TIMER_NO) = CurrentFrameNo;
        queueGlobalFriendlyFire(i).IsExploding = true;
        queueGlobalFriendlyFire(i).BeingDestroyed = false;
        queueGlobalFriendlyFire(i).ExplosionType = PLAYER_CONST.BULLET_EXPLO_TYPE;
        queueGlobalFriendlyFire(i).ExplosionStat = 1;
        queueGlobalFriendlyFire(i).ExplosionFrame = 1;
        queueGlobalFriendlyFire(i).CurDefBox = [];
        queueGlobalFriendlyFire(i).CurAttBox = [];
    end
    
     if queueGlobalFriendlyFire(i).IsExploding
            queueGlobalFriendlyFire(i).ElapTimes(PLAYER_CONST.EXPLO_ANIM_TIMER_NO) = ...
            CurrentFrameNo - queueGlobalFriendlyFire(i).Timers(PLAYER_CONST.EXPLO_ANIM_TIMER_NO);
            if (queueGlobalFriendlyFire(i).ElapTimes(PLAYER_CONST.EXPLO_ANIM_TIMER_NO) > ...
                    EXPLO_ANIM(queueGlobalFriendlyFire(i).ExplosionType).AnimDur{queueGlobalFriendlyFire(i).ExplosionStat}(queueGlobalFriendlyFire(i).ExplosionFrame))
                queueGlobalFriendlyFire(i).ExplosionFrame = queueGlobalFriendlyFire(i).ExplosionFrame + 1;
            end
            % If the explosion is already over
            if queueGlobalFriendlyFire(i).ExplosionFrame > EXPLO_ANIM(queueGlobalFriendlyFire(i).ExplosionType).NumFrame(queueGlobalFriendlyFire(i).ExplosionStat)
%                 queueGlobalFriendlyFire(i).ExplosionFrame = 0;
%                 queueGlobalFriendlyFire(i).IsExploding = false;
                friendlyfireToDelete(i) = true;
%                 stl_deleteFromGlobalFriendlyFire(i);            
                continue;
            else
                continue;
            end
            
     end
     
    
    
    if queueGlobalFriendlyFire(i).Pos(2) < 0
        queueGlobalFriendlyFire(i).BeingDestroyed = true; 
    end
    
    queueGlobalFriendlyFire(i).Pos = queueGlobalFriendlyFire(i).Pos + queueGlobalFriendlyFire(i).V;
    queueGlobalFriendlyFire(i).V = queueGlobalFriendlyFire(i).V + queueGlobalFriendlyFire(i).A;

end


bulletPos = [queueGlobalFriendlyFire.Pos];
bulletPosX = bulletPos(1:2:end);
bulletPosY = bulletPos(2:2:end);
indexOutBullets = find((bulletPosX <0 | bulletPosX > GAME_RESOLUTION(1) |...
    bulletPosY < 0 | bulletPosY > GAME_RESOLUTION(2))|friendlyfireToDelete);

stl_deleteFromGlobalFriendlyFire(indexOutBullets);

end