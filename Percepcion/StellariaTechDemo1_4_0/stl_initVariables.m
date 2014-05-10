function stl_initVariables()
%% STL_INITVARIABLES - Init the global variables (初始化全局变量)
%
%% USAGE 用法:
% ------
% stl_initVariables
% 
%% Input 输入参数：
% ------
% None
%

%% Output 输出参数:
% -------
% NONE
% 
%% Dependencies 依赖关系:
% -------
% -- Global Variables Created:
%       see the Global Variables Declaration Section:
% -- Global Variables Used:
%       ditto
% -- Global Variables Modifed:
%       ditto
% -- Functions Used:
%       none
%
%% Created by Mingjing Zhang, Stellari Studio, 2011.

%% Update History
%
%  Date                     Updater                 Modifications Made
% --------------            -----------------       --------------------
%  Mar 13, 2011             M. Zhang                wrote it
% --------------            -----------------       --------------------

%% --------------------Code Starts Here -------------------------

%% Declare the Global Variables
% Global Constants
global GAME_RESOLUTION 
global PLAYER_CONST;
global ENEMY_CONST;
global ENEMY_BULLET_CONST;
global OBJ_GENERIC_CONST
global FPS
global FRAME_DURATION
global GAME_PATH

global PLAYER_ANIM
global PLAYER_SFX

global MAX_FRAME_SKIP
global PLAYER_BULLET_ANIM
global EXPLO_ANIM
global ENEMY_ANIM
global ENEMY_BULLET_ANIM
global OBJ_GENERIC_ANIM

% Global Variables
global CurrentFrameNo
global allowEnemyEntrance

% Global Image Queues
global queueGlobalImageHandles          % The Global Image Object Queue
global numAvailGlobalImageHandles       % The number of unused image objects
global availGlobalImageHandles          % The indices of unused image objects

global queueNeutralImageHandles          % The Global Image Object Queue
global numAvailNeutralImageHandles       % The number of unused image objects
global availNeutralImageHandles          % The indices of unused image objects

global queueGlobalTextHandles
global numAvailGlobalTextHandles
global availGlobalTextHandles

% Global Player Queues
global queueGlobalPlayers
global DefaultGlobalPlayers
global MAX_NUM_PLAYER_OBJ
global MAX_NUM_FRIENDLYFIRE_OBJ
global MAX_NUM_ENEMY_OBJ
global MAX_NUM_IMAGE_OBJ
global MAX_NUM_NEUTRAL_OBJ
global MAX_NUM_TEXT_OBJ

% Global Enemey Queues
global emptyEnemyStruct     % an enemy struct whose fields contain empty arrays.
                            % Used to reset destroyed enemies
global emptyNeutralObjectStruct
% global enemyStructFields    % The field names for the enemy struct
global queueGlobalEnemies   % The Global Enemy Queue
global availGlobalEnemies   % The indices of unused enemy queue elements
global numAvailGlobalEnemies    % The number of unused enemie queue elements
global usedGlobalEnemies

global queueImpromptuEnemies
global numImpromptuEnemies

%
global queueGlobalFriendlyFire
global availGlobalFriendlyFire
global numAvailGlobalFriendlyFire
global usedGlobalFriendlyFire
global indexGlobalBomb

global queueNeutralObjects
global availNeutralObjects
global numAvailNeutralObjects
global usedNeutralObjects

% global Enemy Bounding Boxes
global queueGlobalEnemyAttBoxes     % The aggressive boxes of all enemies
global queueGlobalEnemyDefBoxes     % The defensive boxes of all enemies
global indGlobalEnemyAttBoxes    % The index of global enemies an attbox represents
global indGlobalEnemyDefBoxes    % The index of global enemies an defbox represents 

global ActivePlayers
%% Global Constants
% Main Figure and Axes
global MainFigureHdl;
global MainAxesHdl;
global TextAxesHdl

global MainFigureSize;
global MainAxesSize;
global TextAxesSizeFactor
global MainFigureInitPos;
global MainAxesInitPos;

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

%% Enemy Types and IDS
global TYPE_ENEMY_CRAFT
global ID_EC_STACCATO
global ID_EC_LEGATO
global ID_EC_FORTEPIANO
global ID_EC_FORTEPIANO_WRECKAGE
global ID_EC_RONDO
global ID_EC_ROTATO

global TYPE_ENEMY_BULLET
global ID_EB_VERDE
global ID_EB_ROSSO
global ID_EB_POWER_ONEUP

global TYPE_PLAYER_BULLET
global ID_PB_FIRE
global ID_PB_BOMB

global TYPE_NEUTRAL_TEXT
global TYPE_NEUTRAL_PICT
global ID_CHN_TITLE
global ID_NEUTRAL_MOTTO_STAGE1
global ID_TEXT_PROLOGUE
global ID_TEXT_PROLOGUE_BLINK
global ID_1UP_
global ID_2UP

global sinTable;
global cosTable;
global rotTable;

global AxesResizeFactor
%% Define the Types and IDS
TYPE_ENEMY_CRAFT = 10;
ID_EC_STACCATO = 1;
ID_EC_LEGATO = 2;
ID_EC_FORTEPIANO = 3;
ID_EC_FORTEPIANO_WRECKAGE = 4;
ID_EC_RONDO = 5;
ID_EC_ROTATO = 6;
ID_EC_BRAVURA = 7;
ID_EC_BRAVURA_WRECKAGE = 8;

TYPE_ENEMY_BULLET = 11;
ID_EB_VERDE = 1;
ID_EB_ROSSO = 2;
ID_EB_POWER_ONEUP = 3;

TYPE_PLAYER_BULLET = 5;
ID_PB_FIRE = 1;
ID_PB_BOMB = 2;


TYPE_NEUTRAL_TEXT = 12;
TYPE_NEUTRAL_PICT = 13;
ID_CHN_TITLE = 1;
ID_NEUTRAL_MOTTO_STAGE1 = 2;
ID_TEXT_PROLOGUE = 3;
ID_TEXT_PROLOGUE_BLINK = 4;

global SPECIAL_FLAG

SPECIAL_FLAG.BOMB_EXIST = [false false];
SPECIAL_FLAG.HIDE_PLAYER = [false false];
SPECIAL_FLAG.IS_GAME_PAUSED = false;

%% STAGE COLUMNS
global STAGE_COLUMNS
global STAGE_COL_SEC2FRAME_CONV
global STAGE_NEUTRAL_COL_SEC2FRAME_CONV
global STAGE_COLUMNS_TEXT
global STAGE_COLUMNS_PICT

STAGE_COLUMNS = {'TIME2APPEAR','Type','ID','Pos','V','A', 'CurAnimFrame', 'CurAnimStat', 'CurObjStat', 'InitStat', 'EndStat', 'PowerUp'};

STAGE_COL_SEC2FRAME_CONV = [1, 0, 0, 0, -1, -1, 0, 0, 0, 0, 0, 0, 0];
STAGE_NEUTRAL_COL_SEC2FRAME_CONV = [1, 0, 0, 0, -1, -1, 0, 0, 0, 0, 1, 1, 0];

STAGE_COLUMNS_TEXT = {'TIME2APPEAR','Type','ID','Pos','V','A', 'Text', 'TextFont', 'TextSize', 'Color','FadeInOutTime', 'LifeTime', 'DestPos'};
STAGE_COLUMNS_PICT = {'TIME2APPEAR','Type','ID','Pos','V','A', 'CurAnimFrame', 'CurAnimStat', 'CurObjStat', 'InitStat', 'FadeInOutTime', 'LifeTime', 'DestPos'};
%% Miscellaneous
allowEnemyEntrance = true;

%% Star Scroll
global StarNum;         % The density of stars, in numbers/square pixel
global StarSpeed;           % The speed of stars, 1x2 array, in pixels/sec
global StarPosition;        % The positions of stars, 1x2 array
global StarSize;
global StarColor;
global starPlotHdl;
global StarX;
global StarY;

global StarNum2;         % The density of stars, in numbers/square pixel
global StarSpeed2;           % The speed of stars, 1x2 array, in pixels/sec
global StarPosition2;        % The positions of stars, 1x2 array
global StarSize2;
global StarColor2;
global starPlotHdl2;
global StarX2;
global StarY2;


global starScrollTimer; 
%% Define the Global Constants that are accessible by other functions,
%% but they should not be changed:
MainAxesSize = [300 320];   % Normalized Canvas Size;
GAME_RESOLUTION = MainAxesSize;  % GAME_RESOLUTION is an alias of MainAxesSize
FPS = 20;
FRAME_DURATION = 1./FPS;
MAX_FRAME_SKIP = 5;
MainFigureSize = MainAxesSize .* 2; % Actual size of the window
MainFigureInitPos = [300 50];
MainAxesInitPos = [0 0];    % Must be lower than [1 1];

%% Define Local Constants that are not supposed to be changed by
%% other functions. 
MAX_NUM_IMAGE_OBJ = 200;
MAX_NUM_ENEMY_OBJ = 150;
MAX_NUM_PLAYER_OBJ = 2;
MAX_NUM_FRIENDLYFIRE_OBJ = 150;
MAX_NUM_NEUTRAL_OBJ = 30;
MAX_NUM_TEXT_OBJ = 20;

PLAYER_CONST.SPEED = 150 .* FRAME_DURATION;   % pix per frame
PLAYER_CONST.HP = 1;
PLAYER_CONST.AP = 1; % AP is the attack point of the Player crafts themselves, not the AP of their bullets
PLAYER_CONST.DP = 0;
PLAYER_CONST.DEFBOX = [-5 -5 5 5];
PLAYER_CONST.ATTBOX = [-5 -5 5 5];
PLAYER_CONST.EFFDEFBOX = ones(size(PLAYER_CONST.DEFBOX,1),1);
PLAYER_CONST.EFFATTBOX = ones(size(PLAYER_CONST.ATTBOX,1),1);
PLAYER_CONST.NEWBORN_INVUL_TIME = round(5 .* FPS);    % The invulnerable time 

PLAYER_CONST.INVUL_TIMER_NO = 1;
PLAYER_CONST.BLINK_INTERVAL = round(0.1 .* FPS);
PLAYER_CONST.BLINK_TIMER_NO = 2;
PLAYER_CONST.RESPAWN_FLYTODEST_TIME = round(1 .* FPS);
PLAYER_CONST.FLYTODEST_TIMER_NO = 3;
PLAYER_CONST.CUR_ANIM_TIMER_NO = 4;
PLAYER_CONST.BULLET_TIMER_NO = 5;
PLAYER_CONST.MISSILE_TIMER_NO = 6;
PLAYER_CONST.BOMB_TIMER_NO = 7;
PLAYER_CONST.EXPLO_ANIM_TIMER_NO = 8;

PLAYER_CONST.BULLET_RELOAD_TIME = round(0.05.*FPS);
PLAYER_CONST.MISSILE_RELOAD_TIME = round(0.25.*FPS);
PLAYER_CONST.BOMB_RELOAD_TIME = round(3.5.*FPS);
PLAYER_CONST.BOMB_LASTING_TIME = round(3.*FPS);

PLAYER_CONST.RESPAWN_DES_Y = GAME_RESOLUTION(2) .* 7/8;
PLAYER_CONST.RESPAWN_INI_X = GAME_RESOLUTION(1) .* 1/3;
PLAYER_CONST.RESPAWN_INI_Y = GAME_RESOLUTION(2);
PLAYER_CONST.STAGECLEAR_DES_Y = GAME_RESOLUTION(2) .* 7/8;
PLAYER_CONST.AVAIL_CANNON = logical(...
    [0 0 0 1 0 0 0;
    0 0 1 0 1 0 0; 
    0 0 1 1 1 0 0; 
    0 1 1 0 1 1 0;
    0 1 1 1 1 1 0]);
%     1 0 1 0 1 0 1; 
%     1 1 1 0 1 1 1; 
%     1 1 1 1 1 1 1]);
% 
% EMPTY_ANIM_STRUCT = struct('AnimSeq', {}, 'AnimDur', {});
% PLAYER_ANIM = repmat(EMPTY_ANIM_STRUCT, 1, MAX_NUM_PLAYER_OBJ);
load PLAYER_ANIM.mat;
% load PLAYER_SFX.mat
for i = 1:numel(PLAYER_ANIM);
    for j = 1:numel(PLAYER_ANIM(i).AnimDur)
        PLAYER_ANIM(i).AnimDur{j} = PLAYER_ANIM(i).AnimDur{j}.*FPS;
    end
end
% PLAYER_ANIM(1).AnimSeq = {{rand(30,30,4), rand(30,30,4)},{rand(30, 30, 4), rand(30, 30, 4)}};
PLAYER_ANIM(1).AnimDur = {round([0.05, 0.05].*FPS), round([0.05 0.05].*FPS)};
% PLAYER_ANIM(1).NumFrame = [2, 2];
% PLAYER_ANIM(2).AnimSeq = {{rand(30,30,4), rand(30,30,4)},{rand(30, 30, 4), rand(30, 30, 4)}};
PLAYER_ANIM(2).AnimDur = {round([0.05, 0.05].*FPS),  round([0.05 0.05].*FPS)};
% PLAYER_ANIM(2).NumFrame = [2, 2];

for i = 1:numel(PLAYER_BULLET_ANIM);
    for j = 1:length(PLAYER_BULLET_ANIM(i).NumFrame)
        PLAYER_BULLET_ANIM(i).AnimDur{j} = min(round(ones(1,PLAYER_BULLET_ANIM(i).NumFrame(j)).*0.05.*FPS), 1);
    end
end

load EXPLO_ANIM.mat;

for i = 1:numel(EXPLO_ANIM)
    EXPLO_ANIM(i).AnimDur = {max(round(ones(1,EXPLO_ANIM(i).NumFrame).*0.05.*FPS), 1)};
end
% 
% 
% PLAYER_BULLET_ANIM(1).AnimSeq = {{rand(16,3,4)}};
% PLAYER_BULLET_ANIM(1).AnimDur = {0};
% PLAYER_BULLET_ANIM(1).NumFrame = [1];

PLAYER_CONST.BULLET_INI_X = linspace(-size(PLAYER_ANIM(1).AnimSeq{1}{1}, 2)./2, ...
    size(PLAYER_ANIM(1).AnimSeq{1}{1}, 2)./2, size(PLAYER_CONST.AVAIL_CANNON, 2));

PLAYER_CONST.BULLET_INI_Y = 0;
PLAYER_CONST.BULLET_V = round([-300].*FRAME_DURATION);

PLAYER_CONST.BULLET_DEFBOX = [0 0 0 0];
PLAYER_CONST.BULLET_ATTBOX = [-1 -8 1 8];
PLAYER_CONST.BULLET_EFFDEFBOX = [1];
PLAYER_CONST.BULLET_EFFATTBOX = [1];
PLAYER_CONST.BULLET_EXPLO_TYPE = 2;

load ENEMY_ANIM.mat
for i = 1:numel(ENEMY_ANIM);
    for j = 1:length(ENEMY_ANIM(i).NumFrame)
        ENEMY_ANIM(i).AnimDur{j} = max(round(ones(1,ENEMY_ANIM(i).NumFrame(j)).*0.05.*FPS), 1);
    end
end

load ENEMY_BULLET_ANIM.mat
for i = 1:numel(ENEMY_BULLET_ANIM);
    for j = 1:length(ENEMY_BULLET_ANIM(i).NumFrame)
        ENEMY_BULLET_ANIM(i).AnimDur{j} = max(round(ones(1,ENEMY_BULLET_ANIM(i).NumFrame(j)).*0.05.*FPS), 2);
    end
end

load OBJ_GENERIC_ANIM.mat

ENEMY_CONST(ID_EC_STACCATO).SPEED = 100 .* FRAME_DURATION;
ENEMY_CONST(ID_EC_STACCATO).HP = 8;
ENEMY_CONST(ID_EC_STACCATO).AP = 1;
ENEMY_CONST(ID_EC_STACCATO).DP = 0;
ENEMY_CONST(ID_EC_STACCATO).DEFBOX = [-15 -15 15 15];
ENEMY_CONST(ID_EC_STACCATO).ATTBOX = [-10 -10 10 10];
ENEMY_CONST(ID_EC_STACCATO).EFFDEFBOX = ones(size(ENEMY_CONST(ID_EC_STACCATO).DEFBOX,1),1);
ENEMY_CONST(ID_EC_STACCATO).EFFATTBOX = ones(size(ENEMY_CONST(ID_EC_STACCATO).ATTBOX,1),1);
ENEMY_CONST(ID_EC_STACCATO).NEWBORN_INVUL_TIME = 0;    % The invulnerable time 
ENEMY_CONST(ID_EC_STACCATO).TYPE = TYPE_ENEMY_CRAFT;    % 10 is for Enemy Crafts
ENEMY_CONST(ID_EC_STACCATO).ID = ID_EC_STACCATO;       % STACCATO is the first type of enemy

ENEMY_CONST(ID_EC_STACCATO).TIMER.CUR_ANIM_NO = 4;
ENEMY_CONST(ID_EC_STACCATO).TIMER.EXPLO_ANIM_NO = 8;
ENEMY_CONST(ID_EC_STACCATO).EXPLO_TYPE = 3;


ENEMY_CONST(ID_EC_LEGATO).SPEED = 50 .* FRAME_DURATION;
ENEMY_CONST(ID_EC_LEGATO).HSPEED = 40 .* FRAME_DURATION;
ENEMY_CONST(ID_EC_LEGATO).HP = 12;
ENEMY_CONST(ID_EC_LEGATO).AP = 1;
ENEMY_CONST(ID_EC_LEGATO).DP = 0;
ENEMY_CONST(ID_EC_LEGATO).DEFBOX = [-10 -6 10 6];
ENEMY_CONST(ID_EC_LEGATO).ATTBOX = [-10 -6 10 6];
ENEMY_CONST(ID_EC_LEGATO).EFFDEFBOX = ones(size(ENEMY_CONST(ID_EC_LEGATO).DEFBOX,1),1);
ENEMY_CONST(ID_EC_LEGATO).EFFATTBOX = ones(size(ENEMY_CONST(ID_EC_LEGATO).ATTBOX,1),1);
ENEMY_CONST(ID_EC_LEGATO).NEWBORN_INVUL_TIME = 0;    % The invulnerable time 
ENEMY_CONST(ID_EC_LEGATO).TYPE = TYPE_ENEMY_CRAFT;    % 10 is for Enemy Crafts
ENEMY_CONST(ID_EC_LEGATO).ID = ID_EC_LEGATO;       % STACCATO is the first type of enemy

ENEMY_CONST(ID_EC_LEGATO).TIMER.CUR_ANIM_NO = 4;
ENEMY_CONST(ID_EC_LEGATO).TIMER.EXPLO_ANIM_NO = 8;
ENEMY_CONST(ID_EC_LEGATO).EXPLO_TYPE = 3;

ENEMY_CONST(ID_EC_FORTEPIANO).SPEED = 50 .* FRAME_DURATION;
ENEMY_CONST(ID_EC_FORTEPIANO).HP = 100;
ENEMY_CONST(ID_EC_FORTEPIANO).AP = 1;
ENEMY_CONST(ID_EC_FORTEPIANO).DP = 0;
ENEMY_CONST(ID_EC_FORTEPIANO).DEFBOX = [-19 -20 19 24
                                    -32 -6 -18 14
                                    +18 -6 +32 14];
ENEMY_CONST(ID_EC_FORTEPIANO).ATTBOX = [-19 -20 19 24];

ENEMY_CONST(ID_EC_FORTEPIANO).EFFDEFBOX = ones(size(ENEMY_CONST(ID_EC_FORTEPIANO).DEFBOX,1),1);
ENEMY_CONST(ID_EC_FORTEPIANO).EFFATTBOX = ones(size(ENEMY_CONST(ID_EC_FORTEPIANO).ATTBOX,1),1);
ENEMY_CONST(ID_EC_FORTEPIANO).NEWBORN_INVUL_TIME = 0;    % The invulnerable time 
ENEMY_CONST(ID_EC_FORTEPIANO).TYPE = TYPE_ENEMY_CRAFT;    % 10 is for Enemy Crafts
ENEMY_CONST(ID_EC_FORTEPIANO).ID = ID_EC_FORTEPIANO;       % STACCATO is the first type of enemy

ENEMY_CONST(ID_EC_FORTEPIANO).TIMER.CUR_ANIM_NO = 4;
ENEMY_CONST(ID_EC_FORTEPIANO).TIMER.EXPLO_ANIM_NO = 8;
ENEMY_CONST(ID_EC_FORTEPIANO).EXPLO_TYPE = 6;
ENEMY_CONST(ID_EC_FORTEPIANO).WAYPOINTS = [-GAME_RESOLUTION(1)./4 0;
                                           -GAME_RESOLUTION(1)./4 GAME_RESOLUTION(2)./5;
                                           -GAME_RESOLUTION(1)./4 0;
                                           0 0;
                                           GAME_RESOLUTION(1)./4 0;
                                           0 0];
ENEMY_CONST(ID_EC_FORTEPIANO).FINAL_COUNTDOWN.V = [-10 -30].*FRAME_DURATION;
ENEMY_CONST(ID_EC_FORTEPIANO).FINAL_COUNTDOWN.A = [-1 -3].*FRAME_DURATION;
ENEMY_CONST(ID_EC_FORTEPIANO).FINAL_COUNTDOWN.T = 2.*FPS;

ENEMY_CONST(ID_EC_FORTEPIANO_WRECKAGE).SPEED = [-10 -18].*FRAME_DURATION;
ENEMY_CONST(ID_EC_FORTEPIANO_WRECKAGE).A = [0.2 0.2].*FRAME_DURATION;
ENEMY_CONST(ID_EC_FORTEPIANO_WRECKAGE).HP = Inf;
ENEMY_CONST(ID_EC_FORTEPIANO_WRECKAGE).AP = 0;
ENEMY_CONST(ID_EC_FORTEPIANO_WRECKAGE).DP = 0;
ENEMY_CONST(ID_EC_FORTEPIANO_WRECKAGE).DEFBOX = [];
ENEMY_CONST(ID_EC_FORTEPIANO_WRECKAGE).ATTBOX = [];

ENEMY_CONST(ID_EC_FORTEPIANO_WRECKAGE).EFFDEFBOX = ones(size(ENEMY_CONST(ID_EC_FORTEPIANO).DEFBOX,1),1);
ENEMY_CONST(ID_EC_FORTEPIANO_WRECKAGE).EFFATTBOX = ones(size(ENEMY_CONST(ID_EC_FORTEPIANO).ATTBOX,1),1);
ENEMY_CONST(ID_EC_FORTEPIANO_WRECKAGE).NEWBORN_INVUL_TIME = 0;    % The invulnerable time 
ENEMY_CONST(ID_EC_FORTEPIANO_WRECKAGE).TYPE = TYPE_ENEMY_CRAFT;    % 10 is for Enemy Crafts
ENEMY_CONST(ID_EC_FORTEPIANO_WRECKAGE).ID = ID_EC_FORTEPIANO_WRECKAGE;       % STACCATO is the first type of enemy

ENEMY_CONST(ID_EC_FORTEPIANO_WRECKAGE).TIMER.CUR_ANIM_NO = 4;
ENEMY_CONST(ID_EC_FORTEPIANO_WRECKAGE).TIMER.EXPLO_ANIM_NO = 8;
ENEMY_CONST(ID_EC_FORTEPIANO_WRECKAGE).EXPLO_TYPE = 3;
% ENEMY_CONST(ID_EC_FORTEPIANO_WRECKAGE).WAYPOINTS = [-GAME_RESOLUTION(1)./4 0;
%                                            -GAME_RESOLUTION(1)./4 GAME_RESOLUTION(2)./5;
%                                            -GAME_RESOLUTION(1)./4 0;
%                                            0 0;
%                                            GAME_RESOLUTION(1)./4 0;
%                                            0 0];
ENEMY_CONST(ID_EC_FORTEPIANO_WRECKAGE).FINAL_COUNTDOWN.T = 1.*FPS;

ENEMY_CONST(ID_EC_RONDO).SPEED = 50 .* FRAME_DURATION;
ENEMY_CONST(ID_EC_RONDO).HP = 6;
ENEMY_CONST(ID_EC_RONDO).AP = 1;
ENEMY_CONST(ID_EC_RONDO).DP = 0;
ENEMY_CONST(ID_EC_RONDO).DEFBOX = [-10 -10 10 10];
ENEMY_CONST(ID_EC_RONDO).ATTBOX = [-7 -10 7 10];

ENEMY_CONST(ID_EC_RONDO).EFFDEFBOX = ones(size(ENEMY_CONST(ID_EC_RONDO).DEFBOX,1),1);
ENEMY_CONST(ID_EC_RONDO).EFFATTBOX = ones(size(ENEMY_CONST(ID_EC_RONDO).ATTBOX,1),1);
ENEMY_CONST(ID_EC_RONDO).NEWBORN_INVUL_TIME = 0;    % The invulnerable time 
ENEMY_CONST(ID_EC_RONDO).TYPE = TYPE_ENEMY_CRAFT;    % 10 is for Enemy Crafts
ENEMY_CONST(ID_EC_RONDO).ID = ID_EC_RONDO;       % STACCATO is the first type of enemy

ENEMY_CONST(ID_EC_RONDO).TIMER.CUR_ANIM_NO = 4;
ENEMY_CONST(ID_EC_RONDO).TIMER.EXPLO_ANIM_NO = 8;
ENEMY_CONST(ID_EC_RONDO).EXPLO_TYPE = 3;
ENEMY_CONST(ID_EC_RONDO).WAYPOINTS = [-GAME_RESOLUTION(1)./4 0;
                                           -GAME_RESOLUTION(1)./4 GAME_RESOLUTION(2)./5;
                                           -GAME_RESOLUTION(1)./4 0;
                                           0 0;
                                           GAME_RESOLUTION(1)./4 0;
                                           0 0];
                                       

ENEMY_CONST(ID_EC_ROTATO).SPEED = 50 .* FRAME_DURATION;
ENEMY_CONST(ID_EC_ROTATO).HSPEED = GAME_RESOLUTION(1).*4/5 .* FRAME_DURATION;
ENEMY_CONST(ID_EC_ROTATO).A = 4 .* FRAME_DURATION;
ENEMY_CONST(ID_EC_ROTATO).HP = 8;
ENEMY_CONST(ID_EC_ROTATO).AP = 1;
ENEMY_CONST(ID_EC_ROTATO).DP = 0;
ENEMY_CONST(ID_EC_ROTATO).DEFBOX = [-10 -10 10 10];
ENEMY_CONST(ID_EC_ROTATO).ATTBOX = [-7 -7 7 7];
ENEMY_CONST(ID_EC_ROTATO).EFFDEFBOX = ones(size(ENEMY_CONST(ID_EC_ROTATO).DEFBOX,1),1);
ENEMY_CONST(ID_EC_ROTATO).EFFATTBOX = ones(size(ENEMY_CONST(ID_EC_ROTATO).ATTBOX,1),1);
ENEMY_CONST(ID_EC_ROTATO).NEWBORN_INVUL_TIME = 0;    % The invulnerable time 
ENEMY_CONST(ID_EC_ROTATO).TYPE = TYPE_ENEMY_CRAFT;    % 10 is for Enemy Crafts
ENEMY_CONST(ID_EC_ROTATO).ID = ID_EC_ROTATO;       % STACCATO is the first type of enemy

ENEMY_CONST(ID_EC_ROTATO).TIMER.CUR_ANIM_NO = 4;
ENEMY_CONST(ID_EC_ROTATO).TIMER.EXPLO_ANIM_NO = 8;
ENEMY_CONST(ID_EC_ROTATO).EXPLO_TYPE = 3;

% BRAVURA is currently not implemented
ENEMY_CONST(ID_EC_BRAVURA).SPEED = 50 .* FRAME_DURATION;
ENEMY_CONST(ID_EC_BRAVURA).HP = 600;
ENEMY_CONST(ID_EC_BRAVURA).AP = 1;
ENEMY_CONST(ID_EC_BRAVURA).DP = 0;
ENEMY_CONST(ID_EC_BRAVURA).DEFBOX = [-10 -10 10 10];
ENEMY_CONST(ID_EC_BRAVURA).ATTBOX = [-7 -10 7 10];

ENEMY_CONST(ID_EC_BRAVURA).EFFDEFBOX = ones(size(ENEMY_CONST(ID_EC_RONDO).DEFBOX,1),1);
ENEMY_CONST(ID_EC_BRAVURA).EFFATTBOX = ones(size(ENEMY_CONST(ID_EC_RONDO).ATTBOX,1),1);
ENEMY_CONST(ID_EC_BRAVURA).NEWBORN_INVUL_TIME = 0;    % The invulnerable time 
ENEMY_CONST(ID_EC_BRAVURA).TYPE = TYPE_ENEMY_CRAFT;    % 10 is for Enemy Crafts
ENEMY_CONST(ID_EC_BRAVURA).ID = ID_EC_BRAVURA;       % STACCATO is the first type of enemy

ENEMY_CONST(ID_EC_BRAVURA).TIMER.CUR_ANIM_NO = 4;
ENEMY_CONST(ID_EC_BRAVURA).TIMER.EXPLO_ANIM_NO = 8;
ENEMY_CONST(ID_EC_BRAVURA).EXPLO_TYPE = 3;
ENEMY_CONST(ID_EC_BRAVURA).WAYPOINTS = [-GAME_RESOLUTION(1)./4 0;
                                           -GAME_RESOLUTION(1)./4 GAME_RESOLUTION(2)./5;
                                           -GAME_RESOLUTION(1)./4 0;
                                           0 0;
                                           GAME_RESOLUTION(1)./4 0;
                                           0 0];
                                       
%% ENEMY BULLETS
ENEMY_BULLET_CONST(ID_EB_VERDE).SPEED = 100 .* FRAME_DURATION;
ENEMY_BULLET_CONST(ID_EB_VERDE).HP = 1;
ENEMY_BULLET_CONST(ID_EB_VERDE).AP = 1;
ENEMY_BULLET_CONST(ID_EB_VERDE).DP = 0;
ENEMY_BULLET_CONST(ID_EB_VERDE).DEFBOX = [-2 -2 2 2];
ENEMY_BULLET_CONST(ID_EB_VERDE).ATTBOX = [-2 -2 2 2];
ENEMY_BULLET_CONST(ID_EB_VERDE).EFFDEFBOX = ones(size(ENEMY_BULLET_CONST(ID_EB_VERDE).DEFBOX,1),1);
ENEMY_BULLET_CONST(ID_EB_VERDE).EFFATTBOX = ones(size(ENEMY_BULLET_CONST(ID_EB_VERDE).ATTBOX,1),1);
ENEMY_BULLET_CONST(ID_EB_VERDE).NEWBORN_INVUL_TIME = 0;    % The invulnerable time 
ENEMY_BULLET_CONST(ID_EB_VERDE).TYPE = TYPE_ENEMY_BULLET;    % 10 is for Enemy Crafts
ENEMY_BULLET_CONST(ID_EB_VERDE).ID = ID_EB_VERDE;       % STACCATO is the first type of enemy

ENEMY_BULLET_CONST(ID_EB_VERDE).TIMER.CUR_ANIM_NO = 4;
ENEMY_BULLET_CONST(ID_EB_VERDE).TIMER.EXPLO_ANIM_NO = 8;
ENEMY_BULLET_CONST(ID_EB_VERDE).EXPLO_TYPE = 4;


ENEMY_BULLET_CONST(ID_EB_ROSSO).SPEED = 100 .* FRAME_DURATION;
ENEMY_BULLET_CONST(ID_EB_ROSSO).HP = 1;
ENEMY_BULLET_CONST(ID_EB_ROSSO).AP = 1;
ENEMY_BULLET_CONST(ID_EB_ROSSO).DP = 0;
ENEMY_BULLET_CONST(ID_EB_ROSSO).DEFBOX = [-2 -2 2 2];
ENEMY_BULLET_CONST(ID_EB_ROSSO).ATTBOX = [-2 -2 2 2];
ENEMY_BULLET_CONST(ID_EB_ROSSO).EFFDEFBOX = ones(size(ENEMY_BULLET_CONST(ID_EB_VERDE).DEFBOX,1),1);
ENEMY_BULLET_CONST(ID_EB_ROSSO).EFFATTBOX = ones(size(ENEMY_BULLET_CONST(ID_EB_VERDE).ATTBOX,1),1);
ENEMY_BULLET_CONST(ID_EB_ROSSO).NEWBORN_INVUL_TIME = 0;    % The invulnerable time 
ENEMY_BULLET_CONST(ID_EB_ROSSO).TYPE = TYPE_ENEMY_BULLET;    % 10 is for Enemy Crafts
ENEMY_BULLET_CONST(ID_EB_ROSSO).ID = ID_EB_ROSSO;       

ENEMY_BULLET_CONST(ID_EB_ROSSO).TIMER.CUR_ANIM_NO = 4;
ENEMY_BULLET_CONST(ID_EB_ROSSO).TIMER.EXPLO_ANIM_NO = 8;
ENEMY_BULLET_CONST(ID_EB_ROSSO).EXPLO_TYPE = 5;

ENEMY_BULLET_CONST(ID_EB_POWER_ONEUP).SPEED = [75 75] .* FRAME_DURATION;
ENEMY_BULLET_CONST(ID_EB_POWER_ONEUP).HP = 1;
ENEMY_BULLET_CONST(ID_EB_POWER_ONEUP).AP = 1;
ENEMY_BULLET_CONST(ID_EB_POWER_ONEUP).DP = 0;
ENEMY_BULLET_CONST(ID_EB_POWER_ONEUP).DEFBOX = [-5 -5 5 5];
ENEMY_BULLET_CONST(ID_EB_POWER_ONEUP).ATTBOX = [-5 -5 5 5];
ENEMY_BULLET_CONST(ID_EB_POWER_ONEUP).EFFDEFBOX = ones(size(ENEMY_BULLET_CONST(ID_EB_VERDE).DEFBOX,1),1);
ENEMY_BULLET_CONST(ID_EB_POWER_ONEUP).EFFATTBOX = ones(size(ENEMY_BULLET_CONST(ID_EB_VERDE).ATTBOX,1),1);
ENEMY_BULLET_CONST(ID_EB_POWER_ONEUP).NEWBORN_INVUL_TIME = 0;    % The invulnerable time 
ENEMY_BULLET_CONST(ID_EB_POWER_ONEUP).TYPE = TYPE_ENEMY_BULLET;    % 10 is for Enemy Crafts
ENEMY_BULLET_CONST(ID_EB_POWER_ONEUP).ID = ID_EB_POWER_ONEUP;      
ENEMY_BULLET_CONST(ID_EB_POWER_ONEUP).TIMER.CUR_ANIM_NO = 4;
ENEMY_BULLET_CONST(ID_EB_POWER_ONEUP).TIMER.EXPLO_ANIM_NO = 8;
ENEMY_BULLET_CONST(ID_EB_POWER_ONEUP).EXPLO_TYPE = 5;


%% GENERIC_OBJ

OBJ_GENERIC_CONST(ID_CHN_TITLE).SPEED = [0 0];
OBJ_GENERIC_CONST(ID_CHN_TITLE).LIFE_TIME = Inf;
OBJ_GENERIC_CONST(ID_CHN_TITLE).FADE_IN_OUT_TIME = [1 1].*FPS;
OBJ_GENERIC_CONST(ID_CHN_TITLE).POS = GAME_RESOLUTION .*[1/2 1/4];
OBJ_GENERIC_CONST(ID_CHN_TITLE).POS_LIM_X = GAME_RESOLUTION.*[1/6 5/6];
OBJ_GENERIC_CONST(ID_CHN_TITLE).TYPE = TYPE_NEUTRAL_PICT;
OBJ_GENERIC_CONST(ID_CHN_TITLE).ID = ID_CHN_TITLE;
OBJ_GENERIC_CONST(ID_CHN_TITLE).TIMER.LIFETIME = 1;

OBJ_GENERIC_CONST(ID_NEUTRAL_MOTTO_STAGE1).SPEED = [0 -5] .* FRAME_DURATION;
OBJ_GENERIC_CONST(ID_NEUTRAL_MOTTO_STAGE1).LIFE_TIME = 8.*FPS;
OBJ_GENERIC_CONST(ID_NEUTRAL_MOTTO_STAGE1).FADE_IN_OUT_TIME = [1.5 1.5].*FPS;
OBJ_GENERIC_CONST(ID_NEUTRAL_MOTTO_STAGE1).POS = GAME_RESOLUTION .*[1/2 3/4];
OBJ_GENERIC_CONST(ID_NEUTRAL_MOTTO_STAGE1).POS_LIM_X = GAME_RESOLUTION.*[1/6 5/6];
OBJ_GENERIC_CONST(ID_NEUTRAL_MOTTO_STAGE1).TYPE = TYPE_NEUTRAL_PICT;
OBJ_GENERIC_CONST(ID_NEUTRAL_MOTTO_STAGE1).ID = ID_NEUTRAL_MOTTO_STAGE1;
OBJ_GENERIC_CONST(ID_NEUTRAL_MOTTO_STAGE1).TIMER.LIFETIME = 1;

OBJ_GENERIC_CONST(ID_TEXT_PROLOGUE).POS = GAME_RESOLUTION.*[1/2 1/2];
OBJ_GENERIC_CONST(ID_TEXT_PROLOGUE).SPEED = [0 0];
OBJ_GENERIC_CONST(ID_TEXT_PROLOGUE).TYPE = TYPE_NEUTRAL_TEXT;
OBJ_GENERIC_CONST(ID_TEXT_PROLOGUE).ID = ID_TEXT_PROLOGUE;
OBJ_GENERIC_CONST(ID_TEXT_PROLOGUE).TIMER.LIFETIME = 1;
OBJ_GENERIC_CONST(ID_TEXT_PROLOGUE).FADE_IN_OUT_TIME = [1 1].*FPS;  
OBJ_GENERIC_CONST(ID_TEXT_PROLOGUE).LIFE_TIME = 5.*FPS;

OBJ_GENERIC_CONST(ID_TEXT_PROLOGUE_BLINK).POS = GAME_RESOLUTION.*[1/2 1/2];
OBJ_GENERIC_CONST(ID_TEXT_PROLOGUE_BLINK).SPEED = [0 0];
OBJ_GENERIC_CONST(ID_TEXT_PROLOGUE_BLINK).TYPE = TYPE_NEUTRAL_TEXT;
OBJ_GENERIC_CONST(ID_TEXT_PROLOGUE_BLINK).ID = ID_TEXT_PROLOGUE_BLINK;
OBJ_GENERIC_CONST(ID_TEXT_PROLOGUE_BLINK).TIMER.LIFETIME = 1;
OBJ_GENERIC_CONST(ID_TEXT_PROLOGUE_BLINK).TIMER.BLINK = 2;
OBJ_GENERIC_CONST(ID_TEXT_PROLOGUE_BLINK).FADE_IN_OUT_TIME = [0 0].*FPS;  
OBJ_GENERIC_CONST(ID_TEXT_PROLOGUE_BLINK).LIFE_TIME = inf;
OBJ_GENERIC_CONST(ID_TEXT_PROLOGUE_BLINK).BLINK_ONOFF_PERIOD = [0.5 0.5].*FPS;

% ENEMY_CONST(1).BLINK_INTERVAL = round(0.1 .* FPS);
% ENEMY_CONST(1).BLINK_TIMER_NO = 2;
% ENEMY_CONST(1).RESPAWN_FLYTODEST_TIME = round(1 .* FPS);
% ENEMY_CONST(1).FLYTODEST_TIMER_NO = 3;
% ENEMY_CONST(1).CUR_ANIM_TIMER_NO = 4;
% ENEMY_CONST(1).BULLET_TIMER_NO = 5;
% ENEMY_CONST(1).MISSILE_TIMER_NO = 6;
% ENEMY_CONST(1).BOMB_TIMER_NO = 7;
% ENEMY_CONST(1).EXPLO_ANIM_TIMER_NO = 8;
% 
% ENEMY_CONST(1).BULLET_RELOAD_TIME = round(0.05.*FPS);
% ENEMY_CONST(1).MISSILE_RELOAD_TIME = round(0.25.*FPS);
% ENEMY_CONST(1).BOMB_RELOAD_TIME = round(5.*FPS);
% 
% ENEMY_CONST(1).RESPAWN_DES_Y = GAME_RESOLUTION(2) .* 7/8;
% ENEMY_CONST(1).RESPAWN_INI_X = GAME_RESOLUTION(1) .* 1/3;
% ENEMY_CONST(1).RESPAWN_INI_Y = GAME_RESOLUTION(2);
% ENEMY_CONST(1).STAGECLEAR_DES_Y = GAME_RESOLUTION(2) .* 7/8;

CurrentFrameNo = 0;
%% Key Initialization
LeftKeyNames = {'a','leftarrow'};
RightKeyNames = {'d','rightarrow'};
UpKeyNames = {'w','uparrow'};
DownKeyNames = {'s','downarrow'};
FireKeyNames = {'u', 'insert'};
BombKeyNames = {'i', 'delete'};
PauseKeyNames = {'p', ''};
StartKeyNames = {'1','2'};
CoinKeyNames = {'5','6'};

%% Key Status
LeftKeyStatus = [false false];
RightKeyStatus = [false false];
UpKeyStatus =  [false false];
DownKeyStatus = [false false];
FireKeyStatus = [false false];
BombKeyStatus = [false false];
PauseKeyStatus = [false false];
StartKeyStatus = [false false];
CoinKeyStatus = [false false];

% global LeftKeyEffective;
% global RightKeyEffective;
% global UpKeyEffective;
% global DownKeyEffective;
% global FireKeyEffective;
BombKeyEffective = [false false];
PauseKeyEffective = [false false];
StartKeyEffective = [false false];
CoinKeyEffective = [false false];

%% Initialize the Global Variables
% Image Objects
queueGlobalImageHandles = zeros(1, MAX_NUM_IMAGE_OBJ);
availGlobalImageHandles = 1:MAX_NUM_IMAGE_OBJ;
numAvailGlobalImageHandles = MAX_NUM_IMAGE_OBJ;

queueNeutralImageHandles  = zeros(1, MAX_NUM_NEUTRAL_OBJ);
numAvailNeutralImageHandles = MAX_NUM_NEUTRAL_OBJ;
availNeutralImageHandles = 1:MAX_NUM_NEUTRAL_OBJ;
usedNeutralObjects = false(size(availNeutralImageHandles));

queueGlobalTextHandles = zeros(1, MAX_NUM_TEXT_OBJ);
numAvailGlobalTextHandles = MAX_NUM_TEXT_OBJ;
availGlobalTextHandles = 1:MAX_NUM_TEXT_OBJ;


ActivePlayers = logical([1 1]);
% Enemies
emptyEnemyStruct = struct( ...  
    'Pos', [0 0],         ... % Position, 1 x 2 (pix) (0,0) - (GAME_RES-1)
    'InterpPos', [0, 0],   ... % Interpolated position, 1 x 2 (pix)
    'OriPos', [0 0], ...
    'V', [0, 0],           ... % Velocity, 1 x 2 (pix / sec)
    'A', [0, 0],           ... % Accelaration, 1 x 2 (p/s^2)
    'Type', [0],        ... % The Enemy's Type
    'ID', [0],          ... % The Enemy's Model Number
    'ImageHandle', [0],  ... % The Image handle to use
    'ImageHandleIndex', [0],...% The index of Image Handle in qGIH
    'CurHP', [0],       ... % The HP left
    'MaxHP', [0],       ... % The Maximum HP
    'AP', [0],          ... % Attack points, should be 1 for aircrafts and bullets, 0 for bonus objects
    'DP', [0],          ... % Defense points (not used), replaced by intEffDefBox
    'OriDefBox', [],   ... % The Defensive Boxes in gGDB with respect to (0,0);
    'OriAttBox', [],   ... % The Aggressive Boxes in gGAB, N X 4.
    'CurDefBox', [],   ... % The DefBoxes with respect to the current position, N x 6.
    'CurAttBox', [],   ... % The AttBoxes with respect to the current position.
    'EffDefBox', [], ... % size(...,1) same as OriDefBox. Specifies the attenuation of damage done to this enemy. 1 -  maximum damage; 0 - no damage ar all.
    'EffAttBox', [], ...
    'thisObjIndex', [], ... % the index of this object in the qGE.
    'BeingDestroyed', false,...% If the enemy is being destroyed (i.e. exploding).
    'IsExploding', false, ... %
    'ExplosionType', 1,... % The Type of Explosion to use.
    'ExplosionStat', 1, ... % The Status of Explosion.
    'ExplosionFrame', 1, ... % The Current Frame of Explosion.
    'CurObjStat', 1,  ... % The current status of enemy, reserved for user.
    'CurAnimFrame', 1, ... % Current frame in the animation.
    'CurAnimStat', 1, ... % Which animation to show currently.
    'InitStat', [],    ... % The Initial and Final Status.
    'EndStat', [],     ... % Useful to create text scrolls, reserved for user.
    'FreezeTimeWhenCreated', false, ... % Prevent all other enemies. 
    'EndStageWhenDestroyed', false, ... % If this object is destroyed, end the stage.
    'Invulnerable', false, ... % Whether this object is in the invulnerable status.
    'NewBornInvulnerableTime', 0,... % The time the invulnerablity lasts.
    'Controllable', [], ... % Whether this object can be controlled by player
    'UnderAttack', false, ...
    'AlphaData', [], ...    % If this array is not empty, the AlphaData property will be set to this array.
    'AnimChangeFlag', false, ...
    'BulletType', [],...
    'MissileType', [],...
    'BombType', [],...
    'BulletLevel', [], ... % logical([0 0 0 1 0 0 0]), logical([0 0 0 1 0 0 0])}
    'BulletPower', [], ...
    'MissileLevel', [], ...
    'MissilePower', [], ...
    'BombLevel', [],...
    'BombPower', [], ...
    'LaunchedBy', [], ...   % Launched by which player
    'CData', [], ...        % If this array is not empty,the CData property will be set to this array.
    'Timers', zeros(1,10),      ... % 1 x 10 array for timer objects
    'ElapTimes', zeros(1,10), ...
    'Visible', true, ...
    'HasWreckage', false, ... % If this enemy has wreckage after destroyed
    'PowerUp', 0, ...        % If this enemy emits power-up items after destroyed
    'IsWreckage', false, ... % If this enemy IS a wreckage
    'FinalCountDown', 0, ... % The time the wreckage last
    'WreckageIndex', 0, ...  % The index of the wreckage to use
    'ExploV', [0 0], ...    % The speed while exploding
    'ResizeFactor', 1, ...
    'UserData1', [],   ... % User-defined Data. Could be cell array or anything
    'UserData2', [],   ... % ditto
    'UserData3', [],   ... % ditto
    'Text', '',         ...
    'TextFont', 'Times New Roman',     ...
    'TextSize', 16,     ...
    'Color', [1 1 1],   ... 
    'DestPos',  [],     ... % The destination of the object. ignored if empty
    'LifeTime', '',     ...
    'FadeInOutTime', [0 0], ...
    'TextEditable', true, ...   % Whether the text will be updated on the screen if user edits it
    'IsStatic', false, ...       % If this object is completely Static: No fade in\out, no moving,
    'AlphaChangeFlag', true,    ... % Whether the AlphaData should be refreshed
    'PositionChangeFlag', true, ... % Whether the Position should be modified
    'IsGeneric', true,  ... % If this object is in the OBJ_GENERIC_ANIM or OBJ_STAGE_ANIM, only affects PICT objects
    'AlphaFactor', 1, ... % The alpha value 
    'Blink', false, ...     % Whether this object is blinking
    'BlinkOnOffPeriod', [0 0], ...   % The on/off periods if this object is blinking
    'CONST', [] ... % Constants for this enemy
    );

% Backup an empty enemy structure
queueGlobalEnemies = repmat(emptyEnemyStruct, 1, MAX_NUM_ENEMY_OBJ);   
queueImpromptuEnemies = repmat(emptyEnemyStruct, 1, MAX_NUM_ENEMY_OBJ);
availGlobalEnemies = 1:MAX_NUM_ENEMY_OBJ;
numAvailGlobalEnemies = MAX_NUM_ENEMY_OBJ;
numImpromptuEnemies = 0;
usedGlobalEnemies = false(size(availGlobalEnemies));

% Friendly Fire Queue
queueGlobalFriendlyFire = repmat(emptyEnemyStruct, 1, MAX_NUM_FRIENDLYFIRE_OBJ);
availGlobalFriendlyFire = 1:MAX_NUM_FRIENDLYFIRE_OBJ;
numAvailGlobalFriendlyFire = MAX_NUM_FRIENDLYFIRE_OBJ;
usedGlobalFriendlyFire = false(1, MAX_NUM_FRIENDLYFIRE_OBJ);
indexGlobalBomb = zeros(1, MAX_NUM_PLAYER_OBJ);

% Player Spacecrafts
DefaultGlobalPlayers = struct(...
    'Pos', {[GAME_RESOLUTION(1)./4 GAME_RESOLUTION(2)], ...
            [GAME_RESOLUTION(1)*3/4 GAME_RESOLUTION(2)]},... % Position, 1 x 2 (pix)
    'InterpPos', {[GAME_RESOLUTION(1)./4 GAME_RESOLUTION(2)], ...
            [GAME_RESOLUTION(1)*3/4 GAME_RESOLUTION(2)]},...   ... % Interpolated position, 1 x 2 (pix)
    'V', {[0 PLAYER_CONST.SPEED]},           ... % Velocity, 1 x 2 (pix / sec)
    'A', {[0 0]},            ... % Accelaration, 1 x 2 (p/s^2)
    'Type',{1},        ... % The Player's Type, must be 1
    'ID', {1, 2},           ... % The Players's Model Number, must be 1,2
    'ImageHandle', {0,0},   ... % The Image handle to use
    'ImageHandleIndex', {0,0},...% The index of Image Handle in qGIH
    'CurHP', {PLAYER_CONST.HP},       ... % The HP left
    'MaxHP', {PLAYER_CONST.HP},       ... % The Maximum HP
    'AP', {PLAYER_CONST.AP},          ... % Attack points, should be 1 for aircrafts and bullets, 0 for bonus objects
    'DP', {PLAYER_CONST.DP},          ... % Defense points (not used), replaced by intEffDefBox
    'OriDefBox', {PLAYER_CONST.DEFBOX},   ... % The Defensive Boxes in gGDB with respect to (0,0);
    'OriAttBox', {PLAYER_CONST.ATTBOX},   ... % The Aggressive Boxes in gGAB, N X 4.
    'CurDefBox', {PLAYER_CONST.DEFBOX},   ... % The DefBoxes with respect to the current position, N x 6.
    'CurAttBox', {PLAYER_CONST.ATTBOX},   ... % The AttBoxes with respect to the current position.
    'EffDefBox', {PLAYER_CONST.EFFDEFBOX}, ... % size(...,1) same as OriDefBox. Specifies the attenuation of damage done to this enemy. 1 -  maximum damage; 0 - no damage ar all.
    'EffAttBox', {PLAYER_CONST.EFFATTBOX}, ...
    'thisObjIndex', {0,0}, ... % the index of this object in the qGE.
    'BeingDestroyed', {false, false}, ... % If the enemy is destroyed.
    'IsExploding', {false, false}, ... % If the enemy is currently exploding
    'BeingBorn', {true, true}, ... % If the player is being born.
    'ExplosionType', {1, 1}, ... % The Type of Explosion to use.
    'ExplosionStat', {1, 1}, ... % The Status of Explosion.
    'ExplosionFrame', [], ... % The Current Frame of Explosion.
    'CurObjStat', {0, 0},  ... % The current status of enemy, reserved for user.
    'CurAnimFrame', {1, 1}, ... % Current frame in the animation.
    'CurAnimStat', {1, 1}, ... % Which animation to show currently.
    'InitStat', {0, 0},    ... % The Initial and Final Status.
    'EndStat', {1, 1},     ... % Useful to create text scrolls, reserved for user.
    'FreezeTimeWhenCreated', {false, false}, ... % Prevent all other enemies. 
    'EndStageWhenDestroyed', {false, false}, ... % If this object is destroyed, end the stage.
    'Invulnerable', {true, true}, ... % Whether this object is in the invulnerable status.
    'NewBornInvulnerableTime', {PLAYER_CONST.NEWBORN_INVUL_TIME}, ... % The time the invulnerablity lasts.
    'Controllable', {false, false}, ... % Whether the player can be controlled
    'DestPos', {0,0}, ... % The player is only controllable after moving to this Dest
    'DestReached', {false, false}, ... % If the player has reached the destination
    'FlyToDestTime', {0, 0}, ... % The time it takes to fly to the destination
    'BulletType', {1,1},...
    'MissileType', {1,1},...
    'BombType', {1,1},...
    'BulletLevel', {3, 3}, ... % logical([0 0 0 1 0 0 0]), logical([0 0 0 1 0 0 0])}
    'BulletPower', {1, 1}, ...
    'BulletReady', {true, true},...
    'MissileLevel', {1, 1}, ...
    'MissilePower', {1, 1}, ...
    'MissileReady', {true, true}, ...
    'BombLevel', {3, 3},...
    'BombPower', {20, 20}, ...
    'BombReady', {true, true}, ...
    'BombsLeft', {3, 3},...
    'LivesLeft', {30, 30}, ...
    'Visible', {true, true}, ...    % Whether the player is able to be seen
    'AlphaData', {[],[]}, ...    % If this array is not empty, the AlphaData property will be set to this array.
    'CData', {[],[]}, ...        % If this array is not empty,the CData property will be set to this array.
    'Timers', zeros(1,10),      ... % 1 x 10 array for timer objects
    'ElapTimes', zeros(1,10),   ... % 1 x 10 array for elapsed time
    'FinalCountDown', 0,        ... % The time the wreckage exists
    'UserData1', {[],[]},   ... % User-defined Data. Could be cell array or anything
    'UserData2', {[],[]},   ... % ditto
    'UserData3', {[],[]}   ... % ditto
    );
queueGlobalPlayers = DefaultGlobalPlayers;

% Neutral Objects
emptyNeutralObjectStruct = emptyEnemyStruct;
%     'Pos', [0 0],         ... % Position, 1 x 2 (pix) (0,0) - (GAME_RES-1)
%     'InterpPos', [0, 0],   ... % Interpolated position, 1 x 2 (pix)
%     'OriPos', [0 0], ...
%     'V', [0, 0],           ... % Velocity, 1 x 2 (pix / sec)
%     'A', [0, 0],           ... % Accelaration, 1 x 2 (p/s^2)
%     'Type', [0],        ... % The Enemy's Type
%     'ID', [0],          ... % The Enemy's Model Number
%     'Text', '',         ...
%     'Font', '',         ...
%     'LifeTime', '',     ...
%     'FadeInOutTime', [0 0], ...
%     'TextEditable', true, ...
%     'IsGeneric', true,  ... % If this object is in the OBJ_GENERIC_ANIM or OBJ_STAGE_ANIM
%     'ImageHandle', [0],  ... % The Image handle to use
%     'ImageHandleIndex', [0],...% The index of Image Handle in qGIH
%     'CurHP', [0],       ... % The HP left
%     'MaxHP', [0],       ... % The Maximum HP
%     'AP', [0],          ... % Attack points, should be 1 for aircrafts and bullets, 0 for bonus objects
%     'DP', [0],          ... % Defense points (not used), replaced by intEffDefBox
%     'thisObjIndex', [], ... % the index of this object in the qGE.
%     'CurObjStat', 1,  ... % The current status of enemy, reserved for user.
%     'CurAnimFrame', 1, ... % Current frame in the animation.
%     'CurAnimStat', 1, ... % Which animation to show currently.  
%     'DestPos', {0,0}, ... % The player is only controllable after moving to this Dest
%     'DestReached', {false, false}, ... % If the player has reached the destination
%     'FlyToDestTime', {0, 0}, ... % The time it takes to fly to the destination    
%     'InitStat', [],    ... % The Initial and Final Status.
%     'EndStat', [],     ... % Useful to create text scrolls, reserved for user.
%     'FreezeTimeWhenCreated', false, ... % Prevent all other enemies. 
%     'EndStageWhenDestroyed', false, ... % If this object is destroyed, end the stage.
%     'AlphaData', [], ...    % If this array is not empty, the AlphaData property will be set to this array.
%     'AlphaFactor', 1, ...
%     'AnimChangeFlag', false, ...
%     'CData', [], ...        % If this array is not empty,the CData property will be set to this array.
%     'Timers', zeros(1,10),      ... % 1 x 10 array for timer objects
%     'ElapTimes', zeros(1,10), ...
%     'Visible', true, ...
%     'ResizeFactor', 1, ...
%     'UserData1', [],   ... % User-defined Data. Could be cell array or anything
%     'UserData2', [],   ... % ditto
%     'UserData3', [],   ... % ditto
%     'CONST', [] ... % Constants for this enemy
%     );
queueNeutralObjects = repmat(emptyNeutralObjectStruct, 1, MAX_NUM_NEUTRAL_OBJ);   
availNeutralObjects = 1:MAX_NUM_NEUTRAL_OBJ;
numAvailNeutralObjects = MAX_NUM_NEUTRAL_OBJ;



%% Create objects that are associated with the variables
% Create the Game Window and Canvas
MainFigureHdl = figure('Name', 'Stellaria - Tech Demo', ...
                       'NumberTitle' ,'off', ...
                        'Units', 'pixels', ...
                       'Position', [MainFigureInitPos, MainFigureSize], ...
                       'MenuBar', 'figure', ...
                       'Renderer', 'opengl', ...
                       'KeyPressFcn', @stl_KeyDown,...
                       'KeyReleaseFcn', @stl_KeyUp, ...
                       'ResizeFcn', @stl_CALLBACK_winResizeFcn, ...
                       'CloseRequestFcn', @stl_CALLBACK_CloseRequestFcn);

MainAxesHdl = axes('Parent', MainFigureHdl, ...
                    'Units', 'normalized',...
                    'Position', [MainAxesInitPos, 1-MainAxesInitPos.*2], ...                   
                    'color', [0 0 0], ...
                    'XLim', [1 MainAxesSize(1)], ...
                    'YLim', [1 MainAxesSize(2)], ...
                    'YDir', 'reverse', ...
                    'NextPlot', 'add', ...
                    'Visible', 'on', ...
                    'XTick',[], ...
                    'YTick',[]);
TextAxesSizeFactor = 1;
% TextAxesHdl = axes('Parent', MainFigureHdl, ...
%                     'Units', 'normalized',...
%                     'Position', [MainAxesInitPos, 1-MainAxesInitPos.*2], ...
%                     'color', [0 0 0], ...
%                     'XLim', [1 MainAxesSize(1).*TextAxesSizeFactor], ...
%                     'YLim', [1 MainAxesSize(2).*TextAxesSizeFactor], ...
%                     'YDir', 'reverse', ...
%                     'NextPlot', 'add', ...
%                     'Visible', 'off');
grid on;
% Create the Image Handle Queue
for i = MAX_NUM_IMAGE_OBJ:-1:1
    queueGlobalImageHandles(i) = image(0, 0, [], ...
        'Parent', MainAxesHdl,...
        'Visible', 'off');
end

for i = 1:MAX_NUM_NEUTRAL_OBJ
    queueNeutralImageHandles(i) = image(0, 0, [], ...
        'Parent', MainAxesHdl,...
        'Visible', 'off');
end

for i = 1:MAX_NUM_TEXT_OBJ
    queueGlobalTextHandles(i) = text(0, 0, '', ...
        'Parent', MainAxesHdl, ...
        'Visible', 'off', ...
        'HorizontalAlignment', 'center', ...
        'VerticalAlignment', 'middle', ...
        'Interpreter', 'none', ...
        'EraseMode', 'normal');
end


% Get Image Handles for the Players
stl_addToGlobalPlayers

stl_defineDefaultEnemies;
% Reorder the image handles
for i = 1:MAX_NUM_PLAYER_OBJ
    uistack(queueGlobalPlayers(i).ImageHandle, 'top');
end
for i = 1:MAX_NUM_NEUTRAL_OBJ
    uistack(queueNeutralImageHandles(i),'top');
end

sinTable = sin([0:359].*pi/180);
cosTable = cos([0:359].*pi/180);
rotTable = [sinTable' cosTable'];


AxesResizeFactor = 1;

%% Initialize the Star Scroll
StarNum = 40;
StarNum2 = 20;
StarSpeed = [zeros(StarNum, 1), (rand(StarNum, 1).*40+5)];
StarSpeed2 = [zeros(StarNum2, 1), (rand(StarNum2, 1).*40+30)];
StarPosition = rand(StarNum, 2).* repmat(MainAxesSize, [StarNum 1]);
StarPosition2 = rand(StarNum2, 2).* repmat(MainAxesSize, [StarNum2 1]);
%     StarSize = -StarSpeed(:,2)./100.*2;
%     StarColor = rand(StarNum, 3);

StarX = StarPosition(:, 1);
StarY = StarPosition(:, 2);
StarX2 = StarPosition2(:, 1);
StarY2 = StarPosition2(:, 2);
%     hold on
starPlotHdl = plot(MainAxesHdl, StarX, StarY,'.',...
    'Color', [1 1 1], ...
    'Marker', '.', ...
    'MarkerSize', 2);
%         starPlotHdl = scatter(MainAxesHdl, StarX, StarY, StarSize, StarColor);
%         'Color', [1 1 1], ...
%         'Marker', 'hexagram', ...
%         'MarkerSize', 20);
%     hold off
starPlotHdl2 = plot(MainAxesHdl, StarX2, StarY2,'.',...
    'Color', [1 1 1], ...
    'Marker', '.', ...
    'MarkerSize', 5);
set(starPlotHdl, 'XDataSource', 'StarX', 'YDataSource', 'StarY');
set(starPlotHdl2, 'XDataSource', 'StarX2', 'YDataSource', 'StarY2');
uistack(starPlotHdl2, 'bottom');
uistack(starPlotHdl, 'bottom');
starScrollTimer = tic;

%% Game Path
GAME_PATH.MAIN =  [fileparts(mfilename('fullpath')) filesep];
GAME_PATH.MUSIC_RES = [GAME_PATH.MAIN 'Music' filesep];
GAME_PATH.UTIL = [GAME_PATH.MAIN 'Util' filesep];
GAME_PATH.UTIL_MIDI = [GAME_PATH.UTIL 'midi' filesep];
GAME_PATH.UTIL_MIDI_SOUND = [GAME_PATH.UTIL_MIDI 'sound' filesep];

%% --------------- Code Ends Here --------------------------------
return;
