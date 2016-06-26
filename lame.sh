#!/bin/bash

#################################################################################
#                                                                               
#   lame.sh
#   Laravel + Homestead の環境を簡単に整えることを目的とするスクリプト                  
#
#   *注意*
#   このスクリプトはHomebrewを用いて必要なソフトウェアを自動でインストールします。
#   そのため、Homebrewをインストールしていない環境ではHomebrewを最初にインストールします。
#   その他インストールするソフトウェアはLaravel及びHomesteadの動作に必要なものです。
#   すでに、必要なソフトウェアがインストールされている場合はインストールされません。
#
#   *このスクリプトによってインストールされるソフトウェア*
#   ・Homebrew
#   ・VirtualBox
#   ・Vagrant
#   ・Composer
#   ・Larabel
#   ・Homestead
#
#   *使用法*
#   プロジェクトを作成したいディレクトリでこのスクリプトを実行する。
#   $ ./larahome.sh <プロジェクト名>
#   途中、/etc/hosts ファイルを編集するためにパスワードが問われます。
#   ローカルでプロジェクトにアクセスするために必要な処理ですので、パスワードを入力して処理を進めてください。
#
#   *Future*
#   help機能(-help)
#   プロジェクトをクリーンする機能(-c)
#   正しい設定を行っているかをチェックする機能(-d)
#   を追加したい。
#
#   @version    1.0.0
#   @update     2016/06/26
#   @develop    K.Asai (asai@teaapplications.com)
#
#################################################################################

readonly COLOR_RED="\033[31m"
readonly COLOR_GREEN="\033[32m"
readonly COLOR_YELLOW="\033[33m"
readonly COLOR_BLUE="\033[34m"
readonly COLOR_OFF="\033[m"

## prapare 
new_project=$1
if [ ! ${new_project} ]
then
    echo -e "${COLOR_RED}プロジェクト名を引数に指定してください。${COLOR_OFF}"
    exit 0
fi
echo "${new_project} project crafting ..."

## functions
# コマンドが存在するか確認する。
function commandIsExists(){
    if type $1 2>/dev/null 1>/dev/null; 
    then
        echo true
    else
        echo false
    fi
} 

# ユーザに yes/no の入力を促す
function askYesOrNo() {
    while true ; do
        read -p "$1 (y/n)?" answer
        case $answer in
            [yY] | [yY]es | YES )
                return 0;;
            [nN] | [nN]o | NO )
                return 1;;
            * ) echo "Please answer yes or no.";;
        esac
    done
}

## homebrewが存在するか 
if [ `commandIsExists brew` = true ]
then
    echo -e "brew is exists ... ${COLOR_GREEN}true${COLOR_OFF}" 
else
    # 存在しない場合、インストールを促す
    echo -e "homebrew is exists ... ${COLOR_YELLOW}false${COLOR_OFF}"
    askYesOrNo "Homebrew をインストールします"
    if [ $? -eq 0 ]
    then
        # brew のインストール
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        # brew cask のインストール
        brew install caskroom/cask/brew-cask
    else
        exit 0
    fi
fi
#==================================================================#

## virtualboxが存在するか。
if [ `commandIsExists virtualbox` = true ]
then
    echo -e "virtualbox is exists ... ${COLOR_GREEN}true${COLOR_OFF}" 
else
    # 存在しない場合インストールする
    echo -e "virtualbox is exists ... ${COLOR_YELLOW}false${COLOR_OFF}"
    echo "VirtualBox install ..."
    # virtualboxのインストール
    brew cask install virtualbox
fi

## vagrantが存在するか。
if [ `commandIsExists vagrant` = true ]
then
    echo -e "vagrant is exists ... ${COLOR_GREEN}true${COLOR_OFF}" 
else
    echo -e "vagrant is exists ... ${COLOR_RED}false${COLOR_OFF}"
    echo "Vagrant install ..."
    # vagrantのインストール
    brew cask install vagrant
fi

#==================================================================#

## composerが存在するか。
if [ `commandIsExists composer` = true ]
then
    echo -e "composer is exists ... ${COLOR_GREEN}true${COLOR_OFF}" 
else
    echo -e "composer is exists ... ${COLOR_RED}false${COLOR_OFF}"
    echo "Composer install ..."
    # vagrantのインストール
    brew install composer
fi

#==================================================================#

## laravelが存在するか。
commandPath="$HOME/.composer/vendor/bin/laravel"
if [ -e ${commandPath} ]
then
    echo -e "laravel is exists ... ${COLOR_GREEN}true${COLOR_OFF}" 
else
    echo -e "laravel is exists ... ${COLOR_RED}false${COLOR_OFF}"
    echo "Laravel install ..."
    # laravelのインストール
    composer global require "laravel/installer=~1.1"
fi


## プロジェクトファイルの作成
${commandPath} new ${new_project}

## boxの有無を確認する
box_exists=`vagrant box list | grep -c 'homestead'`
if [ ${box_exists} -gt 0 ]
then
    echo -e "homestead box is exists ... ${COLOR_GREEN}true${COLOR_OFF}" 
else
    echo -e "homestead box is exists ... ${COLOR_YELLOW}false${COLOR_OFF}"
    # boxのダウンロード
    vagrant box add laravel/homestead
fi


## プロジェクトへHomesteadをインストール
current=`pwd`
workPath="${current}/${new_project}"
cd ${workPath}
composer require laravel/homestead --dev


## Vagrantfileの作成
php vendor/bin/homestead make


## Homestead.yamlファイルの編集
sed -i -e '/ip: "192.168.10.10"/s/ip: "192.168.10.10"/ip: "10.0.0.33"/' Homestead.yaml
sed -i -e "/- map: homestead.app/s/- map: homestead.app/- map: ${new_project}/" Homestead.yaml
sed -i -e "/- homestead/s/- homestead/- ${new_project}/" Homestead.yaml


## etc/hostsファイルを編集
add_texts="10.0.0.33 ${new_project} # writed by larahome.sh"
hosts_exists=`cat /etc/hosts | grep -c "$add_texts"`
if [ ${hosts_exists} -lt 1 ]
then
    echo "writing /etc/hosts"
    sudo sh -c "echo '${add_texts}' >> /etc/hosts"
fi


## Homesteadを立ち上げる
vagrant up


## ローカルで開く
open http://${new_project}
 