clear all, close all, clc
load('confusionMatriz.mat');
load('errorMatriz.mat');
indx = find(errorMatriz == min(min(errorMatriz)));
confusion = confusionMatriz{indx(1)};
observedAccuracy = trace(confusion)/(sum(sum(confusion)));
marginalFrecuencies = [];
for(i=1:size(confusion,1))
    marginalFrecuencies(i) = (sum(confusion(i,:))*sum(confusion(:,i)))/sum(sum(confusion));
end
expectedAccuracy = sum(marginalFrecuencies)/sum(sum(confusion));
kappa = (observedAccuracy-expectedAccuracy)/(1-expectedAccuracy);
save('kappaIndx.mat','kappa');