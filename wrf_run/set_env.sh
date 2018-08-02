#!/bin/sh
# @Author: Benjamin Held
# @Date:   2017-03-03 17:20:53
# @Last Modified by:   benjamin
# @Last Modified time: 2018-07-28 16:08:09

# Script that sets the required variables for the model run
# $1: the build path where the required wrf files are installed

# Setting required environment variables for the session
export BUILD_PATH=${HOME}/Build_WRF
export DIR="${BUILD_PATH}/libraries"
export CC="gcc"
export CXX="g++"
export FC="gfortran"
export FCFLAGS="-m64"
export F77="gfortran"
export FFLAGS="-m64"
export PATH="${PATH}:${DIR}/netcdf/bin"
export NETCDF="${DIR}/netcdf"
export LDFLAGS="-L${DIR}/grib2/lib"
export CPPFLAGS="-I${DIR}/grib2/include"
export PATH="${PATH}:${DIR}/mpich/bin"
export WRFIO_NCD_LARGE_FILE_SUPPORT=1
export JASPERLIB="${DIR}/grib2/lib"
export JASPERINC="${DIR}/grib2/include"

# optional: required when using ncl unpacked in the library folder
export NCARG_ROOT="${DIR}/ncl"
export PATH="${PATH}:${NCARG_ROOT}/bin"
