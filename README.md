# dotfilesだよー (╹▽╹๑) うぇるかむ!

## 導入手順

* 初期化

```
./init.sh
```

* vim-plaginをclone

```
vi
:NeoBundleInstall
```

* vimprocをmake

```
cd .vim/bundle/vimproc/
make -f make_gcc.mak
```

## 言語単位での導入手順

* w3mをインストールしておく

### php

* http://jp2.php.net/download-docs.php からリファレンスを取得

```
# アドレスはそのたびごとに確認
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

* ctagsを生成

```
ctags -R --languages=php
```

* .gitignoreに.tagsを追記

## メモ

* 忘れがちなものたち
	* ,rp # phpmanual
	* ,t # タブ
	* Ctrl-h/l # タブ移動
	* ,r # quickrun
	* ,l # syntastic
