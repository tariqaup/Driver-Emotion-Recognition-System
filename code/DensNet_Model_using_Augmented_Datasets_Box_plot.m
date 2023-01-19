s1 = [98.66	98.06	98.15	97.13];
s1 = s1';
s2 = [99.72	98.14	97.58	98.7];
s2 = s2';
s3 = [99.95	99.71	99.82	96.64];
s3 = s3';
s4 = [98.05	97.98	95.91	95.3];
s4 = s4';
s5 = [99.97	99.97	99.95	99.72];
s5 = s5';9
boxplot([s1 s2 s3 s4 s5],'Notch','on', ...
        'Labels',{'Jaffe','CK+','FER-2013','Affact-Net','Custom'}),title('Box Plot of DenseNet Model using Augmented Dataset')