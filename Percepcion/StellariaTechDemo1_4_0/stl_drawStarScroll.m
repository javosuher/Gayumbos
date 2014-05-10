function stl_updateStarScroll()

global MainFigureHdl;
global MainAxesHdl;
global 

global StarDensity;         % The density of stars, in numbers/square pixel
global StarSpeed;           % The speed of stars, 1x2 array, in pixels/sec
global StarPosition;        % The positions of stars, 1x2 array

persistent lastEntryTime;   % The time when this function was last executed

