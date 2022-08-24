function [plt1,plt2] = dataplot3()
% plots date vs price for 3 origins over a specified period
dat = readtable('bananas-18jan21.csv'); % reads file
cr = sortrows(dat(strcmp(dat.Origin, 'costa_rica'),:),'Date','ascend'); % gets costa rica entries and sorts by date
wi = sortrows(dat(strcmp(dat.Origin, 'windward_isles'),:),'Date','ascend');
ec = sortrows(dat(strcmp(dat.Origin, 'ecuador'),:),'Date','ascend');
ab = sortrows(dat(strcmp(dat.Origin, 'all_bananas'),:),'Date','ascend');
t1 = datetime(2016,01,01); % year/month/day
t2 = datetime(2020,12,31);
cr1 = cr(isbetween(cr.Date,t1,t2),:);
wi1 = wi(isbetween(wi.Date,t1,t2),:);
ec1 = ec(isbetween(ec.Date,t1,t2),:);
ab1 = ab(isbetween(ab.Date,t1,t2),:);
figure()
plt1 = plot(cr.Date,cr.Price,wi.Date,wi.Price,ec.Date,ec.Price,ab.Date,ab.Price);
legend({'costa\_rica','windward\_isles','ecuador','all\_bananas'},'FontSize',20); % \ for formatting
title('Plot of banana price fluctations over time','FontSize',20)
xlabel('Date','FontSize',20)
ylabel('Price','FontSize',20)
figure()
plt2 = plot(cr1.Date,cr1.Price,wi1.Date,wi1.Price,ec1.Date,ec1.Price,ab1.Date,ab1.Price);
legend('costa\_rica','windward\_isles','ecuador','all\_bananas', 'FontSize', 20,'Location','northwest');
title('Plot of banana price fluctations over time', 'FontSize',20)
xlabel('Date','FontSize',20)
ylabel('Price','FontSize',20)
end

