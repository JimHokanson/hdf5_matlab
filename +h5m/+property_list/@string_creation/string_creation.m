classdef string_creation
    %
    %   Class:
    %   h5m.property_list.string_creation
    %
    
    %{
     String Properties:
     get_char_encoding             - Gets the character encoding
     set_char_encoding             - Sets the character encoding
    %}
    
    properties (Hidden)
       h
    end
    
    methods
        function obj = string_creation()
           obj.h = H5P.create('H5P_STRING_CREATE'); 
        end
    end
    
end

