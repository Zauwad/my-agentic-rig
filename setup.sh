#!/usr/bin/env bash
# my-agentic-rig - Personal AI Agent Dotfiles & Environment Setup for macOS / Linux / WSL
set -e

CONFIG_DIR="${1:-$HOME/.gemini/config}"
AGENTS_DIR="${2:-$HOME/.agents}"
SKILLS_DIR="$CONFIG_DIR/skills"
HOOKS_DIR="$CONFIG_DIR/hooks"

echo -e "\033[36m"
cat << "EOF"
  ███    ███  ██    ██      █████   ██████  ███████ ███    ██ ████████ ██  ██████      ██████  ██  ██████  
  ████  ████   ██  ██      ██   ██ ██       ██      ████   ██    ██    ██ ██           ██   ██ ██ ██       
  ██ ████ ██    ████       ███████ ██   ███ █████   ██ ██  ██    ██    ██ ██           ██████  ██ ██   ███ 
  ██  ██  ██     ██        ██   ██ ██    ██ ██      ██  ██ ██    ██    ██ ██           ██   ██ ██ ██    ██ 
  ██      ██     ██        ██   ██  ██████  ███████ ██   ████    ██    ██  ██████      ██   ██ ██  ██████  
                 [ PERSONAL AGENTIC DOTFILES // SKILLS // MCPS // RUNTIMES ]
EOF
echo -e "\033[0m"

echo ">>> Linking personal skills, MCP tools, and runtime protocols..."

mkdir -p "$CONFIG_DIR" "$SKILLS_DIR" "$HOOKS_DIR" "$AGENTS_DIR"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 1. Install Skills
echo -e "\n[1/4] Installing Skills..."
if [ -d "$SCRIPT_DIR/skills" ]; then
  cp -r "$SCRIPT_DIR/skills/"* "$SKILLS_DIR/"
  echo "  -> Skills linked into $SKILLS_DIR"
fi

# 2. Sync MCP & Config
echo -e "\n[2/4] Restoring Settings & MCP Servers..."
if [ -f "$SCRIPT_DIR/config/config.json" ]; then
  cp "$SCRIPT_DIR/config/config.json" "$CONFIG_DIR/config.json"
  echo "  -> Settings restored"
fi

if [ -f "$SCRIPT_DIR/config/mcp_config.template.json" ]; then
  cp "$SCRIPT_DIR/config/mcp_config.template.json" "$CONFIG_DIR/mcp_config.json"
  echo "  -> MCP servers active (context7, gsap, shadcn)"
fi

# 3. Restore Hooks
echo -e "\n[3/4] Installing Hooks..."
if [ -f "$SCRIPT_DIR/config/hooks.json" ]; then
  cp "$SCRIPT_DIR/config/hooks.json" "$CONFIG_DIR/hooks.json"
fi
if [ -d "$SCRIPT_DIR/config/hooks" ]; then
  cp -r "$SCRIPT_DIR/config/hooks/"* "$HOOKS_DIR/"
  echo "  -> hooks linked"
fi

# 4. Restore Skill Lock
echo -e "\n[4/4] Restoring Agent Registry..."
if [ -f "$SCRIPT_DIR/agents/.skill-lock.json" ]; then
  cp "$SCRIPT_DIR/agents/.skill-lock.json" "$AGENTS_DIR/.skill-lock.json"
  echo "  -> .skill-lock.json restored to $AGENTS_DIR"
fi

echo -e "\nRig ready. Your agent runtime is loaded and synchronized.\n"
