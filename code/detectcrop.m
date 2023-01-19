clear all
clc
load('faster11layers.mat');
load('model500images.mat');
imds = imageDatastore('C:\Users\HP\Desktop\Second step Pocessed videos\VID-20210407-WA0000\Sadness','IncludeSubfolders',true,'LabelSource','foldernames');
%%
k= 1;
for i=1:numel(imds.Files)
i
    img=[imds.Files(i)];
   a = imread(char(img));
  [bbox, score, label] = detect(rcnn1, a, 'MiniBatchSize', 64);
 avg = mean(mean(bbox(:,:)));
  if  avg > 1
 
c = imcrop(a,bbox(1,1:4));
d = imresize(c,[299 299]);
imshow(d)
k=k+1;
str=strcat('C:\Users\HP\Desktop\Second step Pocessed videos\VID-20210407-WA0000\Sadness Crop/img-',int2str(k),'.jpg');
       imwrite(d,str,'jpg');

  end
 end
