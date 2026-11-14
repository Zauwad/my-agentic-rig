# Changelog

## [Unreleased]

### Changed — 2026-11-14

**Time:** 2026-11-14 21:43 (UTC+6)
**Author:** Antigravity agent
**Issue:** Remove circular self-references and redundant skill directives

**Summary:**
- Removed circular `Activate and follow the harness-loop skill` and self-referential mentions from `cursor/rules/harness-loop.mdc`
- Streamlined Section 3 and Section 4 in `config/GEMINI.md` and global `AGENTS.md` by eliminating repetitive skill cross-references, keeping a single clean directive under Scope
- Ensured rule definitions are direct and non-tautological

**Files:**
- `cursor/rules/harness-loop.mdc`
- `config/GEMINI.md`

**Impact:** config

### Changed — 2026-11-14

**Time:** 2026-11-14 21:32 (UTC+6)
**Author:** Antigravity agent
**Issue:** Add explicit harness-loop skill references to global and Cursor rules

**Summary:**
- Added explicit `harness-loop` skill references by name under Scope, Harness Engineering, and Loop Engineering sections of the global rule
- Removed pinned file path (`skills/harness-loop/SKILL.md`) to keep the rule strictly path-agnostic across runtimes and environments
- Updated `config/GEMINI.md` and `cursor/rules/harness-loop.mdc` to guide the agent to load and follow the skill directly by name

**Files:**
- `config/GEMINI.md`
- `cursor/rules/harness-loop.mdc`

**Impact:** config

### Added — 2026-11-14

**Time:** 2026-11-14 21:15 (UTC+6)
**Author:** Antigravity agent
**Issue:** Add harness-loop skill, global GEMINI.md rule, and Cursor rule to rig

**Summary:**
- Added `harness-loop` global skill defining the Plan → Subsection → Execute-One workflow with Playwright first, Chrome DevTools interactive fallback, and mandatory success screenshots
- Updated `config/GEMINI.md` to include the global Harness & Loop Engineering rule alongside the Project Workflow & Changelog rule
- Added `cursor/rules/harness-loop.mdc` providing the equivalent project-agnostic harness and loop rule for Cursor
- Updated `README.md` Core Skills Inventory table to document `harness-loop`

**Files:**
- `skills/harness-loop/SKILL.md`
- `config/GEMINI.md`
- `cursor/rules/harness-loop.mdc`
- `README.md`

**Impact:** config

