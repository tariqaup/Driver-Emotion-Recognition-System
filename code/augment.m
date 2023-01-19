rootFolder = fullfile('C:\Users\HP\Desktop\Khalid Code\Khalid updated Dataset\Reduce Dataset');
imgSets = imageSet(fullfile(rootFolder,'Surprice'));
ok = imgSets.Count
%%

for i = 1:ok
    I = read(imgSets(1),i);
%     J = imrotate( I , 180 )
img1=imresize(I,[227 227]);
       
    


se1= [1/9 1/9 1/9
     1/9 1/9 1/9 
      1/9 1/9 1/9];
img2 = imfilter(img1,se1);  
  se2=[1/25 1/25 1/25 1/25 1/25
       1/25 1/25 1/25 1/25 1/25
       1/25 1/25 1/25 1/25 1/25
       1/25 1/25 1/25 1/25 1/25
       1/25 1/25 1/25 1/25 1/25];
   img3 = imfilter(img1,se2);
   
   R_C = img1(:,:,1);
   G_C = img1(:,:,2);
   B_C = img1(:,:,3);
   med_r=medfilt2(R_C);
   med_g=medfilt2(G_C);
   med_b=medfilt2(B_C);
   img4 = cat(3,med_r,med_g,med_b);
   
   gau_filt = fspecial('gaussian',[5 5]);
   img5 = imfilter(img1,gau_filt);
   
   wnr_r = wiener2(R_C);
   wnr_g = wiener2(G_C);
   wnr_b = wiener2(B_C);
   
   img6 = cat(3,wnr_r,wnr_g,wnr_b);
   
   img7=imsharpen(img1);
   
   img8 = imnoise(img1,'salt & pepper',0.001);
   
   img9 = histeq(img1);
   
   img10 = imrotate(img1,90);
   
   img11 = imrotate(img10,90);
   
   img12 = imrotate(img11,90);
   
   
   c_s1 = R_C+10;
   c_s2 = R_C-10;
   c_s3 = G_C+10;
   c_s4 = G_C-10;
   c_s5 = B_C+10;
   c_s6 = B_C-10;

   img13 = cat(3,c_s1,G_C,B_C);
   img14 = imrotate(img13,90);
   img15 = imrotate(img14,90);
   img16 = imrotate(img15,90);
   
   img17 = cat(3,c_s2,G_C,B_C);
   img18 = imrotate(img17,90);
   img19 = imrotate(img18,90);
   img20 = imrotate(img19,90);
   
   img21 = cat(3,R_C,c_s3,B_C);
   img22 = imrotate(img21,90);
   img23 = imrotate(img22,90);
   img24 = imrotate(img23,90);
   
   
   img25 = cat(3,R_C,c_s4,B_C);
   img26 = imrotate(img25,90);
   img27 = imrotate(img26,90);
   img28 = imrotate(img27,90);
   
   
   img29 = cat(3,R_C,G_C,c_s5);
   img30 = imrotate(img29,90);
   img31 = imrotate(img30,90);
   img32 = imrotate(img31,90);
   
   img33 = cat(3,R_C,G_C,c_s6);
   img34 = imrotate(img33,90);
   img35 = imrotate(img34,90);
   img36 = imrotate(img35,90);
   
    
    str2 = strcat('C:\Users\HP\Desktop\Khalid Code\augment\data\Surprice\img-1',int2str(i),'.jpg');
    imwrite(img2,str2,'jpg');
    str3 = strcat('C:\Users\HP\Desktop\Khalid Code\augment\data\Surprice\img-2',int2str(i),'.jpg');
    imwrite(img3,str3,'jpg');
    str4 = strcat('C:\Users\HP\Desktop\Khalid Code\augment\data\Surprice\img-3',int2str(i),'.jpg');
    imwrite(img4,str4,'jpg');
    str5 = strcat('C:\Users\HP\Desktop\Khalid Code\augment\data\Surprice\img-4',int2str(i),'.jpg');
    imwrite(img5,str5,'jpg');
    str6 = strcat('C:\Users\HP\Desktop\Khalid Code\augment\data\Surprice\img-5',int2str(i),'.jpg');
    imwrite(img6,str6,'jpg');
    str7 = strcat('C:\Users\HP\Desktop\Khalid Code\augment\data\Surprice\img-6',int2str(i),'.jpg');
    imwrite(img7,str7,'jpg');
    str8 = strcat('C:\Users\HP\Desktop\Khalid Code\augment\data\Surprice\img-7',int2str(i),'.jpg');
    imwrite(img8,str8,'jpg');
    str9 = strcat('C:\Users\HP\Desktop\Khalid Code\augment\data\Surprice\img-8',int2str(i),'.jpg');
    imwrite(img9,str9,'jpg');
    str10 = strcat('C:\Users\HP\Desktop\Khalid Code\augment\data\Surprice\img-9',int2str(i),'.jpg');
    imwrite(img10,str10,'jpg');
    str11 = strcat('C:\Users\HP\Desktop\Khalid Code\augment\data\Surprice\img-10',int2str(i),'.jpg');
    imwrite(img11,str11,'jpg');
    str12 = strcat('C:\Users\HP\Desktop\Khalid Code\augment\data\Surprice\img-11',int2str(i),'.jpg');
    imwrite(img12,str12,'jpg');
    str13 = strcat('C:\Users\HP\Desktop\Khalid Code\augment\data\Surprice\img-12',int2str(i),'.jpg');
    imwrite(img13,str13,'jpg');
    str14 = strcat('C:\Users\HP\Desktop\Khalid Code\augment\data\Surprice\img-13',int2str(i),'.jpg');
    imwrite(img14,str14,'jpg');
    str15 = strcat('C:\Users\HP\Desktop\Khalid Code\augment\data\Surprice\img-14',int2str(i),'.jpg');
    imwrite(img15,str15,'jpg');
    str16 = strcat('C:\Users\HP\Desktop\Khalid Code\augment\data\Surprice\img-15',int2str(i),'.jpg');
    imwrite(img16,str16,'jpg');
    str17 = strcat('C:\Users\HP\Desktop\Khalid Code\augment\data\Surprice\img-16',int2str(i),'.jpg');
    imwrite(img17,str17,'jpg');
    str18 = strcat('C:\Users\HP\Desktop\Khalid Code\augment\data\Surprice\img-17',int2str(i),'.jpg');
    imwrite(img18,str18,'jpg');
    str19 = strcat('C:\Users\HP\Desktop\Khalid Code\augment\data\Surprice\img-18',int2str(i),'.jpg');
    imwrite(img19,str19,'jpg');
    str20 = strcat('C:\Users\HP\Desktop\Khalid Code\augment\data\Surprice\img-19',int2str(i),'.jpg');
    imwrite(img20,str20,'jpg');
    str21 = strcat('C:\Users\HP\Desktop\Khalid Code\augment\data\Surprice\img-20',int2str(i),'.jpg');
    imwrite(img21,str21,'jpg');
    str22 = strcat('C:\Users\HP\Desktop\Khalid Code\augment\data\Surprice\img-21',int2str(i),'.jpg');
    imwrite(img22,str22,'jpg');
    str23 = strcat('C:\Users\HP\Desktop\Khalid Code\augment\data\Surprice\img-22',int2str(i),'.jpg');
    imwrite(img23,str23,'jpg');
    str24 = strcat('C:\Users\HP\Desktop\Khalid Code\augment\data\Surprice\img-23',int2str(i),'.jpg');
    imwrite(img24,str24,'jpg');
    str25 = strcat('C:\Users\HP\Desktop\Khalid Code\augment\data\Surprice\img-24',int2str(i),'.jpg');
    imwrite(img25,str25,'jpg');
    str26 = strcat('C:\Users\HP\Desktop\Khalid Code\augment\data\Surprice\img-25',int2str(i),'.jpg');
    imwrite(img26,str26,'jpg');
    str27 = strcat('C:\Users\HP\Desktop\Khalid Code\augment\data\Surprice\img-26',int2str(i),'.jpg');
    imwrite(img27,str27,'jpg');
    str28 = strcat('C:\Users\HP\Desktop\Khalid Code\augment\data\Surprice\img-27',int2str(i),'.jpg');
    imwrite(img28,str28,'jpg');
    str29 = strcat('C:\Users\HP\Desktop\Khalid Code\augment\data\Surprice\img-28',int2str(i),'.jpg');
    imwrite(img29,str29,'jpg');
    str30 = strcat('C:\Users\HP\Desktop\Khalid Code\augment\data\Surprice\img-29',int2str(i),'.jpg');
    imwrite(img30,str30,'jpg');
    str31 = strcat('C:\Users\HP\Desktop\Khalid Code\augment\data\Surprice\img-30',int2str(i),'.jpg');
    imwrite(img31,str31,'jpg');
    str32 = strcat('C:\Users\HP\Desktop\Khalid Code\augment\data\Surprice\img-31',int2str(i),'.jpg');
    imwrite(img32,str32,'jpg');
    str33 = strcat('C:\Users\HP\Desktop\Khalid Code\augment\data\Surprice\img-32',int2str(i),'.jpg');
    imwrite(img33,str33,'jpg');
    str34 = strcat('C:\Users\HP\Desktop\Khalid Code\augment\data\Surprice\img-33',int2str(i),'.jpg');
    imwrite(img34,str34,'jpg');
    str35 = strcat('C:\Users\HP\Desktop\Khalid Code\augment\data\Surprice\img-34',int2str(i),'.jpg');
    imwrite(img35,str35,'jpg');
    str36 = strcat('C:\Users\HP\Desktop\Khalid Code\augment\data\Surprice\img-35',int2str(i),'.jpg');
    imwrite(img36,str36,'jpg');
    str1 = strcat('C:\Users\HP\Desktop\Khalid Code\augment\data\Surprice\img-36',int2str(i),'.jpg');
    imwrite(img1,str1,'jpg');
    
    i
    
end