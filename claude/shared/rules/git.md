# Git 操作

- 指示を待たずに適宜コミットする。作業が論理的な区切り（機能・修正・リファクタ単位）に達したらその都度コミットし、まとめて1コミットにしない（MUST）
- コミット手順は /koizumi:commit に従う。保護ブランチ上なら先にブランチを切る（MUST）
- 作業ブランチへの `git push` は確認なしで行う。force push はしない（NEVER）
- `git add -A` / `git add .` を使わない。変更ファイルをパス指定でステージする（NEVER）
- `--no-verify` / `--amend` / `--no-gpg-sign` を使わない。全コミットは 1Password で SSH 署名されるため `--no-gpg-sign` は特に厳禁。フック失敗時は修正して新規コミットする（NEVER）
- secrets（`.env*`, `*.key`, `credentials.*`, 秘密鍵）や巨大バイナリはステージしない。混入しかけたら停止して報告する（MUST）
- main（および保護ブランチ）への直接コミット・プッシュをしない。ベースブランチはリポジトリごとに確認する（NEVER）。ただし `~/dotfiles` など個人リポジトリで履歴が main 直コミットなら、それに合わせる（MAY）
- 無関係な変更は別コミットに分割する。迷ったら分ける（SHOULD）
- コミット形式は `<type>(<scope>): <summary>` を基本とし、言語・形式は当該リポジトリの git log に合わせる（MUST）
- AI co-author フッターは settings の `attribution` で自動付与を無効化済み。リポジトリが明示的に要求する場合のみ手動で付ける（MUST）
