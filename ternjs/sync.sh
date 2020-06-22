#!/bin/sh

# 実行スクリプトのpath取得
# https://qiita.com/koara-local/items/2d67c0964188bba39e29
SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd $SCRIPT_DIR

# config path
TERN_CONFIG_PATH=.tern-config

help=$(cat << EOS

Usage: bash sync.bash <arg>
<arg>:
    deploy
        - rsync to USER's config (~/$TERN_CONFIG_PATH)
    import
        - rsync from USER's config (~/$TERN_CONFIG_PATH)
    link
        - make symbolic-link at USER's config (~/$TERN_CONFIG_PATH)

EOS
)
if [ $# -ne 1 ]; then
    echo "$help"
    exit
fi

if [ "$1" = "deploy" ]; then
    rsync -auv ./$TERN_CONFIG_PATH ~/$TERN_CONFIG_PATH
elif [ "$1" = "import" ]; then
    rsync -auv ~/$TERN_CONFIG_PATH ./$TERN_CONFIG_PATH
elif [ "$1" = "link" ]; then
    if [ -e ~/$TERN_CONFIG_PATH ]; then
        # はじめからsymbolic linkで管理していることを前提
        # 時間があったらファイルタイプに応じて処理を分岐させるかも
        unlink ~/$TERN_CONFIG_PATH
    fi
    ln -s $(pwd)/$TERN_CONFIG_PATH ~/$TERN_CONFIG_PATH
else
    echo "wrong argument \n"
    echo "$help"
fi

exit

