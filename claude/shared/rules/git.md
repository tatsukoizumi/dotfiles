# Git 操作

- 明示的な指示なしに `git push` しない（NEVER）
- `git add -A` / `git add .` を使わない。変更ファイルをパス指定でステージする（NEVER）
- `--no-verify` / `--amend` / `--no-gpg-sign` を使わない。全コミットは 1Password で SSH 署名されるため `--no-gpg-sign` は特に厳禁。フック失敗時は修正して新規コミットする（NEVER）
- secrets（`.env*`, `*.key`, `credentials.*`, 秘密鍵）や巨大バイナリはステージしない。混入しかけたら停止して報告する（MUST）
- main（および保護ブランチ）への直接コミット・プッシュをしない。ベースブランチはリポジトリごとに確認する（NEVER）
- 無関係な変更は別コミットに分割する。迷ったら分ける（SHOULD）
- コミット形式は `<type>(<scope>): <summary>` を基本とし、言語・形式は当該リポジトリの git log に合わせる（MUST）
- AI co-author フッターはリポジトリが明示的に要求する場合のみ付ける（MUST）
