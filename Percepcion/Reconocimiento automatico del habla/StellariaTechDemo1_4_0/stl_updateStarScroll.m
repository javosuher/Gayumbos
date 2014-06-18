function stl_updateStarScroll()
% STL_UPDATESTARSCROLL - DRAWS AND CONSTANTLY UPDATES A STARRY SKY SCROLL
%
% Usage:
% ------
%   stl_updateStarScroll();
%
% Input:
% ------
%   None
%
% Output:
% ------
%   None
%
% Note:
% -----
%   This function, upon the first entry, plots the stars on the main game
%   figure. Then update this scroll once every time it is provoked. As such,
%   this function should always be called INSIDE a game loop. The speed of stars
%   is measured in pixels/second, so less frequent updates would make the
%   motion of the stars less fluent, but do not affect their speed.  
%
% Dependencies:
% -------------
%   stl_InitParam.m


global MainFigureHdl;
global MainAxesHdl;
global MainAxesSize;

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

global starScrollTimer;   % The time when this function was last executed
% persistent StarX;
% persistent StarY;

elapsedTimeSinceLastEntry = toc(starScrollTimer);


StarPosition = StarPosition + StarSpeed.*elapsedTimeSinceLastEntry;
StarPosition2 = StarPosition2 + StarSpeed2.*elapsedTimeSinceLastEntry;
StarPosition(:, 2) = mod(StarPosition(:, 2),  MainAxesSize(2));
StarPosition2(:, 2) = mod(StarPosition2(:, 2),  MainAxesSize(2));
%     StarPosition(StarPosition(:, 2)>MainAxesSize(2), 2) -  MainAxesSize(2);
% StarPosition(StarPosition(:, 2)>MainAxesSize(2), 2) = ...
%     StarPosition(StarPosition(:, 2)>MainAxesSize(2), 2) -  MainAxesSize(2);
% StarPosition(StarPosition(:, 2)<1, 2) = ...
%     StarPosition(StarPosition(:, 2)<1, 2) +  MainAxesSize(2);

StarX = StarPosition(:,1);
StarY = StarPosition(:,2);

StarX2 = StarPosition2(:,1);
StarY2 = StarPosition2(:,2);

refreshdata(starPlotHdl, 'caller');
refreshdata(starPlotHdl2, 'caller');

starScrollTimer = tic;