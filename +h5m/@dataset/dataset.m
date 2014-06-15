classdef dataset < handle
    %
    %   Class:
    %   h5m.dataset
    %
    %   Exposes:
    %   H5D
    %
    %   User Guide:
    %       http://www.hdfgroup.org/HDF5/doc/UG/10_Datasets.html
    %
    %   API Documentation:
    %       http://www.hdfgroup.org/HDF5/doc/RM/RM_H5D.html
    %
    %   See Also:
    %   H5D
    
    %{
      close             - Closes the specified dataset
      create            - Creates a new dataset
    
      %----------------
      get_access_plist  - Returns a dataset access property list
      get_create_plist  - Returns a dataset creation property list
      get_offset        - Returns the dataset address in the file
      get_space         - Returns a copy of the dataset's dataspace
      get_space_status  - Determines if space has been allocated
      get_storage_size  - Returns required amount of storage
      get_type          - Returns a copy of a dataset's datatype
      %---------------

      open              - Opens an existing dataset
      read              - Reads from a dataset
      set_extent        - Extends a dataset
      vlen_get_buf_size - Determines storage requirements for VL data
      write             - Writes to a dataset
    %}
    properties (Hidden)
        h
    end
    
    properties (Dependent)
       access_pl
       create_pl
       offset
       space
       space_status
       storage_size
       type
    end
    
    methods
        
    end
    
    methods (Access=protected)
        function obj = dataset(id)
            obj.h = id;
        end
        function delete(obj)
           H5D.close(obj.h);
        end
    end
    
    methods
        function write(obj,data,varargin)
            %
            %   NYI
            %   
            %   Inputs:
            %   -------
            %
            %
            %   Optional Inputs:
            %   ----------------
            %   mem_space : ????
            %       Selection info for the data being written. In other
            %       words, instead of writing the entire matrix, or
            %       creating a temporary copy in memory for this function,
            %       you  can just tell this function what of the data being
            %       passed in should actually be written to disk.
            %   file_space : ????
            %       Target selection of where the data is going to be
            %       written to. Instead of writing to the entire dataset
            %       you can write to just a part of it.
            
            in.mem_space   = []; %write everything
            in.file_space  = []; %target everything
            in.transfer_pl = [];
            in = h5m.sl.in.processVarargin(in,varargin);
            
           %H5D.write(dataset_id, mem_type_id, mem_space_id, file_space_id, plist_id,buf) 
        
           %Note reagarding mem_type_id:
           %We are currently using the default 'H5ML_DEFAULT'. 
           %The only reason not to use default is if we were trying
           %to avoid a casting operation and the data were really of some 
           %other type. For example, we had int32s but we were really
           %dealing with singles.
           
           %Input handling
           %-----------------------------
           if isempty(in.mem_space)
               mem_space_id = 'H5S_ALL';
           else
               mem_space_id = in.mem_space.h;
           end
           
           if isempty(in.file_space)
               file_space_id = 'H5S_ALL';
           else
               file_space_id = in.file_space.h;
           end
           
           if isempty(in.transfer_pl)
               plist_id = 'H5P_DEFAULT';
           else
               plist_id = in.transfer_pl.h;
           end
           
           %Function call
           %-----------------------------
           H5D.write(...
               obj.h,...
               'H5ML_DEFAULT',... 
               mem_space_id,...
               file_space_id,...
               plist_id,...
               data);
        end
    end
    methods (Static)
        function create_and_write(parent_obj,name)
           %Goal is to make adding data simple
        end

        function open()
        
        end
        obj = create(varargin);
    end
    
end

