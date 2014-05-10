function [hit_flag, hit_index, num_hits] = stlm_HitDetect_BoxVSBoxes(box1, boxes2)
% stlm_HitDetect_BoxVSBoxes - Detect collision between a BOX and a group of BOXES (Row Version)
% ** This function is part of the STeLlari Mathematics library **
% -- Usage --
%   [hit_flag, hit_index, num_hits] = stlm_HitDetect_BoxVSBoxes(box1, boxes2);
% 
% -- Input --
%   box1:       a 1 x 4 BOX array in the following format: [lefttopx lefttopy
%               rightbottomx, rightbottomy];
%   boxes2:     a N x 4 BOXes array.
%
% -- Output --
%   hit_flag:   whether BOX1 collides with any of the rows in BOXES2 (true)
%               or not (false). [logical]
%   hit_index:  an 1 x N logical indexing array where each element denote
%               whether the corresponding row of boxes2 intersects with
%               box1 (true) or not (false). [logical]
%   num_hits:   (Currently Unused)how many boxes in boxes2 collide with box1. 
%               [double]
%
% -----------
% Note:
%   the elements in a BOX indicate PIXELS rather than the SPACE BETWEEN
%   PIXELS. Therefore, [5 5 10 10] and [10 10 15 15] are deemed to
%   intersect since they share a common pixel (10 10);
%
% See Also: stlm_HitDetect_BoxesVSBoxes_Row, stlm_HitDetect_LinesVSBoxes_Row
%
% ** Brought to you by Stellari Studio **

% Update History:
% -------------------------------------------------------------------------
% Date                  Updater                     Modification
% ----------            --------------              -------------------
% 01/30/2011            Mingjing Zhang              Wrote it
% ... 
% ----------            --------------              -------------------
% -------------------------------------------------------------------------

%% Initialize Temporary Arrays
n_boxes = size(boxes2, 1);                   % Number of rows in boxes2
if isempty(box1) || isempty(boxes2)
    hit_flag = false;
    hit_index = [];
    num_hits = 0;
    return;
end
% hit_index = logical(zeros(1, n_boxes));     % Create the hit_index
hit_temp = boxes2;                          % The temporary array used for matrix manipulation

hit_temp(:, 1) = min(box1(:, 1), boxes2(:, 1));     % Initiate the temporary array
hit_temp(:, 2) = min(box1(:, 2), boxes2(:, 2));
hit_temp(:, 3) = max(box1(:, 3), boxes2(:, 3));
hit_temp(:, 4) = max(box1(:, 4), boxes2(:, 4));

%% Get the width and length for the 'bounding boxes ' in the temporary array
dim_temp = (hit_temp(:, [3 4]) - hit_temp(:, [1 2]));

dim_boxes2 = (boxes2(:, [3 4]) - boxes2(:, [1 2]));
dim_box1 = box1(1,[3 4]) - box1(1,[1 2]);

dim_boxes2(:,1) = dim_boxes2(:,1) + dim_box1(:, 1);
dim_boxes2(:,2) = dim_boxes2(:,2) + dim_box1(:, 2);

%% if the size of any bounding box is so small that it won't allow two boxes
%% to exist in it unoverlapped, then these two boxes MUST BE OVERLAPPED.
hit_index = all((dim_temp - dim_boxes2) <= 0, 2);
hit_flag = any(hit_index);
num_hits = 0;           % num_hits currently unused.


