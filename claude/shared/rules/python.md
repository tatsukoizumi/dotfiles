---
paths:
  - "**/*.py"
---
# Python

- パッケージ管理は uv（`uv add` / `uv run`）。pip / poetry を使わない（MUST）
- Ruff で lint + format（line-length 100、`I` ルールで import 整列）（MUST）
- mypy は `disallow_untyped_defs` 水準。関数には型注釈を必ず書く（MUST）
- `print` を使わない（logger を使う）。`typing.Any` を使わない（NEVER）
- テストは pytest + pytest-asyncio。モックは Fake パターンを優先し MagicMock を濫用しない（SHOULD）
- DB マイグレーションは Alembic。手動 SQL でスキーマを変更しない（MUST）
