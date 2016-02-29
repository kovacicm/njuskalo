%for i=1:993
%    if(minvar(i,15)==100 && minvar(i,16)==100)
%        minvar(i,15)=50;
%        minvar(i,16)=50;
%    end
%end

[b,bint,r,rint,stats] = regress(y,minvar);

lowpct=0;
highpct=0;
indexh=1;
indexl=1;
fid=fopen('results.txt', 'w');

for i=1:997
    priceest(i)=b(1)*minvar(i,1)+b(2)*minvar(i,2)+b(3)*minvar(i,3)+b(4)*minvar(i,4)+b(5)*minvar(i,5)+b(6)*minvar(i,6)+b(7)*minvar(i,7)+b(8)*minvar(i,8)+b(9)*minvar(i,9)+b(10)*minvar(i,10)+b(11)*minvar(i,11)+b(12)*minvar(i,12)+b(13)*minvar(i,13)+b(14)*minvar(i,14)+b(15)*minvar(i,15)+b(16)*minvar(i,16)+b(17)*minvar(i,17)+b(18)*minvar(i,18);
    
    pcthigh=(priceest(i)-y(i))/y(i);
    pctlow=(y(i)-priceest(i))/y(i);
    if(pcthigh>0 && pcthigh <0.15)
        if(y(i)<600000 && minvar(i,13)>45 && minvar(i,13)<70)
        fprintf(fid,'%s\n',svistanovi{i});
        end
    end    
    
end

fclose(fid);
%svistanovi{indexh}
%svistanovi{indexl}
