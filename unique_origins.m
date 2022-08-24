function [unique_origins] = unique_origins(data)
% Function that returns the distinct origins of the data
unique_origins = unique(readtable(data).Origin)';
end

