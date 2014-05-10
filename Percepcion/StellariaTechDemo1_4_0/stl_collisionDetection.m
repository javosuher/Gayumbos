function stl_collisionDetection()
% STL_COLLISIONDETECTION - Perform the collision detection for Stellaria

global CurrentFrameNo

global queueGlobalPlayers
global queueGlobalFriendlyFire
global usedGlobalFriendlyFire

global queueGlobalEnemies
global usedGlobalEnemies

global indexGlobalBomb

global MAX_NUM_PLAYER_OBJ
global ActivePlayers

global SPECIAL_FLAG
% if CurrentFrameNo > 100
global ID_PB_BOMB

global DefaultBulletStructs



%% ------------------ PART 1: Player Bullets VS Enemy Crafts -----
%% Get the Boxes of PlayerBullets
PlayerBulletAttBoxes = cell2mat({queueGlobalFriendlyFire(usedGlobalFriendlyFire).CurAttBox}');

%% Get the Boxes of Enemy
try
EnemyDefBoxes = cell2mat({...
    queueGlobalEnemies(~cell2mat({queueGlobalEnemies.Invulnerable}) & ... % ~cell2mat({queueGlobalEnemies.IsWreckage}) & ...
    usedGlobalEnemies).CurDefBox}');
catch
    a = 3;
end
for i = 1:size(EnemyDefBoxes, 1)
    % Detect which bullets intersects with this Enemy.
    
    [hit_flag, hit_index, num_hits] = stlm_HitDetect_BoxVSBoxes(EnemyDefBoxes(i, 1:4), PlayerBulletAttBoxes);
    
    % If no collision is detected at all
    if ~hit_flag
        continue;
    end
    
    % Destroy those bullets who hit an enemy
    [queueGlobalFriendlyFire(PlayerBulletAttBoxes(hit_index, 5)).BeingDestroyed] = deal(true);
    
    
    
    % Accrete all the bullets power
    AllBulletPower = cell2mat({queueGlobalFriendlyFire(PlayerBulletAttBoxes(hit_index, 5)).AP});
    SummedBulletPower = sum(AllBulletPower(:));
    try
    HarmDone = SummedBulletPower .* EnemyDefBoxes(i, 6);
    catch
        a = 3;
    end
    queueGlobalEnemies(EnemyDefBoxes(i, 5)).CurHP = queueGlobalEnemies(EnemyDefBoxes(i, 5)).CurHP - HarmDone;
    if HarmDone ~= 0
        queueGlobalEnemies(EnemyDefBoxes(i, 5)).UnderAttack = true;
    else
        queueGlobalEnemies(EnemyDefBoxes(i, 5)).UnderAttack = false;
    end
    
    PlayerBulletAttBoxes(hit_index, :) = [];
   
    % 
%     EnemyDefBoxes(queueGlobalEnemiesEnemyDefBoxes(hit_index, 5)

end
% end

%% ------------------ PART 2: Enemies (Ships and Bullets) VS Players -----------

if any(SPECIAL_FLAG.BOMB_EXIST)
            EnemyHP = [queueGlobalEnemies(usedGlobalEnemies).CurHP] - DefaultBulletStructs(ID_PB_BOMB).AP .* sum(SPECIAL_FLAG.BOMB_EXIST);
            EnemyHPCell = num2cell(EnemyHP);
            [queueGlobalEnemies(usedGlobalEnemies).CurHP] = deal(EnemyHPCell{:});
            [queueGlobalEnemies(usedGlobalEnemies).UnderAttack] = deal(true);
else
    try
        EnemyAttBoxes = cell2mat({queueGlobalEnemies(usedGlobalEnemies).CurAttBox}');
    catch
        a = 3
    end
    
    for i = 1:MAX_NUM_PLAYER_OBJ
        if ~ActivePlayers(i) | queueGlobalPlayers(i).Invulnerable | ~queueGlobalPlayers(i).Controllable | queueGlobalPlayers(i).BeingDestroyed | queueGlobalPlayers(i).IsExploding
            continue;
        end       
        
        [hit_flag, hit_index, num_hits] = stlm_HitDetect_BoxVSBoxes(queueGlobalPlayers(i).CurDefBox, EnemyAttBoxes);
        % If no collision is detected at all
        if ~hit_flag
            continue;
        end
        
        EnemyHP = [queueGlobalEnemies(EnemyAttBoxes(hit_index,5)).CurHP] - queueGlobalPlayers(i).AP;
        
        EnemyHPCell = num2cell(EnemyHP);
        try
            [queueGlobalEnemies(EnemyAttBoxes(hit_index,5)).CurHP] = deal(EnemyHPCell{:});
        catch ME
            a = 3;
        end
        
        [queueGlobalEnemies(EnemyAttBoxes(hit_index,5)).UnderAttack] = deal(true);
        
        queueGlobalPlayers(i).BeingDestroyed = true;
        %     queueGlobalPlayers(i).CurHP = 0;
        
    end
end

%%

