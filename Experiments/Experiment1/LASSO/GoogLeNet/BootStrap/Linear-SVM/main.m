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
cost = logspace(-6,-6,40);
cost = cost';
trainingSet = [featuresTrain outputsTrain];
testSet = [featuresTest outputsTest];
error = [];
confusionMatriz = [];
salidasTrainingSet = trainingSet(:,end);
salidasTestSet = testSet(:,end);
trainingSet(:,end) = [];
testSet(:,end) = [];
[trainingSet testSet] = zscoreNormalization(trainingSet,testSet);
[error confusionMatriz] = trainingLinearSVM(trainingSet,testSet,salidasTrainingSet,salidasTestSet,cost);
tiempo = toc;
save('results/errorMatriz.mat','error');
save('results/confusionMatriz.mat','confusionMatriz');
save('results/parametros.mat','cost');
save('results/tiempo.mat','tiempo');