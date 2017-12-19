clear all, close all, clc;
redes = {'GoogLeNet', 'ResNet50', 'ResNet101', 'ResNet152'};
for(i=2:size(redes,2))
    i
    load(['../' redes{i} 'FeaturesTrain.mat']);
    load(['../' redes{i} 'FeaturesTest.mat']);
    load(['../' redes{i} 'OutputsTrain.mat'])
    load(['../' redes{i} 'OutputsTest.mat']);
    [B stats] = lasso(featuresTrain,outputsTrain,'CV',5);
    Betas(:) = B(:,stats.IndexMinMSE) > 0;
    indx = find(Betas > 0);
    featuresTrain = featuresTrain(:,indx);
    featuresTest = featuresTest(:,indx);
    save([redes{i} 'FeaturesTrain.mat'],'featuresTrain');
    save([redes{i} 'FeaturesTest.mat'],'featuresTest');
    save([redes{i} 'OutputsTrain.mat'],'outputsTrain');
    save([redes{i} 'OutputsTest.mat'],'outputsTest');
    save([redes{i} 'indxLasso.mat'],'indx');
    clear Betas;
    clear indx;
end