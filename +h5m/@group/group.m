classdef group < handle
    %
    %   Class:
    %   h5m.group
    %
    %   User Guide:
    %       http://www.hdfgroup.org/HDF5/doc/UG/UG_frame08TheFile.html
    %
    %   API:
    %       http://www.hdfgroup.org/HDF5/doc/RM/RM_H5G.html
    %
    %   Property Lists:
    %   h5m.property_list.group_creation
    %   h5m.property_list.group_access
    %
    %   See Also:
    %   H5G
    %   H5O
    %   h5m.file
    %   h5m.dataset
    %   h5m.property_list.group_creation
    %   h5m.property_list.group_access
    
    %TODO: Consider inheriting from H5O
    
    %In Matlab it won't let chunksize be greater than the datasize
    
    %{
      DONE close              - Closes the specified group
      DONE create             - Creates a new group
      DONE get_info           - Returns information about a group
      DONE open               - Opens a group
    %}
    
    properties (Hidden)
        h
    end
    
    properties (Dependent)
        info %Format is currently unspecified (i.e. it is whatever the API
        %returns)
    end
    
    methods
        function value = get.info(obj)
            value = H5G.get_info(obj.h);
        end
    end
    
    methods
        function obj = group(id)
            %
            %   obj = h5m.group(id)
            obj.h = id;
        end
        function delete(obj)
            try  %#ok<TRYNC>
                H5G.close(obj.h);
            end
        end
        function close(obj)
            H5G.close(obj.h);
        end
    end
    methods (Static)
        function obj = open(parent_obj,name,varargin)
            %
            %
            %   obj = open(parent_obj,name,varargin)
            %
            %   obj = open(parent_obj,name,varargin)
            %
            %   Inputs:
            %   -------
            %   name : 
            %       Name of the group. How are nested objects handled with
            %       names? Do you need the full name if you pass in a lower
            %       object???? For a group whose parent is root you need
            %       a leading slash ...
            %
            %   Optional Inputs:
            %   ----------------
            %   group_access_pl : h5m.property_list.group_access
            %
            %   Example:
            %   ---------------------------------------
            %   file_obj  = h5m.file.open(file_path);
            %   group_obj = h5m.group.open(file_obj,'test_path');
            
            
            
            in.group_access_pl = [];
            in = h5m.sl.in.processVarargin(in,varargin);
            
            if nargin == 2
                group_id = H5G.open(parent_obj.h,name);
            else
                group_id = H5G.open(parent_obj.h,name,in.group_access_pl.h);
            end
            
            obj = h5m.group(group_id);
        end
        function obj = create(parent_obj,name,varargin)
            %
            %   obj = h5m.group.create(parent_id,name,varargin)
            %
            %   Inputs:
            %   -------
            %   parent_obj : h5m.group or h5m.file
            %
            %   name : str
            %       Name of the group to create. ??? - rules for nesting?
            %
            %   Optional Inputs:
            %   ----------------
            %   link_creation_pl  : h5m.property_list.link_creation
            %   group_creation_pl : h5m.property_list.group_creation
            %   group_access_pl   : h5m.property_list.group_access
            
            in.link_creation_pl  = [];
            in.group_creation_pl = [];
            in.group_access_pl   = [];
            in = h5m.sl.in.processVarargin(in,varargin);
            
            %Link Creaton Property List ------
            if isempty(in.link_creation_pl)
                lcpl_id = 'H5P_DEFAULT';
            else
                lcpl_id = in.link_creation_pl.h;
            end
            
            %Group Creation Property List ------
            if isempty(in.group_creation_pl)
                gcpl_id = 'H5P_DEFAULT';
            else
                gcpl_id = in.group_creation_pl.h;
            end
            
            %Group Access Propery List -----
            if isempty(in.group_access_pl)
                gapl_id = 'H5P_DEFAULT';
            else
                gapl_id = in.group_access_pl.h;
            end
            
            group_id = H5G.create(parent_obj.h,name,lcpl_id,gcpl_id,gapl_id);
            obj = h5m.group(group_id);
        end
    end
    
end

