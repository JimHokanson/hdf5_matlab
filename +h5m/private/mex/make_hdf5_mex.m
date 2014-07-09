%{

----------------------------
 This is a work in progress 
----------------------------

Steps to getting things working:

1) HDF5 Installation
    Windows: use prebuilt binares at:
                    http://www.hdfgroup.org/HDF5/release/obtain5.html



Failure Points:
1) Wrong Visual Studio Version vs pre-built binaries
2) 

To run call: 
--------------
make_hdf5_mex()


%NOTE: Need to change compiler flags from:
/MD
TO
/MT

This allows inclusion of the libraries ...

#TODO: Make this automatic

mex.getCompilerConfigurations('c++')

file at something like:
C:\Users\Jim\AppData\Roaming\MathWorks\MATLAB\R2014a\mex_C++_win64.xml

%}

MEX_FILE_NAME = 'hdf5_mex.cpp';

LIBS_TO_INCLUDE = {'-lszip','-lzlib','-lhdf5','-lhdf5_hl'};
LIBS_TO_INCLUDE2 = {'szip','zlib','hdf5','hdf5_hl'};

HDF5_ROOT_PATH = 'C:\Program Files\HDF_Group\HDF5\1.8.13\';

LIB_PATH = fullfile(HDF5_ROOT_PATH,'lib');
INC_PATH = fullfile(HDF5_ROOT_PATH,'include');

L_DIR = sprintf('-L"%s"',LIB_PATH);
I_DIR = sprintf('-I"%s"',INC_PATH);

mex('-v',MEX_FILE_NAME,L_DIR,I_DIR,LIBS_TO_INCLUDE{:});


