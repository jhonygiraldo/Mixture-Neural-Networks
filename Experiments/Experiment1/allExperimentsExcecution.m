clear all, close all, clc;
savePath = 'savesAllExperimentsExcecution/';
mainPath = 'C:/Users/Jhony/Desktop/ResultadosOptimistasYnoOptimistas/optimistas/Experiment1/';
networksNames = {'GoogLeNet', 'ResNet50', 'ResNet101', 'ResNet152'};
load([savePath 'i.mat']);
load([savePath 'j.mat']);
inicioI = i;
inicioJ = j;
for(i=inicioI:size(networksNames,2))
    save([savePath 'i.mat'],'i');
    classifiersPath = [networksNames{i} '/BootStrap/'];
    classifiersFolder = dir(classifiersPath);
    for(j=inicioJ:size(classifiersFolder,1)-2)
       save([savePath 'j.mat'],'j');
       classifierPath = [classifiersPath, classifiersFolder(j+2).name '/'];
       save([savePath 'workspace.mat']);
       completePath = [mainPath, classifierPath];
       cd(completePath);
       main
       clear all;
       load(['C:/Users/Jhony/Desktop/ResultadosOptimistasYnoOptimistas/optimistas/Experiment1/savesAllExperimentsExcecution/workspace.mat']);
       cd(mainPath);
    end
    inicioJ = 1;
    save([savePath 'j.mat'],'j');
end