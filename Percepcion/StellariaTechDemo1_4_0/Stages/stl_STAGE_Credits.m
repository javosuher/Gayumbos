function bkgMusicPlayer = stl_STAGE_Credits
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

textScrollFadeTime = [1.5 1.5];

NameFont = 25;
JobFont = 17;
SmallFont = 12;
BigFont = 32;
textScrollSpeed = [0 -30];
textLifeTime = 9;
timeJob2Name = 1;

%% The Main Stage Description Array
stage = {

    3,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed, [],   'Credits',  'Times New Roman', 40, [1 1 1], textScrollFadeTime, textLifeTime, [];
    3,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed, [],   'Programming',  'Vivaldi', JobFont, [1 1 1], textScrollFadeTime, textLifeTime,  [];
    1,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed, [],   'Mingjing Zhang',  'Times New Roman', NameFont, [1 1 1],textScrollFadeTime, textLifeTime,  [];
    3,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed, [],   'Graphics',  'Vivaldi', JobFont, [1 1 1], textScrollFadeTime, textLifeTime,  [];
    1,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed, [],   'Hamukorosama',  'Times New Roman', NameFont, [1 1 1],textScrollFadeTime, textLifeTime,  [];
    1,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed, [],   'Mingjing Zhang',  'Times New Roman', NameFont, [1 1 1],textScrollFadeTime, textLifeTime,  [];
    
     
    3,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed, [],   'Music',  'Vivaldi', JobFont, [1 1 1], textScrollFadeTime, textLifeTime,  []; 
    1,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed, [],   'Shi Jin',  'Times New Roman', NameFont, [1 1 1],textScrollFadeTime, textLifeTime,  [];
    
    3,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed, [],   'Special Thanks To',  'Vivaldi', JobFont, [1 1 1], textScrollFadeTime, textLifeTime,  [];
    1,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed, [],   'Kenneth Adams, Jr.',  'Times New Roman', NameFont, [1 1 1],textScrollFadeTime, textLifeTime,  [];
    0.5,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed, [],   '(for a fabulous midi synthesizer)',  'Times New Roman', SmallFont, [1 1 1],textScrollFadeTime, textLifeTime,  [];
    1.5,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed, [],   'Ryan Kinnett',  'Times New Roman', NameFont, [1 1 1],textScrollFadeTime, textLifeTime,  [];
    0.5,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed, [],   '(for the keyboard processing technique)',  'Times New Roman', SmallFont, [1 1 1],textScrollFadeTime, textLifeTime,  [];
    1.5,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed, [],   'David Buckingham',  'Times New Roman', NameFont, [1 1 1],textScrollFadeTime, textLifeTime,  [];
    0.5,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed, [],   '(for the double-plot scrolling technique)',  'Times New Roman', SmallFont, [1 1 1],textScrollFadeTime, textLifeTime,  [];
    1.5,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed, [],   'Huang Jun',  'Times New Roman', NameFont, [1 1 1],textScrollFadeTime, textLifeTime,  [];
    0.5,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed, [],   '(for his invaluable comments on stage design)',  'Times New Roman', SmallFont, [1 1 1],textScrollFadeTime, textLifeTime,  [];
    1.5,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed, [],   'Curtis L. Baker, Jr.',  'Times New Roman', NameFont, [1 1 1],textScrollFadeTime, textLifeTime,  [];
    0.5,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed, [],   '(for various programming tips)',  'Times New Roman', SmallFont, [1 1 1],textScrollFadeTime, textLifeTime,  [];
    1.5,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed, [],   'Yifeng Zhou',  'Times New Roman', NameFont, [1 1 1],textScrollFadeTime, textLifeTime,  [];
    0.5,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed, [],   '(for granting me enough spare time to finish this game)',  'Times New Roman', SmallFont, [1 1 1],textScrollFadeTime, textLifeTime,  [];
    1.5,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed, [],   'AND',  'Times New Roman', NameFont, [1 1 1],textScrollFadeTime, textLifeTime,  [];
    1.5,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed, [],   'Zora',  'Times New Roman', NameFont, [1 1 1],textScrollFadeTime, textLifeTime,  [];
    0.5,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed, [],   '(for encouraging me all the time)',  'Times New Roman', SmallFont, [1 1 1],textScrollFadeTime, textLifeTime,  [];
%     1.5,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed, [],   'Williams Wu',  'Times New Roman', NameFont, [1 1 1],textScrollFadeTime, textLifeTime,  [];
%     0.5,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed, [],   '(for his kind help in debugging the game)',  'Times New Roman', SmallFont, [1 1 1],textScrollFadeTime, textLifeTime,  [];
    3,   TYPE_NEUTRAL_PICT,  ID_CHN_TITLE,     [midx bottomy.*15/16],        textScrollSpeed, [],   1, 1, 1, [], textScrollFadeTime, textLifeTime,  [];
    2,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed, [],   'is a trademark of Stellari Studio',  'Times New Roman', JobFont, [1 1 1],textScrollFadeTime, textLifeTime,  [];
    
    2,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed,   [],   'Most graphical materials used in ',  'Times New Roman', SmallFont, [1 1 1],textScrollFadeTime, textLifeTime,  [];
    0.5,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed, [],   'this game could be found at',  'Times New Roman', SmallFont, [1 1 1],textScrollFadeTime, textLifeTime,  [];
    0.5,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed, [],   'http://homepage2.nifty.com/hamcorossam (Japanese)',  'Times New Roman', SmallFont, [1 1 1],textScrollFadeTime, textLifeTime,  [];
    0.5,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed, [],   'and are the property of the original author Hamukorosama',  'Times New Roman', SmallFont, [1 1 1],textScrollFadeTime, textLifeTime,  [];
    
%     2,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed, [],   '"Melody of the night" #11, #2, and #8',  'Times New Roman', JobFont, [1 1 1],textScrollFadeTime, textLifeTime,  [];
    
    2,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed,   [],   'All music ("Melody of the night" #11, #2, and #8) ',  'Times New Roman', SmallFont, [1 1 1],textScrollFadeTime, textLifeTime,  [];
    0.5,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed, [],   'are available at ',  'Times New Roman', SmallFont, [1 1 1],textScrollFadeTime, textLifeTime,  [];
    0.5,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed, [],   'http://blog.sina.com.cn/sjhome (Chinese)',  'Times New Roman', SmallFont, [1 1 1],textScrollFadeTime, textLifeTime,  [];
    0.5,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed, [],   'and are the property of the original author Shi Jin',  'Times New Roman', SmallFont, [1 1 1],textScrollFadeTime, textLifeTime,  [];
    
    2,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed,   [],   'The midi synthesizer (written by Kenneth Adams, Jr.)',  'Times New Roman', SmallFont, [1 1 1],textScrollFadeTime, textLifeTime,  [];
    0.5,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed, [],   'is available at ',  'Times New Roman', SmallFont, [1 1 1],textScrollFadeTime, textLifeTime,  [];
    0.5,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed, [],   'http://www.prism.gatech.edu/~kadams6/matlab.shtml (English)',  'Times New Roman', SmallFont, [1 1 1],textScrollFadeTime, textLifeTime,  [];
    
%     2,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed,   [],   'The author of this game was highly depressed.',  'Times New Roman', SmallFont, [1 0 0],textScrollFadeTime, textLifeTime,  [];
%     0.5,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed,   [],   'By the time you play this game, he will probably be dead.',  'Times New Roman', SmallFont, [1 0 0],textScrollFadeTime, textLifeTime,  [];  
%     2,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed,   [],   'Please do not follow his example.',  'Times New Roman', JobFont, [1 1 0],textScrollFadeTime, textLifeTime,  [];
%     1,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed,   [],   'Live well. Laugh Often. Love Much',  'Times New Roman', NameFont, [1 1 1],textScrollFadeTime, textLifeTime,  [];
    
     2,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed,   [],   'Send your questions, suggestions, comments or complaints to',  'Times New Roman', SmallFont, [1 0 0],textScrollFadeTime, textLifeTime,  [];
    0.5,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed,   [],   'matthiaszhang@yahoo.com',  'Times New Roman', JobFont, [1 1 1],textScrollFadeTime, textLifeTime,  []; 
    0.5,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed,   [],   'I will write back as soon as possible',  'Times New Roman', SmallFont, [1 0 0],textScrollFadeTime, textLifeTime,  [];  
%     0.5,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed,   [],   'If I am still alive',  'Times New Roman', SmallFont, [1 0 0],textScrollFadeTime, textLifeTime,  [];  
    
    3,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed, [],   'We are like the stars',  'Times New Roman', 15, [1 1 1],textScrollFadeTime, textLifeTime,  [];
    1,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed, [],   'glistening in the dark universe',  'Times New Roman', 15, [1 1 1],textScrollFadeTime, textLifeTime,  [];
    1,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed, [],   'not knowing where our future lies',  'Times New Roman', 15, [1 1 1],textScrollFadeTime, textLifeTime,  [];
    1,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed, [],   'One day',  'Times New Roman', 15, [1 1 1],textScrollFadeTime, textLifeTime,  [];
    1,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed, [],   'We would all fade away',  'Times New Roman', 15, [1 1 1],textScrollFadeTime, textLifeTime,  [];
    1,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed, [],   'just like the stars',  'Times New Roman', 15, [1 1 1],textScrollFadeTime, textLifeTime,  [];
    1,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed, [],   'at least you could remember',  'Times New Roman', 15, [1 1 1],textScrollFadeTime, textLifeTime,  [];
    1,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed, [],   'somebody has ever cared about you',  'Times New Roman', 15, [1 1 1],textScrollFadeTime, textLifeTime,  [];
    1,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed, [],   'even though he is no more',  'Times New Roman', 15, [1 1 1],textScrollFadeTime, textLifeTime,  [];
   
    3,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed, [],   'Thanks for playing',  'Times New Roman', 20, [1 1 1],textScrollFadeTime, textLifeTime,  [];
    1,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed, [],   'and',  'Times New Roman', 15, [1 1 1],textScrollFadeTime, textLifeTime,  [];
    1,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed, [],   'Thanks for supporting MATLAB games',  'Times New Roman', 20, [1 1 1],textScrollFadeTime, textLifeTime,  [];
    
    6,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed, [],   'Brought to you by',  'Times New Roman', JobFont, [1 1 1],textScrollFadeTime, inf,  [midx midy-30];    
    1,   TYPE_NEUTRAL_TEXT,  ID_TEXT_PROLOGUE, [midx bottomy.*15/16],        textScrollSpeed, [],   'Stellari Studio',  'Times New Roman', BigFont, [1 1 1],textScrollFadeTime, inf,  [midx midy];    
};
     
[thisStageTimeTable thisStageActors] = stl_preprocessStage(stage);

[song freq] = readmidi2([GAME_PATH.MUSIC_RES 'MOTN8.mid']);

bkgMusicPlayer = audioplayer(song, freq);

SPECIAL_FLAG.HIDE_PLAYER = [true true];