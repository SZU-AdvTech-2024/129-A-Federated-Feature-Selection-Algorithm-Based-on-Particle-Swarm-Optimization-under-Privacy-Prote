function [globalBestFeatures, globalBestAccuracy] = FPSO_FS(data, labels, numParticipants, numParticles, maxGlobalIter, maxLocalIter)
    % FPSO-FS: Federated Particle Swarm Optimization for Feature Selection
    % Inputs:
    % data - Input dataset (rows: samples, cols: features)
    % labels - Ground truth labels
    % numParticipants - Number of participants (B-participants)
    % numParticles - Number of particles in each swarm
    % maxGlobalIter - Maximum global iterations
    % maxLocalIter - Maximum local iterations for each participant
    % Outputs:
    % globalBestFeatures - Global best feature subset (binary vector)
    % globalBestAccuracy - Classification accuracy for the global best subset

    [numSamples, numFeatures] = size(data);
    participantsData = splitData(data, labels, numParticipants);

    % Initialize global best
    globalBestFeatures = zeros(1, numFeatures);
    globalBestAccuracy = 0;

    % Global federated optimization loop
    for globalIter = 1:maxGlobalIter
        fprintf('Global Iteration %d/%d\n', globalIter, maxGlobalIter);
        
        % Step 1: Local optimization by each participant
        localBestFeatures = cell(numParticipants, 1);
        localBestAccuracies = zeros(numParticipants, 1);
        parfor i = 1:numParticipants
            [localBestFeatures{i}, localBestAccuracies(i)] = ...
                localPSO(participantsData{i}.data, participantsData{i}.labels, numParticles, maxLocalIter);
        end

        % Step 2: Aggregate results to find global best
        [globalBestFeatures, globalBestAccuracy] = aggregateResults(localBestFeatures, localBestAccuracies);

        % Broadcast global best to all participants (simulation)
        fprintf('Global Best Accuracy: %.4f\n', globalBestAccuracy);
    end
end
