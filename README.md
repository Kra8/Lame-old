# Lame
Laravel + Homestead の環境を簡単に整えることを目的とするスクリプト                  

![ラム](https://github.com/Kra8/lame/blob/master/data/lame_anime.jpg)

## 既知の不具合
・ver1.1.1より -r オプションが使用できるが、理想の動作が行われない。（使用非推奨）  
・Composerが正しくインストールできない不具合。  
(対処法:Composerを別の方法で正しくインストールした場合、この不具合を回避できる）  
・SSHKeyを作成していない場合Vagrant up できない不具合  
(対処法:SSHKeyを作成する）  

これらの不具合は暇ができたら直す(｀・ω・´)ｷﾘｯ  

## インストール方法
```
$ curl -fsSL https://raw.githubusercontent.com/Kra8/lame/master/installer.sh | sh
```

### アンインストールする場合
```
$ curl -fsSL https://raw.githubusercontent.com/Kra8/lame/master/uninstaller.sh | sh
```

## 使用方法
プロジェクトを作成したいディレクトリでこのスクリプトを実行する。
```
$ lame <プロジェクト名>
```
途中、/etc/hosts ファイルを編集するためにパスワードが問われます。  
ローカルでプロジェクトにアクセスするために必要な処理ですので、パスワードを入力して処理を進めてください。  


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

## 動作環境
macOS - OSX El Capitan 10.11.5  
それ以外の環境で動くかは試していません。

## Future
各ソフトウェアのインストール部分と、プロジェクト作成部分の切り離し。
プロジェクトをクリーンする機能(-c)  
正しい設定を行っているかをチェックする機能(-d)  
を追加したい。  

@version    1.1.1  
@update     2016/06/29  
@develop    K.Asai (asai@teaapplications.com)  

