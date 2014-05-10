function stl_UpdateObjectPos()

global queueGlobalPlayers
global MAX_NUM_PLAYER_OBJ
global ActivePlayers

global queueGlobalFriendlyFire
global usedGlobalFriendlyFire
global MAX_NUM_FRIENDLYFIRE_OBJ
global PLAYER_BULLET_ANIM

global queueNeutralObjects
global availNeutralObjects
global numAvailNeutralObjects
global usedNeutralObjects

global MAX_NUM_ENEMY_OBJ
global queueGlobalEnemies
global usedGlobalEnemies

global GAME_RESOLUTION
global PLAYER_ANIM
global EXPLO_ANIM
global ENEMY_ANIM
global ENEMY_BULLET_ANIM
global OBJ_GENERIC_ANIM

%% Enemy Types and IDS
global TYPE_ENEMY_CRAFT
global ID_EC_STACCATO

global TYPE_ENEMY_BULLET
global ID_EB_VERDE

global TYPE_PLAYER_BULLET
global ID_PB_FIRE
global ID_PB_BOMB

global TYPE_NEUTRAL_PICT
global TYPE_NEUTRAL_TEXT

global TextAxesSizeFactor
global AxesResizeFactor

global CurrentFrameNo
global FPS
global FRAME_DURATION
global stageStartTime
% Update Player Position
for i = 1:MAX_NUM_PLAYER_OBJ
    if ~ActivePlayers(i)
        continue;
    end
    
    if ~queueGlobalPlayers(i).IsExploding
%     queueGlobalPlayers(i).Pos = queueGlobalPlayers(i).Pos + queueGlobalPlayers(i).V;    
    currentFrame = PLAYER_ANIM(i).AnimSeq{queueGlobalPlayers(i).CurAnimStat}{queueGlobalPlayers(i).CurAnimFrame};
    
    % Update the DefBox and AttBox
    AttPosBox = queueGlobalPlayers(i).Pos(ones(size(queueGlobalPlayers(i).EffAttBox)),:);
    DefPosBox = queueGlobalPlayers(i).Pos(ones(size(queueGlobalPlayers(i).EffDefBox)),:);

    queueGlobalPlayers(i).CurDefBox(:, 1:4) = queueGlobalPlayers(i).OriDefBox + [DefPosBox DefPosBox];
    queueGlobalPlayers(i).CurAttBox(:, 1:4) = queueGlobalPlayers(i).OriAttBox + [AttPosBox AttPosBox];
    
    else
        currentFrame = EXPLO_ANIM(queueGlobalPlayers(i).ExplosionType).AnimSeq{queueGlobalPlayers(i).ExplosionStat}{queueGlobalPlayers(i).ExplosionFrame};
    end
    sizeFrame = size(currentFrame);
    
%     
%     for iBox = 1:size(queueGlobalPlayers(i).OriDefBox, 1)
%         currentFrame(sizeFrame(2)./2+[(queueGlobalPlayers(i).OriDefBox(iBox, 1)+1):queueGlobalPlayers(i).OriDefBox(iBox, 3)],...
%             sizeFrame(1)./2+[(queueGlobalPlayers(i).OriDefBox(iBox, 2)+1):queueGlobalPlayers(i).OriDefBox(iBox, 4)],1:3) = 128;
%     end
%     
    set(queueGlobalPlayers(i).ImageHandle, 'CData', currentFrame(:,:,1:3));
    
    if queueGlobalPlayers(i).Visible
        set(queueGlobalPlayers(i).ImageHandle, 'AlphaData', currentFrame(:,:,4));
    else
        set(queueGlobalPlayers(i).ImageHandle, 'AlphaData', 0);
    end
%     set(queueGlobalPlayers(i).ImageHandle, 'XData', queueGlobalPlayers(i).Pos(1)+0.5, ...
%         'YData', queueGlobalPlayers(i).Pos(2)+0.5);
%     set(queueGlobalPlayers(i).ImageHandle, 'XData', queueGlobalPlayers(i).Pos(1)-sizeFrame(2)/2, ...
%         'YData', queueGlobalPlayers(i).Pos(2)-sizeFrame(1)/2);
    set(queueGlobalPlayers(i).ImageHandle, 'XData', queueGlobalPlayers(i).Pos(1)-sizeFrame(2)/2+0.5, ...
        'YData', queueGlobalPlayers(i).Pos(2)-sizeFrame(1)/2+0.5);
end

% Update Bullets
for i = find(usedGlobalFriendlyFire)
    if ~queueGlobalFriendlyFire(i).IsExploding
        %     queueGlobalFriendlyFire(i).Pos = queueGlobalFriendlyFire(i).Pos + queueGlobalFriendlyFire(i).V;
        %     queueGlobalFriendlyFire(i).V = queueGlobalFriendlyFire(i).V + queueGlobalFriendlyFire(i).A;
        
        AttPosBox = queueGlobalFriendlyFire(i).Pos(ones(size(queueGlobalFriendlyFire(i).EffAttBox)),:);
        DefPosBox = queueGlobalFriendlyFire(i).Pos(ones(size(queueGlobalFriendlyFire(i).EffDefBox)),:);
        
        queueGlobalFriendlyFire(i).CurDefBox(:, 1:4) = queueGlobalFriendlyFire(i).OriDefBox + [DefPosBox DefPosBox];
        queueGlobalFriendlyFire(i).CurAttBox(:, 1:4) = queueGlobalFriendlyFire(i).OriAttBox + [AttPosBox AttPosBox];
        
        currentFrame = PLAYER_BULLET_ANIM(queueGlobalFriendlyFire(i).ID).AnimSeq{queueGlobalFriendlyFire(i).CurAnimStat}{queueGlobalFriendlyFire(i).CurAnimFrame};
        sizeFrame = size(currentFrame);
        
        if queueGlobalFriendlyFire(i).ID == ID_PB_FIRE
            %             set(queueGlobalFriendlyFire(i).ImageHandle, 'AlphaData', 1);
            
        elseif queueGlobalFriendlyFire(i).ID == ID_PB_BOMB
            
            set(queueGlobalFriendlyFire(i).ImageHandle, 'CData', currentFrame(:,:,1:3));
            set(queueGlobalFriendlyFire(i).ImageHandle, 'AlphaData', currentFrame(:,:,4));
        end
        set(queueGlobalFriendlyFire(i).ImageHandle, 'XData', queueGlobalFriendlyFire(i).Pos(1)-sizeFrame(2)/2+0.5, ...
            'YData', queueGlobalFriendlyFire(i).Pos(2)-sizeFrame(1)/2+0.5);
    else
        %         queueGlobalFriendlyFire(i).ExplosionFrame
        currentFrame = EXPLO_ANIM(queueGlobalFriendlyFire(i).ExplosionType).AnimSeq{queueGlobalFriendlyFire(i).ExplosionStat}{queueGlobalFriendlyFire(i).ExplosionFrame};
        set(queueGlobalFriendlyFire(i).ImageHandle, 'CData', currentFrame(:,:,1:3));
        if queueGlobalFriendlyFire(i).Visible
            set(queueGlobalFriendlyFire(i).ImageHandle, 'AlphaData', currentFrame(:,:,4));
        else
            set(queueGlobalFriendlyFire(i).ImageHandle, 'AlphaData', 0);
        end
        sizeFrame = size(currentFrame);
        set(queueGlobalFriendlyFire(i).ImageHandle, 'XData', queueGlobalFriendlyFire(i).Pos(1)-sizeFrame(2)/2+0.5, ...
            'YData', queueGlobalFriendlyFire(i).Pos(2)-sizeFrame(1)/2+0.5); 
    end
end

% Update Enemies
for i = find(usedGlobalEnemies)
    %     if ~usedGlobalEnemies(i)
    %         continue;
    %     end
    if ~queueGlobalEnemies(i).IsExploding
%         queueGlobalEnemies(i).Pos = queueGlobalEnemies(i).Pos + queueGlobalEnemies(i).V;
%         queueGlobalEnemies(i).V = queueGlobalEnemies(i).V + queueGlobalEnemies(i).A;
        if queueGlobalEnemies(i).Type == TYPE_ENEMY_CRAFT
            try
            currentFrame = ENEMY_ANIM(queueGlobalEnemies(i).ID).AnimSeq{queueGlobalEnemies(i).CurAnimStat}{queueGlobalEnemies(i).CurAnimFrame};
            catch
                a = 3;
            end
        else
            try
            currentFrame = ENEMY_BULLET_ANIM(queueGlobalEnemies(i).ID).AnimSeq{queueGlobalEnemies(i).CurAnimStat}{queueGlobalEnemies(i).CurAnimFrame};
            catch
                a = 3;
            end
        end
        
        % If the enemy is under attack, make it 'blink'
%         if queueGlobalEnemies(i).IsWreckage
%             queueGlobalEnemies(i).UnderAttack = false;
%         end
        if queueGlobalEnemies(i).UnderAttack
            currentFrame(:,:,1:3) = currentFrame(:,:,[4 4 4]);
            queueGlobalEnemies(i).UnderAttack = false;
        end
        
        
        
        % Update the DefBox and AttBox
        
        if ~isempty(queueGlobalEnemies(i).CurDefBox)
            DefPosBox = queueGlobalEnemies(i).Pos(ones(size(queueGlobalEnemies(i).EffDefBox)),:);
            try
            queueGlobalEnemies(i).CurDefBox(:, 1:4) = queueGlobalEnemies(i).OriDefBox + [DefPosBox DefPosBox];
            catch
                a = 3;
            end
        end
        
        if ~isempty(queueGlobalEnemies(i).CurAttBox)
            AttPosBox = queueGlobalEnemies(i).Pos(ones(size(queueGlobalEnemies(i).EffAttBox)),:);
            queueGlobalEnemies(i).CurAttBox(:, 1:4) = queueGlobalEnemies(i).OriAttBox + [AttPosBox AttPosBox];
        end
        
    else
%         if queueGlobalEnemies(i).HasWreckage
%              queueGlobalEnemies(i).Pos = queueGlobalEnemies(i).Pos + queueGlobalEnemies(i).V;
%              queueGlobalEnemies(i).V = queueGlobalEnemies(i).V + queueGlobalEnemies(i).A;
%         end
            
        currentFrame = EXPLO_ANIM(queueGlobalEnemies(i).ExplosionType).AnimSeq{queueGlobalEnemies(i).ExplosionStat}{queueGlobalEnemies(i).ExplosionFrame};
%         if queueGlobalEnemies(i).HasWreckage
% %             uistack(queueGlobalEnemies(i).ImageHandle, 'top');
%         end
    end
    sizeFrame = size(currentFrame);
    %
    %        AttPosBox = queueGlobalEnemies(i).Pos(ones(size(queueGlobalEnemies(i).EffAttBox)),:);
    %    DefPosBox = queueGlobalEnemies(i).Pos(ones(size(queueGlobalEnemies(i).EffDefBox)),:);
    %
    %     queueGlobalEnemies(i).CurDefBox(:, 1:4) = queueGlobalEnemies(i).OriDefBox + [DefPosBox DefPosBox];
    %     queueGlobalEnemies(i).CurAttBox(:, 1:4) = queueGlobalEnemies(i).OriAttBox + [AttPosBox AttPosBox];
    
    %     for iBox = 1:size(queueGlobalEnemies(i).OriDefBox, 1)
    %         currentFrame(sizeFrame(2)./2+[(queueGlobalEnemies(i).OriDefBox(iBox, 1)+1):queueGlobalEnemies(i).OriDefBox(iBox, 3)],...
    %             sizeFrame(1)./2+[(queueGlobalEnemies(i).OriDefBox(iBox, 2)+1):queueGlobalEnemies(i).OriDefBox(iBox, 4)],1:3) = 0.5;
    %     end
    
    
    
    if queueGlobalEnemies(i).Visible
        set(queueGlobalEnemies(i).ImageHandle, 'CData', currentFrame(:,:,1:3));
        set(queueGlobalEnemies(i).ImageHandle, 'AlphaData', currentFrame(:,:,4));
    else
        set(queueGlobalEnemies(i).ImageHandle, 'AlphaData', 0);
    end
    %     set(queueGlobalPlayers(i).ImageHandle, 'XData', queueGlobalPlayers(i).Pos(1)+0.5, ...
    %         'YData', queueGlobalPlayers(i).Pos(2)+0.5);
    %     set(queueGlobalPlayers(i).ImageHandle, 'XData', queueGlobalPlayers(i).Pos(1)-sizeFrame(2)/2, ...
    %         'YData', queueGlobalPlayers(i).Pos(2)-sizeFrame(1)/2);
    if queueGlobalEnemies(i).ResizeFactor == 1
    set(queueGlobalEnemies(i).ImageHandle, 'XData', queueGlobalEnemies(i).Pos(1)-sizeFrame(2)/2+0.5, ...
        'YData', queueGlobalEnemies(i).Pos(2)-sizeFrame(1)/2+0.5);
    else
        sizeFrame = sizeFrame.*queueGlobalEnemies(i).ResizeFactor;
        if queueGlobalEnemies(i).ResizeFactor<0.9
            a = 3;
        end
        set(queueGlobalEnemies(i).ImageHandle, 'XData', [queueGlobalEnemies(i).Pos(1)-sizeFrame(2)/2+0.5,queueGlobalEnemies(i).Pos(1)+sizeFrame(2)/2+0.5] + 1.5.*(rand-0.5).*(queueGlobalEnemies(i).ResizeFactor), ...
        'YData', [queueGlobalEnemies(i).Pos(2)-sizeFrame(1)/2+0.5, queueGlobalEnemies(i).Pos(2)+sizeFrame(1)/2+0.5] + 1.5.*(rand -0.5).*(queueGlobalEnemies(i).ResizeFactor));
    end
    
    
end

interpTime = 0; % GetSecs - CurrentFrameNo.*FRAME_DURATION - stageStartTime;

for i = find(usedNeutralObjects)
            try
    currentFrame = OBJ_GENERIC_ANIM(queueNeutralObjects(i).ID).AnimSeq{queueNeutralObjects(i).CurAnimStat}{queueNeutralObjects(i).CurAnimFrame};
            catch
                a = 3;
            end
    sizeFrame = size(currentFrame);
    
    if queueNeutralObjects(i).AnimChangeFlag
        if queueNeutralObjects(i).Type == TYPE_NEUTRAL_PICT
            set(queueNeutralObjects(i).ImageHandle, 'CData', currentFrame(:,:,1:3));
        else
            set(queueNeutralObjects(i).ImageHandle, 'String', queueNeutralObjects(i).Text, ...
                'FontName', queueNeutralObjects(i).TextFont, ...
                'FontSize', queueNeutralObjects(i).TextSize .* AxesResizeFactor);
        end
        queueNeutralObjects(i).AnimChangeFlag = false;
    end
    
    if queueNeutralObjects(i).Visible
        if queueNeutralObjects(i).AlphaChangeFlag
            if queueNeutralObjects(i).Type == TYPE_NEUTRAL_PICT
                set(queueNeutralObjects(i).ImageHandle, 'AlphaData', currentFrame(:,:,4).*queueNeutralObjects(i).AlphaFactor);
            else
%                 if strcmp(queueNeutralObjects(i).Text, 'Stellaria')
%                     queueNeutralObjects(i).AlphaFactor
%                 end
                try
                set(queueNeutralObjects(i).ImageHandle, 'Color', queueNeutralObjects(i).Color.*queueNeutralObjects(i).AlphaFactor);
                catch
                    a = 3;
                end
            end
            queueNeutralObjects(i).AlphaChangeFlag = false;
        end
        
    else
        if queueNeutralObjects(i).Type == TYPE_NEUTRAL_PICT
            set(queueNeutralObjects(i).ImageHandle, 'AlphaData', 0);
        else
            set(queueNeutralObjects(i).ImageHandle, 'Color', [0 0 0]);
        end
        
    end
    if queueNeutralObjects(i).Type == TYPE_NEUTRAL_PICT
        if queueNeutralObjects(i).ResizeFactor == 1
            set(queueNeutralObjects(i).ImageHandle, 'XData', (queueNeutralObjects(i).Pos(1)*TextAxesSizeFactor-sizeFrame(2)/2+0.5), ...
                'YData', queueNeutralObjects(i).Pos(2)*TextAxesSizeFactor-sizeFrame(1)/2+0.5 );
        else
            sizeFrame = sizeFrame.*queueNeutralObjects(i).ResizeFactor;
            
            set(queueNeutralObjects(i).ImageHandle, 'XData', queueNeutralObjects(i).Pos(1)*TextAxesSizeFactor+0.5+[-sizeFrame(2)/2, +sizeFrame(2)/2] , ...
                'YData', queueNeutralObjects(i).Pos(2)*TextAxesSizeFactor+0.5 + [-sizeFrame(1)/2,sizeFrame(1)/2]);
        end
    else
        try
        set(queueNeutralObjects(i).ImageHandle, 'Position', queueNeutralObjects(i).Pos*TextAxesSizeFactor + interpTime.*FPS.*queueNeutralObjects(i).V);
        catch
            a= 3;
        end
    end
end


