function [error confusion] = trainingLinearSVM(trainingSet,testSet,salidasTrainingSet,salidasTestSet,cost)
parfor(i=1:size(cost,1))
    i
    options = ['-s 0 -t 0 -c ', num2str(cost(i)),' -b ', '1', ' -q'];
    Y = salidasTrainingSet;
    X = trainingSet;
    modelo = svmtrain(Y,X,options);
    options = ['-b ','1',' -q'];
    [salidasSVM , accuracy , probabilidad] = svmpredict(salidasTestSet,testSet,modelo,options);
    error(i,1) = (sum(salidasSVM ~= salidasTestSet))/(size(testSet,1));
    confusion{i,1} = confusionmat(salidasTestSet,salidasSVM);
end