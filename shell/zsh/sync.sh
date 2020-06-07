#!/bin/sh

# Issue: 関連ファイルが増えると管理が大変なので、対応を考える

# 実行スクリプトのpath取得
# https://qiita.com/koara-local/items/2d67c0964188bba39e29
SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd $SCRIPT_DIR

# config path
ZSHRC_CONFIG_PATH=.zshrc
ZSH_UDF_PATH=.zsh_udf

help=$(cat << EOS

Usage: sh sync.bash <arg>
<arg>:
    deploy
        - rsync to USER's config (~/$ZSHRC_CONFIG_PATH)
    import
        - rsync from USER's config (~/$ZSHRC_CONFIG_PATH)
    link
        - make symbolic-link at USER's config (~/$ZSHRC_CONFIG_PATH)

EOS
)
if [ $# -ne 1 ]; then
    echo "$help"
    exit
fi

if [ "$1" = "deploy" ]; then
    rsync -auv ./$ZSHRC_CONFIG_PATH ~/$ZSHRC_CONFIG_PATH
    rsync -auv ./$ZSH_UDF_PATH ~/$ZSH_UDF_PATH
elif [ "$1" = "import" ]; then
    rsync -auv ~/$ZSHRC_CONFIG_PATH ./$ZSHRC_CONFIG_PATH
    rsync -auv ~/$ZSH_UDF_PATH ./$ZSH_UDF_PATH
elif [ "$1" = "link" ]; then
    if [ -e ~/$ZSHRC_CONFIG_PATH ]; then
        # はじめからsymbolic linkで管理していることを前提
        # 時間があったらファイルタイプに応じて処理を分岐させるかも
        unlink ~/$ZSHRC_CONFIG_PATH
    fi
    ln -s $(pwd)/$ZSHRC_CONFIG_PATH ~/$ZSHRC_CONFIG_PATH
    if [ -e ~/$ZSH_UDF_PATH ]; then
        unlink ~/$ZSH_UDF_PATH
    fi
    ln -s $(pwd)/$ZSH_UDF_PATH ~/$ZSH_UDF_PATH
else
    echo "wrong argument \n"
    echo "$help"
fi

exit

