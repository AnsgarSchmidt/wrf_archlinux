#!/bin/sh
# @Author: Benjamin Held
# @Date:   2017-07-03 18:01:23
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-06-14 14:45:19

# script to generate output meteograms from a model run
# ${1}: the year for the model run
# ${2}: the month for the model run
# ${3}: the day for the model run
# ${4}: the hour of the model run
# ${5}: the folder where the the visualizations scripts are stored
# ${6}: the destination folder of the output

# setting -e to abort on error
set -e

# define terminal colors
source "${COLOR_PATH}"

# error handling for input parameter
if [ "$#" -ne 6 ]; then
  printf "%bWrong number of arguments. Must be one for <YEAR> <MONTH> <DAY> <HOUR> <WRF_VIZ> <DEST_FOLDER>.%b\\n" "${RED}" "${NC}"
  exit 1
fi

# logging time stamp
printf "Starting meteograms at %s.\\n" "$(date +"%T")" >> "${INFO_LOG}"

START_DATE="${1}-${2}-${3} ${4}:00"
DEST_FOLDER=${6}
# path for external python visualization tool
WRF_VISUALIZATION="${5}"
# the tool will store the pngs here
WRF_OUTPUT="${WRF_VISUALIZATION}/files"

cd "${WRF_VISUALIZATION}/lib/meteogram" || exit 1
# move required meteogram files to output folder
mv "${WRF_DIR}/test/em_real/"*.PH "${WRF_OUTPUT}"
mv "${WRF_DIR}/test/em_real/"*.PR "${WRF_OUTPUT}"
mv "${WRF_DIR}/test/em_real/"*.QV "${WRF_OUTPUT}"
mv "${WRF_DIR}/test/em_real/"*.TH "${WRF_OUTPUT}"
mv "${WRF_DIR}/test/em_real/"*.TS "${WRF_OUTPUT}"
mv "${WRF_DIR}/test/em_real/"*.UU "${WRF_OUTPUT}"
mv "${WRF_DIR}/test/em_real/"*.VV "${WRF_OUTPUT}"
mv "${WRF_DIR}/test/em_real/"*.WW "${WRF_OUTPUT}"

# call python script for meteogram creation
conda activate wrf_env
python meteogram.py "${START_DATE}" 
conda deactivate wrf_env

# optimize png size
find . -maxdepth 1 -name '*.png' -exec optipng {} \;

# move files to output folder
mv "${WRF_OUTPUT}/"*.png "${DEST_FOLDER}/"

# logging time stamp
printf "Finished meteograms at %s.\\n" "$(date +"%T")" >> "${INFO_LOG}"
