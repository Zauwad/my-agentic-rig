---
name: harness-loop
description: Plan first, execute one numbered subsection at a time, and apply harness and loop engineering (define pass/fail gates before coding, verify in tight loops) on coding, feature, and bugfix tasks across any project.
---

# Harness & Loop Engineering (Plan → Subsection → Execute-One)

A disciplined engineering workflow for executing coding, feature, refactoring, and bugfix tasks reliably. It enforces planning before editing, incremental execution, pre-defined pass/fail gates (harnesses), and tight diagnostic iteration (loops).

Use this skill for **any non-trivial coding task** across any project, framework, or language.

---

## Core Principles

1. **Plan First**: Never write or edit code without a structured, numbered plan.
2. **Execute-One**: Implement exactly one subsection at a time. No batch sweeps.
3. **Gate Before Code (Harness)**: Define the pass/fail verification criteria before modifying code.
4. **Loop Until Pass**: Run the gate, diagnose failures, apply minimal fixes, and re-run. Escalate after 2–3 failed iterations.
5. **Runtime Evidence**: Verify the changes in the actual runtime environment (browser, terminal, API, or tests).

---

## The 5-Phase Workflow

### Phase 1: Plan First (Mandatory)

Before modifying or creating any code files:

1. **Restate Goal**: Formulate the objective in a single concise sentence.
2. **Decompose into Numbered Subsections**: Break down the task into discrete, sequentially deliverable slices. Each slice must be independently verifiable and testable.
3. **Define Subsection Metadata**:
   - Files to create or edit.
   - Acceptance check / pass criteria.
   - Potential risks or side effects.
4. **Publish Task/Todo List**:
   - List all numbered subsections.
   - Mark exactly **one** as `in_progress`.
   - Keep all remaining subsections pending.
5. **Align with Existing Plans**: Follow project-level specs, roadmap docs, or issue descriptions. Do not invent a disconnected parallel roadmap.

> **Rule:** Do not touch code for subsection $N+1$ until subsection $N$ is verified and marked complete.

---

### Phase 2: Execute One Subsection

Focus exclusively on the active subsection:

- Keep changes minimal and scoped only to the current subsection's goal.
- Avoid "while I'm here" refactorings or modifying unrelated files.
- If an unexpected blocker arises:
  - Stop the active subsection.
  - Document the blocker and reason.
  - Do not silently skip ahead to another subsection.

---

### Phase 3: Harness Engineering (Gates Defined Before Coding)

Every subsection must have a concrete **harness** (verification gate) established **before coding begins**. A subsection without a defined gate is considered incomplete.

| Verification Gate | What to Verify | Agnostic Examples |
|---|---|---|
| **Build & Typecheck** | Syntactic and type correctness for all touched files | `npm run lint`, `tsc --noEmit`, `cargo check`, `go build`, `pyright`, `python -m py_compile` |
| **Behavioral Tests** | Unit, integration, or contract tests covering the changed logic | Framework test runner (`pytest`, `vitest`, `jest`, `go test`, `cargo test`) |
| **Runtime & Interface** | Functional validation under live execution | Web/UI: Playwright first, Chrome DevTools click & test fallback, success screenshots. API/CLI: status & payload, CLI stdout/stderr |
| **Rollback Safety** | Safe recovery strategy if the implementation fails | Reversible git diff, feature flag, isolated commit |

---

### Phase 4: Loop Engineering

Execute the verification loop until the harness passes cleanly:

```
┌──────────────────────────────────────────┐
│             Execute Gate                 │
│   (Build, Test, Script, or DevTools)     │
└────────────────────┬─────────────────────┘
                     ▼
             Does gate pass?
             ├── YES ──► Mark Subsection Complete ──► Next Subsection
             └── NO
                  ▼
         Diagnose Root Cause
                  ▼
         Apply Minimal Fix (Same Subsection Only)
                  ▼
         Loop Iteration Count:
             ├── ≤ 2 iterations ──► Re-run Gate
             └── ≥ 3 iterations ──► ESCALATE (Stop blind retries)
```

#### Loop Rules:
1. **Targeted Fixes**: Apply the smallest possible fix that directly addresses the diagnostic output.
2. **Same Subsection Scope**: Never expand scope to solve a gate failure.
3. **Escalation Protocol**: After 2–3 failed loops without progress:
   - Stop and re-evaluate root assumptions.
   - Switch to a stronger reasoning model or consult available project documentation.
   - If blocked by environment, credentials, or architectural ambiguity, report clearly to the user.
4. **No Unbounded Loops**: Avoid infinite retry cycles. Verification must be deterministic.

---

### Phase 5: Runtime & Interface Verification

Static checks alone are not sufficient. Verify runtime behavior according to the project type:

#### For Web / Frontend / UI Changes:
1. **Primary Choice: Playwright Testing**:
   - Run existing Playwright test suites or execute targeted Playwright test scripts as the primary testing harness.
   - Automate navigation, user interactions (click, type, toggle), and assertions against DOM states, URLs, and expected responses.
   - Assert that no unhandled console errors or failed network requests occurred.
2. **Interactive Fallback: Chrome DevTools Click & Test**:
   - If Playwright is not yet configured or for rapid interactive debugging, fall back to Chrome DevTools MCP (or browser subagent).
   - Actively click, type, navigate, and verify the path interactively as an end user.
3. **Mandatory Success Screenshots**:
   - The agent MUST capture and provide clear screenshot(s) of the success screens / completed state as visual proof of the changes before concluding the subsection.
4. **Clean Environment Check**:
   - Inspect browser console logs (ensure zero unhandled runtime errors or warnings).
   - Inspect network activity (ensure zero failed API requests or 4xx/5xx responses).
   - Validate responsive layouts and visual rendering.

#### For Backend / API / CLI / Services:
1. **Live Execution**: Invoke the command, endpoint, or background job with realistic payloads.
2. **Inspect Output & Logs**: Verify status codes, responses, standard output, and application logs.
3. **Failure Path Check**: Confirm error handling operates gracefully without uncaught exceptions or leaking secrets.

---

## Phase 6: Subsection Completion

Once all harness gates and runtime verification pass:
1. Mark the active subsection as complete in the task list.
2. Verify rollback state is clean before moving forward.
3. Proceed to the next numbered subsection.

---

## Execution Checklist Template

Include this checklist when working on tasks:

```markdown
### Task Execution Checklist
- [ ] Goal restated in one sentence
- [ ] Work broken into numbered subsections (shippable & testable)
- [ ] Exactly one subsection marked `in_progress`
- [ ] Harness gates established before coding (build, test, runtime)
- [ ] Iterated in diagnostic loops until gates pass (escalated if >3 loops)
- [ ] Runtime interface verified (Playwright first, Chrome DevTools click & test fallback)
- [ ] Visual screenshots of success screens captured and provided
```

