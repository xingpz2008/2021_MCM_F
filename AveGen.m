%This script is to generate the average

Sample=xlsread("Data/TestData1.xlsx");
% numAttr=11;
numCountry_=6;
% numYear=19;
% startYear=2005;
averageMatrix=zeros(numAttr,numYear);
for year=1:numYear
    for attr=1:numAttr
        for country=1:numCountry_
            averageMatrix(attr,year)=averageMatrix(attr,year)+Sample(attr+(country-1)*numAttr,year);
        end
    end
end

averageMatrix=averageMatrix./numCountry_;