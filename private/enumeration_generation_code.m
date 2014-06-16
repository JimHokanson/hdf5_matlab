%     H5ML.compare_values     - Numerically compare two HDF5 values.
%     H5ML.get_constant_names - Get a list of HDF5 library constants
%     H5ML.get_constant_value - Return the value corresponding to string.
%     H5ML.get_function_names - Get the functions provided by the library.
%     H5ML.get_mem_datatype   - Retrieve datatype for dataset ID

%This is a small script to populate some information for enumerations.

%Eventually I would like to have a script that checks that the values and
%strings match the latest version ...

    data = H5ML.get_constant_names()';
    
    data(:,2) = cellfun(@H5ML.get_constant_value,data,'un',0);
    
    n_values = size(data,1);
    
    for iValue = 1:n_values
           data{iValue,2} = H5ML.get_constant_value(data{iValue,1});
    end
    