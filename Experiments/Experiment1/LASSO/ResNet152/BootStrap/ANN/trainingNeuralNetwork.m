function [error confusion] = trainingNeuralNetwork(trainingSet,testSet,salidasTrainingSet,salidasTestSet,vectorNeurons)
numTraining = size(vectorNeurons,2);
confusion = cell(numTraining,1);
error = zeros(numTraining,1);
salidasTrainingSetRed = zeros(size(salidasTrainingSet,1),max(salidasTrainingSet));
for(i=1:size(salidasTrainingSet,1))
    salidasTrainingSetRed(i,salidasTrainingSet(i)) = 1;
end
parfor(i=1:numTraining)
    net = patternnet(vectorNeurons(:,i)');
    net = train(net,trainingSet',salidasTrainingSetRed');
    salidasRed = net(testSet');
    [dummy, salidasRed] = max(salidasRed', [], 2);
    error(i) = (sum(salidasRed ~= salidasTestSet))/(size(testSet,1));
    confusion{i,1} = confusionmat(salidasTestSet,salidasRed);
end