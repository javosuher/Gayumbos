function bkgMusicPlayer = stl_STAGE_TitleScreen
% STL_STAGE_[stagename] - Define a stage for Stellaria
%
% Usage:
%   bkgMusicPlayer = stl_STAGE_[stagename]
%
% Input:
%   None;
%
% Output:
%   bkgMusicPlayer - An audioplayer object that stores the bkg music for
%                    this stage
% 
% Columns for the 'stage' cell array:
% -------------------------------------------------------------------------
% For Regular Enemy Objects
% TIME | Type | ID | Pos | V | A | CurAnimFrame | CurAnimStat | CurObjStat | InitStat | EndStat'};
%
% For Text Objects
% TIME | Type | ID | Pos | V | A | Text | TextFont | TextSize | Color | FadeInOutTime | LifeTime | DestPos'};
% 
% For Picture Objects
% TIME | Type | ID | Pos | V | A | CurAnimFrame | CurAnimStat | CurObjStat | InitStat | FadeInOutTime | LifeTime | DestPos
%
% 
% TIME(sec) -    The time the current object enters the stage since the entrance of the last object
% Type      -    The TYPE of the object, see those global variables which have a TYPE_ prefix
% ID        -    The ID of the object, see those global variables which have a ID_ prefix
% Pos       -    The initial position of the object
% V(pix/sec)-    The initial speed of the object
% A(pix/s^2)-    The initial acceleration of the object
% CurAnimFrame  -    The initial frame number in the current animation sequence
% CurAnimStat   -   The current animation sequence
% CurObjStat    - The current status of the object
% InitStat, EndStat     - Usage contingent on the object's TYPE and ID
% 
% Text      -   The 'String' property of the text object
% TextFont  -   The 'FontName' property of the text object
% TextSize  -  The 'FontSize' property of the text object
% Color     -   The Color of the text
% FadeInOutTime(sec)    - The time it takes the text to fade in and out. Must be a 1 x 2 vector.
% LifeTime(sec) - The time the text exist on the screen (FadeInOutTime included)
% DestPos   -    The destination of a moving text. A text would stop immediately upon reaching this very spot
% -------------------------------------------------------------------------
% 
global thisStageTimeTable;
global thisStageActors;

global SceneRect;
global GAME_RESOLUTION
global TextAxesSizeFactor
global FPS
global SPECIAL_FLAG
%% Enemy Types and IDS

global ENEMY_CONST
global TYPE_ENEMY_CRAFT
global ID_EC_STACCATO
global ID_EC_LEGATO
global ID_EC_FORTEPIANO
global ID_EC_RONDO

global TYPE_ENEMY_BULLET
global ID_EB_VERDE

global TYPE_PLAYER_BULLET
global ID_PB_FIRE

global TYPE_NEUTRAL_PICT
global TYPE_NEUTRAL_TEXT
global ID_CHN_TITLE
global ID_NEUTRAL_MOTTO_STAGE1
global ID_TEXT_PROLOGUE
global ID_TEXT_PROLOGUE_BLINK

global StartKeyNames

global GAME_PATH

%% Various useful constants
leftx = 0;
topy = 0;
rightx = GAME_RESOLUTION(1);
midx = GAME_RESOLUTION(1)./2;
bottomy = GAME_RESOLUTION(2);
midy =  GAME_RESOLUTION(2)./2;

width = rightx - leftx;
height = bottomy - topy;
% Stage = [WhatTime], [Type], [ID], [InitPos], [InitSpeed(pixel/second)], [InitAccl(pix/sec^2)],
% rot(deg), rotation speed(deg/sec), CurAnimFrame, CurAnimStat, curObjStat,
% InitStat, EndStat, {Text, TextFont, TextSize, Color, FadeInOutTime, LifeTime, DesPos}

textScrollFadeTime = [1.5 1.5];

promptText = sprintf('PRESS %s OR %s TO START', StartKeyNames{1}, StartKeyNames{2});

%% The Main Stage Description Array
stage = {
    2,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx midy-bottomy.*2/8],        [], [],   'A',  'Times New Roman', 15, [], [], [], [];
    0, TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx midy-bottomy.*1/8],        [], [],   'Stellari Studio', 'Times New Roman', 40, [], [], [], [];
    0,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx midy],   [], [],       'GAME','Times New Roman', 15, [], [], [], [];
%     
    6,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx midy-bottomy.*2/8],        [], [],   'Designed by',  'Times New Roman', 15, [], [], [], [];
    0, TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx midy-bottomy.*1/8],        [], [],   'Mingjing Zhang', 'Times New Roman', 40, [], [], [], [];
% %     6,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx midy-bottomy.*2/8],        [], [],   'Dedicated to',  'Times New Roman', 16, [], [], [], [];
% %     0, TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx midy-bottomy.*1/8],                       [], [],   'MATLAB THE GREAT', 'Arial', 30, [], [], [], []; 
%     
    6,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx midy-bottomy.*2/16],        [0 10], [],   'Stellaria',  'Vivaldi', 50, [1 1 1], [2 2], Inf, [midx midy-bottomy.*1/16];
    4,   TYPE_NEUTRAL_PICT,  ID_CHN_TITLE,   [midx midy-bottomy.*1/4+bottomy.*1/16],         [0 -10], [], 1, 1, 1, [], [2 2], Inf, [midx midy-bottomy.*1/4];
    2,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*7/8],        [], [],   'Stellari Studio, 2011',  'Times New Roman', 15, [], [], Inf, [];
    1,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE_BLINK, [midx bottomy.*3/4],        [0 0], [],   promptText,  'Times New Roman', 15, [1 1 0],[0 0], inf,  [midx midy];
};
     
[thisStageTimeTable thisStageActors] = stl_preprocessStage(stage);

[song freq] = readmidi2([GAME_PATH.MUSIC_RES 'MOTN11.mid']);

bkgMusicPlayer = audioplayer(song, freq);

SPECIAL_FLAG.HIDE_PLAYER = [true true];