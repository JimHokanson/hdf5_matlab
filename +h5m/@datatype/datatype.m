classdef datatype < handle
    %
    %   Class:
    %   h5m.datatype
    %
    %   User Guide:
    %       http://www.hdfgroup.org/HDF5/doc/UG/11_Datatypes.html
    %
    %   API Info
    %       http://www.hdfgroup.org/HDF5/doc/RM/RM_H5T.html
    %
    %   Actual datatypes:
    %       http://www.hdfgroup.org/HDF5/doc/RM/PredefDTypes.html
    %
    %   See Also:
    %   H5T
    
    %{
    close             - Closes a datatype object
    commit            - Commits a transient datatype
    committed         - Queries if a datatype is transient or not
    copy              - Copies an existing datatype
    create            - Creates a new datatype
    detect_class      - Detects a given datatype class in a datatype
    equal             - Determines equality for two datatypes
    get_class         - Returns the datatype class identifier
    get_create_plist  - Returns a copy of the creation property list
    get_native_type   - Returns the native datatype of a given datatype
    get_size          - Returns the size of a datatype
    get_super         - Returns a derived datatype's base datatype
    lock              - Locks a datatype
    open              - Opens a named datatype    
    %}
    
    properties
    end
    
    methods (Static)
        function create()
        end
        function open()
        end
    end
    
end

