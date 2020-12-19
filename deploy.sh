#!/bin/bash

# get this script's path
SCRIPT_DIR=$(cd $(dirname $0); pwd)

# source common settings
source ${SCRIPT_DIR}/dotfiles

# deploy
for target in ${TARGET_LIST[@]}; do
    echo $target
    /bin/bash ${DEPLOY_SCRIPTS_PATH[$target]} ${DEPLOY_SCRIPTS_OPTS[$target]}
done
