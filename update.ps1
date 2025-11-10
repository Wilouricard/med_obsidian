# Simple script to update Quartz from Obsidian

$obsidianPath = "C:\Users\Wilson\Documents\Projet Médical\Médecine"
$quartzPath   = "C:\Users\Wilson\Documents\quartz"
$contentPath  = Join-Path $quartzPath "content"

Write-Host "=== Updating Quartz from Obsidian ==="

# Copy markdown files
Copy-Item -Path (Join-Path $obsidianPath "*") -Destination $contentPath -Recurse -Force
Write-Host "Files copied successfully."

# Git push
Set-Location $quartzPath
git add .
$commitMessage = "auto update notes - $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
git commit -m $commitMessage
git push origin main

Write-Host "=== Update completed successfully ==="
