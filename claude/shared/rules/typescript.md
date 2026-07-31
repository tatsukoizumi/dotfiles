---
paths:
  - "**/*.ts"
  - "**/*.tsx"
---
# TypeScript

- `strict: true` 前提。新規プロジェクトでは `noUncheckedIndexedAccess` / `verbatimModuleSyntax` / `noImplicitOverride` も有効化する（MUST）
- `any` を使わない。`unknown` + 型ガードで書く（NEVER）
- linter/formatter はリポジトリの既存設定（Biome か ESLint+Prettier）を確認してから作業する。新規は Biome（MUST）
- type import は分離する（`import type { ... }`）（SHOULD）
- テストは Vitest が既定。リポジトリに既存のテストランナーがあればそれに従う（SHOULD）
- 未使用の export・依存は knip で検出し、同じ変更内で削除する（MUST）
