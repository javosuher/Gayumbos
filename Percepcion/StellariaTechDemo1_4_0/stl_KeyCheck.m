function stl_KeyCheck(varargin)

global SpaceKeyPressed;

key = get(gcbf,'CurrentKey');

if strcmp(key, 'space') & SpaceKeyPressed
    SpaceKeyPressed = 1;
else
    SpaceKeyPressed = 0;
end
% disp(key);