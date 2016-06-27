# lame
Laravel + Homestead の環境を簡単に整えることを目的とするスクリプト                  

<<<<<<< HEAD

=======
![ラム](https://github.com/Kra8/lame/blob/master/data/lame_anime.jpg)
>>>>>>> 8b19bdb3252db1a8db953106ed28ac6dee2e300a

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
* Laravel
* Homestead

## 使用法
プロジェクトを作成したいディレクトリでこのスクリプトを実行する。
```
$ ./lame.sh <プロジェクト名>
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

