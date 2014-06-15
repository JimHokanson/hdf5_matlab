classdef mdc_size
    %
    %   Class:
    %   h5m.file.mdc_size    
    %
    %   http://www.hdfgroup.org/HDF5/doc/Advanced/MetadataCache/
    %
    %   See Also:
    %   h5m.file
    
    properties
       max_size
       min_clean_size
       current_size
       n_current_entries
    end
    
    methods
        function obj = mdc_size(file_id)
           [...
               obj.max_size,...
               obj.min_clean_size,...
               obj.current_size,...
               obj.n_current_entries] = H5F.get_mdc_size(file_id);
        end
    end
    
end

