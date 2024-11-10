# 定義 XML 檔案路徑與輸出 JSON 檔案路徑
$parentDir = Split-Path -Path $PSScriptRoot -Parent
$xmlFilePath = Join-Path -Path $parentDir -ChildPath "data/terms.xml"
$jsonFilePath = Join-Path -Path $parentDir -ChildPath "data/terms.json"

# 讀取並解析 XML 檔案
Write-Host "讀取 XML 檔案：$($xmlFilePath)"
[xml]$xmlDoc = Get-Content -Path $xmlFilePath

# 初始化陣列來存放處理過的資料
$terms = @()

# 迭代 termEntry 節點
foreach ($termEntry in $xmlDoc.martif.text.body.termEntry) {
    $englishTerm = ""
    $chineseTerm = ""
    $definition = ""

    # 抓取定義
    if ($termEntry.langSet.descripGrp.descrip) {
        $definition = $termEntry.langSet.descripGrp.descrip.'#text'
    }

    # 處理每個 langSet 節點
    foreach ($langSet in $termEntry.langSet) {
        $lang = $langSet.'lang'
        $termElement = $langSet.ntig.termGrp.term

        if ($lang -eq "en-US") {
            $englishTerm = $termElement.'#text'
        }
        elseif ($lang -eq "zh-Hant") {
            $chineseTerm = $termElement.'#text'
        }
    }

    # 將結果加入陣列
    $terms += @{
        english    = $englishTerm
        chinese    = $chineseTerm
        definition = $definition
    }
}

# 將資料轉換為 JSON 格式並寫入檔案
$terms | ConvertTo-Json -Depth 2 | Set-Content -Path $jsonFilePath

Write-Host "轉換並輸出至：$($jsonFilePath)"
