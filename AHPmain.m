%This is the main script for MCM2021 AHP (Problem F)


%META info area
numAttr=11;
numCountry=25;
numYear=13;
startYear=2005;
%%%

WeightCalculation;
MatrixCorrection;
DataPreProcess;


score=zeros(numCountry+1,numYear+1);
%countryID=["Argentina","Italy","Mexico","Poland","Portugal","Lithuania"];
AGNMatrix=zeros(numAttr,numYear);
countryID=zeros(1,numCountry);
for year=1:numYear
    score(1,1+year)=startYear+year;
end
for country=1:numCountry
    score(1+country,1)=countryID(country);
end

for country=1:numCountry
    for year=1:numYear
        for attr=1:numAttr
            score(1+country,1+year)=score(1+country,1+year)+maxVector(attr)*xlsRes(attr+(country-1)*numAttr,year);
            %fprintf("score += %f * %f\n",maxVector(attr),xlsRes(1+(country-1)*numAttr,year));
            if(country==1)
                AGNMatrix(attr,year)=maxVector(attr)*xlsRes(attr+(country-1)*numAttr,year);
            end
        end
    end
end
%DataPostProcessAGN;
%Visualize;
