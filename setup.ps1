<#
.SYNOPSIS
    my-agentic-rig - Personal AI Agent Dotfiles & Environment Setup
.DESCRIPTION
    Installs and synchronizes personal skills, plugins, and MCP server configurations.
#>

[CmdletBinding()]
param(
    [string]$ConfigDir = "$HOME\.gemini\config",
    [switch]$Force = $false,
    [switch]$UsePortableMcp = $false
)

$ErrorActionPreference = "Stop"

Write-Host @"

  ███    ███  ██    ██      █████   ██████  ███████ ███    ██ ████████ ██  ██████      ██████  ██  ██████  
  ████  ████   ██  ██      ██   ██ ██       ██      ████   ██    ██    ██ ██           ██   ██ ██ ██       
  ██ ████ ██    ████       ███████ ██   ███ █████   ██ ██  ██    ██    ██ ██           ██████  ██ ██   ███ 
  ██  ██  ██     ██        ██   ██ ██    ██ ██      ██  ██ ██    ██    ██ ██           ██   ██ ██ ██    ██ 
  ██      ██     ██        ██   ██  ██████  ███████ ██   ████    ██    ██  ██████      ██   ██ ██  ██████  
                 [ PERSONAL AGENTIC DOTFILES // SKILLS // PLUGINS // MCPS ]
"@ -ForegroundColor Cyan

Write-Host "`n>>> Linking personal skills, plugins, and runtime configuration..." -ForegroundColor Gray

$skillsDest  = Join-Path $ConfigDir "skills"
$pluginsDest = Join-Path $ConfigDir "plugins"

$dirs = @($ConfigDir, $skillsDest, $pluginsDest)
foreach ($dir in $dirs) {
    if (-not (Test-Path $dir)) {
        Write-Host "Creating directory: $dir" -ForegroundColor Gray
        New-Item -ItemType Directory -Path $dir -Force | Out-Null
    }
}

$scriptRoot = $PSScriptRoot

# 1. Sync Skills
Write-Host "`n[1/3] Installing Skills..." -ForegroundColor Yellow
$skillsSource = Join-Path $scriptRoot "skills"
if (Test-Path $skillsSource) {
    $skills = Get-ChildItem -Path $skillsSource -Directory
    foreach ($skill in $skills) {
        $dest = Join-Path $skillsDest $skill.Name
        Write-Host "  -> Syncing skill: $($skill.Name)" -ForegroundColor Green
        Copy-Item -Path $skill.FullName -Destination $dest -Recurse -Force
    }
}

# 2. Sync Plugins
Write-Host "`n[2/3] Installing Plugins..." -ForegroundColor Yellow
$pluginsSource = Join-Path $scriptRoot "plugins"
if (Test-Path $pluginsSource) {
    $plugins = Get-ChildItem -Path $pluginsSource -Directory
    foreach ($plugin in $plugins) {
        $dest = Join-Path $pluginsDest $plugin.Name
        Write-Host "  -> Syncing plugin: $($plugin.Name)" -ForegroundColor Green
        Copy-Item -Path $plugin.FullName -Destination $dest -Recurse -Force
    }
}

# 3. Sync Settings & MCP Configuration
Write-Host "`n[3/3] Syncing Settings & MCP Servers..." -ForegroundColor Yellow
$configSrc = Join-Path $scriptRoot "config\config.json"
$configDest = Join-Path $ConfigDir "config.json"
if (Test-Path $configSrc) {
    if ((Test-Path $configDest) -and -not $Force) {
        Write-Host "  -> config.json exists. Backing up to config.json.bak" -ForegroundColor Gray
        Copy-Item -Path $configDest -Destination "$configDest.bak" -Force
    }
    Copy-Item -Path $configSrc -Destination $configDest -Force
    Write-Host "  -> Settings restored" -ForegroundColor Green
}

$mcpSrc = if ($UsePortableMcp -or (-not (Test-Path (Join-Path $scriptRoot "config\mcp_config.json")))) {
    Join-Path $scriptRoot "config\mcp_config.template.json"
} else {
    Join-Path $scriptRoot "config\mcp_config.json"
}
$mcpDest = Join-Path $ConfigDir "mcp_config.json"
if (Test-Path $mcpSrc) {
    Copy-Item -Path $mcpSrc -Destination $mcpDest -Force
    Write-Host "  -> MCP servers active (context7, gsap, shadcn)" -ForegroundColor Green
}

Write-Host "`nRig ready. Your agent runtime is loaded and synchronized.`n" -ForegroundColor Cyan
