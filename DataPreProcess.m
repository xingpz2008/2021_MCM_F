%This script is the pre-process of the Country statistics
%Specific Process Rules are
%
%   1.Students number will be convert to a rtio based on the average students
%   number of the respective year;
%   2.Initial household funding per tertiary student as a percentage of GDP
%   per capita will be convert into x'=1/x (or Max-x, including in
%   sensitivity test)
%   3. Gender Ratio, absolute value of the difference between 50% and the
%   real value, 
%               = 2*(x-m)/(M-m) x<50%
%   fomula-> x=
%               = 2*(M-x)/(M-m) x>50%
%   4. Amount number of published paper , calculate the average value
%   according to research personel amount, then normailize.
%   5.Government expenditure on tertiary education as a percentage of GDP
%   (%) , raw value used
%   6. Labor force with advanced education (% of total working-age population with advanced education)
%   the same as students number
%   7. Research and development expenditure (% of GDP), use the raw value
%   8. Researchers in R&D (per million people), normalize
%   9. Unemployment with advanced education (% of total labor force with
%   advanced education), convert into x'=1/x, (or Max-x, including in
%   sensitivity test)
%   10. Percentage of graduates from tertiary education graduating from Arts and Humanities programmes, both sexes (%)
%   normalize
%   11. Gross graduation ratio from first degree programmes (ISCED 6 and 7)
%   in tertiary, normalize


%%%
%META info area
numAttr=11;
numCountry=6;
numYear=13;

%%%
clear xlsRead;

xlsRes=xlsread("Data/TestData1.xlsx");
totalInternationalStudents=zeros(numYear,1);
totalGovExpenditure=zeros(numYear,1);
totalPublishedPaper=zeros(numYear,1);
totalLabourRatio=zeros(numYear,1);
totalResearcher=zeros(numYear,1);
totalArtRatio=zeros(numYear,1);
totalGraduationRatio=zeros(numYear,1);
for year=1:numYear
    for country=1:numCountry
        totalInternationalStudents(year)=totalInternationalStudents(year)+xlsRes(1+(country-1)*numAttr,year);
        totalPublishedPaper(year)=totalPublishedPaper(year)+xlsRes(4+(country-1)*numAttr,year)/xlsRes(8+(country-1)*numAttr,year);
        totalGovExpenditure(year)=totalGovExpenditure(year)+xlsRes(5+(country-1)*numAttr,year);
        totalLabourRatio(year)=totalLabourRatio(year)+xlsRes(6+(country-1)*numAttr,year);
        totalResearcher(year)=totalResearcher(year)+xlsRes(8+(country-1)*numAttr,year);
        totalArtRatio(year)=totalArtRatio(year)+xlsRes(10+(country-1)*numAttr,year);
        totalGraduationRatio(year)=totalGraduationRatio(year)+xlsRes(11+(country-1)*numAttr,year);
    end
end
for year=1:numYear
    for country=1:numCountry
        xlsRes(1+(country-1)*numAttr,year)=xlsRes(1+(country-1)*numAttr,year)/totalInternationalStudents(year)*numCountry;
        xlsRes(2+(country-1)*numAttr,year)=1/xlsRes(2+(country-1)*numAttr,year);
        if(xlsRes(3+(country-1)*numAttr,year)>=0.5)
            xlsRes(3+(country-1)*numAttr,year)=2*xlsRes(3+(country-1)*numAttr,year);
        else
            xlsRes(3+(country-1)*numAttr,year)=2*(1-xlsRes(3+(country-1)*numAttr,year));
        end
        xlsRes(4+(country-1)*numAttr,year)=xlsRes(4+(country-1)*numAttr,year)/totalPublishedPaper(year)/xlsRes(8+(country-1)*numAttr,year)*numCountry;
        xlsRes(6+(country-1)*numAttr,year)=xlsRes(6+(country-1)*numAttr,year)/totalLabourRatio(year)*numCountry;
        xlsRes(8+(country-1)*numAttr,year)=xlsRes(8+(country-1)*numAttr,year)/totalResearcher(year)*numCountry;
        xlsRes(9+(country-1)*numAttr,year)=1/xlsRes(9+(country-1)*numAttr,year);
        xlsRes(10+(country-1)*numAttr,year)=xlsRes(10+(country-1)*numAttr,year)/totalArtRatio(year)*numCountry;
        xlsRes(11+(country-1)*numAttr,year)=xlsRes(11+(country-1)*numAttr,year)/totalGraduationRatio(year)*numCountry;
    end
end