clear all;
clc;
videoFReader = vision.VideoFileReader('F:\Sargodha University\fake.mp4');
%  whos videoFReader
videoPlayer = vision.DeployableVideoPlayer;
%  position= [1 1];
 %%
 ii=1
 while ~isDone(videoFReader)
   frame = step(videoFReader);
   im1 = imresize(frame,[299 299],'bilinear');
   im = im2uint8(im1);
     if rem(ii,5)==0
       str=strcat('C:\Users\Pc\Desktop\Fake Frames/img-',int2str(ii),'.jpg');
       imwrite(im,str,'jpg');
    end

     ii=ii+1      

%    step(videoPlayer,im);
end