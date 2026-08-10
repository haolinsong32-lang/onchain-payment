# 获取最新网站链接并打开浏览器
$ErrorActionPreference = "SilentlyContinue"
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$projectDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $projectDir

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  SUKA.net - 获取最新链接" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# 方法1：优先使用CLI获取最新预览链接
Write-Host "正在获取最新部署链接..." -ForegroundColor Yellow
$previewOutput = npx @iga-pages/cli@latest pages preview 2>&1
$previewUrl = ""

foreach ($line in $previewOutput) {
    if ($line -match "https://[^\s]+\.iga-pages\.com[^\s]*") {
        $previewUrl = $Matches[0]
        break
    }
}

# 方法2：如果CLI获取失败，使用备用稳定链接
if (-not $previewUrl) {
    Write-Host "CLI获取失败，使用稳定版链接..." -ForegroundColor Yellow
    $previewUrl = "https://ai-agent-pay-fmmr578s5b-ew0xfhiyn2.preview.iga-pages.com"
}

Write-Host ""
Write-Host "最新链接：" -ForegroundColor Green
Write-Host $previewUrl -ForegroundColor White
Write-Host ""

# 复制到剪贴板
try {
    Set-Clipboard -Value $previewUrl
    Write-Host "链接已复制到剪贴板" -ForegroundColor Green
} catch {
    Write-Host "无法复制到剪贴板" -ForegroundColor Yellow
}

# 打开浏览器
Write-Host "正在打开浏览器..." -ForegroundColor Yellow
Start-Process $previewUrl

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  网站已打开！" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Start-Sleep -Seconds 2
