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

figure;plot(dataOrg(1,:), (dataOrg(2,:)));title('Voltage');xlabel('time(s)');
figure;plot(dataOrg(1,:), (dataOrg(3,:)));title('Current');xlabel('time(s)');
figure;plot(dataOrg(1,:), (dataOrg(4,:)));title('Power');xlabel('time(s)');


