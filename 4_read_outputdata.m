clc 
close all

timesteps=2161;
casenum=2000;
ammonia_p1=zeros(timesteps,casenum);
ammonia_p1_end=zeros(1,casenum);
ammonia_p2_end=zeros(1,casenum);
ammonia_p3_end=zeros(1,casenum);
ammonia_p4_end=zeros(1,casenum);
ammonia_p5_end=zeros(1,casenum);
ammonia_p6_end=zeros(1,casenum);
ammonia_p7_end=zeros(1,casenum);
filename='outputdata.txt';
fid=fopen(filename,'a');

for ii=1:casenum
    ss=strcat('case',num2str(ii),'\lake01.m21fm - Result Files\ecooutput.dfs0');
    [t,data]=read_dfs0_fun(ss);
    ammonia_p1(:,ii)=data(:,15);
    ammonia_p1_end(1,ii)=data(timesteps,15);
    ammonia_p2_end(1,ii)=data(timesteps,16);
    ammonia_p3_end(1,ii)=data(timesteps,17);
    ammonia_p4_end(1,ii)=data(timesteps,18);
    ammonia_p5_end(1,ii)=data(timesteps,19);
    ammonia_p6_end(1,ii)=data(timesteps,20);
    ammonia_p7_end(1,ii)=data(timesteps,21);
    fprintf(fid,'%d  ',ii);
    fprintf(fid,'%f  ',data(timesteps,15));
    fprintf(fid,'%f  ',data(timesteps,16));
    fprintf(fid,'%f  ',data(timesteps,17));
    fprintf(fid,'%f  ',data(timesteps,18));
    fprintf(fid,'%f  ',data(timesteps,19));
    fprintf(fid,'%f  ',data(timesteps,20));
    fprintf(fid,'%f\n',data(timesteps,21));
end
fclose(fid);


