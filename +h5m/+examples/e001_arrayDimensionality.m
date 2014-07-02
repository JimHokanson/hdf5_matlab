function e001_arrayDimensionality()
%
%   h5m.examples.e001_arrayDimensionality()
%
%   Write array to disk. Test dimensionality of the array.
%
%   Results: 
%   ------------
%   The interface takes the buffer and writes it to disk. The HDF5
%   library interface notes the dimensions when writing, but NOT the data
%   order. This means that when writing to disk the default is to create
%   the # of rows and columns specified, but for the data itself to
%   interpreted by other programs as going across a row first.
%
%   Original Matrix (in Matlab):
%   1     5     9    13    17
%   2     6    10    14    18
%   3     7    11    15    19
%   4     8    12    16    20
%
%   HDFView following use of H5D.write 
%   where dimensions specified were [4 5]:
%   1  2  3  4  5
%   6  7  8  9  10
%   11 12 13 14 15
%   16 17 18 19 20
%
%   Matlab's h5write will switch the dimensions, so that the matrix stored
%   is the transponse of the original matrix.
%
%   HDFView following use of h5write
%    1     2     3     4
%    5     6     7     8
%    9    10    11    12
%   13    14    15    16
%   17    18    19    20
%
%   One could change the data order in the buffer but this computationally
%   expensive and without an indicator of data ordering it becomes
%   ambiguous as to how the data are actually ordered.


data = reshape(1:20,[4 5]);

save_root = h5m.example_helpers.getDataSaveRoot;

test_file_path = fullfile(save_root,'file1.h5');

delete(test_file_path);

file_obj = h5m.file.create(test_file_path);


%Part 1, doing nothing fancy with the dimensions
%-----------------------------------------------
obj = h5m.dataset.create(file_obj,'test',class(data),size(data));

obj.write(data);

%Part 2, using h5write (NOT YET IMPLEMENTED)

keyboard

end