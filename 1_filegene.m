clc;
close all;

filename='run.bat';
fid=fopen(filename,'w');

fprintf(fid,'%s\n','@echo off');
fprintf(fid,'%s\n','set starttime=%date% %time%');
for ns=1:2000
    fprintf('%g >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n',ns);
    ns_str=num2str(ns);
    fprintf(fid,'%s','echo    ');
    fprintf(fid,'%s',ns_str);
    fprintf(fid,'%s\n','_Case_Start  %date% %time%');
    fprintf(fid,'%s','start/w C:\"Program Files (x86)"\DHI\2014\bin\x64\MzLaunch.exe E:\mikemodel\case');
    fprintf(fid,'%s',ns_str);
    fprintf(fid,'%s\n','\lake01.m21fm -x');
end
fprintf(fid,'%s\n','set  end time =%date% %time%');
fprintf(fid,'%s\n','echo Start Time = %starttime%');
fprintf(fid,'%s\n','echo  End  Time = %date% %time%');
fprintf(fid,'%s\n','pause');
fclose(fid);