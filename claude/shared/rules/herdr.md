# herdr

- workspace のラベルは `~` からの相対パス（例: `~/<client>/<repo>` → `<client>/<repo>`）。`herdr workspace create --cwd <path> --label <label>` で明示する（MUST）
- worktree から作る workspace は `<workspace ラベル>#<branch>`（例: `<client>/<repo>#feat/login`）。`herdr worktree create --label` で明示し、ブランチ名だけのラベルにしない（MUST）
- 作成時は `--no-focus` を付ける。フォーカス移動はユーザーが求めたときだけ（MUST）
- 既存 workspace のラベルを勝手に変更しない（NEVER）
- 代表 agent から別リポジトリの agent へ作業を委譲するときは `fleet` コマンドと /koizumi:fleet に従う。`herdr` を直接叩くのは fleet で足りないときだけ（MUST）
- ハブは `entry` workspace のタブに1つずつ置く。担当範囲は pane の cwd（`~/<root>` ならその root 専用、`~` なら残り全部）で決まり、ハブは担当外に作業を投げない（MUST）
