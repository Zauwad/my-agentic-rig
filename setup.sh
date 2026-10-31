#!/usr/bin/env bash
# GRAVITY // RIG - Autonomous Agent Environment Replicator for macOS / Linux / WSL
set -e

echo -e "\033[36m"
cat << "EOF"
  ▄████  ██▀███   ▄▄▄    ██▒   █▓ ██▓ ▄▄▄█████▓▓██   ██▓
 ██▒ ▀█▒▓██ ▒ ██▒▒████▄ ▓██░   █▒▓██▒ ▓  ██▒ ▓▒ ▒██  ██▒
▒██░ ▄▄▄░▓██ ░▄█ ▒▒██  ▀█▄ ▓██  █▒░▒██▒ ▒ ▓██░ ▒░  ▒██ ██░
░▓█  ██▓ ▒██▀▀█▄  ░██▄▄▄▄██  ▒██ █░░░██░ ░ ▓██▓ ░   ░ ▐██▓░
░▒▓███▀▒ ░██▓ ▒██▒ ▓█   ▓██▒  ▒▀█░  ░██░   ▒██▒ ░   ░ ██▒▓░
  [ THE AUTONOMOUS AGENT ENGINEERING RIG ]
EOF
echo -e "\033[0m"

echo -e ">>> Initiating RIG bootstrap sequence..."

GEMINI_CONFIG_DIR="$HOME/.gemini/config"
GEMINI_SKILLS_DIR="$GEMINI_CONFIG_DIR/skills"
GEMINI_HOOKS_DIR="$GEMINI_CONFIG_DIR/hooks"
AGENTS_DIR="$HOME/.agents"

mkdir -p "$GEMINI_CONFIG_DIR" "$GEMINI_SKILLS_DIR" "$GEMINI_HOOKS_DIR" "$AGENTS_DIR"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 1. Install Global Skills
echo -e "\n[1/4] Installing Global Skills..."
if [ -d "$SCRIPT_DIR/skills" ]; then
  cp -r "$SCRIPT_DIR/skills/"* "$GEMINI_SKILLS_DIR/"
  echo "  -> Global skills copied to $GEMINI_SKILLS_DIR"
fi

# 2. Configure Settings & MCP
echo -e "\n[2/4] Restoring Settings & MCP Servers..."
if [ -f "$SCRIPT_DIR/config/config.json" ]; then
  cp "$SCRIPT_DIR/config/config.json" "$GEMINI_CONFIG_DIR/config.json"
  echo "  -> config.json restored"
fi

if [ -f "$SCRIPT_DIR/config/mcp_config.template.json" ]; then
  cp "$SCRIPT_DIR/config/mcp_config.template.json" "$GEMINI_CONFIG_DIR/mcp_config.json"
  echo "  -> mcp_config.json restored (portable template)"
fi

# 3. Restore Hooks
echo -e "\n[3/4] Installing Hooks..."
if [ -f "$SCRIPT_DIR/config/hooks.json" ]; then
  cp "$SCRIPT_DIR/config/hooks.json" "$GEMINI_CONFIG_DIR/hooks.json"
fi
if [ -d "$SCRIPT_DIR/config/hooks" ]; then
  cp -r "$SCRIPT_DIR/config/hooks/"* "$GEMINI_HOOKS_DIR/"
  echo "  -> hooks restored"
fi

# 4. Restore Skill Lock
echo -e "\n[4/4] Restoring Agent Registry..."
if [ -f "$SCRIPT_DIR/agents/.skill-lock.json" ]; then
  cp "$SCRIPT_DIR/agents/.skill-lock.json" "$AGENTS_DIR/.skill-lock.json"
  echo "  -> .skill-lock.json restored to $AGENTS_DIR"
fi

echo -e "\nEnvironment replication complete! Restart Antigravity to activate changes.\n"
