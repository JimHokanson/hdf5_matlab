classdef group_access < handle
    %
    %   Class:
    %   h5m.property_list.group_access
    %
    %   See Also:
    %   H5P
    
    %{
        ???? No properties ????
        TODO: Inherit from generic
    %}
    
    properties (Hidden)
       h
    end
    
    methods
        function obj = group_access()
           obj.h = H5P.create('H5P_GROUP_ACCESS');  
        end
    end
    
end

