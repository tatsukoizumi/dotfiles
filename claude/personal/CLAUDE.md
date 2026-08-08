# グローバル設定（通常プロファイル）

> キーワード: MUST / NEVER = 必須。SHOULD = 明確な理由がない限り従う。MAY = 任意。

共通ルールは `~/.claude/rules/` に分割している（git / workflow / package-manager / language / writing / comments、TS・Python はファイルに触れたとき遅延ロード）。

## 新規プロジェクトの既定

- パッケージマネージャー: pnpm。`packageManager` をピンし `only-allow pnpm` を入れる
- TypeScript strict 最大（`noUncheckedIndexedAccess` / `verbatimModuleSyntax` 含む）+ Biome + Vitest + knip
- スタックの第一候補: Cloudflare Workers + Hono + D1 + Drizzle。UI は shadcn/ui + Tailwind
- ランタイムのバージョンは mise で管理する

## Skills ルーティング

手作業よりこれらを優先する:

- コミット → /commit
- PR 作成 → /pr
- 複数チケットの並行実装 → /parallel-tickets
- コードレビュー・セキュリティ → /code-review, /review, /security-review

## クライアント・ディレクトリ別ルール

クライアント固有の規約は各親ディレクトリの CLAUDE.md（例: `~/github/CLAUDE.md`）に置く。このファイルには書かない。

## 知識の保存先

- 全プロジェクト共通のルール・規約 → このファイルまたは `~/.claude/rules/`
- ユーザーに関する事実・フィードバック・プロジェクト状況 → memory（MEMORY.md にポインタを追加）
