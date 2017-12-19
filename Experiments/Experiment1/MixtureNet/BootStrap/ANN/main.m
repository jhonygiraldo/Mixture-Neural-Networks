clear all, close all, clc;
redes = {'GoogLeNet', 'ResNet50', 'ResNet101', 'ResNet152'};
featuresTestMix = [];
featuresTrainMix = [];
load(['../../../' redes{1} 'OutputsTest.mat'])
load(['../../../' redes{1} 'OutputsTrain.mat'])
for(i=1:size(redes,2))
    festuresTestAux = load(['../../../' redes{i} 'FeaturesTest.mat']);
    featuresTrainAux = load(['../../../' redes{i} 'FeaturesTrain.mat']);
    featuresTestMix = [featuresTestMix festuresTestAux.featuresTest];
    featuresTrainMix = [featuresTrainMix featuresTrainAux.featuresTrain];
end
featuresTrain = featuresTrainMix;
featuresTest = featuresTestMix;
mkdir('results');
tic;
errorMatriz = [];
stdMatriz = [];
confusionMatriz = {};
trainingSet = [featuresTrain outputsTrain];
testSet = [featuresTest outputsTest];
salidasTrainingSet = trainingSet(:,end);
salidasTestSet = testSet(:,end);
trainingSet(:,end) = [];
testSet(:,end) = [];
[trainingSet testSet] = zscoreNormalization(trainingSet,testSet);
hiddenLayers = 3;
maxNeurons = 100;
neurons = [1:1:maxNeurons];
for(i=1:hiddenLayers)
    i/hiddenLayers
    vectorNeuronas = [];
    for(j=1:i)
        vectorNeuronas = [vectorNeuronas;neurons];
    end
    [error confusionMatrizAux] = trainingNeuralNetwork(trainingSet,testSet,salidasTrainingSet,salidasTestSet,vectorNeuronas);
    errorMatriz = [errorMatriz,error];
    confusionMatriz = [confusionMatriz,confusionMatrizAux];
end
tiempo = toc;
save('results/errorMatriz.mat','errorMatriz');
save('results/confusionMatriz.mat','confusionMatriz');
save('results/tiempo.mat','tiempo');