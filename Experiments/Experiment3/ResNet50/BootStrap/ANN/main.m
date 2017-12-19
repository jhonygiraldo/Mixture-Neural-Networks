clear all, close all, clc;
red = 'ResNet50';
load(['../../../' red 'FeaturesTest.mat'])
load(['../../../' red 'FeaturesTrain.mat'])
load(['../../../' red 'OutputsTest.mat'])
load(['../../../' red 'OutputsTrain.mat'])
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