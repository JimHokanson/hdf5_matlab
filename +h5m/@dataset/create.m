function obj = create(parent_obj,name,data_type_on_disk,data_space_obj,varargin)
%
%
%   obj = h5m.dataset.create(parent_obj,name,data_type_on_disk,data_space_obj,varargin)
%
%   Inputs:
%   -------
%   name :
%       Can this be nested? For example /a/b???
%
%   parent_obj : h5m.file or h5m.group
%
%   data_type_on_disk : {'uint8','int8',...,'single','double')
%       This is the data type on disk. Normally the data input
%       will match type but this is not required
%
%   data_space_obj : h5m.dataspace.simple OR size_array
%
%   Optional Inputs:
%   ----------------
%
%   Examples:
%   ---------
%   obj = h5m.dataset.create(file_obj,'test',class(data),size(data))
%
%
%
%   See Also:
%   h5m.file
%   h5m.group
%   h5m.dataspace.simple
%   h5m.property_list.link_creation
%   h5m.property_list.dataset_creation
%   h5m.property_list.dataset_access

in.link_creation_pl    = 'H5P_DEFAULT';
in.dataset_creation_pl = 'H5P_DEFAULT';
in.dataset_access_pl   = 'H5P_DEFAULT';
in = h5m.sl.in.processVarargin(in,varargin);

switch(data_type_on_disk)
    case 'double'
        data_type_on_disk_fcn_input = 'H5T_NATIVE_DOUBLE';
    case 'single'
        data_type_on_disk_fcn_input = 'H5T_NATIVE_FLOAT';
    case 'uint64'
        data_type_on_disk_fcn_input = 'H5T_NATIVE_UINT64';
    case 'int64'
        data_type_on_disk_fcn_input = 'H5T_NATIVE_INT64';
    case 'uint32'
        data_type_on_disk_fcn_input = 'H5T_NATIVE_UINT';
    case 'int32'
        data_type_on_disk_fcn_input = 'H5T_NATIVE_INT';
    case 'uint16'
        data_type_on_disk_fcn_input = 'H5T_NATIVE_USHORT';
    case 'int16'
        data_type_on_disk_fcn_input = 'H5T_NATIVE_SHORT';
    case 'uint8'
        data_type_on_disk_fcn_input = 'H5T_NATIVE_UCHAR';
    case 'int8'
        data_type_on_disk_fcn_input = 'H5T_NATIVE_CHAR';
    otherwise
        error('Unrecognized type: %s',data_type_on_disk);
end

if isnumeric(data_space_obj)
   data_space_obj = h5m.dataspace.simple(data_space_obj);
end

%inputs (loc_id,name,type_id,space_id,lcpl_id,dcpl_id,dapl_id)

dataset_id = H5D.create(...         %Input names from H5D.create
    parent_obj.h,...                %loc_id
    name,...                        %name
    data_type_on_disk_fcn_input,... %type_id
    data_space_obj.h,...            %space_id
    in.link_creation_pl,...         %lcpl_id
    in.dataset_creation_pl,...      %dcpl_id
    in.dataset_access_pl);          %dapl_id

    obj = h5m.dataset(dataset_id);
end