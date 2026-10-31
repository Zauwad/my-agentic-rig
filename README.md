# my-agentic-rig

> This is my daily agent setup. It contains the mental models, skills, plugins, and tools I use across my projects. Take what works for you.

Think of this like a personal dotfiles repository, but designed for AI agents. Whether working in terminal agent loops, Claude Code, Antigravity, Cursor, or custom CLI runners, I do not want agents starting from zero, guessing framework APIs, or generating brittle boilerplate.

This repository packages my cognitive skill packs, plugins, Model Context Protocol (MCP) servers, and configuration into a single portable environment that can be replicated anywhere in seconds.

---

## Architecture

How the components connect when an agent initializes in a workspace:

```text
+------------------------------------------------------------------------+
|                          MY AGENTIC RIG                                |
+------------------------------------------------------------------------+
|                                                                        |
|   HUMAN INTENT & ARCHITECTURAL DECISIONS                               |
|      |                                                                 |
|      v                                                                 |
|   AGENT RUNTIME (Claude Code / Antigravity / Cursor / Custom CLI)      |
|      |                                                                 |
|      +-- MCP Toolchain (Live Context, Not Stale Training Memory)       |
|      |   +-- @upstash/context7-mcp   --> Live Documentation & APIs     |
|      |   +-- @vinhnguyen/gsap-mcp    --> 60fps Motion & Timelines      |
|      |   +-- shadcn-ui MCP           --> UI Primitives & Scaffolding   |
|      |                                                                 |
|      +-- Standalone Global Skills (Loaded On-Demand)                   |
|      |   +-- Frontend & Visual Systems                                 |
|      |   +-- Token Optimization & Compression                          |
|      |   +-- Planning, Introspection & Reasoning                       |
|      |                                                                 |
|      +-- Bundled Plugins & Extended Capabilities                       |
|          +-- Chrome DevTools, Superpowers, ECC Standards, Shadcn UI    |
|                                                                        |
+------------------------------------------------------------------------+
```

---

## Quickstart

Replicate this setup onto any new machine:

### Windows (PowerShell)
```powershell
git clone git@github.com:Zauwad/my-agentic-rig.git
Set-Location my-agentic-rig
.\setup.ps1
```
*Note: To use the portable MCP template without machine-specific PATH variables, add `-UsePortableMcp`.*

### macOS / Linux / WSL (Bash)
```bash
git clone git@github.com:Zauwad/my-agentic-rig.git
cd my-agentic-rig
chmod +x setup.sh
./setup.sh
```

---

## Repository Structure

```text
my-agentic-rig/
├── skills/                     # Global agent skills
├── plugins/                    # Installed agent plugin bundles
├── config/                     # Core runtime and MCP configurations
│   ├── config.json             # Enabled plugins, theme seeds, execution policy
│   ├── mcp_config.json         # Active local MCP servers
│   └── mcp_config.template.json# Portable cross-platform MCP template
├── setup.ps1                   # Automated setup script for Windows
├── setup.sh                    # Automated setup script for macOS/Linux/WSL
├── .gitignore                  # Security guardrails (excludes credentials/tokens)
└── README.md                   # Documentation
```

---

## Core Skills Inventory

The rig contains 28 standalone global skills organized by operational focus:

### 1. Frontend & Visual Systems

| Skill | Description |
| :--- | :--- |
| `creative-web-animations` | Theoretical foundations, mathematical mechanics (LERP, spring physics, scroll normalization), and architectural blueprints for 12 modern web paradigms. |
| `design-taste-frontend` | Curated design direction and anti-slop visual rules distilled from modern gallery sites. |
| `frontend-design` | Guidelines for intentional visual design, typography, and layout composition. |
| `improve-animations` | Motion inspection and review workflow focused on timing, physics, and interaction feedback. |
| `improve-ui` | Targeted UI refinement covering spacing rhythm, sub-pixel borders, hit targets, and micro-interactions. |

### 2. Token Optimization & Compression

| Skill | Description |
| :--- | :--- |
| `caveman` | Ultra-dense communication mode reducing token usage by ~75% while maintaining technical accuracy. |
| `caveman-commit` | Generates concise Conventional Commits with subject lines limited to 50 characters. |
| `caveman-compress` | Compresses runbooks, notes, and memory files in place to conserve context window space. |
| `caveman-help` | Quick-reference cheat sheet for all caveman commands and modes. |
| `caveman-review` | One-line code review comments formatted as location, problem, and fix. |
| `caveman-stats` | Session token consumption and estimated savings telemetry. |
| `ponytail` | Strict YAGNI enforcement prioritizing standard libraries and platform primitives over dependencies. |
| `ponytail-audit` | Codebase scanner for speculative code, unnecessary abstractions, and redundant packages. |
| `ponytail-debt` | Collects and tracks deliberate shortcuts and deferrals in a structured ledger. |
| `ponytail-help` | Quick-reference cheat sheet for all ponytail modes and commands. |
| `ponytail-review` | Code review focused exclusively on hunting over-engineering and dead weight. |
| `context-budget` | Audits context window utilization across agents, MCP servers, and rule definitions. |

### 3. Planning, Introspection & Reasoning

| Skill | Description |
| :--- | :--- |
| `grill-me` | Interactive interview workflow that stress-tests plans and architecture decisions step by step. |
| `grilling` | Socratic interrogation engine for sharpening technical plans and designs. |
| `agent-introspection-debugging` | Structured failure handling workflow: capture, contained diagnosis, recovery, and reporting. |
| `search-first` | Research-before-coding protocol requiring verification of existing tools prior to implementation. |
| `find-skills` | On-demand discovery and installation tool for community agent skills. |
| `documentation-lookup` | Direct documentation lookup via Context7 MCP to ensure API accuracy. |
| `handoff` | Session context transfer and state packaging between agents. |
| `teach` | Protocol updates and guideline persistence based on developer corrections. |
| `to-questionnaire` | Converts complex architectural plans into structured multiple-choice interviews. |
| `wait-what` | Cognitive pause mechanism for sanity-checking assumptions before executing irreversible operations. |
| `writing-for-agents` | Guidelines for writing clear documentation, rules, and skills specifically tailored for AI agents. |

---

## Skills Provided by Plugins

In addition to the standalone global skills, the bundled plugins provide extended, specialized capabilities across engineering domains:

### Superpowers (Rigorous Development Workflows)
* `test-driven-development`: Enforces write-failing-tests-first methodology before writing implementation code.
* `systematic-debugging`: Multi-phase root-cause diagnosis protocol before attempting fixes.
* `subagent-driven-development`: Task orchestration across isolated, scoped subagents.
* `executing-plans`: Step-by-step implementation tracking against approved engineering specs.
* `writing-plans`: Task breakdown, dependency trees, and implementation checklists.
* `requesting-code-review` / `receiving-code-review`: Technical review protocols for pull requests and major diffs.
* `verification-before-completion`: Requires verification command evidence before making success claims.
* `using-git-worktrees`: Workspace isolation patterns using git worktrees.

### Chrome DevTools (Browser Automation & Runtime Inspection)
* `chrome-devtools`: Direct browser automation, DOM inspection, network waterfall tracing, and runtime evaluation.
* `a11y-debugging`: Accessibility auditing based on WCAG 2.2 and web.dev guidelines.
* `debug-optimize-lcp`: Core Web Vitals and Largest Contentful Paint diagnostics.
* `cookie-debugging`: Session state, authentication redirects, and cookie consent inspection.
* `memory-leak-debugging`: Heap snapshot comparisons and memory leak tracking.
* `troubleshooting`: Target connection and CDP socket debugging.

### GSAP (Motion Systems & Hardware Acceleration)
* `gsap-core`: Core tweening API, easing equations, durations, and staggers.
* `gsap-timeline`: Complex multi-step animation sequencing and keyframe choreography.
* `gsap-scrolltrigger`: Scroll-linked animations, pinning, and scrub ratios.
* `gsap-react`: React integration patterns using the `useGSAP` hook and context cleanup.
* `gsap-plugins`: Official plugin registration for Flip, Draggable, and SplitText.
* `gsap-performance`: Layout thrashing prevention, transforms-only rule, and will-change optimizations.

### Shadcn UI (Accessible Primitives & Components)
* `shadcn-ui`: Component creation and integration using Radix primitives and Tailwind CSS.
* `shadcn-component-discovery`: Ecosystem-wide component and registry exploration.
* `shadcn-component-review`: Visual style audits, token compliance, and slot usage verification.

### Modern Web Guidance
* `modern-web-guidance`: Search engine and reference tool for modern web standards and browser APIs.
* `chrome-extensions`: Best practices for Manifest V3 browser extension engineering.

### Pstack & Architectural Reasoning
* `typescript-best-practices`: Strong type systems, immutability, and safe narrowing.
* `unslop`: Removal of AI boilerplate, excessive wrappers, and bloated abstractions.
* `poteto-mode`: Pragmatic, minimalist coding style.
* `architect`: High-level system design and technical decomposition.
* `blast-radius`: Change impact analysis before refactoring critical paths.

### ECC & ECC-FullStack (Engineering Standards)
* `architecture-decision-records`: Automated ADR logging for significant technical decisions.
* `api-design`: REST API conventions, status codes, pagination, and error contracts.
* `backend-patterns`: Server-side architecture, data access layers, and API route structure.
* `database-migrations`: Schema changes, data migrations, rollbacks, and zero-downtime procedures.
* `e2e-testing`: Playwright end-to-end testing patterns and page object models.
* `security-review`: Authentication, authorization, input validation, and secret management audits.
* `deployment-patterns`: CI/CD pipelines, Docker containerization, and production readiness checks.

### Google Antigravity SDK
* `google-antigravity-sdk`: Autonomous agent design, multi-agent orchestration, and lifecycle tooling.

---

## Connected MCP Servers

External context providers connected via the Model Context Protocol:

* `context7` (`@upstash/context7-mcp`): Up-to-date documentation lookup for modern frameworks and libraries.
* `gsap` (`@vinhnguyen/gsap-mcp`): GSAP animation reference, ScrollTrigger debugging, and timeline optimization.
* `shadcn` (`shadcn@latest mcp`): Direct registry exploration and block installation for accessible UI components.

---

## Security & Portability

Security boundaries are strictly enforced:
* Credentials, OAuth tokens (`oauth_creds.json`), machine IDs (`installation_id`), local workspace session files, and logs are excluded via `.gitignore`.
* The setup scripts link directly to local configuration paths without hardcoding machine-specific absolute directories.

---

## Author

Ridwanul Azim (Zauwad)
* Portfolio: [ridwanul.dev](https://ridwanul.dev)
* GitHub: [@Zauwad](https://github.com/Zauwad)
