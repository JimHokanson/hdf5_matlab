%

data = H5ML.get_constant_names()';

data(:,2) = cellfun(@H5ML.get_constant_value,data,'un',0);

n_values = size(data,1);

for iValue = 1:n_values
    data{iValue,2} = H5ML.get_constant_value(data{iValue,1});
end

%TODO: Print each entry as:
%("H5D_CHUNKED",2)
%then join all lines by string