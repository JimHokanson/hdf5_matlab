//File: enum_map_info.h

/*
 *  This file initializes a map with enumeration strings as the key and
 *  their integer values as the values. This allows the user to pass a 
 *  string as an input to a function instead of needing to know the
 *  enumeration value.
 *
 *  - initialization made easier in C++11
 *  - prior could use Boost to make initialization easier
 *  - Visual Studio 2012 - doesn't support C++11 fully
 *
 *  TODO: Consider removing Boost requirement since code will need to be
 *  generated from code anyway
 *
 *  
 *
 */

//http://stackoverflow.com/questions/138600/initializing-a-static-stdmapint-int-in-c
//http://stackoverflow.com/questions/17927736/static-c-map-initialization-error-c2552-non-aggregates-cannot-be-initialized
#include <map>
#include <string>
#include "boost/assign.hpp"
using namespace std;
using namespace boost::assign;



map<string,int> ENUM_MAP = map_list_of
        ("H5D_CHUNKED",2);
