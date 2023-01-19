
Var1 = gTruth.LabelData.Leaf; % selecting the ground truth
Var2 = gTruth.DataSource.Source;

%%
T1 = table(Var2,Var1);

%%
options = trainingOptions('sgdm', ...
  'MiniBatchSize', 4, ...
  'InitialLearnRate', 1e-6, ...
  'MaxEpochs', 1);

%%
rcnn1 = trainFasterRCNNObjectDetector(T1, F_RCNN, options, 'NegativeOverlapRange', [0 0.3]);

%%
    img = imread('C:\Users\zak03\Desktop\New folder\Early\img (2).jpg');
%     img = imresize(img,[350 350]);


[bbox, score, label] = detect(rcnn1, img, 'MiniBatchSize', 64);

%%
for i=1:numel(bbox(:,1))
    
bbox1 = bbox(i,:)

detectedImg = insertObjectAnnotation(img, 'rectangle', bbox1);
figure,
imshow(detectedImg);
end

%%
% Precision And Recall

TP = cm.NormalizedValues(1,1)
FP = cm.NormalizedValues(1,2)
FN = cm.NormalizedValues(2,1)
TN = cm.NormalizedValues(2,2)
Accuracy = ((TP+TN)/(TP+FP+FN+TN))*100
Recall = (TP/(TP+FN))
Precision = (TP/(TP+FP))
F_Measure = 2*((Precision*Recall)/(Precision+Recall))

%%


