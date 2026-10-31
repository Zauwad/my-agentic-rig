<#
.SYNOPSIS
    my-agentic-rig - Personal AI Agent Dotfiles & Environment Setup
.DESCRIPTION
    Installs and synchronizes personal skills, MCP server configs, and agent protocols.
#>

[CmdletBinding()]
param(
    [string]$ConfigDir = "$HOME\.gemini\config",
    [string]$AgentsDir = "$HOME\.agents",
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
                 [ PERSONAL AGENTIC DOTFILES // SKILLS // MCPS // RUNTIMES ]
"@ -ForegroundColor Cyan

Write-Host "`n>>> Linking personal skills, MCP tools, and runtime protocols..." -ForegroundColor Gray

$skillsDest = Join-Path $ConfigDir "skills"
$hooksDest  = Join-Path $ConfigDir "hooks"

$dirs = @($ConfigDir, $skillsDest, $hooksDest, $AgentsDir)
foreach ($dir in $dirs) {
    if (-not (Test-Path $dir)) {
        Write-Host "Creating directory: $dir" -ForegroundColor Gray
        New-Item -ItemType Directory -Path $dir -Force | Out-Null
    }
}

$scriptRoot = $PSScriptRoot

# 1. Sync Skills
Write-Host "`n[1/4] Installing Skills..." -ForegroundColor Yellow
$skillsSource = Join-Path $scriptRoot "skills"
if (Test-Path $skillsSource) {
    $skills = Get-ChildItem -Path $skillsSource -Directory
    foreach ($skill in $skills) {
        $dest = Join-Path $skillsDest $skill.Name
        Write-Host "  -> Syncing skill: $($skill.Name)" -ForegroundColor Green
        Copy-Item -Path $skill.FullName -Destination $dest -Recurse -Force
    }
}

# 2. Sync MCP Servers & Configuration
Write-Host "`n[2/4] Syncing MCP Protocols & Settings..." -ForegroundColor Yellow
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

# 3. Sync Hooks
Write-Host "`n[3/4] Installing Lifecycle Hooks..." -ForegroundColor Yellow
$hooksJsonSrc = Join-Path $scriptRoot "config\hooks.json"
$hooksJsonDest = Join-Path $ConfigDir "hooks.json"
if (Test-Path $hooksJsonSrc) {
    Copy-Item -Path $hooksJsonSrc -Destination $hooksJsonDest -Force
    Write-Host "  -> hooks.json restored" -ForegroundColor Green
}
$hooksDirSrc = Join-Path $scriptRoot "config\hooks"
if (Test-Path $hooksDirSrc) {
    Copy-Item -Path "$hooksDirSrc\*" -Destination $hooksDest -Recurse -Force
    Write-Host "  -> hook scripts linked" -ForegroundColor Green
}

# 4. Sync Agent Skill-Lock Registry
Write-Host "`n[4/4] Restoring Agent Registry..." -ForegroundColor Yellow
$lockSrc = Join-Path $scriptRoot "agents\.skill-lock.json"
$lockDest = Join-Path $AgentsDir ".skill-lock.json"
if (Test-Path $lockSrc) {
    Copy-Item -Path $lockSrc -Destination $lockDest -Force
    Write-Host "  -> .skill-lock.json restored to $lockDest" -ForegroundColor Green
}

Write-Host "`nRig ready. Your agent runtime is loaded and synchronized.`n" -ForegroundColor Cyan
