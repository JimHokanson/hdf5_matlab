/*  
 *
 *  This currently a work in progress
 *
 */

#include "mex.h"
#include "hdf5.h"
#include <string.h> //For string comparison

#if defined(_MSC_VER) || defined(__BORLANDC__)
typedef __int64 int64;
typedef __int32 int32;
typedef __int16 int16;
typedef __int8 int8;
typedef unsigned __int64 uint64;
typedef unsigned __int32 uint32;
typedef unsigned __int16 uint16;
typedef unsigned __int8 uint8;
#else /* LINUX + LCC, CAUTION: not tested by the author */
typedef long long int int64;
typedef long int int32;
typedef short int16;
typedef char int8;
typedef unsigned long long int uint64;
typedef unsigned long int uint32;
typedef unsigned short uint16;
typedef unsigned char uint8;
#endif



#define H5FILE_NAME "Attributes.h5";

void setInt8Output(mxArray *plhs[],int index, int8 value)
{

    plhs[index] = mxCreateNumericMatrix(1,1,mxINT8_CLASS,mxREAL);
    int8 *p_value;
    p_value    = (int8 *)mxGetData(plhs[index]);
    p_value[0] = value;
}

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
       //See h5f
       //
       //file_id = hdf5_mex('H5Fcreate',file_name);
       //
       //TODO: Eventually this will be changed to allow
       //all inputs, not just the file
       hid_t file;
       file = H5Fcreate("Attributes.h5", H5F_ACC_TRUNC, H5P_DEFAULT, H5P_DEFAULT);
       
    } else if (!strcmp("H5Fopen",cmd)){
        
	} else if (!strcmp("H5Fclose",cmd)){
        
    } else if (!strcmp("H5Zfilter_avail",cmd)){
      //http://www.hdfgroup.org/HDF5/doc/RM/RM_H5Z.html#Compression-FilterAvail
      //
      //    status = hdf5_mex('H5Zfilter_avail',filter_id);    
        
      htri_t status;
      status = H5Zfilter_avail(H5Z_FILTER_SZIP);
      
      setInt8Output(plhs,0,(int8)status); 
      //TODO: Convert result to int8
    }
    
    
    //herr_t  ret;
    
    
    //ret  = H5Fclose(file);
}