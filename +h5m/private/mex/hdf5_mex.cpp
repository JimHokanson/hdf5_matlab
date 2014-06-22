/*  
 *
 *  This currently a work in progress
 *
 */

#include "mex.h"
#include "hdf5.h"

#define H5FILE_NAME "Attributes.h5"

void setDoubleOutput(mxArray *plhs[],int index, double value)
{
    
    //Sets a single scalar value at the output location specified.
    //
    //  Inputs:
    //  -------
    //  plhs  : The output data
    //  index : Which index to set the data for (0 based)
    //  value : The value to assign to that particular output
    //
    //  Example: (In Matlab)
    // [a,b] = testFunction()
    //
    //  Let's say we are trying to set b to 5
    //
    //  setDoubleOutput(plhs,1,5)
    
    //NOTE: We've hardcoded the output to be a scalar
    plhs[index] = mxCreateNumericMatrix(1,1,mxDOUBLE_CLASS,mxREAL);
    double *p_value;
    p_value    = (double *)mxGetData(plhs[index]);
    p_value[0] = value;
}

//=========================================================================
void mexFunction( int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    if (nrhs < 1 || !mxIsChar(prhs[0])) 
        mexErrMsgTxt("First parameter must be the command (a string)");
    
    char cmd[100];
	mxGetString(prhs[0],cmd,100);
    
    if (!strcmp("H5Fcreate",cmd)){
       //file_id = hd5_mex('H5Fcreate',file_name);
       //
       //TODO: Eventually this will be changed to allow
       //all inputs, not just the file
       hid_t file;
       file = H5Fcreate("Attributes.h5", H5F_ACC_TRUNC, H5P_DEFAULT, H5P_DEFAULT);
    } else if (!strcmp("H5Fopen",cmd))
	{
        
	} else if (!strcmp("H5Fclose",cmd)) {
        
    }
    
    
    herr_t  ret;
    
    
    ret  = H5Fclose(file);
}