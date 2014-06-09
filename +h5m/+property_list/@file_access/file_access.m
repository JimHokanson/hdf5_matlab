classdef file_access < handle
    %
    %   Class:
    %   h5m.property_list.file_access
    %
    %   User Guide:
    %       http://www.hdfgroup.org/HDF5/doc/UG/UG_frame08TheFile.html
    %
    %   API:
    %       http://www.hdfgroup.org/HDF5/doc/RM/RM_H5P.html#FileAccessPropFuncs
    %
    %   See Also:
    %   H5P
    
    %{
     File Access Properties:
     get_alignment             - Gets alignment properties
     set_alignment             - Sets alignment properties
    
     get_meta_block_size       - Gets the metadata block size setting
     set_meta_block_size       - Sets the minimum metadata block size
    
    
     
     get_driver                - Gets low-lever driver identifier
     get_family_offset         - Gets low-level file offset
     get_fapl_core             - Gets the H5FD_CORE driver properties
     get_fapl_family           - Gets file access for the family driver
     get_fapl_multi            - Gets multi-file driver properties
     get_fclose_degree         - Gets the file close degree
     get_libver_bounds         - Gets library version bounds settings
     get_gc_references         - Gets the garbage collecting settings
     get_mdc_config            - Gets the metadata cache configuration
     
     get_multi_type            - Gets MULTI driver type of data
     get_sieve_buf_size        - Gets maximum data sieve buffer size
     get_small_data_block_size - Gets the small data block size setting
    
     
     set_family_offset         - Sets low-level file offset 
     set_fapl_core             - Sets the H5FD_CORE driver properties
     set_fapl_family           - Sets file access for the family driver
     set_fapl_log              - Sets up the use of the logging driver
     set_fapl_multi            - Sets multi-file driver properties
     set_fapl_sec2             - Sets up the use of the sec2 driver
     set_fapl_split            - Emulates the old split file driver
     set_fapl_stdio            - Sets the standard I/O driver
     set_fclose_degree         - Sets the file close degree
     set_gc_references         - Sets the garbage collecting flag
     set_libver_bounds         - Sets library version bounds settings
     set_mdc_config            - Sets the metadata cache configuration
     
     set_multi_type            - Sets the type of data property
     set_sieve_buf_size        - Sets the data sieve buffer max size
     set_small_data_block_size - Sets small data contiguous block sizes
    %}
    
    properties (Hidden)
        h
    end
    
    properties (Dependent)
       alignment %h5m.properties.data_alignment 
       
       meta_block_size %Minimum size in bytes of new metadata block allocations.
       %
       %Metadata typically exists as very small chunks of data; storing
       %metadata elements in a file without blocking them can result in
       %hundreds or thousands of very small data elements in the file. This
       %can result in a highly fragmented file and seriously impede I/O. By
       %blocking metadata elements, these small elements can be grouped in
       %larger sets, thus alleviating both problems.
    end
    
    methods
        function value = get.alignment(obj)
           [threshold, align_value] = H5P.get_alignment(obj.h); 
           value = h5m.properties.data_alignment(threshold,align_value);
        end 
        function set.alignment(obj,align_obj)
           align_obj.applyValueToID(obj.h);
        end
        function value = get.meta_block_size(obj)
           value = H5P.get_meta_block_size(obj.h);
        end
        function set.meta_block_size(obj,n_bytes)
           H5P.set_meta_block_size(obj.h,n_bytes)
        end
    end
    methods
        function obj = file_access()
           obj.h = H5P.create('H5P_DATASET_CREATE'); 
        end
    end
    
end

