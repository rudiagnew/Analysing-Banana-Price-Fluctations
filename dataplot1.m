function [plt] = dataplot1()
% plots date vs price for 3 origins
dat = readtable('bananas-18jan21.csv'); % reads file
cr = sortrows(dat(strcmp(dat.Origin, 'costa_rica'),:),'Date','ascend'); % gets costa rica entries and sorts by date
wi = sortrows(dat(strcmp(dat.Origin, 'windward_isles'),:),'Date','ascend');
ec = sortrows(dat(strcmp(dat.Origin, 'ecuador'),:),'Date','ascend');
ab = sortrows(dat(strcmp(dat.Origin, 'all_bananas'),:),'Date','ascend');
plt = plot(cr.Date,cr.Price,wi.Date,wi.Price,ec.Date,ec.Price,ab.Date,ab.Price);
legend({'costa\_rica','windward\_isles','ecuador','all\_bananas'},'FontSize',20); % \ for formatting
title('Plot of banana price fluctations over time','FontSize',20)
xlabel('Date','FontSize',20)
ylabel('Price','FontSize',20)
end

