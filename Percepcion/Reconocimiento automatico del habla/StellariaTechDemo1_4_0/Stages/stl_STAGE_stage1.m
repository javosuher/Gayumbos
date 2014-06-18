function bkgMusicPlayer = stl_STAGE_stage1
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
% TIME | Type | ID | Pos | V | A | CurAnimFrame | CurAnimStat | CurObjStat | InitStat | EndStat | PowerUp };
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
% 
global thisStageTimeTable;
global thisStageActors;

global SceneRect;
global GAME_RESOLUTION
global FPS
%% Enemy Types and IDS

global ENEMY_CONST
global TYPE_ENEMY_CRAFT
global ID_EC_STACCATO
global ID_EC_LEGATO
global ID_EC_FORTEPIANO
global ID_EC_RONDO
global ID_EC_ROTATO

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
% global bkgMusicPlayer;
% if isa(bkgMusicPlayer, 'audioplayer')
%     clear global bkgMusicPlayer;
%     
% end
% global bkgMusicPlayer

global GAME_PATH
%

% leftx = SceneRect(1);
% topy = SceneRect(2);
% rightx = SceneRect(3);
% bottomy = SceneRect(4);

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
% InitStat, EndStat, {Text, TextFont, TextSize}
stage = {

    2,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx midy],        [], [],   'ACT 1', 'Arial', 20, [1 1 1], [1.5 1.5], 5, [];
 

8.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./3 topy], [], [0 0], 1, 1, 1, [], [], [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./3 topy], [], [0 0], 1, 1, 1, [], [], [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./3 topy], [], [0 0], 1, 1, 1, [], [], [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./3 topy], [], [0 0], 1, 1, 1, [], [], [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./3 topy], [], [0 0], 1, 1, 1, [], [], [], [];
2.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*2/3 topy], [], [0 0], 1, 1, 1, [], [], [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*2/3 topy], [], [0 0], 1, 1, 1, [], [], [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*2/3 topy], [], [0 0], 1, 1, 1, [], [], [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*2/3 topy], [], [0 0], 1, 1, 1, [], [], [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*2/3 topy], [], [0 0], 1, 1, 1, [], [], [], [];

4,   TYPE_NEUTRAL_PICT,  ID_NEUTRAL_MOTTO_STAGE1, [],             [], [], 1, 1, 1, [], [], [], [];

4.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./3 topy], [], [0 0], 1, 1, 1, [], [], [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./3 topy], [], [0 0], 1, 1, 1, [], [], [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./3 topy], [], [0 0], 1, 1, 1, [], [], [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./3 topy], [], [0 0], 1, 1, 1, [], [], [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./3 topy], [], [0 0], 1, 1, 1, [], [], [], [];

2.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*2/3 topy], [], [0 0], 1, 1, 1, [], [], [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*2/3 topy], [], [0 0], 1, 1, 1, [], [], [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*2/3 topy], [], [0 0], 1, 1, 1, [], [], [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*2/3 topy], [], [0 0], 1, 1, 1, [], [], [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*2/3 topy], [], [0 0], 1, 1, 1, [], [], [], [];

2.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./3 topy], [], [0 8], 1, 1, 1, [], [], [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./3 topy], [], [0 8], 1, 1, 1, [], [], [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./3 topy], [], [0 8], 1, 1, 1, [], [], [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./3 topy], [], [0 8], 1, 1, 1, [], [], [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./3 topy], [], [0 8], 1, 1, 1, [], [], [], [];

2.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*2/3 topy], [], [0 8], 1, 1, 1, [], [], [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*2/3 topy], [], [0 8], 1, 1, 1, [], [], [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*2/3 topy], [], [0 8], 1, 1, 1, [], [], [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*2/3 topy], [], [0 8], 1, 1, 1, [], [], [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*2/3 topy], [], [0 8], 1, 1, 1, [], [], [], [];

2,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [0 bottomy.*1/6], [10 10], [], 1, 1, 2, [], [], [], [];
1,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [rightx bottomy.*1/6], [-10 10], [], 1, 1, 2, [], 0.5, [], [];
1,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [0  bottomy.*2/6], [10 5], [], 1, 1, 2, [], [], [], [];
1,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [rightx bottomy.*2/6], [-10 -5], [], 1, 1, 2, [], 0.5, [], [];
1,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [0  bottomy.*3/6], [10 0], [], 1, 1, 2, [], [], [], [];
1,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [rightx bottomy.*3/6], [10 0], [], 1, 1, 2, [], 0.5, [], [];
1,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [0  bottomy.*4/6], [10 -5], [], 1, 1, 2, [], [], [], [];
1,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [rightx bottomy.*4/6], [-10 -5], [], 1, 1, 2, [], 0.5, [], [];
1,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [0  bottomy.*5/6], [10 -10], [], 1, 1, 2, [], [], [], [];
1,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [rightx bottomy.*5/6], [-10 -10], [], 1, 1, 2, [], 0.5, [], [];

2,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [0 bottomy.*1/6], [10 10], [], 1, 1, 2, [], [], [], [];
1,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [rightx bottomy.*1/6], [-10 10], [], 1, 1, 2, [], 0.5, [], [];
1,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [0  bottomy.*2/6], [10 5], [], 1, 1, 2, [], [], [], [];
1,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [rightx bottomy.*2/6], [-10 -5], [], 1, 1, 2, [], 0.5, [], [];
1,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [0  bottomy.*3/6], [10 0], [], 1, 1, 2, [], [], [], [];
1,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [rightx bottomy.*3/6], [10 0], [], 1, 1, 2, [], 0.5, [], [];
1,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [0  bottomy.*4/6], [10 -5], [], 1, 1, 2, [], [], [], [];
1,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [rightx bottomy.*4/6], [-10 -5], [], 1, 1, 2, [], 0.5, [], [];
1,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [0  bottomy.*5/6], [10 -10], [], 1, 1, 2, [], [], [], [];
1,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [rightx bottomy.*5/6], [-10 -10], [], 1, 1, 2, [], 0.5, [], [];

         3.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./16, topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./8 topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./8, topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*3/16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*3/16, topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*4/16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*4/16, topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*5/16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*5/16, topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*6/16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*6/16, topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*7/16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*7/16, topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*8/16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*8/16, topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*7/16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*7/16, topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*6/16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*6/16, topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*5/16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*5/16, topy], [], [0 8], 1, 1, 1, [], [], [], [];    
         0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*4/16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*4/16, topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*3/16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*3/16, topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./8 topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./8, topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./16, topy], [], [0 8], 1, 1, 1, [], [], [], [];
         
                  3.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./16, topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./8 topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./8, topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*3/16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*3/16, topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*4/16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*4/16, topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*5/16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*5/16, topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*6/16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*6/16, topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*7/16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*7/16, topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*8/16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*8/16, topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*7/16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*7/16, topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*6/16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*6/16, topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*5/16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*5/16, topy], [], [0 8], 1, 1, 1, [], [], [], [];    
         0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*4/16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*4/16, topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*3/16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*3/16, topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./8 topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./8, topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./16, topy], [], [0 8], 1, 1, 1, [], [], [], [];

2.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./3 topy], [], [0 8], 1, 1, 1, [], [], [], [];
   0,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [0 bottomy.*1/6], [10 10], [], 1, 1, 2, [], [], [], [];
   0,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [rightx bottomy.*1/6], [-10 10], [], 1, 1, 2, [], 0.5, [], [];
   
   0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./3 topy], [], [0 8], 1, 1, 1, [], [], [], [];
   0,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [0  bottomy.*2/6], [10 5], [], 1, 1, 2, [], [], [], [];
   0,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [rightx bottomy.*2/6], [-10 -5], [], 1, 1, 2, [], 0.5, [], [];
   0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./3 topy], [], [0 8], 1, 1, 1, [], [], [], [];
   0,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [0  bottomy.*3/6], [10 0], [], 1, 1, 2, [], [], [], [];
   0,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [rightx bottomy.*3/6], [10 0], [], 1, 1, 2, [], 0.5, [], [];
   0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./3 topy], [], [0 8], 1, 1, 1, [], [], [], [];
   0,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [0  bottomy.*4/6], [10 -5], [], 1, 1, 2, [], [], [], [];
   0,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [rightx bottomy.*4/6], [-10 -5], [], 1, 1, 2, [], 0.5, [], [];
   0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./3 topy], [], [0 8], 1, 1, 1, [], [], [], [];
   0,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [0  bottomy.*5/6], [10 -10], [], 1, 1, 2, [], [], [], [];
   0,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [rightx bottomy.*5/6], [-10 -10], [], 1, 1, 2, [], 0.5, [], [];

2.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*2/3 topy], [], [0 8], 1, 1, 1, [], [], [], [];
   0,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [0 bottomy.*1/6], [10 10], [], 1, 1, 2, [], [], [], [];
   0,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [rightx bottomy.*1/6], [-10 10], [], 1, 1, 2, [], 0.5, [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*2/3 topy], [], [0 8], 1, 1, 1, [], [], [], [];

   0,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [0  bottomy.*2/6], [10 5], [], 1, 1, 2, [], [], [], [];
   0,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [rightx bottomy.*2/6], [-10 -5], [], 1, 1, 2, [], 0.5, [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*2/3 topy], [], [0 8], 1, 1, 1, [], [], [], [];
   0,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [0  bottomy.*3/6], [10 0], [], 1, 1, 2, [], [], [], [];
   0,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [rightx bottomy.*3/6], [10 0], [], 1, 1, 2, [], 0.5, [], [];

0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*2/3 topy], [], [0 8], 1, 1, 1, [], [], [], [];
   0,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [0  bottomy.*4/6], [10 -5], [], 1, 1, 2, [], [], [], [];
   0,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [rightx bottomy.*4/6], [-10 -5], [], 1, 1, 2, [], 0.5, [], [];

0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*2/3 topy], [], [0 8], 1, 1, 1, [], [], [], [];
   0,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [0  bottomy.*5/6], [10 -10], [], 1, 1, 2, [], [], [], [];
   0,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [rightx bottomy.*5/6], [-10 -10], [], 1, 1, 2, [], 0.5, [], [];


3,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./4, topy], [], [0 0], 1, 1, 2, [], 0.5, [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./4, topy], [], [0 0], 1, 1, 2, [], 0, [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./4, topy], [], [0 0], 1, 1, 2, [], 0.5, [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./4, topy], [], [0 0], 1, 1, 2, [], 0, [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./4, topy], [], [0 0], 1, 1, 2, [], 0.5, [], [];

3,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width.*3/4, topy], [], [0 0], 1, 1, 4, [], 0.5, [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width.*3/4, topy], [], [0 0], 1, 1, 4, [], 0, [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width.*3/4, topy], [], [0 0], 1, 1, 4, [], 0.5, [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width.*3/4, topy], [], [0 0], 1, 1, 4, [], 0, [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width.*3/4, topy], [], [0 0], 1, 1, 4, [], 0.5, [], [];

4,   TYPE_ENEMY_CRAFT,   ID_EC_FORTEPIANO, [width.*1/3 topy], [], [0 0], 1, 1, 1, [], [], [], [];

3,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./4, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./4, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];

4,   TYPE_ENEMY_CRAFT,   ID_EC_FORTEPIANO, [width.*2/3 topy], [], [0 0], 1, 1, 1, [], [], [], [];

3,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];

4,   TYPE_ENEMY_CRAFT,   ID_EC_FORTEPIANO, [width.*1/3 topy], [], [0 0], 1, 1, 1, [], [], [], [];

3,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./4, topy], [], [0 0], 1, 1, 2, [], 0.5, [], [];
0,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
0,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./4, topy], [], [0 0], 1, 1, 2, [], 0, [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
0,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./4, topy], [], [0 0], 1, 1, 2, [], 0.5, [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
0,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./4, topy], [], [0 0], 1, 1, 2, [], 0, [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
0,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./4, topy], [], [0 0], 1, 1, 2, [], 0.5, [], [];

4,   TYPE_ENEMY_CRAFT,   ID_EC_FORTEPIANO, [width.*2/3 topy], [], [0 0], 1, 1, 1, [], [], [], [];

3,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
0,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width.*3/4, topy], [], [0 0], 1, 1, 4, [], 0.5, [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width.*3/4, topy], [], [0 0], 1, 1, 4, [], 0, [], [];
0,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./4, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width.*3/4, topy], [], [0 0], 1, 1, 4, [], 0.5, [], [];
0,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width.*3/4, topy], [], [0 0], 1, 1, 4, [], 0, [], [];
0,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./4, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width.*3/4, topy], [], [0 0], 1, 1, 4, [], 0.5, [], [];
0,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];


3,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./4 topy], [], [0 0], 1, 1, 1, [], [], [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./4, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./4 topy], [], [0 0], 1, 1, 1, [], [], [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./4 topy], [], [0 0], 1, 1, 1, [], [], [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./4, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./4 topy], [], [0 0], 1, 1, 1, [], [], [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./4 topy], [], [0 0], 1, 1, 1, [], [], [], [];

3,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*3/4 topy], [], [0 0], 1, 1, 1, [], [], [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*3/4 topy], [], [0 0], 1, 1, 1, [], [], [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*3/4 topy], [], [0 0], 1, 1, 1, [], [], [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*3/4 topy], [], [0 0], 1, 1, 1, [], [], [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*3/4 topy], [], [0 0], 1, 1, 1, [], [], [], [];

3,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./4 topy], [], [0 0], 1, 1, 1, [], [], [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./4, topy], [], [0 0], 1, 1, 3, [], 0, [], [];

   0,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [0 bottomy.*1/6], [10 10], [], 1, 1, 2, [], [], [], [];
   0,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [rightx bottomy.*1/6], [-10 10], [], 1, 1, 2, [], 0.5, [], [];

0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./4 topy], [], [0 0], 1, 1, 1, [], [], [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
   0,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [0  bottomy.*2/6], [10 5], [], 1, 1, 2, [], [], [], [];
   0,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [rightx bottomy.*2/6], [-10 -5], [], 1, 1, 2, [], 0.5, [], [];
0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./4 topy], [], [0 0], 1, 1, 1, [], [], [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./4, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
   0,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [0  bottomy.*3/6], [10 0], [], 1, 1, 2, [], [], [], [];
   0,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [rightx bottomy.*3/6], [10 0], [], 1, 1, 2, [], 0.5, [], [];

0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./4 topy], [], [0 0], 1, 1, 1, [], [], [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
   0,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [0  bottomy.*4/6], [10 -5], [], 1, 1, 2, [], [], [], [];
   0,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [rightx bottomy.*4/6], [-10 -5], [], 1, 1, 2, [], 0.5, [], [];
0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./4 topy], [], [0 0], 1, 1, 1, [], [], [], [];
   0,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [0  bottomy.*5/6], [10 -10], [], 1, 1, 2, [], [], [], [];
   0,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [rightx bottomy.*5/6], [-10 -10], [], 1, 1, 2, [], 0.5, [], [];

3,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*3/4 topy], [], [0 0], 1, 1, 1, [], [], [], [];
   0,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [0 bottomy.*1/6], [10 10], [], 1, 1, 2, [], [], [], [];
   0,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [rightx bottomy.*1/6], [-10 10], [], 1, 1, 2, [], 0.5, [], [];
0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*3/4 topy], [], [0 0], 1, 1, 1, [], [], [], [];
   0,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [0  bottomy.*2/6], [10 5], [], 1, 1, 2, [], [], [], [];
   0,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [rightx bottomy.*2/6], [-10 -5], [], 1, 1, 2, [], 0.5, [], [];

0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*3/4 topy], [], [0 0], 1, 1, 1, [], [], [], [];
   0,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [0  bottomy.*4/6], [10 -5], [], 1, 1, 2, [], [], [], [];
   0,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [rightx bottomy.*4/6], [-10 -5], [], 1, 1, 2, [], 0.5, [], [];

0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*3/4 topy], [], [0 0], 1, 1, 1, [], [], [], [];
   0,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [0  bottomy.*5/6], [10 -10], [], 1, 1, 2, [], [], [], [];
   0,     TYPE_ENEMY_CRAFT,   ID_EC_ROTATO, [rightx bottomy.*5/6], [-10 -10], [], 1, 1, 2, [], 0.5, [], [];


0.4,   TYPE_ENEMY_CRAFT,   ID_EC_FORTEPIANO, [width./3+32 topy], [], [0 0], 1, 1, 1, [], [], [], [];
4,   TYPE_ENEMY_CRAFT,   ID_EC_FORTEPIANO, [width.*2/3+32 topy], [], [0 0], 1, 1, 1, [], [], [], [];
4,   TYPE_ENEMY_CRAFT,   ID_EC_FORTEPIANO, [width./3+32 topy], [], [0 0], 1, 1, 1, [], [], [], [];
% 3,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx midy],        [], [],   'The Curtain Falls', 'Arial', 20, [1 1 1], [1.5 1.5], 5, [];

4,   TYPE_ENEMY_CRAFT,   ID_EC_FORTEPIANO, [width.*2/3+32 topy], [], [0 0], 1, 1, 1, [], [], [], [];
4,   TYPE_ENEMY_CRAFT,   ID_EC_FORTEPIANO, [width.*2/3+32 topy], [], [0 0], 1, 1, 1, [], [], [], [];

4,   TYPE_ENEMY_CRAFT,   ID_EC_FORTEPIANO, [width./3+32 topy], [], [0 0], 1, 1, 1, [], [], [], [];



         
         
%          0.4,   TYPE_ENEMY_CRAFT,   ID_EC_FORTEPIANO, [width.*2/3+32 topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.4,   TYPE_ENEMY_CRAFT,   ID_EC_FORTEPIANO, [width.*2/3+32 topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.4,   TYPE_ENEMY_CRAFT,   ID_EC_FORTEPIANO, [width.*2/3+32 topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.4,   TYPE_ENEMY_CRAFT,   ID_EC_FORTEPIANO, [width.*2/3+32 topy], [], [0 0], 1, 1, 1, [], [], [], [];
            
%          3,   TYPE_ENEMY_CRAFT,   ID_EC_RONDO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_RONDO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_RONDO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_RONDO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          
%          3,   TYPE_ENEMY_CRAFT,   ID_EC_RONDO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_RONDO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_RONDO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_RONDO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          
%          3,   TYPE_ENEMY_CRAFT,   ID_EC_RONDO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_RONDO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_RONDO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_RONDO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          
%          3,   TYPE_ENEMY_CRAFT,   ID_EC_RONDO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_RONDO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_RONDO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_RONDO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          
%          3,   TYPE_ENEMY_CRAFT,   ID_EC_RONDO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_RONDO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_RONDO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_RONDO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          
%          3,   TYPE_ENEMY_CRAFT,   ID_EC_RONDO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_RONDO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_RONDO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_RONDO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          
%          3,   TYPE_ENEMY_CRAFT,   ID_EC_RONDO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_RONDO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_RONDO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_RONDO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          
%          3,   TYPE_ENEMY_CRAFT,   ID_EC_RONDO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_RONDO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_RONDO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_RONDO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          3,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          
%          3,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./4, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./4, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          
%          3,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          
%          3,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./4, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./4, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          
%          3,   TYPE_ENEMY_CRAFT,   ID_EC_RONDO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_RONDO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_RONDO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_RONDO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          
%          3,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./4, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./4, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          
%          3,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          
%          
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width.*3/4, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0.5, [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 3, [], 0, [], [];
%          
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./8 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./8, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*3/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*3/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*4/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*4/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*5/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*5/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*6/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*6/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*7/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*7/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*8/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          3.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./8 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./8, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*3/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*3/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*4/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*4/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*5/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*5/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*6/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*6/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*7/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*7/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*8/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          3.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./8 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./8, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*3/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*3/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*4/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*4/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*5/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*5/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*6/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*6/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*7/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*7/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*8/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          3.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./8 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./8, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*3/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*3/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*4/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*4/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*5/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*5/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*6/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*6/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*7/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*7/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*8/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          3.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./8 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./8, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*3/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*3/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*4/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*4/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*5/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*5/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*6/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*6/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*7/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*7/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*8/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          3.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./8 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./8, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*3/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*3/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*4/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*4/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*5/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*5/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*6/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*6/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*7/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*7/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*8/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          3.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./8 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./8, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*3/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*3/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*4/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*4/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*5/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*5/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*6/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*6/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*7/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*7/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*8/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          3.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./8 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./8, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*3/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*3/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*4/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*4/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*5/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*5/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*6/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*6/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*7/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*7/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*8/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          3.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./8 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./8, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*3/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*3/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*4/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*4/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*5/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*5/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*6/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*6/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*7/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*7/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*8/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          3.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./8 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./8, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*3/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*3/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*4/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*4/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*5/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*5/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*6/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*6/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*7/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*7/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*8/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          3.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./8 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./8, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*3/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*3/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*4/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*4/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*5/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*5/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*6/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*6/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*7/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*7/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*8/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          3.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./8 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./8, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*3/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*3/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*4/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*4/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*5/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*5/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*6/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*6/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*7/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*7/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*8/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          3.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./8 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./8, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*3/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*3/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*4/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*4/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*5/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*5/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*6/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*6/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*7/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*7/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*8/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          3.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./8 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./8, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*3/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*3/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*4/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*4/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*5/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*5/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*6/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*6/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*7/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*7/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*8/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          3.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./8 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./8, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*3/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*3/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*4/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*4/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*5/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*5/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*6/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*6/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*7/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*7/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*8/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          3.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./8 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./8, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*3/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*3/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*4/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*4/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*5/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*5/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*6/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*6/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*7/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*7/16, topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*8/16 topy], [], [0 8], 1, 1, 3, [], [], [], [];
%          
% %          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx./2 topy], [], [], 1, 1, 1, [], [], [], [];
% %          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx./2 topy], [], [], 1, 1, 1, [], [], [], [];
% %          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx./2 topy], [], [], 1, 1, 1, [], [], [], [];
% %          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx./2 topy], [], [], 1, 1, 1, [], [], [], [];
% %          
% %          1.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx.*3/2 topy], [], [], 1, 1, 1, [], [], [], [];
% %          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx.*3/2 topy], [], [], 1, 1, 1, [], [], [], [];
% %          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx.*3/2 topy], [], [], 1, 1, 1, [], [], [], [];
% %          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx.*3/2 topy], [], [], 1, 1, 1, [], [], [], [];
% %          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx.*3/2 topy], [], [], 1, 1, 1, [], [], [], [];
% %          
% %          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx./2 topy], [], [], 1, 1, 1, [], [], [], [];
% %          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx./2 topy], [], [], 1, 1, 1, [], [], [], [];
% %          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx./2 topy], [], [], 1, 1, 1, [], [], [], [];
% %          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx./2 topy], [], [], 1, 1, 1, [], [], [], [];
% %          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx./2 topy], [], [], 1, 1, 1, [], [], [], [];
% %          
% %          1.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx.*3/2 topy], [], [], 1, 1, 1, [], [], [], [];
% %          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx.*3/2 topy], [], [], 1, 1, 1, [], [], [], [];
% %          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx.*3/2 topy], [], [], 1, 1, 1, [], [], [], [];
% %          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx.*3/2 topy], [], [], 1, 1, 1, [], [], [], [];
% %          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx.*3/2 topy], [], [], 1, 1, 1, [], [], [], [];
% %          
% %          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx./2 topy], [], [0 8], 1, 1, 1, [], [], [], [];
% %          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx./2 topy], [], [0 8], 1, 1, 1, [], [], [], [];
% %          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx./2 topy], [], [0 8], 1, 1, 1, [], [], [], [];
% %          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx./2 topy], [], [0 8], 1, 1, 1, [], [], [], [];
% %          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx./2 topy], [], [0 8], 1, 1, 1, [], [], [], [];
% %          
% %          1.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx.*3/2 topy], [], [0 8], 1, 1, 1, [], [], [], [];
% %          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx.*3/2 topy], [], [0 8], 1, 1, 1, [], [], [], [];
% %          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx.*3/2 topy], [], [0 8], 1, 1, 1, [], [], [], [];
% %          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx.*3/2 topy], [], [0 8], 1, 1, 1, [], [], [], [];
% %          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx.*3/2 topy], [], [0 8], 1, 1, 1, [], [], [], [];
% %          
% %          1.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx./2 topy], [], [0 8], 1, 1, 1, [], [], [], [];
% %          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx./2 topy], [], [0 8], 1, 1, 1, [], [], [], [];
% %          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx./2 topy], [], [0 8], 1, 1, 1, [], [], [], [];
% %          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx./2 topy], [], [0 8], 1, 1, 1, [], [], [], [];
% %          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx./2 topy], [], [0 8], 1, 1, 1, [], [], [], [];
% %          
% %          1.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx.*3/2 topy], [], [0 8], 1, 1, 1, [], [], [], [];
% %          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx.*3/2 topy], [], [0 8], 1, 1, 1, [], [], [], [];
% %          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx.*3/2 topy], [], [0 8], 1, 1, 1, [], [], [], [];
% %          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx.*3/2 topy], [], [0 8], 1, 1, 1, [], [], [], [];
% %          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx.*3/2 topy], [], [0 8], 1, 1, 1, [], [], [], [];
% %          
%          3.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./8 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./8, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*3/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*3/16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*4/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*4/16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*5/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*5/16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*6/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*6/16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*7/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*7/16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*8/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          3.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./8 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./8, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*3/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*3/16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*4/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*4/16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*5/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*5/16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*6/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*6/16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*7/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*7/16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*8/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          3.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./8 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./8, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*3/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*3/16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*4/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*4/16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*5/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*5/16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*6/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*6/16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*7/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*7/16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*8/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          3.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_LEGATO, [width./2, topy], [], [0 0], 1, 1, 1, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./8 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./8, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*3/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*3/16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*4/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*4/16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*5/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*5/16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*6/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*6/16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*7/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*7/16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*8/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          3.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./8 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./8, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*3/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*3/16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*4/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*4/16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*5/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*5/16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*6/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*6/16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*7/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*7/16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*8/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          3.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./8 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./8, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*3/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*3/16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*4/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*4/16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*5/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*5/16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*6/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*6/16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*7/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*7/16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*8/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          3.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./8 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./8, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*3/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*3/16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*4/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*4/16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*5/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*5/16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*6/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*6/16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*7/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*7/16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*8/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          3.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./8 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./8, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*3/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*3/16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*4/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*4/16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*5/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*5/16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*6/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*6/16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*7/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*7/16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*8/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          3.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./8 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./8, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*3/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*3/16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*4/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*4/16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*5/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*5/16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*6/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*6/16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*7/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*7/16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*8/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          3.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./8 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./8, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*3/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*3/16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*4/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*4/16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*5/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*5/16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*6/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*6/16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*7/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*7/16, topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*8/16 topy], [], [0 8], 1, 1, 2, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*8/16, topy], [], [0 8], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*7/16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*7/16, topy], [], [0 8], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*6/16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*6/16, topy], [], [0 8], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*5/16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*5/16, topy], [], [0 8], 1, 1, 1, [], [], [], [];    
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*4/16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*4/16, topy], [], [0 8], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*3/16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*3/16, topy], [], [0 8], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./8 topy], [], [0 8], 1, 1, 1, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./8, topy], [], [0 8], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
%          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./16, topy], [], [0 8], 1, 1, 1, [], [], [], [];
%          
%          
         3.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./16, topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./8 topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./8, topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*3/16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*3/16, topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*4/16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*4/16, topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*5/16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*5/16, topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*6/16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*6/16, topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*7/16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*7/16, topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*8/16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*8/16, topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*7/16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*7/16, topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*6/16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*6/16, topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*5/16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*5/16, topy], [], [0 8], 1, 1, 1, [], [], [], [];    
         0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*4/16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*4/16, topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*3/16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*3/16, topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./8 topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./8, topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
         0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./16, topy], [], [0 8], 1, 1, 1, [], [], [], [];
%          
%                   3.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
% %          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./16, topy], [], [0 8], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./8 topy], [], [0 8], 1, 1, 1, [], [], [], [];
% %          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./8, topy], [], [0 8], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*3/16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
% %          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*3/16, topy], [], [0 8], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*4/16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
% %          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*4/16, topy], [], [0 8], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*5/16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
% %          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*5/16, topy], [], [0 8], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*6/16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
% %          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*6/16, topy], [], [0 8], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*7/16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
% %          0.0,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*7/16, topy], [], [0 8], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*8/16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
% %          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*8/16, topy], [], [0 8], 1, 1, 1, [], [], [], [];
% %          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*7/16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*7/16, topy], [], [0 8], 1, 1, 1, [], [], [], [];
% %          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*6/16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*6/16, topy], [], [0 8], 1, 1, 1, [], [], [], [];
% %          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*5/16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*5/16, topy], [], [0 8], 1, 1, 1, [], [], [], [];    
% %          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*4/16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*4/16, topy], [], [0 8], 1, 1, 1, [], [], [], [];
% %          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width.*3/16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width.*3/16, topy], [], [0 8], 1, 1, 1, [], [], [], [];
% %          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./8 topy], [], [0 8], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./8, topy], [], [0 8], 1, 1, 1, [], [], [], [];
% %          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width./16 topy], [], [0 8], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [width-width./16, topy], [], [0 8], 1, 1, 1, [], [], [], [];
%          
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx.*3/8 topy], [], [0 8], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx./2 topy], [], [0 8], 1, 1, 1, [], [], [], [];
%          
%          
%          
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx.*3/2 topy], [0 200], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx.*3/2 topy], [0 200], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx.*3/2 topy], [0 200], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx.*3/2 topy], [0 200], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx.*3/2 topy], [0 200], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx./2 topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx.*3/2 topy], rand(1,2).*200, [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx.*3/2 topy], rand(1,2).*200, [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx.*3/2 topy], rand(1,2).*200, [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx.*3/2 topy], rand(1,2).*200, [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx.*3/2 topy], rand(1,2).*200, [], 1, 1, 1, [], [], [], [];
%          
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx./2 topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx./2 topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx./2 topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx./2 topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx./2 topy], [], [0 10], 1, 1, 1, [], [], [], [];
%           0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx./2 topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx.*3/2 topy], rand(1,2).*200, [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx.*3/2 topy], rand(1,2).*200, [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx.*3/2 topy], rand(1,2).*200, [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx.*3/2 topy], rand(1,2).*200, [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx.*3/2 topy], rand(1,2).*200, [], 1, 1, 1, [], [], [], [];
%          
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx.*3/2 topy], rand(1,2).*200, [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx.*3/2 topy], rand(1,2).*200, [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx.*3/2 topy], rand(1,2).*200, [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx.*3/2 topy], rand(1,2).*200, [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx.*3/2 topy], rand(1,2).*200, [], 1, 1, 1, [], [], [], [];
%          
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx.*3/2 topy], rand(1,2).*200, [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx.*3/2 topy], rand(1,2).*200, [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx.*3/2 topy], rand(1,2).*200, [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx.*3/2 topy], rand(1,2).*200, [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx.*3/2 topy], rand(1,2).*200, [], 1, 1, 1, [], [], [], [];
%          
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx.*3/2 topy], rand(1,2).*200, [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx.*3/2 topy], rand(1,2).*200, [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx.*3/2 topy], rand(1,2).*200, [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx.*3/2 topy], rand(1,2).*200, [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [midx.*3/2 topy], rand(1,2).*200, [], 1, 1, 1, [], [], [], [];
%          
% 
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          
%                   0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          
%                   0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%                   0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%                   0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%                   0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%                   0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%                   0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%                   0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%                   0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%                   0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%                   0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%                   0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%                   0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%                   0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [], 1, 1, 1, [], [], [], [];
%          
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          
%                   0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];         0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];         0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];         0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];         0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];         
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];
%          0.5,   TYPE_ENEMY_CRAFT,   ID_EC_STACCATO, [rand.*GAME_RESOLUTION(1) topy], [], [0 10], 1, 1, 1, [], [], [], [];


         };
     
[thisStageTimeTable thisStageActors] = stl_preprocessStage(stage);

[song freq] = readmidi2([GAME_PATH.MUSIC_RES 'MOTN2.mid']);
% song = 0;
% freq = 22500;
bkgMusicPlayer = audioplayer(song, freq);


