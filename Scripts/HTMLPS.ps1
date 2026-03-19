# Date Report Tool

# Create folder if it doesn't exist
$folder = "C:\Temp"

if (-not (Test-Path $folder)) {
    New-Item -Path $folder -ItemType Directory | Out-Null
}

# Get current date and time
$now = Get-Date

# Create custom object
$data = [PSCustomObject]@{
    Date      = $now.ToShortDateString()
    Time      = $now.ToLongTimeString()
    Day       = $now.DayOfWeek
    Month     = $now.Month
    Year      = $now.Year
}

# Simple HTML style
$style = @"
<style>
body {
    font-family: Arial;
    margin: 20px;
    background-color: #f4f4f4;
}
h1 {
    color: navy;
}
table {
    border-collapse: collapse;
    width: 50%;
    background-color: white;
}
th, td {
    border: 1px solid black;
    padding: 8px;
    text-align: left;
}
th {
    background-color: lightgray;
}
</style>
"@

# File path
$file = "$folder\DateReport.html"

# Create HTML report
$data | ConvertTo-Html -Head $style -Title "Today's Date Report" -PreContent "<h1>Today's Date Report</h1>" |
Out-File $file

# Open the report
Start-Process $file