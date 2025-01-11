function participantsData = splitData(data, labels, numParticipants)
    % Split data into multiple subsets for federated participants
    numSamples = size(data, 1);
    indices = randperm(numSamples);
    splitSize = floor(numSamples / numParticipants);
    participantsData = cell(numParticipants, 1);
    for i = 1:numParticipants
        range = ((i-1)*splitSize + 1):min(i*splitSize, numSamples);
        participantsData{i}.data = data(indices(range), :);
        participantsData{i}.labels = labels(indices(range));
    end
end
