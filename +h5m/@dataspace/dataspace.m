classdef dataspace < handle
    %
    %   Class:
    %   h5m.dataspace
    %
    %   A dataspace can be used to either:
    %   1) Define the size of the data when created
    %   2) Define the elements of the dataset that participate in a I/O
    %      operation.
    %
    %   User Guide:
    %       http://www.hdfgroup.org/HDF5/doc/UG/UG_frame12Dataspaces.html
    %
    %   API:
    %       http://www.hdfgroup.org/HDF5/doc/RM/RM_H5S.html
    %
    %   See Also:
    %   H5S
    %   h5m.dataspace.simple
    %   h5m.dataspace.scalar
    
    %{
      copy                       - Creates a copy of a dataspace
      create                     - Creates a dataspace
      close                      - Terminates access to a dataspace
      create_simple              - Creates a new simple dataspace
      extent_copy                - Copies the extent of a dataspace
    
      
      get_select_bounds          - Gets bounding box of a selection
      get_select_elem_npoints    - Gets number of points in selection
      get_select_elem_pointlist  - Gets list of points in selection
      get_select_hyper_blocklist - Gets list of hyperslab blocks
      get_select_hyper_nblocks   - Gets number of hyperslab blocks
      get_select_npoints         - Gets point count in a selection
      get_select_type            - Gets type of dataspace selection
    
      %Simple dataspace - see h5m.dataspace.simple
      %-------------------------------
      get_simple_extent_dims     - Gets dataspace dimension size
      get_simple_extent_ndims    - Determines rank of dataspace
      get_simple_extent_npoints  - Gets element count in a dataspace
      get_simple_extent_type     - Gets current class of a dataspace
      
      is_simple                  - Determines if dataspace is simple
      offset_simple              - Sets offset of a simple dataspace
      
      %Selection things
      %----------------------------------
      select_all                 - Selects the entire dataspace
      select_elements            - Selects elements for dataspace
      select_hyperslab           - Adds hyperslab to a selection
      select_none                - Resets selection to zero elements
      select_valid               - Verifies the validity of a selection
      set_extent_none            - Removes extent from a dataspace
      set_extent_simple          - Sets the size of a dataspace
    %}
    
    properties (Hidden)
       h 
    end
    
    methods (Access = protected)
        function obj = dataspace()
            
        end
    end
    
    methods (Static)
        function copy()
        end
        function create()
           %Options
           %------------        
           %'H5S_SCALAR'
           %'H5S_SIMPLE' - no need, see h5m.dataspace.create_simple
           %'H5S_NULL'
        end
    end
    methods
        function delete(obj)
            try %#ok<TRYNC>
            H5S.close(obj.h)
            end
        end
    end
    
end

