clear all;
clc;
videoFReader = vision.VideoFileReader('C:\Users\HP\Desktop\Videos and its frams (image dataset)\VID-20210407-WA0002.mp4');   %%C:\Users\HP\Desktop\Videos and its frams (image dataset) ////is used to take video path ///VID-20210407-WA0002  //// this is a video name
%  whos videoFReader
videoPlayer = vision.DeployableVideoPlayer;
%  position= [1 1];
 %%
 ii=1
 while ~isDone(videoFReader)
   frame = step(videoFReader);
   im1 = imresize(frame,[299 299],'bilinear');
   im = im2uint8(im1);
     if rem(ii,1)==0
       str=strcat('C:\Users\HP\Desktop\Videos and its frams (image dataset)\VID-20210407-WA0002/img-',int2str(ii),'.jpg');   %%% this address is used to save a video in folder
       imwrite(im,str,'jpg');
    end

     ii=ii+1      

%    step(videoPlayer,im);
end