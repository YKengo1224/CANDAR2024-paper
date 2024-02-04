# Latex テンプレート
latexmk 経由で uplatex を使って日本語用の Latex 文章を生成します。`make` コマンド でビルドができます。

```
[Command]            [Description]
rebuild              rebuild
view                 show pdf
release              release pdf
info                 show info
clean                clean project
distclean            clean entire project
help                 Print help for Makefile.
```

```
.
├── bib <- bibtex 形式のファイル
├── img <ー画像用
├── main.tex
├── Makefile
├── README.md
└── src <- Tex ファイル用
```

