%This script is for data post-process for AGN
%   research
%   social
%   expenditure
%   system
attrNum_=4;

AGNFactor=zeros(attrNum_,numYear);
attr=1;
for year=1:numYear
        AGNFactor(attr,year)=AGNMatrix(4,year)+AGNMatrix(8,year);
end
attr=2;
for year=1:numYear
        AGNFactor(attr,year)=AGNMatrix(6,year)+AGNMatrix(9,year);
end
attr=3;
for year=1:numYear
        AGNFactor(attr,year)=AGNMatrix(2,year)+AGNMatrix(5,year)+AGNMatrix(7,year);
end
attr=4;
for year=1:numYear
        AGNFactor(attr,year)=AGNMatrix(1,year)+AGNMatrix(3,year)+AGNMatrix(10,year)+AGNMatrix(11,year);
end