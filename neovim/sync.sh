#!/bin/sh

# 実行スクリプトのpath取得
# https://qiita.com/koara-local/items/2d67c0964188bba39e29
SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd $SCRIPT_DIR

# config path
NVIM_CONFIG_PATH=.config/nvim

help=$(cat << EOS

Usage: bash sync.bash <arg>
<arg>:
    deploy
        - rsync to USER's config dir (~/$NVIM_CONFIG_PATH)
    import
        - rsync from USER's config dir (~/$NVIM_CONFIG_PATH)
    link
        - make symbolic-link at USER's config dir (~/$NVIM_CONFIG_PATH)

EOS
)
if [ $# -ne 1 ]; then
    echo "$help"
    exit
fi

if [ "$1" = "deploy" ]; then
    rsync -auv --exclude='.netrwhist' ./$NVIM_CONFIG_PATH/ ~/$NVIM_CONFIG_PATH/
elif [ "$1" = "import" ]; then
    rsync -auv --exclude='.netrwhist' ~/$NVIM_CONFIG_PATH/ ./$NVIM_CONFIG_PATH/
elif [ "$1" = "link" ]; then
    if [ -e ~/$NVIM_CONFIG_PATH ]; then
        # はじめからsymbolic linkで管理していることを前提
        # 時間があったらファイルタイプに応じて処理を分岐させるかも
        unlink ~/$NVIM_CONFIG_PATH
    fi
    ln -s $(pwd)/$NVIM_CONFIG_PATH ~/$NVIM_CONFIG_PATH
else
    echo "wrong argument \n"
    echo "$help"
fi

exit

