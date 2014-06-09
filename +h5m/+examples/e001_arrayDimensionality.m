function e001_arrayDimensionality()
%
%   h5m.examples.e001_arrayDimensionality()
%
%   Write array to disk


%Examine results in HD

save_root = h5m.example_helpers.getDataSaveRoot;

test_file_path = fullfile(save_root,'file1.h5');


file_obj = h5m.file(test_file_path);
keyboard

end