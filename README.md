# これは何?

vimのaleプラグインで利用できるカスタムlinter。
プロジェクト全体の未使用変数（先頭大文字含む）を検知するgoのlinterである`punused`(https://github.com/bep/punused) をaleと統合させる。

# 使い方

`Packer`で`ale`がインストールしてある場合：

`%UserProfile%\AppData\Local\nvim-prime-data\site\pack\packer\start\ale\ale_linters\go`へ`punused.vim`を配置。
↓
nvimを起動。
↓
未使用変数の行にエラーが表示される。

