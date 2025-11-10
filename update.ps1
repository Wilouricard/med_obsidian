# --- Update Quartz from Obsidian (UTF-8 + accents friendly) ---

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$obsidianPath = "C:\Users\Wilson\Documents\Projet Médical\Médecine"
$quartzPath   = "C:\Users\Wilson\Documents\quartz"
$contentPath  = Join-Path $quartzPath "content"

Write-Host "=== Mise à jour Quartz depuis Obsidian ==="

if (!(Test-Path $obsidianPath)) {
    Write-Host "❌ Le dossier Obsidian n'existe pas : $obsidianPath"
    exit 1
}
if (!(Test-Path $contentPath)) {
    Write-Host "❌ Le dossier 'content' de Quartz n'existe pas : $contentPath"
    exit 1
}

Write-Host "Copie des fichiers..."
Copy-Item -Path (Join-Path $obsidianPath "*") -Destination $contentPath -Recurse -Force
Write-Host "✅ Fichiers copiés avec succès."

Set-Location $quartzPath
git add .
$commitMessage = "auto update notes - $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
git commit -m $commitMessage
git push origin v4

Write-Host "=== 🟢 Mise à jour terminée. Notes en ligne à jour. ==="
