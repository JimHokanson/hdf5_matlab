classdef h5m
    %
    %   Class:
    %   h5m
    %
    %   Main documentation for the interfaces can be found at:
    %   http://www.hdfgroup.org/HDF5/doc/RM/RM_H5Front.html
    %
    %   See Also:
    %   H5
    
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

