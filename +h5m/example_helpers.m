classdef example_helpers
    %
    %   h5m.example_helpers
    %
    %   Helpers functions that are shared by the example functions.
    
    properties
    end
    
    methods (Static)
        function save_root_path = getDataSaveRoot()
            %
            %   h5m.example_helpers.getDataSaveRoot
            %
            %   Returns a path where an example can save data.
            %
            %We'll save in a directory that is off of the base repo
            %path
           
           %repo_folder/example_data/[example_name]/
           
           repo_path      = h5m.sl.dir.getMyBasePath('',1);
           
           calling_info   = sl.stack.calling_function_info();
           
           save_root_path = sl.dir.createFolderIfNoExist(...
               repo_path,'example_data',calling_info.name);
           
        end
    end
    
end

