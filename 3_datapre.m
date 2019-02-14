clc;
close all;

startcasenum=1;
casenum=2000;

canshu=load('para.txt');
case_para=zeros(2000,5);
ii=1;
for qq=1:2000
        case_para(ii,1:4)=canshu(ii,2:5);
        case_para(ii,5)=3.5/3*canshu(ii,5);
        ii=ii+1;
end

for num=(startcasenum):(casenum+startcasenum-1)
    ss=strcat('E:\mikemodel\case',num2str(num),'\lake.m21fm');
    ss2=strcat('E:\mikemodel\case',num2str(num),'\eco.ecolab');
    fid=fopen(ss,'r+');
    fprintf('%d\n',num);
    for i=1:711
        nn=fgetl(fid);
    end
    mm=ftell(fid);
    fseek(fid,mm,'bof');
    fprintf(fid,'%s','            constant_value = ');
    fprintf(fid,'%.4f',case_para(num,1));
    fclose(fid);
    fid=fopen(ss,'r+');
    for i=1:738
        nn=fgetl(fid);
    end
    mm=ftell(fid);
    fseek(fid,mm,'bof');
    fprintf(fid,'%s','            constant_value = ');
    fprintf(fid,'%.4f',case_para(num,3));
    fclose(fid);
    fid=fopen(ss,'r+');
    for i=1:2986
        nn=fgetl(fid);
    end
    mm=ftell(fid);
    fseek(fid,mm,'bof');
    fprintf(fid,'%s','               constant_value = ');
    fprintf(fid,'%.3f',4-case_para(num,2));
    fclose(fid);
    fid=fopen(ss,'r+');
    for i=1:3016
        nn=fgetl(fid);
    end
    mm=ftell(fid);
    fseek(fid,mm,'bof');
    fprintf(fid,'%s','               constant_value = ');
    fprintf(fid,'%.3f',case_para(num,2));
    fclose(fid);
    fid=fopen(ss,'r+');
    for i=1:3031
        nn=fgetl(fid);
    end
    mm=ftell(fid);
    fseek(fid,mm,'bof');
    fprintf(fid,'%s','               constant_value = ');
    fprintf(fid,'%.2f',5*case_para(num,2));
    fclose(fid);
    fid=fopen(ss,'r+');
    for i=1:3046
        nn=fgetl(fid);
    end
    mm=ftell(fid);
    fseek(fid,mm,'bof');
    fprintf(fid,'%s','               constant_value = ');
    fprintf(fid,'%.2f',5*case_para(num,2));
    fclose(fid);
    fid=fopen(ss,'r+')
    for i=1:2124
        nn=fgetl(fid);
    end
    mm=ftell(fid);
    fseek(fid,mm,'bof');
    fprintf(fid,'%s','            value = ');
    fprintf(fid,'%.4f',case_para(num,4));
    fclose(fid);
    fid=fopen(ss,'r+');
    for i=1:2148
        nn=fgetl(fid);
    end
    mm=ftell(fid);
    fseek(fid,mm,'bof');
    fprintf(fid,'%s','            value = ');
    fprintf(fid,'%.5f',case_para(num,5));
    fclose(fid);
    
    fid=fopen(ss2,'r+');
    for i=1:225
        nn=fgetl(fid);
    end
    mm=ftell(fid);
    fseek(fid,mm,'bof');
    fprintf(fid,'%s','         DEFAULT_VALUE =  ');
    fprintf(fid,'%f\n',case_para(num,4));
    fclose(fid);
    fid=fopen(ss2,'r+');
    for i=1:259
        nn=fgetl(fid);
    end
    mm=ftell(fid);
    fseek(fid,mm,'bof');
    fprintf(fid,'%s','         DEFAULT_VALUE =  ');
    fprintf(fid,'%f\n',case_para(num,5));
    fclose(fid);
end


