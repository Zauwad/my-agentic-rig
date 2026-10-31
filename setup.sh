#!/usr/bin/env bash
# ai-den: One-command setup for my Antigravity / Gemini CLI environment.
set -e

echo -e "\n[ai-den] setting up environment..."

GEMINI_CONFIG_DIR="$HOME/.gemini/config"
GEMINI_SKILLS_DIR="$GEMINI_CONFIG_DIR/skills"
GEMINI_HOOKS_DIR="$GEMINI_CONFIG_DIR/hooks"
AGENTS_DIR="$HOME/.agents"

mkdir -p "$GEMINI_CONFIG_DIR" "$GEMINI_SKILLS_DIR" "$GEMINI_HOOKS_DIR" "$AGENTS_DIR"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 1. Sync Skills
echo "-> syncing skills to $GEMINI_SKILLS_DIR..."
if [ -d "$SCRIPT_DIR/skills" ]; then
  cp -r "$SCRIPT_DIR/skills/"* "$GEMINI_SKILLS_DIR/"
fi

# 2. Sync Config & MCP
echo "-> syncing settings & MCP configs..."
if [ -f "$SCRIPT_DIR/config/config.json" ]; then
  cp "$SCRIPT_DIR/config/config.json" "$GEMINI_CONFIG_DIR/config.json"
fi

if [ -f "$SCRIPT_DIR/config/mcp_config.template.json" ]; then
  cp "$SCRIPT_DIR/config/mcp_config.template.json" "$GEMINI_CONFIG_DIR/mcp_config.json"
fi

# 3. Sync Hooks
echo "-> syncing hooks..."
if [ -f "$SCRIPT_DIR/config/hooks.json" ]; then
  cp "$SCRIPT_DIR/config/hooks.json" "$GEMINI_CONFIG_DIR/hooks.json"
fi
if [ -d "$SCRIPT_DIR/config/hooks" ]; then
  cp -r "$SCRIPT_DIR/config/hooks/"* "$GEMINI_HOOKS_DIR/"
fi

# 4. Sync Agent Skill-Lock
echo "-> syncing agent lockfile..."
if [ -f "$SCRIPT_DIR/agents/.skill-lock.json" ]; then
  cp "$SCRIPT_DIR/agents/.skill-lock.json" "$AGENTS_DIR/.skill-lock.json"
fi

echo -e "[ai-den] ready. restart antigravity to load changes.\n"
