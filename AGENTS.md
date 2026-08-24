# AGENTS.md

本文件記錄此專案的相關規範與 AI Agent 協作準則。

---

## 1. 專案概述
- **專案名稱**：`homebrew-tap`
- **遠端儲存庫**：`https://github.com/yuhaw0715/homebrew-tap.git`
- **主要用途**：自訂 Homebrew Tap 儲存庫，用於發布及管理 macOS 應用程式的 Homebrew Casks（如 `Casks/mac-calendar-widget.rb`）。

---

## 2. Git 操作規範

### 2.1 Commit 訊息語言
- **所有 Git Commit 訊息一律使用繁體中文**。
- 格式建議清晰描述變更目的與內容。

### 2.2 提交與推送規則
- **禁止自動 Commit 與 Push**：
  - AI Agent 不得在未經使用者明確指示或同意下自動執行 `git commit` 或 `git push`。
  - 所有版本提交與上傳皆須由使用者自行操作或給予明確確認後再行執行。

---

## 3. Cask 維護與更新準則
- 新增或更新 Cask 時：
  - 確保 `version`、`sha256`、`url` 與 release 一致。
  - 確保 `depends_on`、`app`、`zap` 等路徑與軟體設定正確。
