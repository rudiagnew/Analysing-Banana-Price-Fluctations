function [f1,f2] = meanprice(data,t,n)
% Calculates the mean price of data over a duration of time
% f1 top 'n', f2 bottom 'n'
% t is how many years in the past you wish to go
% n represents the top 'n' and bottom 'n' countries
dat = readtable(data); % reads file
unique_origin = unique_origins(data);
for i = 1:length(unique_origin)
    % splits dat into different tables depending on origin and sorts
    T = sortrows(dat(strcmp(dat.Origin, unique_origin(i)),:),'Date', 'descend'); 
    x = T.Date(1);
    y = T.Date(1) - calyears(t); % takes away t calendar years from the
    m = isbetween(T.Date,y,x); % x,y are closed intervals
    T1 = T(m,:);
    mean_price = mean(T1.Price);
    struc(i).Origin = unique_origin{i};
    struc(i).Mean_Price = mean_price;
end
Y = struct2table(struc);
final = sortrows(Y,'Mean_Price', 'descend');
if n >= length(unique_origin)
    n = length(unique_origin);
end    
f1 = final(1:n,1:2);
f2 = final(height(final)-(n-1):end,1:2);
end

