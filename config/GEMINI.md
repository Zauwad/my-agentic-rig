# Plan → Subsection → Execute-One (Harness + Loop Engineering)

## Scope & Skill Reference
Applies to **every coding, feature, refactoring, or bugfix task** across all projects and tech stacks. Skip only for strictly read-only exploration or trivial single-file Q&A with no code changes.

> **Required Skill:** Activate and follow the **`harness-loop`** skill for detailed phase-by-phase runbooks, visual loop mechanics, and gate templates.

## 1. Plan First (Mandatory)
Before writing or editing code:
1. **Restate the goal** in one concise sentence.
2. **Break work into numbered subsections** (each one independently shippable + testable).
3. **Detail each subsection**: note files touched, acceptance check / pass criteria, and risk.
4. **Maintain an active todo/task list**: mark only **one** subsection as `in_progress` at a time.
5. **Align with the project's active plan/spec**: follow existing plans, specifications, or issue roadmaps; do not invent a detached parallel roadmap.

Do **not** start implementing subsection $N+1$ until subsection $N$ is completely implemented and verified.

## 2. Execute Only One Subsection at a Time
- Implement **exactly one** subsection per pass.
- Finish → verify against its harness gate → mark complete → only then proceed to the next.
- Never batch unrelated subsections in a single coding sweep.
- If blocked, halt that subsection, document the blocker, and do not silently skip ahead.

## 3. Harness Engineering (Gates Defined Before Coding)
Each subsection must have a concrete **harness** (pass/fail verification gate) established **before touching code**:

| Gate | Requirement |
|---|---|
| **Build / Lint / Typecheck** | Project-specific verification clean for touched files (e.g., linter, compiler, typechecker, or syntax check) |
| **Behavior / Contract** | Acceptance criteria and behavioral requirements verified via automated tests or targeted validation scripts |
| **Runtime & Interface** | Functional validation under real execution (see Section 5 below) |
| **Rollback Plan** | Clear knowledge of changes to revert if the gate fails |

A subsection without a verified pass/fail gate is incomplete.

## 4. Loop Engineering
Until the harness passes:
1. **Run the check**: execute the gate check (lint, typecheck, unit/integration test, or runtime/browser inspection).
2. **Diagnose & iterate**: if failed → analyze root cause → apply minimal fix → re-run (**same subsection only**).
3. **Escalate when stuck**: after 2–3 failed loops, halt blind retries and escalate (switch to a deeper model, rethink approach, or consult the user).
4. **No infinite loops**: keep verification tight and deterministic; use interval/timer polling only when explicitly requested.

## 5. Runtime & Interface Verification
Verify actual runtime execution according to the project's interface:
- **UI / Frontend / Web:**
  1. **Primary Browser Verification (Playwright First):** Use Playwright automated tests or scripts as the first-choice testing harness to execute navigation, user interactions, and assertions against DOM state, console logs, and network activity.
  2. **Interactive Fallback (Chrome DevTools):** If Playwright is not configured or live exploratory testing is required, fall back to Chrome DevTools MCP (or browser subagent) to navigate, click, type, and verify the path interactively.
  3. **Visual Success Screenshots (Mandatory):** Capture and provide clear screenshot(s) of the successful changes and success screens as concrete visual proof of completion.
  4. **Health Check:** Ensure console logs and network activity show zero unhandled runtime errors, warnings, or failed network requests.
- **Backend / API / CLI / Services:**
  1. Execute the endpoint, command, or script with test payloads.
  2. Inspect output, status codes, and server/application logs.
  3. Ensure clean error handling and no silent failures.

## Execution Checklist
- [ ] Plan + numbered subsections established
- [ ] Exactly one subsection marked in progress
- [ ] Harness gates defined before writing code
- [ ] Loop until pass (or escalate after 2–3 failed cycles)
- [ ] Runtime / interface verified (Playwright first, Chrome DevTools fallback)
- [ ] Visual screenshots of success screens captured and provided

---

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
