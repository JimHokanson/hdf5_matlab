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
    %
    %   See Also:
    %   H5A
    
    %{
      x close         - Closes the specified attribute
      create        - Creates an attribute
      delete        - Deletes an attribute
      x get_info      - Retrieves information about an attribute
      x get_name      - Retrieves an attribute name
      x get_space     - Retrieves a copy of an attribute's dataspace
      x get_type      - Retrieves an attribute's datatype
      iterate       - Calls a user function for each attribute
      open          - Opens attribute specified by object id and name
      open_by_idx   - Opens attribute specified by index
      open_by_name  - Opens attribute specified by name
      read          - Reads an attribute
      write         - Writes an attribute
    %}
    
    properties (Hidden)
        h
    end
    
    %GET ONLY
    properties (Dependent)
        info
        name
        space
        type
    end
    
    methods
        function value = get.info(obj)
            value = H5A.get_info(obj.h);
        end
        function value = get.name(obj)
            value = H5A.get_name(obj.h);
        end
        function value = get.space(obj)
            %TODO: This needs works
            value = H5A.get_space(obj.h);
        end
        function value = get.type(obj)
            %TODO: This needs works
            value = H5A.get_type(obj.h);
        end
    end
    
    methods
        function value = read(obj,mem_type_id)
           if nargin == 1
               value = H5A.read(obj.h);
           else
               value = H5A.read(obj.h, mem_type_id);
           end
        end
        function write(obj)
        end
    end
    
    methods (Access=protected)
        function obj = attribute(id)
            %
            %   obj = h5m.attribute(id)
            obj.h = id;
        end
    end
    
    methods (Static)
        function create(obj)
        end
        function open(obj)
            %attr_id = H5A.open(obj_id,attr_name,aapl_id)
            %attr_id = H5A.open_by_idx(loc_id,obj_name,idx_type,order,n,aapl_id,lapl_id)
            %attr_id = H5A.open_by_name(loc_id,obj_name,attr_name,aapl_id,lapl_id)
        end
    end
    
    methods
        function delete(obj)
            try %#ok<TRYNC>
                close(obj.h);
            end
        end
    end
    
end

