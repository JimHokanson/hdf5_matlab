classdef simple < h5m.dataspace
    %
    %   Class:
    %   h5m.dataspace.simple
    %
    %   Simple, aka array, dataspaces specify size information for data
    %   (specifically a dataset) on disk.
    %
    %   User Guide:
    %       http://www.hdfgroup.org/HDF5/doc/UG/UG_frame12Dataspaces.html
    %
    %   API:
    %       http://www.hdfgroup.org/HDF5/doc/RM/RM_H5S.html
    %   See Also:
    %   h5m.dataspace
    
    %{
    Implementation Notes:
    - I haven't implemented adding dimensions, but I think this is possible
    - Inheritance isn't currently doing much, it might be better to remove
    
    %}
    
    %{
          %-------------------------------
      get_simple_extent_dims     - Gets dataspace dimension size
      get_simple_extent_ndims    - Determines rank of dataspace
      get_simple_extent_npoints  - Gets element count in a dataspace
      get_simple_extent_type     - Gets current class of a dataspace
      
      is_simple                  - Determines if dataspace is simple
      offset_simple              - Sets offset of a simple dataspace
    
    %}
    
    
    methods
        function obj = simple(starting_dim_sizes,max_dim_sizes)
            %
            %
            %   obj = simple(starting_dim_sizes,*max_dim_sizes)
            %
            %   Inputs:
            %   -------
            %   starting_dim_sizes: array
            %       An initial guess as to the size of the array. All
            %       values should be real numbered and not infinite.
            %   max_dim_sizes : array
            %       The maximum size that any dimension of an array might
            %       be. A value of Inf may be used to indicate that the
            %       dimension will grow by an unknown amount.
            %
            %   ??? How do dimensions and max_dimensions impact
            %   performance?
            %
            
            rank = length(starting_dim_sizes);
            
            if nargin == 1
                max_dim_sizes = starting_dim_sizes;
            else
                %H5ML.get_constant_value('H5S_UNLIMITED') => -1
                max_dim_sizes(isinf(max_dim_sizes)) = -1;
            end
            
            obj.h = H5S.create_simple(rank,starting_dim_sizes,max_dim_sizes);
        end
    end
    
end

