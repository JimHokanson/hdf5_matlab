classdef file_creation < handle
    %
    %   Class:
    %   h5m.property_list.file_creation
    
    %{
       File Creation Properties
     get_istore_k             - Gets the 1/2 rank of a B-tree
     get_sizes                - Gets size of the object offsets and lengths
     get_sym_k                - Gets symbol table node parameter sizes
     get_userblock            - Gets the size of a user block
     get_version              - Gets the version information
     set_istore_k             - Sets the 1/2 rank of a B-tree
     set_sizes                - Sets size of the object offsets and lengths
     set_sym_k                - Sets symbol table node parameter sizes
     set_userblock            - Sets the size of a user block
    %}
    
    properties (Hidden)
        h
    end
    
    methods
        function obj = file_creation()
           obj.h = H5P.create('H5P_FILE_CREATE'); 
        end
    end
    
end

