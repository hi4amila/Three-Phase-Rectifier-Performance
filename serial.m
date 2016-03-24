clear all;
clc;
close all;

fileId = fopen('teraterm.txt','r');
formatSpecs= '%f %f %f %f';
size= [4 inf];
data = fscanf(fileId,formatSpecs, size);
fclose(fileId);
counter=0;
count=1;

dataOrg = zeros(4,length(data));
for i= 1:length(data)
    if data(1,i)< 1000000
        counter=1;
    end
    
    if counter==1
        dataOrg(:,count)=data(:,i);
        count= count+1;
    end
end
dataOrg= dataOrg(:,1:count-1);


Average_Power=0;
rms_Power=0;
for i=1:length(dataOrg)
    Average_Power=Average_Power+ dataOrg(4,i);
    rms_Power= rms_Power+ dataOrg(4,i)*dataOrg(4,i);
end

Average_Power= Average_Power/ length(dataOrg);
rms_Power = (sqrt(rms_Power))/ length(dataOrg);
disp(Average_Power);
disp(rms_Power);

figure;plot(dataOrg(1,:), (dataOrg(2,:)));title('Voltage');xlabel('time(s)');
figure;plot(dataOrg(1,:), (dataOrg(3,:)));title('Current');xlabel('time(s)');
figure;plot(dataOrg(1,:), (dataOrg(4,:)));title('Power');xlabel('time(s)');

fileid=fopen('result.txt','w');
fprintf(fileid,'Average_Power- %f \t RMS_Power- %f \n ',Average_Power,rms_Power);
fclose(fileid);
