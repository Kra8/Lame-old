# lame
Laravel + Homestead の環境を簡単に整えることを目的とするスクリプト                  

![ラム](https://github.com/Kra8/lame/blob/master/data/lame_anime.jpg)

## インストール方法
```
bash installer.sh
```
そして、`~/.lame/bin/`にパスを通してください。
```
export PATH="$PATH:~/.lame/bin/"
```
また、常にパスを有効にする場合は`bash_profile`などにパスを書き込んでください。

### アンインストールする場合
```
bash uninstaller.sh
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


## Future
help機能(-help)  
プロジェクトをクリーンする機能(-c)  
正しい設定を行っているかをチェックする機能(-d)  
を追加したい。  

@version    1.0.1  
@update     2016/06/27 
@develop    K.Asai (asai@teaapplications.com)  

