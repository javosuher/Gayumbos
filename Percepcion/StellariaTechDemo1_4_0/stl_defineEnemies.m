function stl_defineDefaultEnemies
% STL_DEFINEDEFAULTENEMIES - Define default enemy structures based on 'emptyEnemyStruct'

global emptyEnemyStruct
global GAME_RESOLUTION
global FPS
global FRAME_DURATION

%% Enemy Types and IDS
global TYPE_ENEMY_CRAFT
global ID_EC_STACCATO

global DefaultEnemyStructs

% emptyEnemyStruct = struct( ...  
%     'Pos', [0, 0],         ... % Position, 1 x 2 (pix) (0,0) - (GAME_RES-1)
%     'InterpPos', [0, 0],   ... % Interpolated position, 1 x 2 (pix)
%     'V', [0, 0],           ... % Velocity, 1 x 2 (pix / sec)
%     'A', [0, 0],           ... % Accelaration, 1 x 2 (p/s^2)
%     'Type', [0],        ... % The Enemy's Type
%     'ID', [0],          ... % The Enemy's Model Number
%     'ImageHandle', [0],  ... % The Image handle to use
%     'ImageHandleIndex', [0],...% The index of Image Handle in qGIH
%     'CurHP', [0],       ... % The HP left
%     'MaxHP', [0],       ... % The Maximum HP
%     'AP', [0],          ... % Attack points, should be 1 for aircrafts and bullets, 0 for bonus objects
%     'DP', [0],          ... % Defense points (not used), replaced by intEffDefBox
%     'OriDefBox', [],   ... % The Defensive Boxes in gGDB with respect to (0,0);
%     'OriAttBox', [],   ... % The Aggressive Boxes in gGAB, N X 4.
%     'CurDefBox', [],   ... % The DefBoxes with respect to the current position, N x 6.
%     'CurAttBox', [],   ... % The AttBoxes with respect to the current position.
%     'EffDefBox', [], ... % size(...,1) same as OriDefBox. Specifies the attenuation of damage done to this enemy. 1 -  maximum damage; 0 - no damage ar all.
%     'thisObjIndex', [], ... % the index of this object in the qGE.
%     'BeingDestroyed', [],...% If the enemy is being destroyed (i.e. exploding).
%     'IsExploding', false, ... %
%     'ExplosionType', 1,... % The Type of Explosion to use.
%     'ExplosionStat', 1, ... % The Status of Explosion.
%     'ExplosionFrame', 1, ... % The Current Frame of Explosion.
%     'CurObjStat', [],  ... % The current status of enemy, reserved for user.
%     'CurAnimFrame', [], ... % Current frame in the animation.
%     'CurAnimStat', [], ... % Which animation to show currently.
%     'InitStat', [],    ... % The Initial and Final Status.
%     'EndStat', [],     ... % Useful to create text scrolls, reserved for user.
%     'FreezeTimeWhenCreated', [], ... % Prevent all other enemies. 
%     'EndStageWhenDestroyed', [], ... % If this object is destroyed, end the stage.
%     'Invulnerable', [], ... % Whether this object is in the invulnerable status.
%     'NewBornInvulnerableTime', [],... % The time the invulnerablity lasts.
%     'Controllable', [], ... % Whether this object can be controlled by player
%     'AlphaData', [], ...    % If this array is not empty, the AlphaData property will be set to this array.
%     'AnimChangeFlag', [], ...
%     'BulletType', [],...
%     'MissileType', [],...
%     'BombType', [],...
%     'BulletLevel', [], ... % logical([0 0 0 1 0 0 0]), logical([0 0 0 1 0 0 0])}
%     'BulletPower', [], ...
%     'MissileLevel', [], ...
%     'MissilePower', [], ...
%     'BombLevel', [],...
%     'BombPower', [], ...
%     'CData', [], ...        % If this array is not empty,the CData property will be set to this array.
%     'Timers', zeros(1,10),      ... % 1 x 10 array for timer objects
%     'ElapTimes', zeros(1,10), ...
%     'Visible', true, ...
%     'UserData1', [],   ... % User-defined Data. Could be cell array or anything
%     'UserData2', [],   ... % ditto
%     'UserData3', [],   ... % ditto
%     'CONST', [] ... % Constants for this enemy
%     );

DefaultEnemyStructs(ID_EC_STACCATO).Pos = [GAME_RESOLUTION(1)./2 0];
DefaultEnemyStructs(ID_EC_STACCATO).V = ENEMY_CONST(ID_EC_STACCATO).SPEED .* FRAME_DURATION;
DefaultEnemyStructs(ID_EC_STACCATO).A = [0 0];
DefaultEnemyStructs(ID_EC_STACCATO).HP = ENEMY_CONST(ID_EC_STACCATO).HP;
DefaultEnemyStructs(ID_EC_STACCATO).AP = ENEMY_CONST(ID_EC_STACCATO).AP;
DefaultEnemyStructs(ID_EC_STACCATO).DP = ENEMY_CONST(ID_EC_STACCATO).DP;
DefaultEnemyStructs(ID_EC_STACCATO).OriDefBox = ENEMY_CONST(ID_EC_STACCATO).DEFBOX;
DefaultEnemyStructs(ID_EC_STACCATO).OriAttBox = ENEMY_CONST(ID_EC_STACCATO).ATTBOX;
DefaultEnemyStructs(ID_EC_STACCATO).EffDefBox = ENEMY_CONST(ID_EC_STACCATO).EFFDEFBOX;
DefaultEnemyStructs(ID_EC_STACCATO).Type = ENEMY_CONST(ID_EC_STACCATO).TYPE;
DefaultEnemyStructs(ID_EC_STACCATO).ID = ENEMY_CONST(ID_EC_STACCATO).ID;
DefaultEnemyStructs(ID_EC_STACCATO).ExplosionType = ENEMY_CONST(ID_EC_STACCATO).EXPLO_TYPE;

% 
% ENEMY_CONST(ID_EC_STACCATO).SPEED = 100 .* FRAME_DURATION;
% ENEMY_CONST(ID_EC_STACCATO).HP = 5;
% ENEMY_CONST(ID_EC_STACCATO).AP = 1;
% ENEMY_CONST(ID_EC_STACCATO).DP = 0;
% ENEMY_CONST(ID_EC_STACCATO).DEFBOX = [-10 -10 10 10];
% ENEMY_CONST(ID_EC_STACCATO).ATTBOX = [-10 -10 10 10];
% ENEMY_CONST(ID_EC_STACCATO).EFFDEFBOX = ones(size(PLAYER_CONST.DEFBOX,1),1);
% ENEMY_CONST(ID_EC_STACCATO).NEWBORN_INVUL_TIME = 0;    % The invulnerable time 
% ENEMY_CONST(ID_EC_STACCATO).TYPE = TYPE_ENEMY_CRAFT;    % 10 is for Enemy Crafts
% ENEMY_CONST(ID_EC_STACCATO).ID = ID_EC_STACCATO;       % STACCATO is the first type of enemy
% 
% ENEMY_CONST(ID_EC_STACCATO).TIMER.CUR_ANIM_NO = 4;
% ENEMY_CONST(ID_EC_STACCATO).TIMER.EXPLO_ANIM_NO = 8;
% ENEMY_CONST(ID_EC_STACCATO).EXPLO_TYPE = 1;