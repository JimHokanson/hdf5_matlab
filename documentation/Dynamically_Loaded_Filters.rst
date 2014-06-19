Dynamically Loaded Filters:
---------------------------

Filter Links:
http://www.hdfgroup.org/services/filters.html

Registered Filters:
http://www.hdfgroup.org/services/contributions.html

http://www.hdfgroup.org/HDF5/doc/Advanced/DynamicallyLoadedFilters/HDF5DynamicallyLoadedFilters.pdf

The default directory for an HDF5 filter plugin library is defined on UNIX-like systems as 
 
“/usr/local/hdf5/lib/plugin” 
 
and on Windows systems as 
 
"%ALLUSERSPROFILE%/hdf5/lib/plugin". 
 
The default path can be overwritten by a user with the HDF5_PLUGIN_PATH environment variable. 
Several directories can be specified for the search path using “:” as a path separator for UNIX-like 
systems and “;” for Windows. 
 
Readers are encouraged to try the example in the “Building an HDF5 bzip2 Plugin Example” section on 
page 17. 
