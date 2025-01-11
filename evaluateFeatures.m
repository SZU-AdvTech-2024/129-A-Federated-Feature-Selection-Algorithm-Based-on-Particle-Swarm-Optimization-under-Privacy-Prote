function score = evaluateFeatures(data, labels, features)
    if sum(features) == 0
        score = 0; % No features selected
        return;
    end
    selectedData = data(:, features);
    model = fitcknn(selectedData, labels, 'NumNeighbors', 3); % KNN classifier
    cvModel = crossval(model, 'KFold', 5);
    score = 1 - kfoldLoss(cvModel); % Accuracy
end
