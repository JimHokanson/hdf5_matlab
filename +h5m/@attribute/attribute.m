classdef attribute < handle
    %
    %   Class:
    %   h5m.attribute
    %
    %   From the guide:
    %   ----------------------------------
    %   While HDF5 attributes are not standard HDF5 datasets, they have
    %   much in common:
    % 
    %   - An attribute has a user-defined dataspace and the included 
    %   metadata has a user-assigned datatype 
    %   - Metadata can be of any valid HDF5 datatype 
    %   - Attributes are addressed by name 
    %
    %   But there are some very important differences:
    % 
    %   - There is no provision for special storage such as compression or
    %   chunking 
    %   - There is no partial I/O or sub-setting capability for
    %   attribute data 
    %   - Attributes cannot be shared 
    %   - Attributes cannot have attributes
    %   - Being small, an attribute is stored in the object header
    %   of the object it describes and is thus attached directly to that
    %   object
    %   ----------------------------------
    %
    %   User Guide:
    %       http://www.hdfgroup.org/HDF5/doc/UG/13_Attributes.html
    %
    %   API:
    %       http://www.hdfgroup.org/HDF5/doc/RM/RM_H5A.html
    
    %{
      close         - Closes the specified attribute
      create        - Creates an attribute
      delete        - Deletes an attribute
      get_info      - Retrieves information about an attribute
      get_name      - Retrieves an attribute name
      get_space     - Retrieves a copy of an attribute's dataspace
      get_type      - Retrieves an attribute's datatype
      iterate       - Calls a user function for each attribute
      open          - Opens attribute specified by object id and name
      open_by_idx   - Opens attribute specified by index
      open_by_name  - Opens attribute specified by name
      read          - Reads an attribute
      write         - Writes an attribute
    %}
    
    properties
    end
    
    methods
    end
    
end

