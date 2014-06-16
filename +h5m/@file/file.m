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
    %   Property Lists:
    %   h5m.property_list.file_creation
    %   h5m.property_list.file_access
    %
    %   See Also:
    %   H5F
    
    %{
      close            - Closes an HDF5 file
      DONE create           - Creates an HDF5 file
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
      DONE open        - Opens an existing file
    
      ?????  Why would you want this ?????
      reopen           - Returns a new identifier for an open file
                        
      set_mdc_config   - Attempts to configure file's metadata cache
      unmount          - Unmounts a file
    %}
    
    properties (Hidden)
        h
    end
    
    %NOT YET IMPLEMENTED
    properties (Dependent)
        file_size  %Size in bytes????
        free_space %Space unused by any objects ... Why would this happen?
        %In bytes????
        info %TODO: Format not yet specified, it is whatever the underlying 
        %code returns
        
        %MDC - meta data cache - http://www.hdfgroup.org/HDF5/doc/Advanced/MetadataCache/
        %-------------------------
        %- ??? Where can I find out more about this
        mdc_config    %Current configuration
        mdc_hit_rate  %(cache hits / (cache hits + cache misses))
        mdc_size      %h5m.file.mdc_size
        name
        obj_count
    end
    
    methods
        function value = get.file_size(obj)
           value = H5F.get_filesize(obj.h);  
        end
        function value = get.free_space(obj)
           value = H5F.get_freespace(obj.h); 
        end
        function value = get.info(obj)
           %TODO: Consider casting to an object ...
           value = H5F.get_info(obj.h); 
        end
        function value = get.mdc_config(obj)
           value = H5F.get_mdc_config(obj.h);  
        end
        function value = get.mdc_hit_rate(obj)
           value = H5F.get_mdc_hit_rate(obj.h);  
        end
        function value = get.mdc_size(obj)
           %Object constructor call
           value = h5m.file.mdc_size(obj.h);
        end
        function value = get.name(obj)
           value = H5F.get_name(obj.h);
        end
    end
    
    methods (Access=protected)
        function obj = file(file_id)
            %
            %   obj = h5m.file(file_id);
            %
            %   Access via open() or close()
            obj.h = file_id;
        end
    end
    
    methods
        function obj_count = getObjectCounts(obj,types)
            %
            %   obj_count = getObjectCounts(obj,types)
            %
            %   Optional Inputs:
            %   ----------------
            %   types : char, cellstr,  
            %       
            %  
            
            %Returned -1 for a cell array input for types. I meant
            %to convert the cell array but I had forgotten. I'm not sure
            %that this is an expected output.
            %   
            
            if nargin < 2 || isempty(types)
               types = 'H5F_OBJ_ALL';
            elseif iscellstr(types)
                values = cellfun(@H5ML.get_constant_value,types);
                
                types = 0;
                for iValue = 1:length(values)
                   types = bitor(types,values(iValue)); 
                end
            end
            
            %TODO: Allow support of a numeric array
            
           obj_count = H5F.get_obj_count(obj.h,types); 
        end
        function getObjectIDsOfType(obj,types_to_get,varargin)
            
            
            
        %TODO: How can I provide these as enumerations ?????
        %
        %
        %1  'H5F_OBJ_FILE'   
        %2  'H5F_OBJ_DATASET'  
        %4  'H5F_OBJ_GROUP'    
        %8  'H5F_OBJ_DATATYPE' 
        %16 'H5F_OBJ_ATTR'     
        %31 'H5F_OBJ_ALL'      
        %32 'H5F_OBJ_LOCAL' 
        
        
        in.max_objs = [];
        in = h5m.sl.in.processVarargin(in,varargin);
        
        if isempty(in.max_objs)
            max_objs = obj.getObjectCounts();
        else
            max_objs = in.max_objs;
        end
            
        
        [n_ids,id_list] = H5F.get_obj_ids(obj.h,types_to_get,max_objs);
        
        %id_list : H5ML.id
        
        keyboard
        
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
            
            in.read_only = true;
            in.file_access_pl = [];
            in = h5m.sl.in.processVarargin(in,varargin);

            if nargin == 1
                file_id = H5F.open(filepath_or_name);
            else
                if in.read_only
                    flags = 'H5F_ACC_RDONLY';
                else
                    flags = 'H5F_ACC_RDWR';
                end
                if isempty(in.file_access_pl)
                    fapl_id = 'H5P_DEFAULT';
                else
                    fapl_id = in.file_access_pl;
                end
                file_id = H5F.open(filepath_or_name,flags,fapl_id);
            end
            obj = h5m.file(file_id);
            
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

