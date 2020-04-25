#!/bin/sh
# @Author: Benjamin Held
# @Date:   2017-03-12 09:26:31
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-04-06 13:17:23

# Script to run the preprocessing operations

# setting -e to abort on error
set -e

now=$(date +"%T")
if [ -z "${LOG_PATH}" ]; then
  printf "Cleaning up output data from last time at %s\\n" "${now}"
else 
	printf "Cleaning up output data from last time at %s\\n" "${now}" >> "${INFO_LOG}"
fi

# remove previous output files
find "${WRF_DIR}"/test/em_real/  -name 'wrfrst_*' -exec rm {} \;
find "${HOME}"/wrf_output -name 'wrfout_*' -exec rm {} \;
find "${HOME}"/wrf_output -name '*.PH' -exec rm {} \;
find "${HOME}"/wrf_output -name '*.PR' -exec rm {} \;
find "${HOME}"/wrf_output -name '*.QV' -exec rm {} \;
find "${HOME}"/wrf_output -name '*.TH' -exec rm {} \;
find "${HOME}"/wrf_output -name '*.TS' -exec rm {} \;
find "${HOME}"/wrf_output -name '*.UU' -exec rm {} \;
find "${HOME}"/wrf_output -name '*.VV' -exec rm {} \;
find "${HOME}"/wrf_output -name '*.WW' -exec rm {} \;
