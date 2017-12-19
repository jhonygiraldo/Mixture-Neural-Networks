function [error confusion parametros] = trainingSVM(trainingSet,testSet,salidasTrainingSet,salidasTestSet,cost,gamma)
parametros = [];
cont = 1;
for(i=1:size(cost,2))
    for(j=1:size(gamma,2))
        parametros(cont,:) = [gamma(j) cost(i)];
        cont = cont + 1;
    end
end
parfor(i=1:size(parametros,1))
    i
    options = ['-s 0 -t 2 -g',' ',num2str(parametros(i,1)),' -c',' ',num2str(parametros(i,2)),' -b ','1',' -q'];
    Y = salidasTrainingSet;
    X = trainingSet;
    modelo = svmtrain(Y,X,options);
    options = ['-b ','1',' -q'];
    [salidasSVM , accuracy , probabilidad] = svmpredict(salidasTestSet,testSet,modelo,options);
    error(i,1) = (sum(salidasSVM ~= salidasTestSet))/(size(testSet,1));
    confusion{i,1} = confusionmat(salidasTestSet,salidasSVM);
end