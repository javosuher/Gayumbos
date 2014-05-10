function stl_defineDefaultEnemies
% STL_DEFINEDEFAULTENEMIES - Define default enemy structures based on 'emptyEnemyStruct'

global emptyEnemyStruct
global emptyNeutralObjectStruct
global GAME_RESOLUTION
global FPS
global FRAME_DURATION
global ENEMY_CONST
global PLAYER_CONST




%% Enemy Types and IDS
global TYPE_ENEMY_CRAFT
global ID_EC_STACCATO
global ID_EC_LEGATO
global ID_EC_FORTEPIANO
global ID_EC_FORTEPIANO_WRECKAGE
global ID_EC_RONDO
global ID_EC_ROTATO

global TYPE_PLAYER_BULLET
global ID_PB_FIRE
global ID_PB_BOMB
global ID_EB_POWER_ONEUP

global TYPE_ENEMY_BULLET
global ID_EB_VERDE
global ID_EB_ROSSO


global TYPE_NEUTRAL_TEXT
global TYPE_NEUTRAL_PICT
global ID_CHN_TITLE
global ID_NEUTRAL_MOTTO_STAGE1
global ID_TEXT_SCROLL
global ID_TEXT_MOTTO
global ID_TEXT_PROLOGUE
global ID_TEXT_PROLOGUE_BLINK

global ENEMY_BULLET_CONST
global OBJ_GENERIC_CONST

global DefaultEnemyStructs
global DefaultEnemyBulletStructs
global DefaultBulletStructs
global DefaultNeutralObjectStructs
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

DefaultBulletStructs = repmat(emptyEnemyStruct,1,3);
DefaultBulletStructs(ID_PB_FIRE).Pos = [0 0];
DefaultBulletStructs(ID_PB_FIRE).V = [0 PLAYER_CONST.BULLET_V];
DefaultBulletStructs(ID_PB_FIRE).A = [0 -0.5];
DefaultBulletStructs(ID_PB_FIRE).MaxHP = 1;
DefaultBulletStructs(ID_PB_FIRE).CurHP = 1;
DefaultBulletStructs(ID_PB_FIRE).AP = 1;
DefaultBulletStructs(ID_PB_FIRE).DP = 0;
DefaultBulletStructs(ID_PB_FIRE).OriDefBox = PLAYER_CONST.BULLET_DEFBOX;
DefaultBulletStructs(ID_PB_FIRE).OriAttBox = PLAYER_CONST.BULLET_ATTBOX;
DefaultBulletStructs(ID_PB_FIRE).EffDefBox = 1;
DefaultBulletStructs(ID_PB_FIRE).EffAttBox = 1;
DefaultBulletStructs(ID_PB_FIRE).CurDefBox = [DefaultBulletStructs(ID_PB_FIRE).OriDefBox 0 DefaultBulletStructs(ID_PB_FIRE).EffDefBox];
DefaultBulletStructs(ID_PB_FIRE).CurAttBox = [DefaultBulletStructs(ID_PB_FIRE).OriAttBox 0 DefaultBulletStructs(ID_PB_FIRE).EffAttBox];
DefaultBulletStructs(ID_PB_FIRE).Type = TYPE_PLAYER_BULLET;
DefaultBulletStructs(ID_PB_FIRE).ID = ID_PB_FIRE;
DefaultBulletStructs(ID_PB_FIRE).ExplosionType = PLAYER_CONST.BULLET_EXPLO_TYPE;
DefaultBulletStructs(ID_PB_FIRE).Visible = true;
DefaultBulletStructs(ID_PB_FIRE).CurAnimStat = 1;
DefaultBulletStructs(ID_PB_FIRE).CurAnimFrame = 1;

DefaultBulletStructs(ID_PB_BOMB).Pos = [0 0];
DefaultBulletStructs(ID_PB_BOMB).V = [0 0];
DefaultBulletStructs(ID_PB_BOMB).A = [0 0];
DefaultBulletStructs(ID_PB_BOMB).MaxHP = 1;
DefaultBulletStructs(ID_PB_BOMB).CurHP = 1;
DefaultBulletStructs(ID_PB_BOMB).AP = 30;
DefaultBulletStructs(ID_PB_BOMB).DP = 0;
DefaultBulletStructs(ID_PB_BOMB).OriDefBox = [-64 -64 64 64];
DefaultBulletStructs(ID_PB_BOMB).OriAttBox = [-64 -64 64 64];
DefaultBulletStructs(ID_PB_BOMB).EffDefBox = 1;
DefaultBulletStructs(ID_PB_BOMB).EffAttBox = 1;
DefaultBulletStructs(ID_PB_BOMB).CurDefBox = [DefaultBulletStructs(ID_PB_BOMB).OriDefBox 0 DefaultBulletStructs(ID_PB_BOMB).EffDefBox];
DefaultBulletStructs(ID_PB_BOMB).CurAttBox = [DefaultBulletStructs(ID_PB_BOMB).OriAttBox 0 DefaultBulletStructs(ID_PB_BOMB).EffAttBox];
DefaultBulletStructs(ID_PB_BOMB).Type = TYPE_PLAYER_BULLET;
DefaultBulletStructs(ID_PB_BOMB).ID = ID_PB_BOMB;
DefaultBulletStructs(ID_PB_BOMB).ExplosionType = 0;

DefaultEnemyStructs = repmat(emptyEnemyStruct,1,6);
%% Enemy Craft: STACCATO
DefaultEnemyStructs(ID_EC_STACCATO).Pos = [GAME_RESOLUTION(1)./2 0];
DefaultEnemyStructs(ID_EC_STACCATO).V = [0 ENEMY_CONST(ID_EC_STACCATO).SPEED];
DefaultEnemyStructs(ID_EC_STACCATO).A = [0 0];
DefaultEnemyStructs(ID_EC_STACCATO).MaxHP = ENEMY_CONST(ID_EC_STACCATO).HP;
DefaultEnemyStructs(ID_EC_STACCATO).CurHP = ENEMY_CONST(ID_EC_STACCATO).HP;
DefaultEnemyStructs(ID_EC_STACCATO).AP = ENEMY_CONST(ID_EC_STACCATO).AP;
DefaultEnemyStructs(ID_EC_STACCATO).DP = ENEMY_CONST(ID_EC_STACCATO).DP;
DefaultEnemyStructs(ID_EC_STACCATO).OriDefBox = ENEMY_CONST(ID_EC_STACCATO).DEFBOX;
DefaultEnemyStructs(ID_EC_STACCATO).OriAttBox = ENEMY_CONST(ID_EC_STACCATO).ATTBOX;

DefaultEnemyStructs(ID_EC_STACCATO).EffDefBox = ENEMY_CONST(ID_EC_STACCATO).EFFDEFBOX;
DefaultEnemyStructs(ID_EC_STACCATO).EffAttBox = ENEMY_CONST(ID_EC_STACCATO).EFFATTBOX;

DefaultEnemyStructs(ID_EC_STACCATO).CurDefBox = [ENEMY_CONST(ID_EC_STACCATO).DEFBOX 0 ENEMY_CONST(ID_EC_STACCATO).EFFDEFBOX(:)];
DefaultEnemyStructs(ID_EC_STACCATO).CurAttBox = [ENEMY_CONST(ID_EC_STACCATO).ATTBOX 0 ENEMY_CONST(ID_EC_STACCATO).EFFATTBOX(:)];

DefaultEnemyStructs(ID_EC_STACCATO).Type = ENEMY_CONST(ID_EC_STACCATO).TYPE;
DefaultEnemyStructs(ID_EC_STACCATO).ID = ENEMY_CONST(ID_EC_STACCATO).ID;
DefaultEnemyStructs(ID_EC_STACCATO).ExplosionType = ENEMY_CONST(ID_EC_STACCATO).EXPLO_TYPE;

%% Enemy Craft: LEGATO (ID_EC_LEGATO)
DefaultEnemyStructs(ID_EC_LEGATO).Pos = [GAME_RESOLUTION(1)./2 0];
DefaultEnemyStructs(ID_EC_LEGATO).V = [5 ENEMY_CONST(ID_EC_LEGATO).SPEED];
DefaultEnemyStructs(ID_EC_LEGATO).A = [0 0];
DefaultEnemyStructs(ID_EC_LEGATO).MaxHP = ENEMY_CONST(ID_EC_LEGATO).HP;
DefaultEnemyStructs(ID_EC_LEGATO).CurHP = ENEMY_CONST(ID_EC_LEGATO).HP;
DefaultEnemyStructs(ID_EC_LEGATO).AP = ENEMY_CONST(ID_EC_LEGATO).AP;
DefaultEnemyStructs(ID_EC_LEGATO).DP = ENEMY_CONST(ID_EC_LEGATO).DP;
DefaultEnemyStructs(ID_EC_LEGATO).OriDefBox = ENEMY_CONST(ID_EC_LEGATO).DEFBOX;
DefaultEnemyStructs(ID_EC_LEGATO).OriAttBox = ENEMY_CONST(ID_EC_LEGATO).ATTBOX;

DefaultEnemyStructs(ID_EC_LEGATO).EffDefBox = ENEMY_CONST(ID_EC_LEGATO).EFFDEFBOX;
DefaultEnemyStructs(ID_EC_LEGATO).EffAttBox = ENEMY_CONST(ID_EC_LEGATO).EFFATTBOX;

DefaultEnemyStructs(ID_EC_LEGATO).CurDefBox = [ENEMY_CONST(ID_EC_LEGATO).DEFBOX 0 ENEMY_CONST(ID_EC_LEGATO).EFFDEFBOX(:)];
DefaultEnemyStructs(ID_EC_LEGATO).CurAttBox = [ENEMY_CONST(ID_EC_LEGATO).ATTBOX 0 ENEMY_CONST(ID_EC_LEGATO).EFFATTBOX(:)];

DefaultEnemyStructs(ID_EC_LEGATO).EndStat = 0;

DefaultEnemyStructs(ID_EC_LEGATO).Type = ENEMY_CONST(ID_EC_LEGATO).TYPE;
DefaultEnemyStructs(ID_EC_LEGATO).ID = ENEMY_CONST(ID_EC_LEGATO).ID;
DefaultEnemyStructs(ID_EC_LEGATO).ExplosionType = ENEMY_CONST(ID_EC_LEGATO).EXPLO_TYPE;

%% Enemy Craft: FORTEPIANO (ID_EC_FORTEPIANO)
DefaultEnemyStructs(ID_EC_FORTEPIANO).Pos = [GAME_RESOLUTION(1)./2 0];
DefaultEnemyStructs(ID_EC_FORTEPIANO).V = [0 ENEMY_CONST(ID_EC_FORTEPIANO).SPEED];
DefaultEnemyStructs(ID_EC_FORTEPIANO).A = [0 0];
DefaultEnemyStructs(ID_EC_FORTEPIANO).MaxHP = ENEMY_CONST(ID_EC_FORTEPIANO).HP;
DefaultEnemyStructs(ID_EC_FORTEPIANO).CurHP = ENEMY_CONST(ID_EC_FORTEPIANO).HP;
DefaultEnemyStructs(ID_EC_FORTEPIANO).AP = ENEMY_CONST(ID_EC_FORTEPIANO).AP;
DefaultEnemyStructs(ID_EC_FORTEPIANO).DP = ENEMY_CONST(ID_EC_FORTEPIANO).DP;
DefaultEnemyStructs(ID_EC_FORTEPIANO).OriDefBox = ENEMY_CONST(ID_EC_FORTEPIANO).DEFBOX;
DefaultEnemyStructs(ID_EC_FORTEPIANO).OriAttBox = ENEMY_CONST(ID_EC_FORTEPIANO).ATTBOX;

DefaultEnemyStructs(ID_EC_FORTEPIANO).EffDefBox = ENEMY_CONST(ID_EC_FORTEPIANO).EFFDEFBOX;
DefaultEnemyStructs(ID_EC_FORTEPIANO).EffAttBox = ENEMY_CONST(ID_EC_FORTEPIANO).EFFATTBOX;

DefaultEnemyStructs(ID_EC_FORTEPIANO).CurDefBox = [ENEMY_CONST(ID_EC_FORTEPIANO).DEFBOX zeros(size(ENEMY_CONST(ID_EC_FORTEPIANO).EFFDEFBOX)) ENEMY_CONST(ID_EC_FORTEPIANO).EFFDEFBOX(:)];
DefaultEnemyStructs(ID_EC_FORTEPIANO).CurAttBox = [ENEMY_CONST(ID_EC_FORTEPIANO).ATTBOX zeros(size(ENEMY_CONST(ID_EC_FORTEPIANO).EFFATTBOX)) ENEMY_CONST(ID_EC_FORTEPIANO).EFFATTBOX(:)];

DefaultEnemyStructs(ID_EC_FORTEPIANO).EndStat = 0;

DefaultEnemyStructs(ID_EC_FORTEPIANO).Type = ENEMY_CONST(ID_EC_FORTEPIANO).TYPE;
DefaultEnemyStructs(ID_EC_FORTEPIANO).ID = ENEMY_CONST(ID_EC_FORTEPIANO).ID;
DefaultEnemyStructs(ID_EC_FORTEPIANO).ExplosionType = ENEMY_CONST(ID_EC_FORTEPIANO).EXPLO_TYPE;
DefaultEnemyStructs(ID_EC_FORTEPIANO).HasWreckage = true;
DefaultEnemyStructs(ID_EC_FORTEPIANO_WRECKAGE).IsWreckage = false;
DefaultEnemyStructs(ID_EC_FORTEPIANO).WreckageIndex = ID_EC_FORTEPIANO_WRECKAGE;
DefaultEnemyStructs(ID_EC_FORTEPIANO).ExploV = ENEMY_CONST(ID_EC_FORTEPIANO_WRECKAGE).SPEED;
DefaultEnemyStructs(ID_EC_FORTEPIANO).FreezeTimeWhenCreated = false;
DefaultEnemyStructs(ID_EC_FORTEPIANO).EndStageWhenDestroyed =false;

%% Enemy Craft: FORTEPIANO's WRECKAGE (ID_EC_FORTEPIANO_WRECKAGE)

DefaultEnemyStructs(ID_EC_FORTEPIANO_WRECKAGE).Pos = [GAME_RESOLUTION(1)./2 0];
DefaultEnemyStructs(ID_EC_FORTEPIANO_WRECKAGE).V = ENEMY_CONST(ID_EC_FORTEPIANO_WRECKAGE).SPEED;
DefaultEnemyStructs(ID_EC_FORTEPIANO_WRECKAGE).A = ENEMY_CONST(ID_EC_FORTEPIANO_WRECKAGE).A;
DefaultEnemyStructs(ID_EC_FORTEPIANO_WRECKAGE).MaxHP = ENEMY_CONST(ID_EC_FORTEPIANO_WRECKAGE).HP;
DefaultEnemyStructs(ID_EC_FORTEPIANO_WRECKAGE).CurHP = ENEMY_CONST(ID_EC_FORTEPIANO_WRECKAGE).HP;
DefaultEnemyStructs(ID_EC_FORTEPIANO_WRECKAGE).AP = ENEMY_CONST(ID_EC_FORTEPIANO_WRECKAGE).AP;
DefaultEnemyStructs(ID_EC_FORTEPIANO_WRECKAGE).DP = ENEMY_CONST(ID_EC_FORTEPIANO_WRECKAGE).DP;
DefaultEnemyStructs(ID_EC_FORTEPIANO_WRECKAGE).OriDefBox = ENEMY_CONST(ID_EC_FORTEPIANO_WRECKAGE).DEFBOX;
DefaultEnemyStructs(ID_EC_FORTEPIANO_WRECKAGE).OriAttBox = ENEMY_CONST(ID_EC_FORTEPIANO_WRECKAGE).ATTBOX;

DefaultEnemyStructs(ID_EC_FORTEPIANO_WRECKAGE).EffDefBox = ENEMY_CONST(ID_EC_FORTEPIANO_WRECKAGE).EFFDEFBOX;
DefaultEnemyStructs(ID_EC_FORTEPIANO_WRECKAGE).EffAttBox = ENEMY_CONST(ID_EC_FORTEPIANO_WRECKAGE).EFFATTBOX;

DefaultEnemyStructs(ID_EC_FORTEPIANO_WRECKAGE).CurDefBox = [];
DefaultEnemyStructs(ID_EC_FORTEPIANO_WRECKAGE).CurAttBox = [];

DefaultEnemyStructs(ID_EC_FORTEPIANO_WRECKAGE).EndStat = 0;

DefaultEnemyStructs(ID_EC_FORTEPIANO_WRECKAGE).Type = ENEMY_CONST(ID_EC_FORTEPIANO_WRECKAGE).TYPE;
DefaultEnemyStructs(ID_EC_FORTEPIANO_WRECKAGE).ID = ENEMY_CONST(ID_EC_FORTEPIANO_WRECKAGE).ID;
DefaultEnemyStructs(ID_EC_FORTEPIANO_WRECKAGE).ExplosionType = ENEMY_CONST(ID_EC_FORTEPIANO_WRECKAGE).EXPLO_TYPE;
DefaultEnemyStructs(ID_EC_FORTEPIANO_WRECKAGE).HasWreckage = false;
DefaultEnemyStructs(ID_EC_FORTEPIANO_WRECKAGE).IsWreckage = true;
%% Enemy Craft: RONDO (ID_EC_RONDO)
DefaultEnemyStructs(ID_EC_RONDO).Pos = [GAME_RESOLUTION(1)./2 0];
DefaultEnemyStructs(ID_EC_RONDO).V = [0 ENEMY_CONST(ID_EC_RONDO).SPEED];
DefaultEnemyStructs(ID_EC_RONDO).A = [0 0];
DefaultEnemyStructs(ID_EC_RONDO).MaxHP = ENEMY_CONST(ID_EC_RONDO).HP;
DefaultEnemyStructs(ID_EC_RONDO).CurHP = ENEMY_CONST(ID_EC_RONDO).HP;
DefaultEnemyStructs(ID_EC_RONDO).AP = ENEMY_CONST(ID_EC_RONDO).AP;
DefaultEnemyStructs(ID_EC_RONDO).DP = ENEMY_CONST(ID_EC_RONDO).DP;
DefaultEnemyStructs(ID_EC_RONDO).OriDefBox = ENEMY_CONST(ID_EC_RONDO).DEFBOX;
DefaultEnemyStructs(ID_EC_RONDO).OriAttBox = ENEMY_CONST(ID_EC_RONDO).ATTBOX;

DefaultEnemyStructs(ID_EC_RONDO).EffDefBox = ENEMY_CONST(ID_EC_RONDO).EFFDEFBOX;
DefaultEnemyStructs(ID_EC_RONDO).EffAttBox = ENEMY_CONST(ID_EC_RONDO).EFFATTBOX;

DefaultEnemyStructs(ID_EC_RONDO).CurDefBox = [ENEMY_CONST(ID_EC_RONDO).DEFBOX 0 ENEMY_CONST(ID_EC_RONDO).EFFDEFBOX(:)];
DefaultEnemyStructs(ID_EC_RONDO).CurAttBox = [ENEMY_CONST(ID_EC_RONDO).ATTBOX 0 ENEMY_CONST(ID_EC_RONDO).EFFATTBOX(:)];

DefaultEnemyStructs(ID_EC_RONDO).EndStat = 0;

DefaultEnemyStructs(ID_EC_RONDO).Type = ENEMY_CONST(ID_EC_RONDO).TYPE;
DefaultEnemyStructs(ID_EC_RONDO).ID = ENEMY_CONST(ID_EC_RONDO).ID;
DefaultEnemyStructs(ID_EC_RONDO).ExplosionType = ENEMY_CONST(ID_EC_RONDO).EXPLO_TYPE;

%% Enemy Craft: RONDO (ID_EC_ROTATO)
DefaultEnemyStructs(ID_EC_ROTATO).Pos = [GAME_RESOLUTION(1)./2 0];
DefaultEnemyStructs(ID_EC_ROTATO).V = [0 ENEMY_CONST(ID_EC_ROTATO).SPEED];
DefaultEnemyStructs(ID_EC_ROTATO).A = [0 0];
DefaultEnemyStructs(ID_EC_ROTATO).MaxHP = ENEMY_CONST(ID_EC_ROTATO).HP;
DefaultEnemyStructs(ID_EC_ROTATO).CurHP = ENEMY_CONST(ID_EC_ROTATO).HP;
DefaultEnemyStructs(ID_EC_ROTATO).AP = ENEMY_CONST(ID_EC_ROTATO).AP;
DefaultEnemyStructs(ID_EC_ROTATO).DP = ENEMY_CONST(ID_EC_ROTATO).DP;
DefaultEnemyStructs(ID_EC_ROTATO).OriDefBox = ENEMY_CONST(ID_EC_ROTATO).DEFBOX;
DefaultEnemyStructs(ID_EC_ROTATO).OriAttBox = ENEMY_CONST(ID_EC_ROTATO).ATTBOX;

DefaultEnemyStructs(ID_EC_ROTATO).EffDefBox = ENEMY_CONST(ID_EC_ROTATO).EFFDEFBOX;
DefaultEnemyStructs(ID_EC_ROTATO).EffAttBox = ENEMY_CONST(ID_EC_ROTATO).EFFATTBOX;

DefaultEnemyStructs(ID_EC_ROTATO).CurDefBox = [ENEMY_CONST(ID_EC_ROTATO).DEFBOX 0 ENEMY_CONST(ID_EC_ROTATO).EFFDEFBOX(:)];
DefaultEnemyStructs(ID_EC_ROTATO).CurAttBox = [ENEMY_CONST(ID_EC_ROTATO).ATTBOX 0 ENEMY_CONST(ID_EC_ROTATO).EFFATTBOX(:)];

DefaultEnemyStructs(ID_EC_ROTATO).EndStat = 0;

DefaultEnemyStructs(ID_EC_ROTATO).Type = ENEMY_CONST(ID_EC_ROTATO).TYPE;
DefaultEnemyStructs(ID_EC_ROTATO).ID = ENEMY_CONST(ID_EC_ROTATO).ID;
DefaultEnemyStructs(ID_EC_ROTATO).ExplosionType = ENEMY_CONST(ID_EC_ROTATO).EXPLO_TYPE;

%% 
DefaultEnemyBulletStructs = repmat(emptyEnemyStruct, 1, 3);
%% Enemy Bullet: VERDE
DefaultEnemyBulletStructs(ID_EB_VERDE).Pos = [0 0];
DefaultEnemyBulletStructs(ID_EB_VERDE).V = [0 ENEMY_BULLET_CONST(ID_EB_VERDE).SPEED];
DefaultEnemyBulletStructs(ID_EB_VERDE).A = [0 0];
DefaultEnemyBulletStructs(ID_EB_VERDE).MaxHP = ENEMY_BULLET_CONST(ID_EB_VERDE).HP;
DefaultEnemyBulletStructs(ID_EB_VERDE).CurHP = ENEMY_BULLET_CONST(ID_EB_VERDE).HP;
DefaultEnemyBulletStructs(ID_EB_VERDE).AP = ENEMY_BULLET_CONST(ID_EB_VERDE).AP;
DefaultEnemyBulletStructs(ID_EB_VERDE).DP = ENEMY_BULLET_CONST(ID_EB_VERDE).DP;
DefaultEnemyBulletStructs(ID_EB_VERDE).OriDefBox = ENEMY_BULLET_CONST(ID_EB_VERDE).DEFBOX;
DefaultEnemyBulletStructs(ID_EB_VERDE).OriAttBox = ENEMY_BULLET_CONST(ID_EB_VERDE).ATTBOX;

DefaultEnemyBulletStructs(ID_EB_VERDE).EffDefBox = ENEMY_BULLET_CONST(ID_EB_VERDE).EFFDEFBOX;
DefaultEnemyBulletStructs(ID_EB_VERDE).EffAttBox = ENEMY_BULLET_CONST(ID_EB_VERDE).EFFATTBOX;

DefaultEnemyBulletStructs(ID_EB_VERDE).CurDefBox = [];
DefaultEnemyBulletStructs(ID_EB_VERDE).CurAttBox = [ENEMY_BULLET_CONST(ID_EB_VERDE).ATTBOX 0 ENEMY_BULLET_CONST(ID_EB_VERDE).EFFATTBOX(:)];

DefaultEnemyBulletStructs(ID_EB_VERDE).Type = ENEMY_BULLET_CONST(ID_EB_VERDE).TYPE;
DefaultEnemyBulletStructs(ID_EB_VERDE).ID = ENEMY_BULLET_CONST(ID_EB_VERDE).ID;
DefaultEnemyBulletStructs(ID_EB_VERDE).ExplosionType = ENEMY_BULLET_CONST(ID_EB_VERDE).EXPLO_TYPE;
DefaultEnemyBulletStructs(ID_EB_VERDE).Invulnerable = true;

%% Enemy Bullet: ROSSO
DefaultEnemyBulletStructs(ID_EB_ROSSO).Pos = [0 0];
DefaultEnemyBulletStructs(ID_EB_ROSSO).V = [0 ENEMY_BULLET_CONST(ID_EB_ROSSO).SPEED];
DefaultEnemyBulletStructs(ID_EB_ROSSO).A = [0 0];
DefaultEnemyBulletStructs(ID_EB_ROSSO).MaxHP = ENEMY_BULLET_CONST(ID_EB_ROSSO).HP;
DefaultEnemyBulletStructs(ID_EB_ROSSO).CurHP = ENEMY_BULLET_CONST(ID_EB_ROSSO).HP;
DefaultEnemyBulletStructs(ID_EB_ROSSO).AP = ENEMY_BULLET_CONST(ID_EB_ROSSO).AP;
DefaultEnemyBulletStructs(ID_EB_ROSSO).DP = ENEMY_BULLET_CONST(ID_EB_ROSSO).DP;
DefaultEnemyBulletStructs(ID_EB_ROSSO).OriDefBox = ENEMY_BULLET_CONST(ID_EB_ROSSO).DEFBOX;
DefaultEnemyBulletStructs(ID_EB_ROSSO).OriAttBox = ENEMY_BULLET_CONST(ID_EB_ROSSO).ATTBOX;

DefaultEnemyBulletStructs(ID_EB_ROSSO).EffDefBox = ENEMY_BULLET_CONST(ID_EB_ROSSO).EFFDEFBOX;
DefaultEnemyBulletStructs(ID_EB_ROSSO).EffAttBox = ENEMY_BULLET_CONST(ID_EB_ROSSO).EFFATTBOX;

DefaultEnemyBulletStructs(ID_EB_ROSSO).CurDefBox = [];
DefaultEnemyBulletStructs(ID_EB_ROSSO).CurAttBox = [ENEMY_BULLET_CONST(ID_EB_ROSSO).ATTBOX 0 ENEMY_BULLET_CONST(ID_EB_ROSSO).EFFATTBOX(:)];

DefaultEnemyBulletStructs(ID_EB_ROSSO).Type = ENEMY_BULLET_CONST(ID_EB_ROSSO).TYPE;
DefaultEnemyBulletStructs(ID_EB_ROSSO).ID = ENEMY_BULLET_CONST(ID_EB_ROSSO).ID;
DefaultEnemyBulletStructs(ID_EB_ROSSO).ExplosionType = ENEMY_BULLET_CONST(ID_EB_ROSSO).EXPLO_TYPE;
DefaultEnemyBulletStructs(ID_EB_ROSSO).Invulnerable = true;

%% Power-up: Bullet Up One Level
DefaultEnemyBulletStructs(ID_EB_POWER_ONEUP).Pos = [0 0];
DefaultEnemyBulletStructs(ID_EB_POWER_ONEUP).V = ENEMY_BULLET_CONST(ID_EB_POWER_ONEUP).SPEED;
DefaultEnemyBulletStructs(ID_EB_POWER_ONEUP).A = [0 0];
DefaultEnemyBulletStructs(ID_EB_POWER_ONEUP).MaxHP = ENEMY_BULLET_CONST(ID_EB_POWER_ONEUP).HP;
DefaultEnemyBulletStructs(ID_EB_POWER_ONEUP).CurHP = ENEMY_BULLET_CONST(ID_EB_POWER_ONEUP).HP;
DefaultEnemyBulletStructs(ID_EB_POWER_ONEUP).AP = ENEMY_BULLET_CONST(ID_EB_POWER_ONEUP).AP;
DefaultEnemyBulletStructs(ID_EB_POWER_ONEUP).DP = ENEMY_BULLET_CONST(ID_EB_POWER_ONEUP).DP;
DefaultEnemyBulletStructs(ID_EB_POWER_ONEUP).OriDefBox = ENEMY_BULLET_CONST(ID_EB_POWER_ONEUP).DEFBOX;
DefaultEnemyBulletStructs(ID_EB_POWER_ONEUP).OriAttBox = ENEMY_BULLET_CONST(ID_EB_POWER_ONEUP).ATTBOX;

DefaultEnemyBulletStructs(ID_EB_POWER_ONEUP).EffDefBox = ENEMY_BULLET_CONST(ID_EB_POWER_ONEUP).EFFDEFBOX;
DefaultEnemyBulletStructs(ID_EB_POWER_ONEUP).EffAttBox = ENEMY_BULLET_CONST(ID_EB_POWER_ONEUP).EFFATTBOX;

DefaultEnemyBulletStructs(ID_EB_POWER_ONEUP).CurDefBox = [];
DefaultEnemyBulletStructs(ID_EB_POWER_ONEUP).CurAttBox = [ENEMY_BULLET_CONST(ID_EB_POWER_ONEUP).ATTBOX 0 ENEMY_BULLET_CONST(ID_EB_POWER_ONEUP).EFFATTBOX(:)];

DefaultEnemyBulletStructs(ID_EB_POWER_ONEUP).Type = ENEMY_BULLET_CONST(ID_EB_POWER_ONEUP).TYPE;
DefaultEnemyBulletStructs(ID_EB_POWER_ONEUP).ID = ENEMY_BULLET_CONST(ID_EB_POWER_ONEUP).ID;
DefaultEnemyBulletStructs(ID_EB_POWER_ONEUP).ExplosionType = ENEMY_BULLET_CONST(ID_EB_POWER_ONEUP).EXPLO_TYPE;
DefaultEnemyBulletStructs(ID_EB_POWER_ONEUP).Invulnerable = true;


% 
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
%% Neutral Objects
DefaultNeutralObjectStructs= repmat(emptyNeutralObjectStruct, 1, 4);


DefaultNeutralObjectStructs(ID_CHN_TITLE).Pos = OBJ_GENERIC_CONST(ID_CHN_TITLE).POS;
DefaultNeutralObjectStructs(ID_CHN_TITLE).LifeTime = OBJ_GENERIC_CONST(ID_CHN_TITLE).LIFE_TIME;
DefaultNeutralObjectStructs(ID_CHN_TITLE).FadeInOutTime = OBJ_GENERIC_CONST(ID_CHN_TITLE).FADE_IN_OUT_TIME;
DefaultNeutralObjectStructs(ID_CHN_TITLE).Type = OBJ_GENERIC_CONST(ID_CHN_TITLE).TYPE;
DefaultNeutralObjectStructs(ID_CHN_TITLE).ID = OBJ_GENERIC_CONST(ID_CHN_TITLE).ID;
DefaultNeutralObjectStructs(ID_CHN_TITLE).V = OBJ_GENERIC_CONST(ID_CHN_TITLE).SPEED;
DefaultNeutralObjectStructs(ID_CHN_TITLE).IsGeneric = true;
DefaultNeutralObjectStructs(ID_CHN_TITLE).ResizeFactor = 1/2;
DefaultNeutralObjectStructs(ID_CHN_TITLE).AnimChangeFlag = true;
% DefaultNeutralObjectStructs(ID_CHN_TITLE).BeingBorn
DefaultNeutralObjectStructs(ID_NEUTRAL_MOTTO_STAGE1).Pos = OBJ_GENERIC_CONST(ID_NEUTRAL_MOTTO_STAGE1).POS;
DefaultNeutralObjectStructs(ID_NEUTRAL_MOTTO_STAGE1).LifeTime = OBJ_GENERIC_CONST(ID_NEUTRAL_MOTTO_STAGE1).LIFE_TIME;
DefaultNeutralObjectStructs(ID_NEUTRAL_MOTTO_STAGE1).FadeInOutTime = OBJ_GENERIC_CONST(ID_NEUTRAL_MOTTO_STAGE1).FADE_IN_OUT_TIME;
DefaultNeutralObjectStructs(ID_NEUTRAL_MOTTO_STAGE1).Type = OBJ_GENERIC_CONST(ID_NEUTRAL_MOTTO_STAGE1).TYPE;
DefaultNeutralObjectStructs(ID_NEUTRAL_MOTTO_STAGE1).ID = OBJ_GENERIC_CONST(ID_NEUTRAL_MOTTO_STAGE1).ID;
DefaultNeutralObjectStructs(ID_NEUTRAL_MOTTO_STAGE1).V = OBJ_GENERIC_CONST(ID_NEUTRAL_MOTTO_STAGE1).SPEED;
DefaultNeutralObjectStructs(ID_NEUTRAL_MOTTO_STAGE1).IsGeneric = true;
DefaultNeutralObjectStructs(ID_NEUTRAL_MOTTO_STAGE1).ResizeFactor = 1/3;
DefaultNeutralObjectStructs(ID_NEUTRAL_MOTTO_STAGE1).AnimChangeFlag = true;

%% Neutral Texts
DefaultNeutralObjectStructs(ID_TEXT_PROLOGUE).Pos = OBJ_GENERIC_CONST(ID_TEXT_PROLOGUE).POS;
DefaultNeutralObjectStructs(ID_TEXT_PROLOGUE).LifeTime = OBJ_GENERIC_CONST(ID_TEXT_PROLOGUE).LIFE_TIME;
DefaultNeutralObjectStructs(ID_TEXT_PROLOGUE).FadeInOutTime = OBJ_GENERIC_CONST(ID_TEXT_PROLOGUE).FADE_IN_OUT_TIME;
DefaultNeutralObjectStructs(ID_TEXT_PROLOGUE).Type = OBJ_GENERIC_CONST(ID_TEXT_PROLOGUE).TYPE;
DefaultNeutralObjectStructs(ID_TEXT_PROLOGUE).ID = OBJ_GENERIC_CONST(ID_TEXT_PROLOGUE).ID;
DefaultNeutralObjectStructs(ID_TEXT_PROLOGUE).V = OBJ_GENERIC_CONST(ID_TEXT_PROLOGUE).SPEED;
DefaultNeutralObjectStructs(ID_TEXT_PROLOGUE).IsGeneric = true;
DefaultNeutralObjectStructs(ID_TEXT_PROLOGUE).ResizeFactor = 1;
DefaultNeutralObjectStructs(ID_TEXT_PROLOGUE).AnimChangeFlag = true;
DefaultNeutralObjectStructs(ID_TEXT_PROLOGUE).Color = [1 1 1];

DefaultNeutralObjectStructs(ID_TEXT_PROLOGUE_BLINK).Pos = OBJ_GENERIC_CONST(ID_TEXT_PROLOGUE_BLINK).POS;
DefaultNeutralObjectStructs(ID_TEXT_PROLOGUE_BLINK).LifeTime = OBJ_GENERIC_CONST(ID_TEXT_PROLOGUE_BLINK).LIFE_TIME;
DefaultNeutralObjectStructs(ID_TEXT_PROLOGUE_BLINK).FadeInOutTime = OBJ_GENERIC_CONST(ID_TEXT_PROLOGUE_BLINK).FADE_IN_OUT_TIME;
DefaultNeutralObjectStructs(ID_TEXT_PROLOGUE_BLINK).Type = OBJ_GENERIC_CONST(ID_TEXT_PROLOGUE_BLINK).TYPE;
DefaultNeutralObjectStructs(ID_TEXT_PROLOGUE_BLINK).ID = OBJ_GENERIC_CONST(ID_TEXT_PROLOGUE_BLINK).ID;
DefaultNeutralObjectStructs(ID_TEXT_PROLOGUE_BLINK).V = OBJ_GENERIC_CONST(ID_TEXT_PROLOGUE_BLINK).SPEED;
DefaultNeutralObjectStructs(ID_TEXT_PROLOGUE_BLINK).IsGeneric = true;
DefaultNeutralObjectStructs(ID_TEXT_PROLOGUE_BLINK).ResizeFactor = 1;
DefaultNeutralObjectStructs(ID_TEXT_PROLOGUE_BLINK).AnimChangeFlag = true;
DefaultNeutralObjectStructs(ID_TEXT_PROLOGUE_BLINK).Color = [1 1 1];
DefaultNeutralObjectStructs(ID_TEXT_PROLOGUE_BLINK).Blink = true;
DefaultNeutralObjectStructs(ID_TEXT_PROLOGUE_BLINK).BlinkOnOffPeriod = OBJ_GENERIC_CONST(ID_TEXT_PROLOGUE_BLINK).BLINK_ONOFF_PERIOD;
