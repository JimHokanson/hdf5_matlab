classdef (Hidden) h5z
    %
    %   Class:
    %   h5m.h5z
    %   
    
    properties
    end
    
    methods (Static)
        function output = filter_available(filter_id)
            %
            %   h5m.h5z.filter_available
            %
            %   output:
            %       negative - error occurred
            %       0 - not available
            %       1 - available
            % 
            
            %TODO: Add on filter_id
           output = hdf5_mex('H5Zfilter_avail');
        end
    end
    
end

