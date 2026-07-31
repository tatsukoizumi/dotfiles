# パッケージマネージャー

- lockfile で判定する: `pnpm-lock.yaml`→pnpm / `bun.lock`→bun / `package-lock.json`→npm / `yarn.lock`→yarn / `uv.lock`→uv（MUST）
- 判定した PM 以外のコマンドを実行しない。別 PM の lockfile を生成しない（NEVER）
- bun はテキスト形式 `bun.lock` を使う。`bun.lockb` を作らない（`bun install --save-text-lockfile`）（MUST）
- Python は uv を使う。pip 直叩き・poetry・requirements.txt ベースの運用をしない（MUST）
- ランタイムのバージョンは mise が正。`mise.toml` があれば従う。package.json に `volta` フィールドがあるリポジトリでは volta に従う（MUST）
