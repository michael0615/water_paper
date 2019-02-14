function [t,data]=read_dfs0_fun(infile)

fprintf('Start reading %s\n',infile);
NET.addAssembly('DHI.Generic.MikeZero.DFS');
import DHI.Generic.MikeZero.DFS.*;
import DHI.Generic.MikeZero.DFS.dfs0.*;

if (~exist(infile,'file'))
  [filename,filepath] = uigetfile('*.dfs0','Select the .dfs0');
  infile = [filepath,filename];
end

dfs0File  = DfsFileFactory.DfsGenericOpen(infile);

t = zeros(dfs0File.FileInfo.TimeAxis.NumberOfTimeSteps,1);
data = zeros(dfs0File.FileInfo.TimeAxis.NumberOfTimeSteps,dfs0File.ItemInfo.Count);
tic
for it = 1:dfs0File.FileInfo.TimeAxis.NumberOfTimeSteps
  for ii = 1:dfs0File.ItemInfo.Count
    itemData = dfs0File.ReadItemTimeStep(ii,it-1);
    if (ii == 1)
        t(it) = itemData.Time;
    end
    data(it, ii) = double(itemData.Data);
  end
  if (mod(it,100) == 0)
    fprintf('it = %i of 2160\n',it);
  end
end
toc
fprintf('Did app. %f .NET calls per second\n',...
double(dfs0File.FileInfo.TimeAxis.NumberOfTimeSteps*(2*dfs0File.ItemInfo.Count+1))/toc);

items = {};
for i = 0:dfs0File.ItemInfo.Count-1
   item = dfs0File.ItemInfo.Item(i);
   items{i+1,1} = char(item.Name);
   items{i+1,2} = char(item.Quantity.Unit);
   items{i+1,3} = char(item.Quantity.UnitAbbreviation); 
end
fprintf('End reading %s\n',infile);

dfs0File.Close();


