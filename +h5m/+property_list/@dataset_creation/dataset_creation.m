classdef dataset_creation < handle
    %
    %   Class:
    %   h5m.property_list.dataset_creation
    %
    %   See Also:
    %   H5P
    
    %{
     
     
     get_alloc_time        - Gets the timing for allocation
     set_alloc_time        - Sets the timing for allocation
    
     get_chunk             - Gets the chunk size
     set_chunk             - Sets the chunk size
    
     get_fill_time         - Gets the fill values write time
     set_fill_time         - Sets the fill value write time
     get_fill_value        - Gets the dataset fill value
     set_fill_value        - Sets the fill value for a dataset 
     fill_value_defined    - Checks if a fill value is defined
    
     get_layout            - Gets the raw data layout
     set_layout            - Sets the raw data layout
    
     %NOT YET IMPLEMENTED
     %=======================================
     get_external          - Gets external file from the list
     get_external_count    - Gets the count of external files
     
     get_filter            - Gets the filter in a pipeline
     get_filter_by_id      - Gets the filter information by index
     
     get_nfilters          - Gets the number of pipeline filters
    
     modify_filter         - Modifies a filter in a pipeline
     remove_filter         - Delete filters in the filter pipeline
     all_filters_avail     - Checks if filters are available
    
     
     
     set_deflate           - Sets compression method and level
     set_external          - Adds external file to the list

     set_filter            - Adds the filter to the pipeline
     set_fletcher32        - Sets up use of the Fletcher32 filter
     
     set_nbit              - Sets up the use of the N-Bit filter
     set_scaleoffset       - Sets up the Scale-Offset filter
     set_shuffle           - Sets up use of the shuffle filter
    
    %}
    
    %???? - How do I want to do this????
    
    %TODO: Fix display of enumerations ...
    
    properties (Hidden)
       h 
    end
    
    properties (Dependent)
       allocation_time %Controls when space on disk is allocated for the dataset
       % 0) H5D_ALLOC_TIME_DEFAULT - what does default mean????
       % 1) H5D_ALLOC_TIME_EARLY   - at time of dataset creation
       %        NOTE: I don't think this works in all cases. TODO: When 
       %        does this work. Presumably it doesn't work if the maximum
       %        data size is not allocated
       % 3) H5D_ALLOC_TIME_INCR    - ?????
       %x2) H5D_ALLOC_TIME_LATE    - when data is first written

       chunk_size
       %TODO: What limits are there on this??? I think I tried setting it
       %larger than the max data dimension once and that didn't work
       %
       %TODO: Figure out how the dimensions work
       
       
       %?external?
       %?external_count
       
       %Filling (aka data initialization)
       %----------------------------------
       %This specifies how the data is 
       fill_time
       %2) H5D_FILL_TIME_IFSET - upon allocation if user value is set
       %0) H5D_FILL_TIME_ALLOC - upon allocation
       %1) H5D_FILL_TIME_NEVER - never fill (fastest when going to write
       %    to all data points)
       fill_value
       fill_value_defined
       
       %Raw data layout
       %---------------
       raw_data_layout
       %0) H5D_COMPACT    - data written into the header
       %1) H5D_CONTIGUOUS - data written into one location
       %2) H5D_CHUNKED    - data written into multiple locations based on
       %                    writing
       
       
       %Missing
       %-external
       %-external_count
       %-filter
       %-filter_by_id
       %-nfilters
       %Also missing set methods
    end
    
    %-------------------------
    %H5P.set_deflate(level) %level goes from 0 (none?) to 9 (most)
    %Why can't we get the compression value
    %
    %Rename as setCompressionLevel
    %
    %Does this not vary by filter???
    %---------------------------------
    
    %???? Do we want to keep track of what we've set or not set?
    methods
        function value = get.allocation_time(obj)
           value = H5P.get_alloc_time(obj.h); 
        end
        function set.allocation_time(obj,value)
           %TODO: Allow setting by character
           H5P.set_alloc_time(obj.h,value) 
        end
        function value = get.chunk_size(obj)
           try
              value = H5P.get_chunk(obj.h);
           catch ME
              %TODO: Does the error class exist?
              %The value is not defined if not in chunk mode.
              value = [];
           end
        end
        function set.chunk_size(obj,value)
           H5P.set_chunk(obj.h,value); 
        end
        function value = get.fill_time(obj)
           value = H5P.get_fill_time(obj.h); 
        end
        function set.fill_time(obj,value) 
           H5P.set_fill_time(obj.h,value);
        end
        function value = get.fill_value(obj)
           %TODO: Requires a type as an input
           %
           %:/ This means we need to know what we are expecting, can we
           %use a default value that just does no transformation????
           
           %value = H5P.get_fill_value(obj.h); 
           value = [];
           %What is the default fill value???? i.e. not user specified
           %but what gets placed in the array if the user does not define
           %a value
        end
        function set.fill_value(obj,value)
           %TODO: Get type from value
           %H5P.set_fill_value(obj.h,type,value); 
        end
        function value = get.fill_value_defined(obj)
           value = H5P.fill_value_defined(obj.h); 
        end
        function value = get.raw_data_layout(obj)
           value = H5P.get_layout(obj.h);  
        end
    end
    
    methods
        function obj = dataset_creation()
           obj.h = H5P.create('H5P_DATASET_CREATE'); 
        end
    end
    
end

