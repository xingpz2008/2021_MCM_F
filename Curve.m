%This script is to curve the function of parameters

numYear__=19;
Yeartodo=7;
yearOffset=19;

Original=xlsread("Data/°¢¸ùÍ¢11Î¬.xlsx");
HouseHold=Original(2,:)';
TotalExpenditure=Original(5,:)';
GovExpenditure=Original(6,:)';
TotalGraduation=Original(11,:)';

Unemployment=Original(9,:)';
Published=Original(4,:)';
Researchers=Original(8,:)';

X1=[ones(size(Unemployment)) HouseHold TotalExpenditure GovExpenditure TotalGraduation];
[b1,bint1,r1,rint1,stats1]=regress(Unemployment,X1);

X2=[ones(size(Published)) HouseHold TotalExpenditure GovExpenditure TotalGraduation];
[b2,bint2,r2,rint2,stats2]=regress(Published,X2);

X3=[ones(size(Researchers)) HouseHold TotalExpenditure GovExpenditure TotalGraduation];
[b3,bint3,r3,rint3,stats3]=regress(Researchers,X3);


Original(11,26)=Original(11,19)*1.5;
delta=0.5*Original(11,19);
inc=delta/6;

for year=1:Yeartodo
    Original(2,yearOffset+year)=Original(2,yearOffset+year-1)*0.95;
    Original(7,yearOffset+year)=Original(7,yearOffset+year-1)*1.05;
    Original(5,yearOffset+year)=Original(5,yearOffset+year-1)*1.1;
    Original(11,yearOffset+year)=Original(11,yearOffset+year-1)+inc;
end

for year=1:Yeartodo
    for attr=1:numAttr
        if(attr==4)
            Original(4,yearOffset+year)=b2(1)+b2(2)*Original(2,year+yearOffset)+b2(3)*Original(5,year+yearOffset)+b2(4)*Original(6,year+yearOffset)+b2(5)*Original(11,year+yearOffset);
        end
        if(attr==9)
            Original(9,yearOffset+year)=b1(1)+b1(2)*Original(2,year+yearOffset)+b1(3)*Original(5,year+yearOffset)+b1(4)*Original(6,year+yearOffset)+b1(5)*Original(11,year+yearOffset);
        end
        if(attr==8)
            Original(8,yearOffset+year)=b3(1)+b3(2)*Original(2,year+yearOffset)+b3(3)*Original(5,year+yearOffset)+b3(4)*Original(6,year+yearOffset)+b3(5)*Original(11,year+yearOffset);
        end
    end
end
