# ai-den

This is my personal setup for Antigravity and Gemini CLI. 

I keep this here so whenever I hop on a new machine or reinstall my OS, I can clone it, run one script, and have my entire AI workflow ready in seconds instead of setting up skills and MCPs manually from scratch.

No fluff or buzzwords—just the skills, tools, and configs I actually use every day.

---

## Quick Setup

### Windows
```powershell
git clone git@github.com:Zauwad/ai-den.git
cd ai-den
.\setup.ps1
```

> If you want to use the portable MCP template without machine-specific paths, pass `-UsePortableMcp`:
> ```powershell
> .\setup.ps1 -UsePortableMcp
> ```

### macOS / Linux / WSL
```bash
git clone git@github.com:Zauwad/ai-den.git
cd ai-den
chmod +x setup.sh
./setup.sh
```

---

## What’s Inside

### 1. Skills I Actually Use

* **`creative-web-animations`**: My core reference for 3D scrollytelling, camera splines, LERP physics, and 12 modern website layouts. Stripped of rigid copy-paste code blocks so the AI learns the math, motion patterns, and mechanics instead of forcing arbitrary styles.
* **`design-taste-frontend` & `frontend-design`**: Keeps generated UI intentional, tasteful, and clean rather than looking like generic AI templates.
* **`improve-animations` & `improve-ui`**: Polish workflows for checking layout rhythm, hit targets, sub-pixel borders, and easing.
* **`caveman` (suite)**: Ultra-compact communication mode. Cuts token usage by ~75% when I need straight-to-the-point technical output without filler text.
* **`ponytail` (suite)**: The anti-overengineering filter. Channels YAGNI, reaches for stdlib first, and prevents bloated abstractions.
* **`grill-me`**: Relentless Socratic interview mode to poke holes in a design or plan before I write code.
* **`agent-introspection-debugging` & `search-first`**: Self-debugging loop and research-first habit to avoid hallucinated APIs.
* **`documentation-lookup`**: Queries up-to-date documentation via Context7 MCP.

### 2. MCP Servers

* **`context7`**: Queries live docs for libraries and frameworks (Next.js, React 19, Prisma, Tailwind v4, etc.) instead of guessing from training data.
* **`gsap`**: Official animation reference for timelines, performance optimization, and ScrollTrigger logic.
* **`shadcn`**: Component registry search and direct block scaffolding.

### 3. Config & Hooks

* `config/config.json`: My editor preferences, dark theme seeds, turbo permissions, and active plugin lists.
* `config/mcp_config.json`: Machine-local MCP setup (+ `mcp_config.template.json` for clean cross-platform portability).
* `config/hooks/`: Lifecycle hooks (like Herdr session state tracking).
* `agents/.skill-lock.json`: Skill source lockfile and integrity hashes.

---

## Security

Zero credentials, tokens, or session databases are stored here. Everything sensitive (`oauth_creds.json`, `installation_id`, `state.json`, local project logs) is `.gitignore`d.

On a fresh install, just run `agy login` once to authenticate your Google/Antigravity account.

---

### Author
[Ridwanul Azim (Zauwad)](https://ridwanul.dev) • [@Zauwad](https://github.com/Zauwad)
