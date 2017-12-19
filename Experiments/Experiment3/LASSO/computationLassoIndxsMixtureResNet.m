clear all, close all, clc;
red = 'MixtureResNet';
redes = {'ResNet50', 'ResNet101', 'ResNet152'};
featuresTestMix = [];
featuresTrainMix = [];
load(['../' redes{1} 'OutputsTest.mat'])
load(['../' redes{1} 'OutputsTrain.mat'])
for(i=1:size(redes,2))
    festuresTestAux = load(['../' redes{i} 'FeaturesTest.mat']);
    featuresTrainAux = load(['../' redes{i} 'FeaturesTrain.mat']);
    featuresTestMix = [featuresTestMix festuresTestAux.featuresTest];
    featuresTrainMix = [featuresTrainMix featuresTrainAux.featuresTrain];
end
featuresTrain = featuresTrainMix;
featuresTest = featuresTestMix;
[B stats] = lasso(featuresTrain,outputsTrain,'CV',5);
Betas(:) = B(:,stats.IndexMinMSE) > 0;
indx = find(Betas > 0);
featuresTrain = featuresTrain(:,indx);
featuresTest = featuresTest(:,indx);
save([red 'FeaturesTrain.mat'],'featuresTrain');
save([red 'FeaturesTest.mat'],'featuresTest');
save([red 'OutputsTrain.mat'],'outputsTrain');
save([red 'OutputsTest.mat'],'outputsTest');
save([red 'indxLasso.mat'],'indx');