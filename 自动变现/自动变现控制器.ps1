# SUKA.net 全自动变现系统 v1.0
param([string]$Action = "monitor")

$ErrorActionPreference = "Continue"
$ScriptDir = "d:\AI\沙盒\onchain-payment\自动变现"
$ProjectDir = "d:\AI\沙盒\onchain-payment"
$IGAUrl = "https://ai-agent-pay-fmmr578s5b-jsx5mea3yz.preview.iga-pages.com?iga_token=9477b2f0fd2dd89adefb8b6e88a43da9&iga_time=1786565311"
$MainDomain = "https://suka.net.cn"
$LogFile = Join-Path $ScriptDir "变现日志.txt"

function Write-Log {
    param([string]$Msg)
    $ts = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $line = "[$ts] $Msg"
    Add-Content -Path $LogFile -Value $line -Encoding UTF8
    Write-Host $line
}

function Start-Monitor {
    Write-Log "生成收益监控面板..."
    $template = Join-Path $ScriptDir "监控模板.html"
    $outPath = Join-Path $ScriptDir "收益监控.html"
    if (Test-Path $template) {
        $html = Get-Content $template -Raw -Encoding UTF8
        $html = $html -replace '\{TIMESTAMP\}', (Get-Date -Format "yyyy-MM-dd HH:mm:ss")
        $html = $html -replace '\{IGAURL\}', $IGAUrl
        $html = $html -replace '\{MAINDOMAIN\}', $MainDomain
        $html | Out-File $outPath -Encoding UTF8
    }
    Write-Log "收益监控面板已生成: $outPath"
}

function Start-Promote {
    Write-Log "生成推广物料..."
    $promoDir = Join-Path $ScriptDir "推广物料"
    New-Item -ItemType Directory -Force -Path $promoDir | Out-Null
    
    $promos = @{
        "CSDN完整文案" = "AI Agent付费服务上线！代码+数据+研究报告一站搞定`n`n服务与价格：代码生成与调试35元/次 | 数据分析报告58元/份 | 研究报告撰写88元/份 | 在线技术咨询28元/次 | AI Agent开发128元/次`n`n支付方式：微信支付(盐潭账户) + 支付宝(素卡经营账户)`n`n立即体验：$MainDomain"
        "V2EX短文" = "做了一个AI Agent付费服务平台，支持微信/支付宝扫码支付。服务包括：代码调试(35)、数据分析(58)、研究报告(88)、在线咨询(28)。欢迎反馈！$MainDomain"
        "掘金短文" = "技术人的副业新思路：AI Agent付费服务。代码35、数据58、研究88。无需注册，扫码即付。$MainDomain"
        "知乎分享" = "利用AI Agent搭建了一个轻量级付费服务平台，提供代码开发、数据分析、研究报告等服务。支持微信支付宝扫码支付。$MainDomain"
        "飞书群版1" = "AI Agent付费服务上线！代码35元起、数据58元、研究88元。扫码即付 $MainDomain"
        "飞书群版2" = "新服务：AI Agent编程助手付费版来了！代码调试、数据分析、研究报告写作全搞定！最低28元/次。$MainDomain"
        "飞书群版3" = "副业新思路：利用AI Agent提供技术服务变现。今日上线5个服务项，最低28元。$MainDomain"
        "微信群短版" = "AI Agent付费服务上线！代码调试35、数据分析58、研究报告88、在线咨询28。微信扫码即付，欢迎试用！$MainDomain"
    }
    
    foreach ($key in $promos.Keys) {
        $promos[$key] | Out-File (Join-Path $promoDir "$key.txt") -Encoding UTF8
        Write-Log "生成: $key.txt"
    }
}

function Start-Report {
    Write-Log "生成每日收益报告..."
    $today = Get-Date -Format "yyyyMMdd"
    $reportDir = Join-Path $ProjectDir "变现记录\$today"
    New-Item -ItemType Directory -Force -Path $reportDir | Out-Null
    
    $template = Join-Path $ScriptDir "日报模板.html"
    $reportPath = Join-Path $reportDir "收益日报.html"
    if (Test-Path $template) {
        $html = Get-Content $template -Raw -Encoding UTF8
        $html = $html -replace '\{DATE\}', (Get-Date -Format "yyyy年MM月dd日")
        $html = $html -replace '\{TIMESTAMP\}', (Get-Date -Format "yyyy-MM-dd HH:mm:ss")
        $html = $html -replace '\{IGAURL\}', $IGAUrl
        $html = $html -replace '\{MAINDOMAIN\}', $MainDomain
        $html | Out-File $reportPath -Encoding UTF8
    }
    Write-Log "每日报告已生成: $reportPath"
}

switch ($Action) {
    "monitor" { Start-Monitor }
    "promote" { Start-Promote }
    "report" { Start-Report }
    "all" { Start-Monitor; Start-Promote; Start-Report }
}
