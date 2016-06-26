# lame.sh
Laravel + Homestead の環境を簡単に整えることを目的とするスクリプト                  

## 注意
このスクリプトはHomebrewを用いて必要なソフトウェアを自動でインストールします。  
そのため、Homebrewをインストールしていない環境ではHomebrewを最初にインストールします。  
その他インストールするソフトウェアはLaravel及びHomesteadの動作に必要なものです。  
すでに、必要なソフトウェアがインストールされている場合はインストールされません。  

## インストールされるソフトウェア
* Homebrew
* VirtualBox
* Vagrant
* Composer
* Larabel
* Homestead

## 使用法
プロジェクトを作成したいディレクトリでこのスクリプトを実行する。
```
$ ./larahome.sh <プロジェクト名>
```
途中、/etc/hosts ファイルを編集するためにパスワードが問われます。  
ローカルでプロジェクトにアクセスするために必要な処理ですので、パスワードを入力して処理を進めてください。  

## Future
help機能(-help)  
プロジェクトをクリーンする機能(-c)  
正しい設定を行っているかをチェックする機能(-d)  
を追加したい。  

@version    1.0.0  
@update     2016/06/26  
@develop    K.Asai (asai@teaapplications.com)  

