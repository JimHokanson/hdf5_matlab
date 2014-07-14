%{

----------------------------
 This is a work in progress 
----------------------------

Steps to getting things working:

1) HDF5 Installation
    Windows: use prebuilt binares at:
    	http://www.hdfgroup.org/HDF5/release/obtain5.html
    Windows: requires using CMAKE or Visual Studio 2012
        http://www.microsoft.com/en-us/download/details.aspx?id=34673
2) (Windows) Make sure the redistributable is installed:
    

http://stackoverflow.com/questions/17023419/win-7-64-bit-dll-problems

Failure Points:
1) Wrong Visual Studio Version vs pre-built binaries
2) HDF5 library not in path - need to figure out why this is even needed
    - NOTE: If the path is too long, the Windows HDF5 installer fails to
    modify it - used http://patheditor2.codeplex.com/ (alternatives?)
3) Redistributable not installed

***** To run call: *****
------------------------
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


C:\local\boost_1_55_0\lib64-msvc-12.0


%}

MEX_FILE_NAME = 'hdf5_mex.cpp';
%===========================================================
HDF5_ROOT_PATH = 'C:\Program Files\HDF_Group\HDF5\1.8.13\';
BOOST_PATH     = 'C:\local\boost_1_55_0';
%===========================================================

LIBS_TO_INCLUDE = {'-lszip','-lzlib','-lhdf5','-lhdf5_hl'};
%LIBS_TO_INCLUDE2 = {'szip','zlib','hdf5','hdf5_hl'};




LIB_PATH   = fullfile(HDF5_ROOT_PATH,'lib');
INC_PATH_1 = fullfile(HDF5_ROOT_PATH,'include');
INC_PATH_2     = BOOST_PATH; %Make sure not to terminate with \


L_DIR = sprintf('-L"%s"',LIB_PATH);
I_DIR_1 = sprintf('-I"%s"',INC_PATH_1);
I_DIR_2 = sprintf('-I"%s"',INC_PATH_2);

mex('-v',MEX_FILE_NAME,L_DIR,I_DIR_1,I_DIR_2,LIBS_TO_INCLUDE{:});

%mex('-v',MEX_FILE_NAME,L_DIR,I_DIR_1,LIBS_TO_INCLUDE{:});

