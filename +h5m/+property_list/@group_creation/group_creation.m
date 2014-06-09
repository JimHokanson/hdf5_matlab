classdef group_creation
    %
    %   Class:
    %   h5m.property_list.group_creation
    %
    %   See Also:
    %   H5P
    
    %{
     Group Creation Properties
     get_create_intermediate_group - Gets intermediate group creation setting
     get_link_creation_order       - Gets link creation order 
     get_link_phase_change         - Gets compact, dense group thresholds
     set_create_intermediate_group - Sets intermediate group creation setting
     set_link_creation_order       - Sets link creation order
     set_link_phase_change         - Sets compact, dense group thresholds
    %}
    
    properties (Hidden)
       h
    end
    
    methods
        function obj = group_creation()
           obj.h = H5P.create('H5P_GROUP_CREATE');  
        end
    end
    
end

