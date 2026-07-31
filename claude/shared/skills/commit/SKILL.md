---
name: commit
description: リポジトリの規約に合わせてステージ・コミットする。push はしない。
---

# /commit

1. リポジトリの CLAUDE.md と `.claude/`（commands / skills）にコミット規約・品質ゲートがあれば読み、それに従う。リポジトリ固有の /commit 相当の手順が定義されている場合はそちらを優先する
2. `git log --oneline -10` でコミットメッセージの言語・形式を確認し、同じスタイルで書く
3. `git status` と `git diff` で変更をレビューし、無関係な変更が混ざっていれば分割を提案する
4. 変更ファイルをパス指定でステージする（`git add -A` / `git add .` 禁止）。secrets・巨大バイナリが含まれていれば停止して報告する
5. リポジトリに品質ゲート（lint / typecheck / test 等）があれば変更範囲に対して実行し、green を確認してからコミットする
6. push はしない。push は別途明示的な指示があった場合のみ
