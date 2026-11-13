#!/usr/bin/env bash
# my-agentic-rig - Personal AI Agent Dotfiles & Environment Setup for macOS / Linux / WSL
set -e

CONFIG_DIR="${1:-$HOME/.gemini/config}"
SKILLS_DIR="$CONFIG_DIR/skills"
PLUGINS_DIR="$CONFIG_DIR/plugins"

echo -e "\033[36m"
cat << "EOF"
  ███    ███  ██    ██      █████   ██████  ███████ ███    ██ ████████ ██  ██████      ██████  ██  ██████  
  ████  ████   ██  ██      ██   ██ ██       ██      ████   ██    ██    ██ ██           ██   ██ ██ ██       
  ██ ████ ██    ████       ███████ ██   ███ █████   ██ ██  ██    ██    ██ ██           ██████  ██ ██   ███ 
  ██  ██  ██     ██        ██   ██ ██    ██ ██      ██  ██ ██    ██    ██ ██           ██   ██ ██ ██    ██ 
  ██      ██     ██        ██   ██  ██████  ███████ ██   ████    ██    ██  ██████      ██   ██ ██  ██████  
                 [ PERSONAL AGENTIC DOTFILES // SKILLS // PLUGINS // MCPS ]
EOF
echo -e "\033[0m"

echo ">>> Linking personal skills, plugins, and runtime configuration..."

mkdir -p "$CONFIG_DIR" "$SKILLS_DIR" "$PLUGINS_DIR"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 1. Install Skills
echo -e "\n[1/4] Installing Skills..."
if [ -d "$SCRIPT_DIR/skills" ]; then
  cp -r "$SCRIPT_DIR/skills/"* "$SKILLS_DIR/"
  echo "  -> Skills linked into $SKILLS_DIR"
fi

# 2. Install Plugins
echo -e "\n[2/4] Installing Plugins..."
if [ -d "$SCRIPT_DIR/plugins" ]; then
  cp -r "$SCRIPT_DIR/plugins/"* "$PLUGINS_DIR/"
  echo "  -> Plugins linked into $PLUGINS_DIR"
fi

# 3. Sync Settings & MCP
echo -e "\n[3/4] Restoring Settings & MCP Servers..."
if [ -f "$SCRIPT_DIR/config/config.json" ]; then
  cp "$SCRIPT_DIR/config/config.json" "$CONFIG_DIR/config.json"
  echo "  -> Settings restored"
fi

if [ -f "$SCRIPT_DIR/config/mcp_config.template.json" ]; then
  cp "$SCRIPT_DIR/config/mcp_config.template.json" "$CONFIG_DIR/mcp_config.json"
  echo "  -> MCP servers active (context7, gsap, shadcn)"
fi

if [ -f "$SCRIPT_DIR/config/GEMINI.md" ]; then
  cp "$SCRIPT_DIR/config/GEMINI.md" "$HOME/.gemini/GEMINI.md"
  cp "$SCRIPT_DIR/config/GEMINI.md" "$CONFIG_DIR/AGENTS.md"
  echo "  -> Global agent rules synced"
fi

# 4. Install Cursor Rules
echo -e "\n[4/4] Installing Cursor Rules..."
CURSOR_RULES_DIR="$HOME/.cursor/rules"
mkdir -p "$CURSOR_RULES_DIR"
if [ -d "$SCRIPT_DIR/cursor/rules" ]; then
  cp -r "$SCRIPT_DIR/cursor/rules/"* "$CURSOR_RULES_DIR/"
  echo "  -> Cursor rules synced into $CURSOR_RULES_DIR"
fi

echo -e "\nRig ready. Your agent runtime is loaded and synchronized.\n"
