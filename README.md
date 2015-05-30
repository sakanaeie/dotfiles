# dotfilesだよー

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

## プロジェクト単位での導入手順

* ctagsを生成

```
ctags -R --languages=php
```

* .gitignoreに.tagsを追記

## メモ

* 忘れがちなものたち
	* ,t # タブ
	* Ctrl-h/l # タブ移動
	* ,r # quickrun
	* ,l # syntastic
