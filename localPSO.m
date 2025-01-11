function [localBestFeatures, localBestAccuracy] = localPSO(data, labels, numParticles, maxIter)
    % Local PSO for feature selection
    [numSamples, numFeatures] = size(data);
    swarm = rand(numParticles, numFeatures) > 0.5; % Binary representation
    velocities = rand(numParticles, numFeatures);
    localBestPositions = swarm;
    localBestScores = zeros(numParticles, 1);
    globalBestPosition = zeros(1, numFeatures);
    globalBestScore = -Inf;

    % Initialize swarm fitness
    for i = 1:numParticles
        score = evaluateFeatures(data, labels, swarm(i, :));
        localBestScores(i) = score;
        if score > globalBestScore
            globalBestScore = score;
            globalBestPosition = swarm(i, :);
        end
    end

    % PSO iterations
    for iter = 1:maxIter
        for i = 1:numParticles
            % Update velocity and position
            velocities(i, :) = updateVelocity(velocities(i, :), swarm(i, :), ...
                                              localBestPositions(i, :), globalBestPosition);
            swarm(i, :) = updatePosition(swarm(i, :), velocities(i, :));

            % Evaluate new position
            score = evaluateFeatures(data, labels, swarm(i, :));
            if score > localBestScores(i)
                localBestScores(i) = score;
                localBestPositions(i, :) = swarm(i, :);
            end
            if score > globalBestScore
                globalBestScore = score;
                globalBestPosition = swarm(i, :);
            end
        end
    end

    localBestFeatures = globalBestPosition;
    localBestAccuracy = globalBestScore;
end


function newVelocity = updateVelocity(velocity, position, localBest, globalBest)
    w = 0.5; c1 = 1.5; c2 = 1.5; % Hyperparameters
    r1 = rand(size(position));
    r2 = rand(size(position));
    newVelocity = w * velocity + c1 * r1 .* (localBest - position) + c2 * r2 .* (globalBest - position);
end

function newPosition = updatePosition(position, velocity)
    sigmoid = 1 ./ (1 + exp(-velocity));
    newPosition = rand(size(position)) < sigmoid;
end
