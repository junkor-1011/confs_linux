#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)
PROJECT_DIR="${SCRIPT_DIR}/../.."   # TMP

exec=$(cat << EOS
    export TEST_ENV1="test_project"
    export TEST_ENV2="test_environment_variable"
    export TEST_ENV3=1
    export SHELL="/usr/bin/fish"
    # "pyenv: shell integration not enabled." が出るので普通に仮想環境を切り替えるのは難しそう
    # pyenv shell miniconda3-4.3.30
    # conda activate test_project
    export PATH="${PYENV_HOME}/versions/miniconda3-4.3.30/envs/test_project/bin:${PATH}"
    # cd ${SCRIPT_DIR}
    nvim ${PROJECT_DIR}
EOS
)
# gnome-terminal -- bash -c "${exec}; nvim" 2>/dev/null
gnome-terminal -- bash -c "${exec}" 2>/dev/null

