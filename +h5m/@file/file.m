classdef file < handle
    %
    %   Class:
    %   h5m.file
    %
    %   User Guide:
    %       http://www.hdfgroup.org/HDF5/doc/UG/UG_frame08TheFile.html
    %   
    %   API:
    %       http://www.hdfgroup.org/HDF5/doc/RM/RM_H5F.html
    %
    %   See Also:
    %   H5F
    
    %{
      close            - Closes an HDF5 file
      create           - Creates an HDF5 file
      flush            - Flushes buffers to disk
      get_access_plist - Returns a file access property identifier
      get_create_plist - Returns a file creation property list
      get_filesize     - Returns the size of an HDF5 file
      get_freespace    - Returns the amount of free space in a file
      get_info         - Returns global information for a file
      get_mdc_config   - Returns current metadata cache configuration
      get_mdc_hit_rate - Returns file's metadata cache hit rate
      get_mdc_size     - Obtain metadata chache size data for a file
      get_name         - Returns name of file owning the object
      get_obj_count    - Returns count of file's open identifiers
      get_obj_ids      - Returns a list of open object identifiers
      is_hdf5          - Determines if a file is in the HDF5 format
      mount            - Mounts a file
      open             - Opens an existing file
      reopen           - Returns a new identifier for an open file
      set_mdc_config   - Attempts to configure file's metadata cache
      unmount          - Unmounts a file
    %}
    
    properties (Hidden)
       h 
    end
    
    %NOT YET IMPLEMENTED
    properties
       filesize
       freespace
       info
       mdc_config
       mdc_hit_rate
       mdc_size
       name
       obj_count
       obj_ids
    end
    
    methods
        
    end
    
    methods (Access=protected) 
        function obj = file(file_id)
            %
            %   obj = h5m.file(file_id);
           obj.h = file_id; 
        end
    end
    methods (Static)
        function obj = open(filepath_or_name,varargin)
            %
            %   h5m.file.open(filepath_or_name,*flags,*fapl_obj)
            %
            %   Optional Inputs:
            %   ----------------
            %   mode: ??? How to handle this???
            %       'r'
            %       'r
            %
            %   fapl_obj: h5m.property_list.file_access 
            
            %Mode
            %H5F_ACC_EXCL   - rw, fail if exists            (create_new_file_for_rw)
            %H5F_ACC_TRUNC  - rw, overwrite if necessary    (rw)
            %H5F_ACC_RDONLY - r, fails if not exist         (read only)
            %HFF_ACC_RDWR   - rw, fails if doesn't exist    (read_or_modify_file)
            
            %
            if nargin == 1
                file_id = H5F.open(filepath_or_name);
            else
                
            end
            obj     = h5m.file(file_id);
            
        end
        function obj = create(filepath_or_name,varargin) %,fcpl_obj,fapl_obj)
           %
           %    h5m.file.create(filepath_or_name,mode,fcpl_obj,fapl_obj)
           %
           %    Inputs:
           %    -------
           %    filepath_or_name :
           %
           %    Optional Inputs:
           %    ----------------
           %    fail_if_exists : (default true)
           %        If true, an error will be thrown if the file exists. If
           %        false, new data will overwrite any old data.
           %    file_creation_pl : 
           %        File cer
           %    file_access_pl : h5m.property_list.file_access 
           %
            
           in.fail_if_exists   = true;
           in.file_creation_pl = [];
           in.file_access_pl   = [];
           in = h5m.sl.in.processVarargin(in,varargin);
           
            if nargin == 1
                id = H5F.create(filepath_or_name);
            else
                %Flag --------------
                if in.fail_if_exists
                    flags = 'H5F_ACC_EXCL';
                else
                    flags = 'H5F_ACC_TRUNC';
                end
                
                %File Creation Property List ------
                if isempty(in.file_creation_pl)
                    fcpl_id = 'H5P_DEFAULT';
                else
                    fcpl_id = in.file_creation_pl.h;
                end
                
                %File Access Propery List -----
                if isempty(in.file_access_pl)
                    fapl_id = 'H5P_DEFAULT';
                else
                    fapl_id = in.file_access_pl.h;
                end
                
                
                id = H5F.create(filepath_or_name,flags,fcpl_id,fapl_id);
            end
            obj = h5m.file(id);
        end
    end
    
    methods 
        function delete(obj)
           
        end
    end
    
end

