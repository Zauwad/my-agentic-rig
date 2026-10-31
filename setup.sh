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
echo -e "\n[1/3] Installing Skills..."
if [ -d "$SCRIPT_DIR/skills" ]; then
  cp -r "$SCRIPT_DIR/skills/"* "$SKILLS_DIR/"
  echo "  -> Skills linked into $SKILLS_DIR"
fi

# 2. Install Plugins
echo -e "\n[2/3] Installing Plugins..."
if [ -d "$SCRIPT_DIR/plugins" ]; then
  cp -r "$SCRIPT_DIR/plugins/"* "$PLUGINS_DIR/"
  echo "  -> Plugins linked into $PLUGINS_DIR"
fi

# 3. Sync Settings & MCP
echo -e "\n[3/3] Restoring Settings & MCP Servers..."
if [ -f "$SCRIPT_DIR/config/config.json" ]; then
  cp "$SCRIPT_DIR/config/config.json" "$CONFIG_DIR/config.json"
  echo "  -> Settings restored"
fi

if [ -f "$SCRIPT_DIR/config/mcp_config.template.json" ]; then
  cp "$SCRIPT_DIR/config/mcp_config.template.json" "$CONFIG_DIR/mcp_config.json"
  echo "  -> MCP servers active (context7, gsap, shadcn)"
fi

echo -e "\nRig ready. Your agent runtime is loaded and synchronized.\n"
