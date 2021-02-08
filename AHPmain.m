%This is the main script for MCM2021 AHP (Problem F)

clear all;

%META info area
numAttr=11;
numCountry=6;
numYear=13;

%%%

WeightCalculation;
MatrixCorrection;
DataPreProcess;


score=[];
countryID=["IRL","ITA","LTU","MEX","POL","PRT"];
for year=1:numYear
    score(1,1+year)=2005+year;
end
for country=1:numCountry
    score(1+country,1)=countryID(country);
end

for country=1:numCountry
    for year=1:numYear
        for attr=1:numAttr
            score(1+country,1+year)=score(1+country,1+year)+maxVector(attr)*xlsRes(attr+(country-1)*numAttr,year);
            %fprintf("score += %f * %f\n",maxVector(attr),xlsRes(1+(country-1)*numAttr,year));
        end
    end
end
