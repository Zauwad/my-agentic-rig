# Project Workflow & Changelog Rule

## Scope
This rule applies exclusively to project directories when project code, configuration, or rules are modified. Do NOT track Antigravity application or machine settings in project changelogs.

## Changelog Location & Multi-Project Behavior
- The project changelog lives at `.agents/workflow/CHANGELOG.md` inside the project root.
- If working in a workspace containing nested subprojects or separate git roots, update **both**:
  1. The subproject's `.agents/workflow/CHANGELOG.md`
  2. The top-level workspace root `.agents/workflow/CHANGELOG.md`
- If `.agents/workflow/CHANGELOG.md` does not yet exist:
  - If a legacy `.cursor/workflow/CHANGELOG.md` exists in the project, copy its existing history to initialize `.agents/workflow/CHANGELOG.md`.
  - Otherwise, initialize it with `# Changelog\n\n## [Unreleased]\n\n`.

## Trigger Timing
- Update `.agents/workflow/CHANGELOG.md` under `## [Unreleased]` at the conclusion of every turn/request that creates, modifies, or deletes code, config, or rules.
- Place new entries at the top of the `## [Unreleased]` section (newest first).
- Skip strictly read-only turns (exploration, answering questions, or checks without modifying files).

## Agnostic Entry Format

```markdown
### [Added | Changed | Fixed | Removed] — YYYY-MM-DD

**Time:** YYYY-MM-DD HH:MM (UTC+X)
**Author:** Antigravity agent
**Issue:** [Brief task/issue description or "—" if none]

**Summary:**
- [Bullet points describing changes in detail]

**Files:**
- `path/to/modified/file`

**Impact:** [route / UI / build env / backend / config / none]
```

### Field Definitions:
- **Type:** `Added` for new features/files, `Changed` for updates/refactors, `Fixed` for bugfixes, `Removed` for deletions.
- **Time:** Local timestamp with timezone offset (`YYYY-MM-DD HH:MM (UTC+X)`).
- **Author:** `Antigravity agent`.
- **Issue:** Concise task summary or issue name.
- **Summary:** Concise, itemized bullet points explaining what was done and why.
- **Files:** List of modified relative file paths; append `(deleted)` for deleted files. Always format paths relative to the top-level workspace root across all changelogs.
- **Impact:** Short categorization (e.g. `route / UI`, `build env`, `backend`, `config`, `none`).
