function [hitFlag hitBoxIndices] = stl_pointInBoxes(points, boxes, exclu_point_indices, exclu_box_indices, point_or_box)
% STL_POINTINBOXES  - decide whether a group of points have intersections
% with a group of rectangles.
%
% Usage:
% [hitFlag hitBoxIndices] = stl_pointInBoxes(points, boxes, exclu_point_indices, exclu_box_indices, point_or_box)
%
% Input:
% ------
% point: an N x 2 matrix, with each row representing a point
% boxes: an M x 4 matrix, with each row representing a rectangle
% exclu_point_indices: the points needed to be excluded
% exclu_box_indices: the boxes needed to be excluded
% point_or_box: affects the output 'hitBoxIndices', see below.
%
% Output:
% -------
% hitFlag: true if any collision is detected, false otherwise
% hitBoxIndices: 
%    when point_or_box == 'point', hitBoxIndices is an 1 x N cell array 
%       where each element represents a point and its content is the indices of
%       boxes this point collides with
%    when point_or_box == 'box', hitBoxindices is an 1 X M cell array
%       where each element represents a box and its content is the indices
%       of points this box collides with
%
% Dependencies:
% -------------
% None
%
% --------------------- END OF HELP ---------------------------

% Update History
% --------------
% Updater               Date                    Modification
% -------               -----------             ------------
% M.Zhang               Oct.26, 2010            Original Code
%
%
%

% boxes(exclu_box_indices, :) = [];    % Delete the boxes to be excluded 
hitFlag = false;

%% Get the outer bounding box
box_bounding_box = [min(boxes(:,1:2)), max(boxes(:,3:4))];

point_bounding_box = [min(points) max(points)];

nPoints = size(points, 1);

nBoxes = size(boxes, 1);

%% Eliminate those points which are out of the bounding box for rectangles
point_determinant = [points-box_bounding_box(ones(1,nPoints),1:2), box_bounding_box(ones(1,nPoints), 3:4)-points]>=0;
point_in_bbox = (sum(point_determinant,2)==4);
point_in_bbox(exclu_point_indices) = false; % Eliminate those which the user requires not to processed

%% Eliminate those boxes which are out of the bounding box for points
box_determinant = [boxes(:,3:4)-point_bounding_box(ones(1,nBoxes),1:2), point_bounding_box(ones(1,nBoxes),3:4)-boxes(:,1:2)] >= 0;
box_in_pbox = (box_determinant(:,1) & box_determinant(:,2)) | ...
             (box_determinant(:,3) & box_determinant(:,4));
box_in_pbox(exclu_box_indices) = false;% Eliminate those which the user requires not to processed

pointsToDetect = find(point_in_bbox);
boxesToDetect = find(box_in_pbox);

% Decide whether the retval is 'POINTWISE' or 'BOXWISE'
if strcmpi(point_or_box, 'point')
    hitBoxIndices = cell(1, nPoints);
    for iPoint = pointsToDetect'    % Loop over every points. Transposition is NECESSARY
        point_expand = repmat(points(iPoint,:),[nBoxes 1]);
        point_determinant = [point_expand-boxes(:,1:2), boxes(:,3:4)-point_expand] >= 0;
        point_in_box = (sum(point_determinant,2)==4);
        point_in_box(exclu_box_indices) = false;
        if any(point_in_box)
            hitFlag = true;
        end
        hitBoxIndices{iPoint} = find(point_in_box);
    end
elseif strcmpi(point_or_box, 'box')
    hitBoxIndices = cell(1, nBoxes);
    for iBox = boxesToDetect'
        box_expand = repmat(boxes(iBox,:),[nPoints 1]);
        point_determinant = [points-box_expand(:,1:2), box_expand(:,3:4)-points] >= 0;
        point_in_box = (sum(point_determinant,2)==4);
        point_in_box(exclu_point_indices) = false;
        if any(point_in_box)
            hitFlag = true;
        end
        hitBoxIndices{iBox} = find(point_in_box);
    end
end
%         
