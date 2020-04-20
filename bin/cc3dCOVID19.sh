#!/bin/sh


current_directory=$(pwd)

echo ${current_directory}

PARENT_DIR="$(dirname "$(pwd)")"

echo ${PARENT_DIR}

# necessary to enforce standard convention for numeric values specification on non-English OS
export LC_NUMERIC="C.UTF-8"

CC3D_DEMO_NAME=Coronavirus
CC3D_DEMO_FILENAME=${CC3D_DEMO_NAME}.cc3d
USER_DEMO_PATH=$HOME/CompuCell3D_Demos/${CC3D_DEMO_NAME}
echo ${USER_DEMO_PATH}

#MAIN_CC3D_FILES=${current_directory}:/../main/
#MAIN_CC3D_FILES=${PARENT_DIR}/main/
MAIN_CC3D_FILES=${PARENT_DIR}main/

echo ${MAIN_CC3D_FILES}

mkdir -p ${USER_DEMO_PATH}
mkdir -p ${USER_DEMO_PATH}/output/

cp -rf ${MAIN_CC3D_FILES}/Demos/.  ${USER_DEMO_PATH} #not checking for existance incase there's been an update

${COMPUCELL3D_HOME}/compucell3d.sh -i ${USER_DEMO_PATH}/${CC3D_DEMO_FILENAME} -o ${USER_DEMO_PATH}/output/ -f 10001 > /dev/null 2>&1 
