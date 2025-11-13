# --- Update Quartz from Obsidian (full sync / mirror) ---

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$obsidianPath = "C:\Users\Wilson\Documents\Projet Médical\Médecine"
$quartzPath   = "C:\Users\Wilson\Documents\quartz"
$contentPath  = Join-Path $quartzPath "content"

Write-Host "=== Mise à jour Quartz (synchronisation complète) ==="

if (!(Test-Path $obsidianPath)) {
    Write-Host "Le dossier Obsidian n'existe pas : $obsidianPath"
    exit 1
}

# 1. Supprimer les anciens fichiers dans content/
Write-Host "Nettoyage de 'content'..."
Get-ChildItem -Path $contentPath -Recurse | Remove-Item -Force -Recurse
Write-Host "OK."

# 2. Recopier les fichiers depuis Obsidian
Write-Host "Copie des fichiers..."
Copy-Item -Path (Join-Path $obsidianPath "*") -Destination $contentPath -Recurse -Force
Write-Host "Fichiers copiés."

# 3. Git push vers v4
Set-Location $quartzPath
git add .
$commitMessage = "sync notes - $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
git commit -m $commitMessage
git push origin v4

Write-Host "=== Mise à jour terminée ==="
