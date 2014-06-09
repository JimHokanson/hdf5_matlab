classdef data_alignment
    %
    %   Class:
    %   h5m.properties.data_alignment
    %
    %     Sometimes file access is faster if certain data elements are
    %     aligned in a specific manner. This can be controlled by setting
    %     alignment properties via the H5Pset_alignment function. There are
    %     two values involved:
    %
    %     - A threshhold value 
    %     - An alignment interval 
    %   
    %     Any allocation request at least as large as the threshold will be
    %     aligned on an address that is a multiple of the alignment
    %     interval.
    %
    %   TODO: Provide examples and more detail
    
    properties
       threshold
       alignment
    end
    
    methods
        function obj = data_alignment(threshold,alignment)
           obj.threshold = threshold;
           obj.alignment = alignment;
        end
    end
    
    methods (Hidden)
        function applyValueToID(obj,id)
           H5P.set_alignment(id,obj.threshold,obj.alignment); 
        end
    end
    
end

