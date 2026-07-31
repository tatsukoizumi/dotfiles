# 実装ワークフロー

- 調査 → 計画 → 合意 → 実装 → 検証 → 報告の順で進める。3 ファイル以上・API・認証・課金・外部連携に触れる変更は実装前に確認を取る（MUST）
- push 前にリポジトリの品質ゲート（lint / typecheck / test / knip 等）をパスさせる。`task ci` などローカルで CI を再現するコマンドがあれば必ず実行する（MUST）
- `@ts-ignore` / `type: ignore` / `noqa` / `eslint-disable` を使わない。やむを得ない場合は理由をコメントで書く（NEVER）
- dead code は同じ変更内で削除する。「便利そうだから」でライブラリを追加しない（MUST）
- YAGNI / KISS / DRY を判断基準にする。Issue や指示を仕様として盲信せず、疑問点は確認する（SHOULD）
- コードレビューは組み込みの `/code-review`・`/review` を使う。再実装しない（MUST）
- 同じ指示が 2 回以上繰り返されたら自動化（CLAUDE.md / skill / script）を提案する（SHOULD）
- CLAUDE.md / rules / skills を編集するときは、簡潔で AI が理解しやすく、人間が保守しやすい自然言語で書く。冗長な記述・重複・背景説明を避ける（MUST）
