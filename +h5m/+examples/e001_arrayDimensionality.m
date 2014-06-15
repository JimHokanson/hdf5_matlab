function e001_arrayDimensionality()
%
%   h5m.examples.e001_arrayDimensionality()
%
%   Write array to disk. Test dimensionality of the array.
%
%
%


%Examine results in HD

data = reshape(1:20,[4 5]);

%This creates a matrix that is 4 rows, 5 columns, but in which the data
%is laid out as:
%
%   1  2  3  4  5
%   6  7  8  9  10
%   11 12 13 14 15
%   16 17 18 19 20
%
%   This is for the original code with no modifications (i.e. nothing
%   internally to reinterpret user intent)


save_root = h5m.example_helpers.getDataSaveRoot;

test_file_path = fullfile(save_root,'file1.h5');

delete(test_file_path);

file_obj = h5m.file.create(test_file_path);


%Part 1, doing nothing fancy with the dimensions



obj = h5m.dataset.create(file_obj,'test',class(data),size(data));

obj.write(data);

keyboard

end