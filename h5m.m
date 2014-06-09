classdef h5m
    %
    %   Class:
    %   h5m
    %
    %   This package is an attempt to simplify 
    %
    %   Main documentation for the interfaces can be found at:
    %   http://www.hdfgroup.org/HDF5/doc/RM/RM_H5Front.html
    %
    %   See Also:
    %   h5m.file
    %   h5m.dataset
    %   h5m.group
    %   H5
    %   h5disp
    %   h5info
    
    %{
    H5.close                - Closes the library
    H5.garbage_collect      - Frees unused memory by the library
    H5.get_libversion       - Retrieves the HDF5 library version
    H5.open                 - Initializes the HDF5 library
    H5.set_free_list_limits - Sets free-list limits
    %}
    
    properties
    end
    
    methods (Static)
        function v = libVersion()
           [majnum,minnum,relnum] = H5.get_libversion();
           v = struct;
           v.major    = majnum;
           v.minor    = minnum;
           v.relative = relnum;
        end
    end
    
end

