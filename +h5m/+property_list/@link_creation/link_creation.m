classdef link_creation < handle
    %
    %   Class:
    %   h5m.property_list.link_creation
    %
    %   See Also:
    %   H5P
    
    %{
     ?????
    %}
    
    properties (Hidden)
       h
    end
    
    methods
        function obj = link_creation()
           obj.h = H5P.create('H5P_LINK_CREATE');  
        end
    end
    
end

