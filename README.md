# dotfiles

## 導入手順

* 初期化スクリプトを叩く

```
./init.sh
```

## プロジェクト単位での導入手順

* ctagsを生成する

```
ctags -R --languages=php
```

* .gitignoreか.git/info/excludeに.tagsを追記する
