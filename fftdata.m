function [cycle] = fftdata()
dat = readtable('bananas-18jan21.csv');
absort = sortrows(dat(strcmp(dat.Origin, 'all_bananas'),:),'Date','ascend');
ab = absort(isbetween(absort.Date,datetime(2016,01,01),datetime(2020,12,31)),:);
y = fft(ab.Price); y(1)=[];
n = length(y);
power = abs(y(1:floor(n/2))).^2; % need first half of data due to symmetry
freq = (1:n/2)/(n/2)*1/2; % equally spaced frequency grid, 1/2 maximum frequency
cycle = 1./freq(find(power==max(power))); % cycle length, 1/freq=period
end

