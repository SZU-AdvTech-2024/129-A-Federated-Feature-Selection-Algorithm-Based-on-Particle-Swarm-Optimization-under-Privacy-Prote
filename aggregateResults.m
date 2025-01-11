function [globalBestFeatures, globalBestAccuracy] = aggregateResults(localFeatures, localAccuracies)
    [globalBestAccuracy, idx] = max(localAccuracies);
    globalBestFeatures = localFeatures{idx};
end
