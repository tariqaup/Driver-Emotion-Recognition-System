
imds = imageDatastore('C:\Users\HP\Desktop\Khalid Code\Khalid updated Dataset\New folder','IncludeSubfolders',true,'LabelSource','foldernames');

[imdsTrain,imdsValidation] = splitEachLabel(imds,0.7,'randomized');

%%
% Load the Transfer Learning CNN Model
 load('C:\Users\HP\Desktop\Khalid Code\Khalid updated Dataset/khalidCNN');
 
%%

%Select the Test images and save in Y_test
Y_test = imdsValidation.Labels;

%%

% optimzation techniques selection and hyperparamter selection
option = trainingOptions('adam', ...
    'MiniBatchSize',16, ...
    'MaxEpochs',10, ...
    'InitialLearnRate',1e-4, ...
    'Shuffle','every-epoch', ...
    'ValidationData',imdsValidation, ...
    'ValidationFrequency',3, ...
    'Verbose',false, ...
    'Plots','training-progress');

%%
%CNN model training
netTransfer = trainNetwork(imdsTrain,waleedCNN2,option);



%%
% CNN Model validation
YPred = classify(netTransfer,imdsValidation);

%%
%Performance evaluation of Deep Learning Trained Model
plotconfusion(Y_test,YPred),title('Confusion Matrix');
