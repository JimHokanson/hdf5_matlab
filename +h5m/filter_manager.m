classdef filter_manager
    %
    %   Class:
    %   h5m.filter_manager
    %
    %   API:
    %       http://www.hdfgroup.org/HDF5/doc/RM/RM_H5Z.html
    %
    %   See Also:
    %   H5Z
    
    %{
   	filter_avail    - Determines whether a filter is available
  	get_filter_info - Retrieves information about a filter
    
    %}
    
    %{
        'H5Z_FILTER_DEFLATE'
        'H5Z_FILTER_SHUFFLE'
        'H5Z_FILTER_FLETCHER32'
        'H5Z_FILTER_SZIP'
        'H5Z_FILTER_NBIT'
        'H5Z_FILTER_SCALEOFFSET'
    %}
    
    %{
    Table 5. Data pipeline filters
    Filter	Description
    gzip compression	Data compression using zlib.
    Szip compression	Data compression using the Szip library. 
            See The HDF Group website for more information regarding the 
            Szip filter.
            http://www.hdfgroup.org/doc_resource/SZIP/
    N-bit compression	Data compression using an algorithm specialized 
            for n-bit datatypes.
    Scale-offset compression	Data compression using using a 
            “scale and offset” algorithm.
    Shuffling	To improve compression performance, data is regrouped by 
            its byte position in the data unit. In other words, the 1st, 
            2nd, 3rd, and 4th bytes of integers are stored together 
            respectively.
    Fletcher32	Fletcher32 checksum for error-detection.
    %}
    
    %????? - How to determine if dynamically loaded filters are available
    
    properties
        
    end
    
    properties
       gzip_available %http://en.wikipedia.org/wiki/Gzip
       szip_available %http://www.hdfgroup.org/doc_resource/SZIP/
       nbit_available %Useful when only storing n bits of data in a larger
       %format (e.g. 12 bit data as a 16 bit integer)
       %See description in:
       %    http://www.hdfgroup.org/HDF5/doc/UG/10_Datasets.html
       scale_offset_available %Perform scale and offset of data prior to storing
       %See description in:
       %    http://www.hdfgroup.org/HDF5/doc/UG/10_Datasets.html
       shuffle_available
       %http://www.pytables.org/docs/manual-1.3.3/x5502.html
       fletcher_avaiable %Data integrity check, not for compression
       %http://en.wikipedia.org/wiki/Fletcher's_checksum
       %gzip_info
       %szip_info
       %
       %    [filter_config_flags] = H5Z.get_filter_info(filter)
       %
       %        Bitwise operation ...
       %        H5Z_FILTER_CONFIG_ENCODE_ENABLED
       %        H5Z_FILTER_CONFIG_DECODE_ENABLED
        %      	flags = H5Z.get_filter_info('H5Z_FILTER_DEFLATE');
        %     	functionality = H5ML.get_constant_value('H5Z_FILTER_CONFIG_ENCODE_ENABLED');
        %    	enabled = bitand(flags,functionality) > 0;
    end
    
    methods
       function value = get.gzip_available(~)
          value = H5Z.filter_avail('H5Z_FILTER_DEFLATE'); 
       end
       function value = get.szip_available(~)
          value = H5Z.filter_avail('H5Z_FILTER_SZIP'); 
       end
       function value = get.nbit_available(~)
          value = H5Z.filter_avail('H5Z_FILTER_NBIT'); 
       end
       function value = get.scale_offset_available(~)
          value = H5Z.filter_avail('H5Z_FILTER_SCALEOFFSET'); 
       end
       function value = get.shuffle_available(~)
          value = H5Z.filter_avail('H5Z_FILTER_SHUFFLE'); 
       end
       function value = get.fletcher_avaiable(~)
          value = H5Z.filter_avail('H5Z_FILTER_FLETCHER32'); 
       end
    end
    
end

