
SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd $SCRIPT_DIR

if type fzf > /dev/null 2>&1; then
  source udf/fzf.zsh
fi
