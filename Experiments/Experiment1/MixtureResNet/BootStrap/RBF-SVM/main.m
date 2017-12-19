clear all, close all, clc;
redes = {'ResNet50', 'ResNet101', 'ResNet152'};
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