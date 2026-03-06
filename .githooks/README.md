### setup GitHooks
変更のリードタイム測定のため、ブランチ作成時に空コミットを作成するフックを設定します。

1. Git にフックのパスを設定する
```sh
git config core.hooksPath .githooks
```

2. フックに実行権限を付与(Mac/Linuxユーザのみ)
```sh
chmod +x .githooks/post-checkout
```
