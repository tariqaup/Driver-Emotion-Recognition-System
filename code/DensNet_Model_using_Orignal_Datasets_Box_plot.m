s1 = [91.71 90.57 83.28 91.28];
s1 = s1';
s2 = [99.02 96.72 98.56 94.42];
s2 = s2';
s3 = [99.61 99.27 99.55 97.71];
s3 = s3';
s4 = [93.65 87.69 85.68 82.05];
s4 = s4';
s5 = [99.16 98.83 98.44 98];
s5 = s5';
boxplot([s1 s2 s3 s4 s5],'Notch','on', ...
        'Labels',{'Jaffe','CK+','FER-2013','Affact-Net','Custom'}),title('Box Plot of DenseNet Model')