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
    %   See Also:
    %   H5G
    
    %{
      close              - Closes the specified group
      create             - Creates a new group
      get_info           - Returns information about a group
      open               - Opens a group
    %}
    
    properties (Hidden)
        h
    end
    
    methods
        function obj = group(id)
            obj.h = id;
        end
    end
    methods (Static)
        function obj = open(parent_id,name,gapl_obj)
           obj = []; 
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

