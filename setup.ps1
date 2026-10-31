<#
.SYNOPSIS
    GRAVITY // RIG - Autonomous Agent Environment Replicator for Windows
.DESCRIPTION
    Bootstraps and synchronizes global skills, MCP servers, hooks, and agent configurations.
#>

[CmdletBinding()]
param(
    [switch]$Force = $false,
    [switch]$UsePortableMcp = $false
)

$ErrorActionPreference = "Stop"

Write-Host @"

  ▄████  ██▀███   ▄▄▄    ██▒   █▓ ██▓ ▄▄▄█████▓▓██   ██▓
 ██▒ ▀█▒▓██ ▒ ██▒▒████▄ ▓██░   █▒▓██▒ ▓  ██▒ ▓▒ ▒██  ██▒
▒██░ ▄▄▄░▓██ ░▄█ ▒▒██  ▀█▄ ▓██  █▒░▒██▒ ▒ ▓██░ ▒░  ▒██ ██░
░▓█  ██▓ ▒██▀▀█▄  ░██▄▄▄▄██  ▒██ █░░░██░ ░ ▓██▓ ░   ░ ▐██▓░
░▒▓███▀▒ ░██▓ ▒██▒ ▓█   ▓██▒  ▒▀█░  ░██░   ▒██▒ ░   ░ ██▒▓░
 ░▒   ▒  ░ ▒▓ ░▒▓░ ▒▒   ▓▒█░  ░ ▐░  ░▓     ▒ ░░      ██▒▒▒ 
  ░   ░    ░▒ ░ ▒░  ▒   ▒▒ ░  ░ ░░   ▒ ░     ░     ▓██ ░▒░ 
░ ░   ░    ░░   ░   ░   ▒       ░░   ▒ ░   ░       ▒ ▒ ░░  
      ░     ░           ░  ░     ░   ░             ░ ░     
                                ░                  ░ ░     
  [ THE AUTONOMOUS AGENT ENGINEERING RIG ]
"@ -ForegroundColor Cyan

Write-Host "`n>>> Initiating RIG bootstrap sequence..." -ForegroundColor Gray

$geminiConfigDir = Join-Path $HOME ".gemini\config"
$geminiSkillsDir = Join-Path $geminiConfigDir "skills"
$geminiHooksDir  = Join-Path $geminiConfigDir "hooks"
$agentsDir       = Join-Path $HOME ".agents"

# Create target directories
$targetDirs = @($geminiConfigDir, $geminiSkillsDir, $geminiHooksDir, $agentsDir)
foreach ($dir in $targetDirs) {
    if (-not (Test-Path $dir)) {
        Write-Host "Creating directory: $dir" -ForegroundColor Gray
        New-Item -ItemType Directory -Path $dir -Force | Out-Null
    }
}

$scriptRoot = $PSScriptRoot

# 1. Sync Skills
Write-Host "`n[1/4] Installing Global Skills..." -ForegroundColor Yellow
$skillsSource = Join-Path $scriptRoot "skills"
if (Test-Path $skillsSource) {
    $skills = Get-ChildItem -Path $skillsSource -Directory
    foreach ($skill in $skills) {
        $dest = Join-Path $geminiSkillsDir $skill.Name
        Write-Host "  -> Installing skill: $($skill.Name)" -ForegroundColor Green
        Copy-Item -Path $skill.FullName -Destination $dest -Recurse -Force
    }
}

# 2. Sync Config & MCP
Write-Host "`n[2/4] Configuring Antigravity Settings & MCP Servers..." -ForegroundColor Yellow
$configSrc = Join-Path $scriptRoot "config\config.json"
$configDest = Join-Path $geminiConfigDir "config.json"
if (Test-Path $configSrc) {
    if ((Test-Path $configDest) -and -not $Force) {
        Write-Host "  -> config.json exists. Backing up to config.json.bak" -ForegroundColor Gray
        Copy-Item -Path $configDest -Destination "$configDest.bak" -Force
    }
    Copy-Item -Path $configSrc -Destination $configDest -Force
    Write-Host "  -> config.json restored" -ForegroundColor Green
}

$mcpSrc = if ($UsePortableMcp -or (-not (Test-Path (Join-Path $scriptRoot "config\mcp_config.json")))) {
    Join-Path $scriptRoot "config\mcp_config.template.json"
} else {
    Join-Path $scriptRoot "config\mcp_config.json"
}
$mcpDest = Join-Path $geminiConfigDir "mcp_config.json"
if (Test-Path $mcpSrc) {
    Copy-Item -Path $mcpSrc -Destination $mcpDest -Force
    Write-Host "  -> mcp_config.json restored" -ForegroundColor Green
}

# 3. Sync Hooks
Write-Host "`n[3/4] Installing Hooks..." -ForegroundColor Yellow
$hooksJsonSrc = Join-Path $scriptRoot "config\hooks.json"
$hooksJsonDest = Join-Path $geminiConfigDir "hooks.json"
if (Test-Path $hooksJsonSrc) {
    Copy-Item -Path $hooksJsonSrc -Destination $hooksJsonDest -Force
    Write-Host "  -> hooks.json restored" -ForegroundColor Green
}
$hooksDirSrc = Join-Path $scriptRoot "config\hooks"
if (Test-Path $hooksDirSrc) {
    Copy-Item -Path "$hooksDirSrc\*" -Destination $geminiHooksDir -Recurse -Force
    Write-Host "  -> hooks scripts restored" -ForegroundColor Green
}

# 4. Sync Agent Skill-Lock
Write-Host "`n[4/4] Restoring Agent Registry (.skill-lock.json)..." -ForegroundColor Yellow
$lockSrc = Join-Path $scriptRoot "agents\.skill-lock.json"
$lockDest = Join-Path $agentsDir ".skill-lock.json"
if (Test-Path $lockSrc) {
    Copy-Item -Path $lockSrc -Destination $lockDest -Force
    Write-Host "  -> .skill-lock.json restored to $lockDest" -ForegroundColor Green
}

Write-Host "`nEnvironment replication complete! Restart Antigravity / Gemini CLI to activate changes.`n" -ForegroundColor Cyan
