<#
.SYNOPSIS
    ai-den: One-command setup for my Antigravity / Gemini CLI environment.
#>

[CmdletBinding()]
param(
    [switch]$Force = $false,
    [switch]$UsePortableMcp = $false
)

$ErrorActionPreference = "Stop"

Write-Host "`n[ai-den] setting up environment..." -ForegroundColor Cyan

$geminiConfigDir = Join-Path $HOME ".gemini\config"
$geminiSkillsDir = Join-Path $geminiConfigDir "skills"
$geminiHooksDir  = Join-Path $geminiConfigDir "hooks"
$agentsDir       = Join-Path $HOME ".agents"

# Create target directories
$targetDirs = @($geminiConfigDir, $geminiSkillsDir, $geminiHooksDir, $agentsDir)
foreach ($dir in $targetDirs) {
    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir -Force | Out-Null
    }
}

$scriptRoot = $PSScriptRoot

# 1. Sync Skills
Write-Host "-> syncing skills to $geminiSkillsDir" -ForegroundColor Gray
$skillsSource = Join-Path $scriptRoot "skills"
if (Test-Path $skillsSource) {
    $skills = Get-ChildItem -Path $skillsSource -Directory
    foreach ($skill in $skills) {
        $dest = Join-Path $geminiSkillsDir $skill.Name
        Copy-Item -Path $skill.FullName -Destination $dest -Recurse -Force
    }
}

# 2. Sync Config & MCP
Write-Host "-> syncing settings & MCP configs..." -ForegroundColor Gray
$configSrc = Join-Path $scriptRoot "config\config.json"
$configDest = Join-Path $geminiConfigDir "config.json"
if (Test-Path $configSrc) {
    if ((Test-Path $configDest) -and -not $Force) {
        Copy-Item -Path $configDest -Destination "$configDest.bak" -Force
    }
    Copy-Item -Path $configSrc -Destination $configDest -Force
}

$mcpSrc = if ($UsePortableMcp -or (-not (Test-Path (Join-Path $scriptRoot "config\mcp_config.json")))) {
    Join-Path $scriptRoot "config\mcp_config.template.json"
} else {
    Join-Path $scriptRoot "config\mcp_config.json"
}
$mcpDest = Join-Path $geminiConfigDir "mcp_config.json"
if (Test-Path $mcpSrc) {
    Copy-Item -Path $mcpSrc -Destination $mcpDest -Force
}

# 3. Sync Hooks
Write-Host "-> syncing hooks..." -ForegroundColor Gray
$hooksJsonSrc = Join-Path $scriptRoot "config\hooks.json"
$hooksJsonDest = Join-Path $geminiConfigDir "hooks.json"
if (Test-Path $hooksJsonSrc) {
    Copy-Item -Path $hooksJsonSrc -Destination $hooksJsonDest -Force
}
$hooksDirSrc = Join-Path $scriptRoot "config\hooks"
if (Test-Path $hooksDirSrc) {
    Copy-Item -Path "$hooksDirSrc\*" -Destination $geminiHooksDir -Recurse -Force
}

# 4. Sync Agent Skill-Lock
Write-Host "-> syncing agent lockfile..." -ForegroundColor Gray
$lockSrc = Join-Path $scriptRoot "agents\.skill-lock.json"
$lockDest = Join-Path $agentsDir ".skill-lock.json"
if (Test-Path $lockSrc) {
    Copy-Item -Path $lockSrc -Destination $lockDest -Force
}

Write-Host "[ai-den] ready. restart antigravity or terminal to load changes.`n" -ForegroundColor Green
