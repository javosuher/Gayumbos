function [thisStageTimeTable thisStageActors] = stl_preprocessStage(thisStage)

global DefaultEnemyStructs;
global DefaultNeutralObjectStructs;
global emptyEnemyStruct;
global STAGE_COLUMNS;
global STAGE_COL_SEC2FRAME_CONV;
global STAGE_NEUTRAL_COL_SEC2FRAME_CONV
global STAGE_COLUMNS_TEXT
global STAGE_COLUMNS_PICT
global FRAME_DURATION;
global FPS;

%% Enemy Types and IDS
global TYPE_ENEMY_CRAFT
global ID_EC_STACCATO
global TYPE_NEUTRAL_PICT
global TYPE_NEUTRAL_TEXT

[nEntries nCols]= size(thisStage);

thisStageTimeTable = zeros(nEntries, 1);
thisStageActors = repmat(emptyEnemyStruct, 1, nEntries);  

for i = 1:nEntries
    thisStageTimeTable(i) = thisStage{i, 1} .* FPS;
    if i >= 2
        thisStageTimeTable(i) = thisStageTimeTable(i-1) + thisStageTimeTable(i);
    end
    if thisStage{i, 2} == TYPE_ENEMY_CRAFT
        % Copy the default enemy struct
        thisStageActors(i) = DefaultEnemyStructs(thisStage{i, 3});
    elseif thisStage{i, 2} == TYPE_NEUTRAL_PICT || thisStage{i, 2} == TYPE_NEUTRAL_TEXT
        thisStageActors(i) = DefaultNeutralObjectStructs(thisStage{i, 3});
    else
        errmsg = sprintf('stl_preprocessStage(): Unrecognizable Object Type %d in line %d', thisStage{i, 2}, i);
        error(errmsg);
    end
    for iCol = 4:nCols
        
       
        if ~isempty(thisStage{i, iCol})

            if thisStage{i, 2} == TYPE_ENEMY_CRAFT 
                if STAGE_COL_SEC2FRAME_CONV(iCol) == -1
                    thisStage{i, iCol} = thisStage{i, iCol} .* FRAME_DURATION;
                elseif STAGE_COL_SEC2FRAME_CONV(iCol) == 1
                    thisStage{i, iCol} = thisStage{i, iCol} .* FPS;
                end
                thisStageActors(i).(STAGE_COLUMNS{iCol}) = thisStage{i, iCol};
            else
                 if STAGE_NEUTRAL_COL_SEC2FRAME_CONV(iCol) == -1
                    thisStage{i, iCol} = thisStage{i, iCol} .* FRAME_DURATION;
                elseif STAGE_NEUTRAL_COL_SEC2FRAME_CONV(iCol) == 1
                    thisStage{i, iCol} = thisStage{i, iCol} .* FPS;
                end
                
                if thisStage{i, 2} == TYPE_NEUTRAL_PICT
                    thisStageActors(i).(STAGE_COLUMNS_PICT{iCol}) = thisStage{i, iCol};
                else
                    thisStageActors(i).(STAGE_COLUMNS_TEXT{iCol}) = thisStage{i, iCol};
                end
            end
            
        end
    end
end