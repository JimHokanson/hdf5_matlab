classdef dataset < handle
    %
    %   Class:
    %   h5m.dataset
    %
    %   Exposes:
    %   H5D
    %
    %   About Datasets:
    %   http://www.hdfgroup.org/HDF5/doc/UG/10_Datasets.html
    %
    %   Documentation of Interface:
    %   http://www.hdfgroup.org/HDF5/doc/RM/RM_H5D.html
    %
    %   See Also:
    %   H5D
    
    %{
      close             - Closes the specified dataset
      create            - Creates a new dataset
      get_access_plist  - Returns a dataset access property list
      get_create_plist  - Returns a dataset creation property list
      get_offset        - Returns the dataset address in the file
      get_space         - Returns a copy of the dataset's dataspace
      get_space_status  - Determines if space has been allocated
      get_storage_size  - Returns required amount of storage
      get_type          - Returns a copy of a dataset's datatype
      open              - Opens an existing dataset
      read              - Reads from a dataset
      set_extent        - Extends a dataset
      vlen_get_buf_size - Determines storage requirements for VL data
      write             - Writes to a dataset
    %}
    properties
    end
    
    methods (Access=protected)
        function obj = dataset()
        
        end
    end
    
    methods
        function write()
        
        end
    end
    methods (Static)
        function create(name,parent_obj,data_example)
            %
            %
            %   
            %
            %   Inputs:
            %   -------
            %   name :
            %       Can this be nested? For example /a/b???
            %
            %   parent_obj : h5m.file or h5m.group
            %
            %   data_example :
            %       ???? How to do default, i.e. 'H5ML_DEFAULT'
            %       If the default is passed in then Matlab will determine
            %       automagically. How does this impact allocate on create?
            %       Would that even work with the default????
            
            %Input Translations:
            %  loc_id   - id from parent_obj
            %  name     - name (might need to transform)
            %  type_id  - compute from data_example
            %  space_id -
            
           %(loc_id,name,type_id,space_id,lcpl_id,dcpl_id,dapl_id)  
        end
        function open()
        
        end
    end
    
end

