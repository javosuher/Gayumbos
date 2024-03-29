function stl_processEnemies()
%% STL_PROCESSENEMIES - Change the status of enemies craft, except for the Pos.
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
global queueGlobalEnemies   % The Global Enemy Queue
global queueImpromptuEnemies
global numImpromptuEnemies
global availGlobalEnemies   % The indices of unused enemy queue elements
global usedGlobalEnemies
global numAvailGlobalEnemies    % The number of unused enemie queue elements
global CurrentFrameNo
global emptyEnemyStruct
global MAX_NUM_ENEMY_OBJ


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

global GAME_RESOLUTION

global ActivePlayers
global MainFigureHdl

%% Enemy Types and IDS
global TYPE_ENEMY_CRAFT
global ID_EC_STACCATO
global ID_EC_LEGATO
global ID_EC_FORTEPIANO
global ID_EC_RONDO
global ID_EC_ROTATO

global TYPE_ENEMY_BULLET
global ID_EB_VERDE
global ID_EB_ROSSO

global TYPE_PLAYER_BULLET
global ID_PB_FIRE

global DefaultEnemyStructs
global DefaultEnemyBulletStructs
global FPS
global FRAME_DURATION

global rotTable
global sinTable

global allowEnemyEntrance
global EnemyEntranceFreezedFrame
global thisStageTimeTable
%% Process every player
% figure(MainFigureHdl);

enemiesToDeleteIndex = false(1, MAX_NUM_ENEMY_OBJ);

for i = 1:MAX_NUM_ENEMY_OBJ
    if ~usedGlobalEnemies(i)
        continue;
    end
    
    if (queueGlobalEnemies(i).Pos(2) > GAME_RESOLUTION(2)+10) ||...
            (queueGlobalEnemies(i).Pos(2) < -10) ||...
            (queueGlobalEnemies(i).Pos(1) > GAME_RESOLUTION(1)+10) ||...
            (queueGlobalEnemies(i).Pos(1) < -10)
        enemiesToDeleteIndex(i) = true;
        continue;
    end
    if queueGlobalEnemies(i).CurHP <= 0 && ~queueGlobalEnemies(i).IsExploding
        queueGlobalEnemies(i).BeingDestroyed = true;
    end
    % Freeze the enemy
    if queueGlobalEnemies(i).FreezeTimeWhenCreated && allowEnemyEntrance
         allowEnemyEntrance = false;
         EnemyEntranceFreezedFrame = CurrentFrameNo;  
    end
    
    if queueGlobalEnemies(i).Type == TYPE_ENEMY_CRAFT
        % If the player is being destroyed
        if queueGlobalEnemies(i).BeingDestroyed
            queueGlobalEnemies(i).Timers(ENEMY_CONST(queueGlobalEnemies(i).ID).TIMER.EXPLO_ANIM_NO) = CurrentFrameNo;
            queueGlobalEnemies(i).IsExploding = true;
            queueGlobalEnemies(i).BeingDestroyed = false;
            queueGlobalEnemies(i).ExplosionFrame = 1;
            queueGlobalEnemies(i).CurAttBox = [];
            queueGlobalEnemies(i).CurDefBox = [];
            %         queueGlobalPlayers(i).ExplosionStat = 1;
            %         queueGlobalPlayers(i).Explosiontype = 1;
            if queueGlobalEnemies(i).HasWreckage
                queueGlobalEnemies(i).V = queueGlobalEnemies(i).ExploV;
            end
            
        end
        
        if queueGlobalEnemies(i).IsExploding
            queueGlobalEnemies(i).ElapTimes(ENEMY_CONST(queueGlobalEnemies(i).ID).TIMER.EXPLO_ANIM_NO) = ...
                CurrentFrameNo - queueGlobalEnemies(i).Timers(ENEMY_CONST(queueGlobalEnemies(i).ID).TIMER.EXPLO_ANIM_NO);
            if (queueGlobalEnemies(i).ElapTimes(ENEMY_CONST(queueGlobalEnemies(i).ID).TIMER.EXPLO_ANIM_NO) > ...
                    EXPLO_ANIM(queueGlobalEnemies(i).ExplosionType).AnimDur{queueGlobalEnemies(i).ExplosionStat}(queueGlobalEnemies(i).ExplosionFrame))
                queueGlobalEnemies(i).ExplosionFrame = queueGlobalEnemies(i).ExplosionFrame + 1;
            end
            if queueGlobalEnemies(i).HasWreckage
                queueGlobalEnemies(i).Pos = queueGlobalEnemies(i).Pos + queueGlobalEnemies(i).V;
                queueGlobalEnemies(i).V = queueGlobalEnemies(i).V + queueGlobalEnemies(i).A;
            end
            % If the explosion is already over
            if queueGlobalEnemies(i).ExplosionFrame == EXPLO_ANIM(queueGlobalEnemies(i).ExplosionType).NumFrame(queueGlobalEnemies(i).ExplosionStat)
                if queueGlobalEnemies(i).HasWreckage
                    queueImpromptuEnemies(numImpromptuEnemies+1) = DefaultEnemyStructs(queueGlobalEnemies(i).WreckageIndex);
                    queueImpromptuEnemies(numImpromptuEnemies+1).Pos = queueGlobalEnemies(i).Pos;    % Give it the current position of the destroyed enemy.
                    %                 queueImpromptuEnemies(numImpromptuEnemies+1).OriIndex = i;
                    queueImpromptuEnemies(numImpromptuEnemies+1).FinalCountDown = CurrentFrameNo;
                    queueImpromptuEnemies(numImpromptuEnemies+1).CurObjStat= 1;
                    numImpromptuEnemies = numImpromptuEnemies + 1;
                end
                
                continue;
                %                     uistack(queueGlobalEnemies(i).ImageHandle, 'top')
            elseif queueGlobalEnemies(i).ExplosionFrame > EXPLO_ANIM(queueGlobalEnemies(i).ExplosionType).NumFrame(queueGlobalEnemies(i).ExplosionStat)
                queueGlobalEnemies(i).ExplosionFrame = 0;
                queueGlobalEnemies(i).IsExploding = false;
                enemiesToDeleteIndex(i) = true;
                if queueGlobalEnemies(i).FreezeTimeWhenCreated && ~allowEnemyEntrance
                    allowEnemyEntrance = true;
                    thisStageTimeTable =  thisStageTimeTable + CurrentFrameNo - EnemyEntranceFreezedFrame;
                end
                continue;
                %                 if ~queueGlobalEnemies(i).HasWreckage    % If the enemy does not have a wreckage after being destroyed
                %
                %                     continue;
                %                 else
                %
                %
                % %                     queueGlobalEnemies(i).IsWreckage = true;
                %                 end
                %                 stl_deleteFromGlobalEnemies(i);
            else
                continue;
            end
            
        end
        if queueGlobalEnemies(i).IsWreckage
            %               if queueGlobalEnemies(i).HasWreckage    % If both of them are true, it means this enemy is destroyed for the first time
            %                   queueGlobalEnemies(i).HasWreckage = false;
            %                   queueGlobalEnemies(i).IsExploding =false;
            %                   queueGlobalEnemies(i).FinalCountDown = CurrentFrameNo;
            %                   queueGlobalEnemies(i).CurHP = Inf;
            %                   queueGlobalEnemies(i).CurDefBox = [];
            %                   queueGlobalEnemies(i).CurAttBox = [];
            %                   queueGlobalEnemies(i).V = ENEMY_CONST(queueGlobalEnemies(i).ID).FINAL_COUNTDOWN.V;
            %                   queueGlobalEnemies(i).A = ENEMY_CONST(queueGlobalEnemies(i).ID).FINAL_COUNTDOWN.A;
            %                   queueGlobalEnemies(i).CurAnimStat = numel(ENEMY_ANIM(queueGlobalEnemies(i).ID).NumFrame);
            %                   queueGlobalEnemies(i).CurAnimFrame = ENEMY_ANIM(queueGlobalEnemies(i).ID).NumFrame(1, end);
            %
            %                   continue;
            %               else
            queueGlobalEnemies(i).UnderAttack = false;
            if ENEMY_CONST(queueGlobalEnemies(i).ID).FINAL_COUNTDOWN.T ...
                    < CurrentFrameNo - queueGlobalEnemies(i).FinalCountDown
                queueGlobalEnemies(i).CurHP = 0;
                queueGlobalEnemies(i).IsWreckage = false;
                continue;
            else
                %                       queueGlobalEnemies(i).ResizeFactor = queueGlobalEnemies(i).ResizeFactor.*0.98;
                queueGlobalEnemies(i).ResizeFactor = 1 - 0.15.*(CurrentFrameNo - queueGlobalEnemies(i).FinalCountDown)./ENEMY_CONST(queueGlobalEnemies(i).ID).FINAL_COUNTDOWN.T;
                %                       queueGlobalEnemies(i).V = queueGlobalEnemies(i).V + queueGlobalEnemies(i).V.*1/5.*(rand(1,2) - [0.5 0.5]);
            end
            %               end
        end
        
        queueGlobalEnemies(i).ElapTimes(ENEMY_CONST(queueGlobalEnemies(i).ID).TIMER.CUR_ANIM_NO) = ...
            CurrentFrameNo - queueGlobalEnemies(i).Timers(ENEMY_CONST(queueGlobalEnemies(i).ID).TIMER.CUR_ANIM_NO);
        
        % If it is time to change animation frame
        try
            if queueGlobalEnemies(i).ElapTimes(ENEMY_CONST(queueGlobalEnemies(i).ID).TIMER.CUR_ANIM_NO) >= ...
                    ENEMY_ANIM(queueGlobalEnemies(i).ID).AnimDur{queueGlobalEnemies(i).CurAnimStat}(queueGlobalEnemies(i).CurAnimFrame)
                queueGlobalEnemies(i).CurAnimFrame = queueGlobalEnemies(i).CurAnimFrame + 1;
                if queueGlobalEnemies(i).CurAnimFrame > ENEMY_ANIM(queueGlobalEnemies(i).ID).NumFrame(queueGlobalEnemies(i).CurAnimStat)
                    queueGlobalEnemies(i).CurAnimFrame = 1;
                end
                
                %         % If there are more than one
                %         if PLAYER_ANIM(i).NumFrame(queueGlobalPlayers(i).CurAnimStat)~=1
                %             set(queueGlobalPlayers(i).ImageHandle, 'CData', ...
                %                 PLAYER_ANIM(i).AnimSeq{queueGlobalPlayers(i).CurAnimStat}{queueGlobalPlayers(i).CurAnimFrame}(:,:,1:3));
                %             set(queueGlobalPlayers(i).ImageHandle, 'AlphaData', ...
                %                 PLAYER_ANIM(i).AnimSeq{queueGlobalPlayers(i).CurAnimStat}{queueGlobalPlayers(i).CurAnimFrame}(:,:,4));
                %         end
                queueGlobalEnemies(i).Timers(ENEMY_CONST(queueGlobalEnemies(i).ID).TIMER.CUR_ANIM_NO) = CurrentFrameNo;
            end
        catch
            a = 3
        end
        
        
        % An Enemy is never 'Invulnerable'
        %     if queueGlobalEnemies(i).Invulnerable
        %         % Get the elapsed time
        %         queueGlobalEnemies(i).ElapTimes(PLAYER_CONST.INVUL_TIMER_NO) = ...
        %             CurrentFrameNo - queueGlobalPlayers(i).Timers(PLAYER_CONST.INVUL_TIMER_NO);
        %
        %         % If the Timers should be stopped
        %         if (queueGlobalPlayers(i).ElapTimes(PLAYER_CONST.INVUL_TIMER_NO) >= queueGlobalPlayers(i).NewBornInvulnerableTime)
        %             queueGlobalPlayers(i).Invulnerable = false;
        %             queueGlobalPlayers(i).Visible = true;
        %             set(queueGlobalPlayers(i).ImageHandle, 'Visible', 'on');
        %         else
        %             queueGlobalPlayers(i).Visible = ...
        %                 logical(mod(ceil(queueGlobalPlayers(i).ElapTimes(PLAYER_CONST.INVUL_TIMER_NO)./PLAYER_CONST.BLINK_INTERVAL), 2));
        %
        %             % Set the visibility of the players
        % %             if queueGlobalPlayers(i).Visible
        % %                 set(queueGlobalPlayers(i).ImageHandle, 'Visible', 'on');
        % %             else
        % %                 set(queueGlobalPlayers(i).ImageHandle, 'Visible', 'off');
        % %             end
        %         end
        %         %         queueGlobalPlayers(i).Timers
        %     end
        % If the player is currently uncontrollable
        if ~queueGlobalEnemies(i).Controllable
            queueGlobalEnemies(i).ElapTimes(ENEMY_CONST(queueGlobalEnemies(i).ID).FLYTODEST_TIMER_NO) = ...
                CurrentFrameNo - queueGlobalEnemies(i).Timers(ENEMY_CONST(queueGlobalEnemies(i).ID).FLYTODEST_TIMER_NO);
            if queueGlobalEnemies(i).ElapTimes(ENEMY_CONST(queueGlobalEnemies(i).ID).FLYTODEST_TIMER_NO) >= ...
                    queueGlobalEnemies(i).FlyToDestTime
                queueGlobalEnemies(i).DestReached = true;
            end
            
            if queueGlobalEnemies(i).DestReached
                queueGlobalEnemies(i).DestReached = false;
                queueGlobalEnemies(i).Controllable = true;
                queueGlobalEnemies(i).FlyToDestTime = 0;
            else
                if queueGlobalEnemies(i).ElapTimes(ENEMY_CONST(queueGlobalEnemies(i).ID).FLYTODEST_TIMER_NO) ~= 0
                    queueGlobalEnemies(i).V = (queueGlobalEnemies(i).DestPos - queueGlobalEnemies(i).Pos) ./ ...
                        (queueGlobalEnemies(i).FlyToDestTime - queueGlobalEnemies(i).ElapTimes(PLAYER_CONST.FLYTODEST_TIMER_NO));
                else
                    queueGlobalEnemies(i).V = [0 0];
                end
                continue;
            end
            
        end
        % Special Processing for Each Type of Enemy
        %         if queueGlobalEnemies(i).Type == TYPE_ENEMY_CRAFT
        if queueGlobalEnemies(i).ID == ID_EC_STACCATO
            
            
            %                         queueGlobalEnemies(i).CurHP = 0;
            
        elseif queueGlobalEnemies(i).ID == ID_EC_LEGATO
            queueGlobalEnemies(i).EndStat = mod(queueGlobalEnemies(i).EndStat,1);
%             if queueGlobalEnemies(i).EndStat == 0.53
%                 a = 3;
%             end
            queueGlobalEnemies(i).V(1) = sinTable(floor(queueGlobalEnemies(i).EndStat .* 360) + 1) .* ENEMY_CONST(ID_EC_LEGATO).HSPEED .* FPS + ...
                queueGlobalEnemies(i).OriPos(1) - queueGlobalEnemies(i).Pos(1);
            queueGlobalEnemies(i).A(1) = -1.* sign(queueGlobalEnemies(i).Pos(1) - queueGlobalEnemies(i).OriPos(1));    % The Accel
            queueGlobalEnemies(i).EndStat = queueGlobalEnemies(i).EndStat + 0.03;
            
            if queueGlobalEnemies(i).CurObjStat >= 2 || queueGlobalEnemies(i).CurObjStat <= 4
                if queueGlobalEnemies(i).Pos(2) >= GAME_RESOLUTION(2)/3;
                    if queueGlobalEnemies(i).CurObjStat == 2
                        BulletAngle = [0:45:90]'+1;
                        nBullets = length(BulletAngle);
                        queueGlobalEnemies(i).CurObjStat = 1;
                    elseif queueGlobalEnemies(i).CurObjStat == 4
                        BulletAngle = [0:315:270]'+1;
                        nBullets = length(BulletAngle);
                        queueGlobalEnemies(i).CurObjStat = 1;
                    else
                        tempY = queueGlobalEnemies(i).Pos(2)./(GAME_RESOLUTION(2)./6);
                        tempNextY = (queueGlobalEnemies(i).Pos(2) +  queueGlobalEnemies(i).V(2))./(GAME_RESOLUTION(2)./6);
                        if floor(tempY) ~= floor(tempNextY)
                            tempActivePlayers = find(ActivePlayers);
                            tempPosDiff = queueGlobalPlayers(tempActivePlayers(ceil(numel(tempActivePlayers).*rand))).Pos - queueGlobalEnemies(i).Pos;
                            %                                 BulletAngle = mod(round(atan(tempPosDiff(1)./tempPosDiff(2)).*180/pi), 360);
                            BulletAngle = [tempPosDiff(1)./hypot(tempPosDiff(1), tempPosDiff(2)), tempPosDiff(2)./hypot(tempPosDiff(1), tempPosDiff(2))];
                            %                                 if queueGlobalPlayers(1).Pos
                            %                             if isempty(queueGlobalEnemies(i).InitStat) || queueGlobalEnemies(i).InitStat == 0
                            %                                 BulletAngle = 1;
                            %                                 queueGlobalEnemies(i).InitStat = BulletAngle;
                            %                             else
                            %                                 BulletAngle = queueGlobalEnemies(i).InitStat + 60;
                            %                                 if BulletAngle > 360
                            %                                     queueGlobalEnemies(i).InitStat = [];
                            %                                     continue;
                            %                                 else
                            %                                     queueGlobalEnemies(i).InitStat = BulletAngle;
                            %                                 end
                            %                             end
                        else
                            queueGlobalEnemies(i).Pos = queueGlobalEnemies(i).Pos + queueGlobalEnemies(i).V;
                            queueGlobalEnemies(i).V = queueGlobalEnemies(i).V + queueGlobalEnemies(i).A;
                            continue;
                        end
                        nBullets = 1;
                    end
                    queueImpromptuEnemies(numImpromptuEnemies+1:numImpromptuEnemies+nBullets) = DefaultEnemyBulletStructs(ID_EB_ROSSO);
                    [queueImpromptuEnemies(numImpromptuEnemies+1:numImpromptuEnemies+nBullets).Pos] = deal(queueGlobalEnemies(i).Pos);
                    
                    %                         try
                    if size(BulletAngle,2) == 1
                        tempV = ENEMY_BULLET_CONST(ID_EB_ROSSO).SPEED.*rotTable(BulletAngle,:); %{[-50 100].*FRAME_DURATION, [0 100].*FRAME_DURATION, [50 100].*FRAME_DURATION};
                    else
                        tempV = ENEMY_BULLET_CONST(ID_EB_ROSSO).SPEED.*BulletAngle;
                    end
                    %                         catch
                    %                             a = 3;
                    %                         end
                    tempVCell = num2cell(tempV, 2);
                    [queueImpromptuEnemies(numImpromptuEnemies+1:numImpromptuEnemies+nBullets).V] = deal(tempVCell{:});
                    numImpromptuEnemies = numImpromptuEnemies + nBullets;
                end
            end
        elseif queueGlobalEnemies(i).ID == ID_EC_FORTEPIANO
            if queueGlobalEnemies(i).CurObjStat ~= 2 && queueGlobalEnemies(i).Pos(2) >= GAME_RESOLUTION(2)/4;
                queueGlobalEnemies(i).CurObjStat = 2;
                queueGlobalEnemies(i).InitStat = 1;
            end
            if queueGlobalEnemies(i).CurObjStat == 2 
                DistDiff = (ENEMY_CONST(ID_EC_FORTEPIANO).WAYPOINTS(queueGlobalEnemies(i).InitStat,:))-...
                    (queueGlobalEnemies(i).Pos-[queueGlobalEnemies(i).OriPos(1) GAME_RESOLUTION(2)/4]);
                if all(DistDiff==0)
                    queueGlobalEnemies(i).InitStat = queueGlobalEnemies(i).InitStat + 1;
                    if queueGlobalEnemies(i).InitStat > size(ENEMY_CONST(ID_EC_FORTEPIANO).WAYPOINTS, 1)
                        queueGlobalEnemies(i).InitStat = 1;
                    end
                    BulletAngle = [0 30 60 300 330]'+1;
                    nBullets = length(BulletAngle);
                    
                    if  queueGlobalEnemies(i).EndStat == 1
                    queueImpromptuEnemies(numImpromptuEnemies+1:numImpromptuEnemies+nBullets) = DefaultEnemyBulletStructs(ID_EB_VERDE);
                    [queueImpromptuEnemies(numImpromptuEnemies+1:numImpromptuEnemies+nBullets).Pos] = deal(queueGlobalEnemies(i).Pos);
                        queueGlobalEnemies(i).EndStat = 2;
                    else
                        queueImpromptuEnemies(numImpromptuEnemies+1:numImpromptuEnemies+nBullets) = DefaultEnemyBulletStructs(ID_EB_ROSSO);
                        [queueImpromptuEnemies(numImpromptuEnemies+1:numImpromptuEnemies+nBullets).Pos] = deal(queueGlobalEnemies(i).Pos);
                        queueGlobalEnemies(i).EndStat = 1;
                    end
                    
                    %                         try
                    if size(BulletAngle,2) == 1
                        tempV = ENEMY_BULLET_CONST(ID_EB_VERDE).SPEED.*rotTable(BulletAngle,:); %{[-50 100].*FRAME_DURATION, [0 100].*FRAME_DURATION, [50 100].*FRAME_DURATION};
                    else
                        tempV = ENEMY_BULLET_CONST(ID_EB_VERDE).SPEED.*BulletAngle;
                    end
                    %                         catch
                    %                             a = 3;
                    %                         end
                    tempVCell = num2cell(tempV, 2);
                    [queueImpromptuEnemies(numImpromptuEnemies+1:numImpromptuEnemies+nBullets).V] = deal(tempVCell{:});
                    numImpromptuEnemies = numImpromptuEnemies + nBullets;
                    
                    
                    %                     if any(DistDiff < ENEMY_CONST(ID_EC_FORTEPIANO).SPEED)
                else
                    if (DistDiff(1)<=10)
                        a = 3;
                    end
                    queueGlobalEnemies(i).V = sign(DistDiff).* min(abs(ENEMY_CONST(ID_EC_FORTEPIANO).SPEED([1 1])), abs(DistDiff));
                end
                %                     end
            end
        elseif queueGlobalEnemies(i).ID == ID_EC_RONDO
            tempActivePlayers = find(ActivePlayers);
            tempPosDiff = queueGlobalPlayers(1).Pos - queueGlobalEnemies(i).Pos;
            %                                 BulletAngle = mod(round(atan(tempPosDiff(1)./tempPosDiff(2)).*180/pi), 360);
            EnemyAngle = mod(atan([tempPosDiff(1)/tempPosDiff(2)]).*180/pi + 180.*(tempPosDiff(2)<0), 360);
            numEnemyOri = length(ENEMY_ANIM(queueGlobalEnemies(i).ID).NumFrame);
            queueGlobalEnemies(i).CurAnimStat = floor(mod(EnemyAngle./360.*numEnemyOri, numEnemyOri))+1;
            if isnan(queueGlobalEnemies(i).CurAnimStat)
                queueGlobalEnemies(i).CurAnimStat = 1;
            end
            
        elseif queueGlobalEnemies(i).ID ==  ID_EC_ROTATO
%             queueGlobalEnemies(i).EndStat = mod(queueGlobalEnemies(i).EndStat,1);
%             if queueGlobalEnemies(i).EndStat == 0.53
%                 a = 3;
%             end
%             queueGlobalEnemies(i).V(1) = sinTable(floor(queueGlobalEnemies(i).EndStat .* 360) + 1) .* ENEMY_CONST(queueGlobalEnemies(i).ID).HSPEED .* FPS + ...
%                 queueGlobalEnemies(i).OriPos(1) - queueGlobalEnemies(i).Pos(1);
% %             queueGlobalEnemies(i).A(1) = -1.* sign(queueGlobalEnemies(i).Pos(1) - queueGlobalEnemies(i).OriPos(1));    % The Accel
%             queueGlobalEnemies(i).EndStat = queueGlobalEnemies(i).EndStat + 0.003;
            
            
            tempActivePlayers = find(ActivePlayers);
            tempPosDiff = queueGlobalPlayers(1).Pos - queueGlobalEnemies(i).Pos;
            %                                 BulletAngle = mod(round(atan(tempPosDiff(1)./tempPosDiff(2)).*180/pi), 360);
            EnemyAngle = mod(atan([tempPosDiff(1)/tempPosDiff(2)]).*180/pi + 180.*(tempPosDiff(2)<0), 360);
            
            queueGlobalEnemies(i).A = ENEMY_CONST(queueGlobalEnemies(i).ID).A .* [sin(EnemyAngle.*pi/180) cos(EnemyAngle*pi/180)];
            
            numEnemyOri = length(ENEMY_ANIM(queueGlobalEnemies(i).ID).NumFrame);
            
            EnemyAngle = EnemyAngle - 180/numEnemyOri + eps;
            queueGlobalEnemies(i).CurAnimStat = mod(round(EnemyAngle./360.*numEnemyOri), numEnemyOri) + 1;
            if isnan(queueGlobalEnemies(i).CurAnimStat)
                queueGlobalEnemies(i).CurAnimStat = 1;
            end
        end
        queueGlobalEnemies(i).Pos = queueGlobalEnemies(i).Pos + queueGlobalEnemies(i).V;
        queueGlobalEnemies(i).V = queueGlobalEnemies(i).V + queueGlobalEnemies(i).A;
        %         end
    elseif queueGlobalEnemies(i).Type == TYPE_ENEMY_BULLET
        
        if queueGlobalEnemies(i).BeingDestroyed
            queueGlobalEnemies(i).Timers(ENEMY_BULLET_CONST(queueGlobalEnemies(i).ID).TIMER.EXPLO_ANIM_NO) = CurrentFrameNo;
            queueGlobalEnemies(i).IsExploding = true;
            queueGlobalEnemies(i).BeingDestroyed = false;
            queueGlobalEnemies(i).ExplosionFrame = 1;
            queueGlobalEnemies(i).CurAttBox = [];
            queueGlobalEnemies(i).CurDefBox = [];
            %         queueGlobalPlayers(i).ExplosionStat = 1;
            %         queueGlobalPlayers(i).Explosiontype = 1;
        end
        
        if queueGlobalEnemies(i).IsExploding
            queueGlobalEnemies(i).ElapTimes(ENEMY_BULLET_CONST(queueGlobalEnemies(i).ID).TIMER.EXPLO_ANIM_NO) = ...
                CurrentFrameNo - queueGlobalEnemies(i).Timers(ENEMY_BULLET_CONST(queueGlobalEnemies(i).ID).TIMER.EXPLO_ANIM_NO);
            if (queueGlobalEnemies(i).ElapTimes(ENEMY_BULLET_CONST(queueGlobalEnemies(i).ID).TIMER.EXPLO_ANIM_NO) > ...
                    EXPLO_ANIM(queueGlobalEnemies(i).ExplosionType).AnimDur{queueGlobalEnemies(i).ExplosionStat}(queueGlobalEnemies(i).ExplosionFrame))
                queueGlobalEnemies(i).ExplosionFrame = queueGlobalEnemies(i).ExplosionFrame + 1;
            end
            % If the explosion is already over
            if queueGlobalEnemies(i).ExplosionFrame > EXPLO_ANIM(queueGlobalEnemies(i).ExplosionType).NumFrame(queueGlobalEnemies(i).ExplosionStat)
                queueGlobalEnemies(i).ExplosionFrame = 0;
                queueGlobalEnemies(i).IsExploding = false;
                enemiesToDeleteIndex(i) = true;
                %                 stl_deleteFromGlobalEnemies(i);
            else
                continue;
            end
            
        end
        
        queueGlobalEnemies(i).ElapTimes(ENEMY_BULLET_CONST(queueGlobalEnemies(i).ID).TIMER.CUR_ANIM_NO) = ...
            CurrentFrameNo - queueGlobalEnemies(i).Timers(ENEMY_BULLET_CONST(queueGlobalEnemies(i).ID).TIMER.CUR_ANIM_NO);
        
        % If it is time to change animation frame
        if queueGlobalEnemies(i).ElapTimes(ENEMY_BULLET_CONST(queueGlobalEnemies(i).ID).TIMER.CUR_ANIM_NO) >= ...
                ENEMY_BULLET_ANIM(queueGlobalEnemies(i).ID).AnimDur{queueGlobalEnemies(i).CurAnimStat}(queueGlobalEnemies(i).CurAnimFrame)
            queueGlobalEnemies(i).CurAnimFrame = queueGlobalEnemies(i).CurAnimFrame + 1;
            if queueGlobalEnemies(i).CurAnimFrame > ENEMY_BULLET_ANIM(queueGlobalEnemies(i).ID).NumFrame(queueGlobalEnemies(i).CurAnimStat)
                queueGlobalEnemies(i).CurAnimFrame = 1;
            end
            queueGlobalEnemies(i).Timers(ENEMY_BULLET_CONST(queueGlobalEnemies(i).ID).TIMER.CUR_ANIM_NO) = CurrentFrameNo;
        end
        
        % If the player is currently uncontrollable
%         if ~queueGlobalEnemies(i).Controllable
%             queueGlobalEnemies(i).ElapTimes(ENEMY_BULLET_CONST(queueGlobalEnemies(i).ID).FLYTODEST_TIMER_NO) = ...
%                 CurrentFrameNo - queueGlobalEnemies(i).Timers(ENEMY_BULLET_CONST(queueGlobalEnemies(i).ID).FLYTODEST_TIMER_NO);
%             if queueGlobalEnemies(i).ElapTimes(ENEMY_BULLET_CONST(queueGlobalEnemies(i).ID).FLYTODEST_TIMER_NO) >= ...
%                     queueGlobalEnemies(i).FlyToDestTime
%                 queueGlobalEnemies(i).DestReached = true;
%             end
%             
%             if queueGlobalEnemies(i).DestReached
%                 queueGlobalEnemies(i).DestReached = false;
%                 queueGlobalEnemies(i).Controllable = true;
%                 queueGlobalEnemies(i).FlyToDestTime = 0;
%             else
%                 if queueGlobalEnemies(i).ElapTimes(ENEMY_BULLET_CONST(queueGlobalEnemies(i).ID).FLYTODEST_TIMER_NO) ~= 0
%                     queueGlobalEnemies(i).V = (queueGlobalEnemies(i).DestPos - queueGlobalEnemies(i).Pos) ./ ...
%                         (queueGlobalEnemies(i).FlyToDestTime - queueGlobalEnemies(i).ElapTimes(PLAYER_CONST.FLYTODEST_TIMER_NO));
%                 else
%                     queueGlobalEnemies(i).V = [0 0];
%                 end
%                 continue;
%             end
%             
%         end
        % Special Processing for Each Type of Enemy
        queueGlobalEnemies(i).Pos = queueGlobalEnemies(i).Pos + queueGlobalEnemies(i).V;
        queueGlobalEnemies(i).V = queueGlobalEnemies(i).V + queueGlobalEnemies(i).A;
        
    end
    
end

stl_deleteFromGlobalEnemies(find(enemiesToDeleteIndex));
end