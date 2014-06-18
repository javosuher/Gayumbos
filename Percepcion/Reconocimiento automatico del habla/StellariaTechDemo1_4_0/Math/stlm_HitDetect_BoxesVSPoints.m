function [hit_flag, hit_index, num_hits] = stlm_HitDetect_BoxesVSPoints(boxes1, points2)
% stlm_HitDetect_BoxVSPoints - Detect collision between a group of BOXES and a group of POINTS (Row Version)
% ** This function is part of the STeLlari Mathematics library **
% -- Usage --
%   [hit_flag, hit_index, num_hits] = stlm_HitDetect_BoxesVSPoints(boxes1, points2)
% 
% -- Input --
%   boxes1:      a Nb x 4 BOXes array where each row is constructed in the following format: [lefttopx lefttopy
%               rightbottomx, rightbottomy];
%   points2:     a Np x 2 POINTS array where each row is constructed in the
%                following format: [x y];
%
% -- Output --
%   hit_flag:   a Nb x 1 logical array where each element represents whether 
%               the corresponding row in boxes1 collides with any of the rows in points2 (true)
%               or not (false). [logical]
%   hit_index:  an Nb x Np logical indexing array where each row denotes
%               one box, and each element in a row indicates whether the corresponding
%               bullet with this box (true) or not (false). [logical]
%   num_hits:   (Currently Unused) Nb x 1 logical array where each element represents
%               how many times each boxes are hit. [double]
%
% -----------
% Note:
%   the elements in a BOX/POINT indicate PIXELS rather than the SPACE BETWEEN
%   PIXELS. Therefore, [5 5 10 10] and [10 10] are deemed to
%   intersect since they share a common pixel (10 10);
%
% See Also: stlm_HitDetect_BoxesVSBoxes
%
% ** Brought to you by Stellari Studio **

% Update History:
% -------------------------------------------------------------------------
% Date                  Updater                     Modification
% ----------            --------------              -------------------
% 01/31/2011            Mingjing Zhang              Wrote it
% ... 
% ----------            --------------              -------------------
% -------------------------------------------------------------------------

%% Initialize Temporary Arrays
n_boxes = size(boxes1, 1);                   % Number of boxes
n_points = size(points2, 1);                 % Number of Points
% hit_index = logical(zeros(1, n_boxes));     % Create the hit_index
box_expand_index = zeros(n_points, 1);

hit_flag = zeros(n_boxes, 1);
hit_index = false(n_boxes, n_points);

%% Calculate the intersections
for i = 1:n_boxes   % Assuming there are more bullets than boxes in most situations
    hit_temp = boxes1(box_expand_index + i, :) - points2(:, [1 2 1 2]);
    hit_temp(:, [1 2]) = -hit_temp(:, [1 2]);
    hit_index(i, :) = all(hit_temp>=0, 2);
    hit_flag(i) = any(hit_index(i, :));
%     num_hits = 0;
end

num_hits = 0;