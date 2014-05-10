function stl_enterImpromptuEnemies()
global numImpromptuEnemies
global queueImpromptuEnemies

if numImpromptuEnemies > 0
    [addedEnemyIndices, nEnemies] = stl_addToGlobalEnemies(queueImpromptuEnemies(1:numImpromptuEnemies));
    if nEnemies ~= numImpromptuEnemies
        error('STL_ENTERENEMIES(): Too many Impromptu Enemies.');
    end
    numImpromptuEnemies = 0;
end