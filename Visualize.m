%This script is the visualize procedure of the results

LineWidth=1.8;

figure();
col=2;
row=3;
datatemp=zeros(1,numYear);
for country=1:numCountry
    subplot(row,col,country);
    datatemp=OriginalResult(1+country,:);
    plot(datatemp,'LineWidth',LineWidth);
    hold on;
    datatemp=NewResult(1+country,:);
    plot(datatemp,'LineWidth',LineWidth);
    
%     datatemp=GDP(country,1:13);
%     plot(datatemp,'LineWidth',LineWidth);
    
    title(countryID(country));
    ylabel('Healthy Index');
    xlabel('Year');
    set(gca,'XTickLabel',[2006:2:2018]);
    legend('x=M-m','x=1/m');
    legend('boxoff');
    hold on;
    
end

suptitle('Sensitivity Test of the Respective Country');

%figure();
% hold on;
% col=2;
% row=3;
% datatemp=zeros(1,numYear);
% for country=1:numCountry
%     subplot(row,col,country);
%     datatemp=OriginalResult(1+country,:);
%     plot(datatemp,'LineWidth',LineWidth);
%     title('ID: '+countryID(country));
%     ylabel('Healthy Index');
%     xlabel('Year');
%     set(gca,'XTickLabel',[2006:2:2018]);
%     hold on;
% end
% suptitle('Results(1/x)');

figure();
for country=1:numCountry
    datatemp=OriginalResult(1+country,:);
    plot(datatemp,'LineWidth',LineWidth);
    title('Healthy Indexes of All 6 Countries');
    ylabel('Healthy Index');
    xlabel('Year');
    set(gca,'XTickLabel',[2006:2:2018]);
    hold on;
end
legend(countryID);
legend('boxoff');