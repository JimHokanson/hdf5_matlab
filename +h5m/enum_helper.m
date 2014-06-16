classdef enum_helper < handle
    %
    %   Class:
    %   h5m.enum_helper
    %
    %   Access via:
    %   h5m.enum_helper.instance();
    
    properties
        enum_strings
        enum_values
        access_names
    end
    
    methods (Access = private)
        function obj = enum_helper()
            %TODO: Load enumeration info
            base_path = h5m.sl.dir.getMyBasePath('',1);
            file_path = fullfile(base_path,'EnumerationInfo.tab');
            
            %TODO: Move locally
            data = sl.io.readDelimitedFile(file_path,'\t','header_lines',1);
            
            obj.enum_strings = cellfun(@(x) x(2:end-1),data(:,1),'un',0);
            obj.enum_values  = str2double(data(:,2));
            obj.access_names = data(:,3);
        end
    end
    
    methods
        function enum_string = getEnumerationStringFromAccessFunction(obj,access_name,value)
            %
            %   Given a specific function and a value, this allows looking
            %   up the enumeration string associated with that value in
            %   order to gain insight into the meaning of the value.
            %
            %   Example:
            %   --------
            %   %NOTE: I've added a function handle to make repeated
            %   %calls a bit cleaner
            %
            %   eh = h5m.enum_helper.instance();
            %   getString = @(access_name,value)getEnumerationStringFromAccessFunction(eh,access_name,value);
            %   enum_string = getString('H5P.get_alloc_time',obj.allocation_time)
            %
            mask = strcmp(access_name,obj.access_names);
            temp_strings = obj.enum_strings(mask);
            temp_values  = obj.enum_values(mask);
            enum_string  = temp_strings{temp_values == value};
        end
    end
    
    methods(Static)
        function obj = instance()
            persistent uniqueInstance
            if isempty(uniqueInstance)
                obj = h5m.enum_helper();
                uniqueInstance = obj;
            else
                obj = uniqueInstance;
            end
        end
    end
end

