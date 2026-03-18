# Example data sets
$processes = Get-Process | Select-Object -First 5 Name, Id, CPU
$services  = Get-Service | Select-Object -First 5 Name, Status, StartType

# Create HTML fragments
$processFragment = $processes | ConvertTo-Html -Fragment -PreContent "<h2>Top 5 Processes</h2>"
$serviceFragment = $services  | ConvertTo-Html -Fragment -PreContent "<h2>Top 5 Services</h2>"

# Combine fragments into a full HTML page
$fullHtml = @"
<html>
<head>
    <title>System Report</title>
    <style>
        body { font-family: Arial; margin: 20px; }
        table { border-collapse: collapse; width: 100%; margin-bottom: 20px; }
        th, td { border: 1px solid #ccc; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
        h2 { color: #333; }
    </style>
</head>
<body>
<h1>System Report</h1>
$processFragment
$serviceFragment
</body>
</html>
"@

# Save to file
$outputPath = "SystemReport.html"
$fullHtml | Out-File -FilePath $outputPath -Encoding UTF8

Write-Host "HTML report generated: $outputPath"