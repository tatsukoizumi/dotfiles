---
name: pr
description: リポジトリの規約に合わせて PR を作成する。リポジトリが許可していない限り、承認前に gh pr create を実行しない。
---

# /pr

1. リポジトリの CLAUDE.md・PR テンプレート(pull_request_template.md)・既存 PR を確認し、規約（タイトル形式・言語・ラベル）に従う。言語は CLAUDE.md（親ディレクトリを含む）の指定を既存 PR の慣習より優先する
2. ベースブランチを決め打ちしない。リポジトリの CLAUDE.md・既存 PR・デフォルトブランチ設定から判定する（develop や staging ベースの運用がある）
3. 現在のブランチが main（保護ブランチ）なら中断して報告する
4. 本文は writing ルールに従って書く: why 中心、変更ファイルの全件列挙をしない、数値で語る、前置きと締めの要約を書かない
5. タイトル・本文・ベースブランチをユーザーに提示し、承認を得てから `gh pr create` を実行する。ただしリポジトリ（親ディレクトリを含む）の CLAUDE.md が承認なしの作成を許可している範囲（例: draft PR）は、承認を待たずに作成し、タイトル・本文・URL を報告する
6. ベースブランチが別の作業ブランチになる（PR の上に PR を積む）場合は、`gh pr create` ではなく gh-stack スキルに従い `gh stack` で Stacked PR にする。作成済みの PR を後から積んだ場合も `gh stack init --base <trunk> <下のブランチ> <上のブランチ>` → `gh stack submit --auto` でスタックにまとめる。スタックのマージは `gh stack merge` を使う（`gh pr merge` は使えない）
