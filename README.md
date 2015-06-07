# dotfiles

## 導入手順

* 初期化スクリプトを叩く

```
./init.sh
```

* vim-plaginをcloneする

```
vi
:NeoBundleInstall
```

* vimprocをmakeする

```
cd .vim/bundle/vimproc/
make -f make_gcc.mak
```

## 言語単位での導入手順

* w3mをインストールしておく

### php

* http://jp2.php.net/download-docs.php からリファレンスを取得する

```
# アドレスはそのたびごとに確認すること
cd .vim/ref
wget http://jp2.php.net/get/php_manual_ja.tar.gz/from/this/mirror
tar zxvf php_manual_jp.tar.gz
```

* tekkoc氏のスニペットファイルを拝借する

```
cd .vim/snippets
mkdir tekkoc
wget https://raw.githubusercontent.com/tekkoc/PHPSnippetsCreator/master/dist/php_functions.snip
mv php_functions.php tekkoc/php.snip
```

## プロジェクト単位での導入手順

* ctagsを生成する

```
ctags -R --languages=php
```

* .gitignoreか.git/info/excludeに.tagsを追記する
