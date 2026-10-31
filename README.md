# my-agentic-rig

> This is my daily agent setup. It contains the mental models, skills, and tools I use across my projects. Take what works for you.

Think of this like a personal `.dotfiles` repository, but designed for AI agents. Whether I am working in terminal agent loops, Claude Code, Antigravity, Cursor, or custom CLI runners, I don't want agents starting from zero, guessing framework APIs, or hallucinating brittle template code. 

This repository packages my cognitive skill packs, Model Context Protocol (MCP) servers, lifecycle hooks, and reasoning rules into a single portable environment that I can replicate anywhere in seconds.

---

## Architecture at a Glance

How the pieces fit together when an agent boots up in my workspace:

```text
┌────────────────────────────────────────────────────────────────────────┐
│                          MY AGENTIC RIG                                │
├────────────────────────────────────────────────────────────────────────┤
│                                                                        │
│   YOU / ME (Human Intent & Architecture Decisions)                     │
│      │                                                                 │
│      ▼                                                                 │
│   AGENT RUNTIME (Claude Code / Antigravity / Cursor / Custom CLI)      │
│      ├── MCP Toolchain (Live Context, Not Training Memory)             │
│      │   ├── @upstash/context7-mcp   ──► Live Framework Docs & APIs    │
│      │   ├── @vinhnguyen/gsap-mcp    ──► 60fps Motion & Timelines      │
│      │   └── shadcn-ui MCP           ──► Accessible UI Scaffolding     │
│      │                                                                 │
│      ├── Progressive Skill Packs (Loaded On-Demand)                    │
│      │   ├── Spatial & Creative Motion                                 │
│      │   ├── Token Compression & Anti-Bloat (Caveman / Ponytail)       │
│      │   └── Reasoning, Introspection & Architecture Review            │
│      │                                                                 │
│      └── Pre-Invocation Hooks & Lockfiles                              │
│          └── Herdr session sync & .skill-lock.json                     │
│                                                                        │
└────────────────────────────────────────────────────────────────────────┘
```

---

## ⚡ Quickstart

Replicate my setup onto any new machine:

### Windows (PowerShell)
```powershell
git clone git@github.com:Zauwad/my-agentic-rig.git
Set-Location my-agentic-rig
.\setup.ps1
```
*Tip: To use the portable MCP template without machine-specific PATH variables, run with `-UsePortableMcp`.*

### macOS / Linux / WSL (Bash)
```bash
git clone git@github.com:Zauwad/my-agentic-rig.git
cd my-agentic-rig
chmod +x setup.sh
./setup.sh
```

---

## 🧠 What’s in My Rig

I organize my agent skills into three distinct categories based on what I need them to do:

### 1. Spatial Motion & Creative Frontend
I don't like AI generating generic template websites or stiff UI. These skills give agents the spatial mental models, physics formulas, and compositing rules to build award-winning interfaces.

| Skill | How I Use It |
| :--- | :--- |
| **`creative-web-animations`** | **My Flagship Reference**: Contains the math (LERP damping, spring physics, scroll remapping, camera splines) and architectural blueprints for 12 modern website paradigms (3D scrollytelling, bento grids, editorial magazines, desktop OS simulators, continuous narrative strips) without binding to rigid code snippets. |
| **`design-taste-frontend`** | Distilled from 247 curated gallery sites (One Page Love, Awwwards SOTD). Enforces a strict anti-slop visual standard, typographic hierarchy, and real-browser inspection. |
| **`frontend-design`** | High-leverage guidelines for distinctive, production-grade visual design and aesthetic direction. |
| **`improve-animations`** | Senior motion advisor workflow based on Emil Kowalski's craftsmanship rules. Surveys code and creates actionable motion plans. |
| **`improve-ui`** | Focuses on tactical UI micro-polish: spacing rhythm, sub-pixel borders, shadows, hit targets, and interaction feedback. |

### 2. Token Compression & Anti-Bloat
Long sessions waste tokens on verbose pleasantries, and AI models love inventing unnecessary abstractions. I use these to keep sessions lean and fast.

| Skill | How I Use It |
| :--- | :--- |
| **`caveman`** | Ultra-dense communication mode. Cuts token usage ~75% while keeping full technical accuracy. |
| **`caveman-commit`** | Generates ultra-compressed Conventional Commits (subject $\le 50$ chars). |
| **`caveman-compress`** | In-place compression for runbooks and memory files to preserve context window. |
| **`caveman-review`** | PR feedback stripped down to one line per finding: `location`, `problem`, `fix`. |
| **`caveman-stats`** | Telemetry tracker for token consumption and real dollar savings. |
| **`ponytail`** | Extreme YAGNI mode. Forces agents to reach for the standard library before adding dependencies, and native platform APIs before custom code. |
| **`ponytail-audit`** | Scans an entire codebase for over-engineering, dead weight, and speculative code. |
| **`ponytail-debt`** | Gathers deliberate shortcuts into a tracked debt ledger so they don't rot. |
| **`context-budget`** | Audits context window consumption across all skills, rules, and MCP servers. |

### 3. Reasoning, Introspection & Planning
Before writing any code, I want agents to plan thoroughly, research real docs, and recover cleanly if a command fails.

| Skill | How I Use It |
| :--- | :--- |
| **`grill-me`** | An interactive interview agent that interrogates my plan and design decisions one by one until every dependency is resolved. |
| **`agent-introspection-debugging`** | Structured self-debugging workflow for when an agent fails a task: capture, diagnosis, contained recovery, and post-mortem report. |
| **`search-first`** | Research-before-coding protocol that forces agents to verify existing libraries and tools before writing custom implementations. |
| **`find-skills`** | Discovers and installs community agent skills on-the-fly when a new problem domain emerges. |
| **`documentation-lookup`** | Queries up-to-date documentation on Context7 MCP instead of relying on outdated pre-training knowledge. |
| **`organize-banners-for-gdn`** | Bulk banner image and sizing pipeline for Google Display Network campaigns. |

---

## 🔌 Connected MCP Tools

I connect my agents to external tools via the Model Context Protocol (MCP) so they have live context instead of guessing:

* **`context7`** (`@upstash/context7-mcp`): Instant documentation lookups for modern stacks (React 19, Next.js, Prisma, Tailwind).
* **`gsap`** (`@vinhnguyen/gsap-mcp`): GSAP animation expertise, ScrollTrigger debugging, and performance profiling.
* **`shadcn`** (`shadcn@latest mcp`): Component registry exploration and clean UI block scaffolding.

---

## 🔒 Security & Portability

I maintain an air-gapped security boundary between my personal credentials and this repository:
- **Never committed**: OAuth tokens, machine hardware identifiers (`installation_id`), local session databases (`projects/`), and command logs.
- **Portable**: The setup scripts automatically link into your local environment (`~/.gemini/config`, `~/.agents`, or custom agent directories) without hardcoding private file paths.

---

## 👤 Author

**Ridwanul Azim (Zauwad)**  
- Portfolio: [ridwanul.dev](https://ridwanul.dev)  
- GitHub: [@Zauwad](https://github.com/Zauwad)

Feel free to fork this, strip out what you don't need, and adapt it to your own workflow.
