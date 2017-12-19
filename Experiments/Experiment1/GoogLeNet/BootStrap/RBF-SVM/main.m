clear all, close all, clc;
red = 'GoogLeNet';
load(['../../../' red 'FeaturesTest.mat'])
load(['../../../' red 'FeaturesTrain.mat'])
load(['../../../' red 'OutputsTest.mat'])
load(['../../../' red 'OutputsTrain.mat'])
%%
mkdir('results');
tic
error = [];
cost = logspace(-3,5,7);
gamma = logspace(-3,5,7);
trainingSet = [featuresTrain outputsTrain];
testSet = [featuresTest outputsTest];
error = [];
confusionMatriz = [];
salidasTrainingSet = trainingSet(:,end);
salidasTestSet = testSet(:,end);
trainingSet(:,end) = [];
testSet(:,end) = [];
[trainingSet testSet] = zscoreNormalization(trainingSet,testSet);
[error confusionMatriz parametros] = trainingSVM(trainingSet,testSet,salidasTrainingSet,salidasTestSet,cost,gamma);
tiempo = toc;
save('results/errorMatriz.mat','error');
save('results/confusionMatriz.mat','confusionMatriz');
save('results/parametros.mat','parametros');
save('results/tiempo.mat','tiempo');