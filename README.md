# Antigravity Environment & Skills Setup

A reproducible, portable repository containing the full personal Antigravity and Gemini CLI environment: global skills, MCP server definitions, hooks, plugins configuration, and agent registry.

---

## 🚀 Quick Replication Guide

Clone this repository and run the setup script for your platform to replicate the entire environment on any machine in seconds.

### Windows (PowerShell)
```powershell
git clone git@github.com:Zauwad/antigravity-setup.git
cd antigravity-setup
.\setup.ps1
```
> **Tip**: To use the clean, cross-platform MCP template without hardcoded machine paths, add `-UsePortableMcp`:
> ```powershell
> .\setup.ps1 -UsePortableMcp
> ```

### macOS / Linux / WSL (Bash)
```bash
git clone git@github.com:Zauwad/antigravity-setup.git
cd antigravity-setup
chmod +x setup.sh
./setup.sh
```

---

## 📂 Repository Structure

```text
antigravity-setup/
├── skills/                     # Global Antigravity skills (~/.gemini/config/skills)
│   ├── creative-web-animations/ # Master architectural guide: 12 web paradigms & motion physics
│   ├── design-taste-frontend/  # Elite frontend design taste system & library
│   ├── find-skills/            # On-demand skill finder
│   ├── frontend-design/        # High-leverage frontend design patterns
│   ├── grill-me/               # Interactive architectural review & stress-testing
│   ├── improve-animations/     # Emil Kowalski motion craftsmanship & audits
│   ├── improve-ui/             # UI micro-polish & tactile refinement
│   ├── caveman/                # Ultra-compressed communication mode (~75% token reduction)
│   ├── caveman-commit/         # Ultra-compressed conventional commit generator
│   ├── caveman-compress/       # Memory file compressor
│   ├── caveman-help/           # Quick-reference card for caveman commands
│   ├── caveman-review/         # High-signal code review feedback
│   ├── caveman-stats/          # Session token usage & savings calculator
│   ├── ponytail/               # Pragmatic YAGNI & standard-library-first mode
│   ├── ponytail-audit/         # Whole-repo over-engineering scanner
│   ├── ponytail-debt/          # Shortcut & deferral tracker
│   ├── ponytail-help/          # Ponytail quick-reference card
│   ├── ponytail-review/        # Over-engineering code review
│   ├── context-budget/         # Context window consumption & bloat auditor
│   ├── documentation-lookup/   # Live framework docs via Context7 MCP
│   ├── agent-introspection-debugging/ # Agent diagnosis & contained recovery
│   ├── organize-banners-for-gdn/ # Bulk Google Display Network asset organizer
│   └── search-first/           # Research-before-coding workflow
├── config/                     # Core Antigravity configuration files
│   ├── config.json             # Enabled plugins, theme seeds, execution policies
│   ├── mcp_config.json         # Active local MCP servers
│   ├── mcp_config.template.json# Portable, cross-platform MCP server template
│   ├── hooks.json              # Lifecycle hook definitions
│   └── hooks/                  # Hook scripts (e.g. Herdr session state)
├── agents/                     # Agent registry & lockfiles
│   └── .skill-lock.json        # Upstream skill sources and version hashes
├── setup.ps1                   # Automated setup script for Windows
├── setup.sh                    # Automated setup script for macOS/Linux/WSL
├── .gitignore                  # Security guardrails (prevents committing tokens/secrets)
└── README.md                   # Environment overview & guide
```

---

## 🛠️ MCP Servers

The environment comes pre-configured with three high-utility Model Context Protocol (MCP) servers:

1. **`context7`** (`@upstash/context7-mcp`): Up-to-date documentation lookup for modern libraries and frameworks (React, Next.js, Prisma, Tailwind, etc.).
2. **`gsap`** (`@vinhnguyen/gsap-mcp`): GSAP animation expertise, ScrollTrigger debugging, and timeline performance patterns.
3. **`shadcn`** (`shadcn@latest mcp`): Direct registry exploration and block installation for accessible UI components.

---

## 🎨 Featured Skill: `creative-web-animations`

Located at [`skills/creative-web-animations`](./skills/creative-web-animations/SKILL.md), this skill provides an architectural and theoretical foundation for building award-winning web motion experiences:
- **Spatial Mental Models**: Perspective optics, 3D scene graph preservation, Z-space staging, stenciling masks, and contrast inversion.
- **Mathematical Mechanics**: LERP damping, force-driven spring dynamics, normalized scroll remapping, and Catmull-Rom 3D camera splines.
- **12 Trending Web Paradigms**: Complete architectural blueprints for 3D Scrollytelling, Linear-Style Bento Grids, Editorial Magazines, Luxury 3D Product Showcases, Horizontal Narrative Strips, Desktop OS Simulators, Physics Playgrounds, and Infinite Pan/Zoom Canvases.
- **Compositing Guardrails**: Compositor-only transforms, layout thrashing prevention, and reduced-motion accessibility.

---

## 🔒 Security Notice

This repository strictly excludes:
- OAuth tokens (`oauth_creds.json`)
- Google account identifiers (`google_accounts.json`)
- Unique installation IDs (`installation_id`)
- Local workspace session databases (`projects/*.json`)

When replicating on a new machine, your personal authentication is performed securely through Antigravity CLI's standard login flow (`agy login` or Antigravity UI).
