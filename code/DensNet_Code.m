imds = imageDatastore('G:\Khalid Code updated\Khalid updated Dataset\3. Augment with 30%\Augmented Dataset with 331 331 from 30%data','IncludeSubfolders',true,'LabelSource','foldernames');
[imdsTrain,imdsValidation] = splitEachLabel(imds,0.7,'randomized');
%%
net =  densnet

%%
layer = 'predictions';
%%
k=1;
for i=55001: 70717
     a=[imdsTrain.Files(i)];
     a = imread(char(a));
featuresTrain(k,:) = activations(net,a,layer,'OutputAs','rows');
k=k+1;
i
end
%%
for i=1:numel(imdsValidation.Files)
     a=[imdsValidation.Files(i)];
     a = imread(char(a));
featuresTest1(i,:) = activations(net,a,layer,'OutputAs','rows');

i
end
%%

NoTrain = 70717
NoTest = 30306
T1 = readtable('nn.xlsx');
tableTrain = table(T1(1:NoTrain,1:1000),categorical(imdsTrain.Labels(1:NoTrain,1)))
%%
T2 = readtable('nntest.xlsx');
tableTest = table(T2(1:NoTest,1:1000),categorical(imdsValidation.Labels(1:NoTest,1)))
%%
t1 = table(categorical(imdsTrain.Labels(1:NoTrain,1)));
tt = [tableTrain.Var1(1:NoTrain,:),t1];
%%
t2 = table(categorical(imdsValidation.Labels(1:NoTest,1)));
ttt = [T2,t2];
%%

numFeatures = 1000;
numClasses = 7;
 
layers = [
    featureInputLayer(numFeatures,'Normalization', 'zscore')
    fullyConnectedLayer(50)
    batchNormalizationLayer
    reluLayer
    fullyConnectedLayer(numClasses)
    softmaxLayer
    classificationLayer];
% layers = [
%     featureInputLayer(numFeatures,'Normalization', 'zscore')
%     fullyConnectedLayer(numClasses)
%     softmaxLayer
%     classificationLayer];
miniBatchSize = 512;

options = trainingOptions('adam', ...
    'MiniBatchSize',miniBatchSize, ...
    'Shuffle','every-epoch', ...
    'ValidationData',ttt, ...
    'Plots','training-progress', ...
    'Verbose',false);
%%
net = trainNetwork(tt,layers,options);
%%
Y_Pred  = classify(net,featuresTest)
%%
plotconfusion(Y_Pred,categorical(imdsValidation.Labels))