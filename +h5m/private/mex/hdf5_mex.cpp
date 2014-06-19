/*  
 *
 *  This currently a work in progress
 *
 */

#include "mex.h"
#include "hdf5.h"

#define H5FILE_NAME "Attributes.h5"

//=========================================================================
void mexFunction( int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    hid_t   file;
    herr_t  ret;
    
    file = H5Fcreate(H5FILE_NAME, H5F_ACC_TRUNC, H5P_DEFAULT, H5P_DEFAULT);
    ret  = H5Fclose(file);
}