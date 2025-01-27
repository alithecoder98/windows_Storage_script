$Diskmgmt = Get-Volume | Select DriveLetter, FileSystemLabel, FileSystem, DriveType, HealthStatus, OperationalStatus, SizeRemaining, Size

# Initialize total variables
$TotalSize = 0
$TotalUsed = 0
$TotalFree = 0

# Create a table for individual drives
$DriveTable = @()

foreach ($dsk in $Diskmgmt) {
    $dl = $dsk.DriveLetter
    $fsl = $dsk.FileSystemLabel
    $fs = $dsk.FileSystem
    $dt = $dsk.DriveType
    $hs = $dsk.HealthStatus
    $os = $dsk.OperationalStatus
    $sizer = [math]::round($dsk.SizeRemaining / 1TB, 2)   # Size Remaining in TB
    $siz = [math]::round($dsk.Size / 1TB, 2)              # Total Size in TB
    $PercentFree = [Math]::Round(($sizer / $siz) * 100, 2) # Free Space Percentage
    $PercentUsed = [Math]::Round((($siz - $sizer) / $siz) * 100, 2) # Used Space Percentage

    # Add individual drive information to the table
    $DriveTable += [PSCustomObject]@{
        'Drive Letter' = $dl
        'FileSystemLabel' = $fsl
        'FileSystem' = $fs
        'DriveType' = $dt
        'HealthStatus' = $hs
        'OperationalStatus' = $os
        'Total Size (TB)' = $siz
        'Used Space (TB)' = $siz - $sizer
        'Free Space (TB)' = $sizer
        'Used Space Percentage' = "$PercentUsed%"
        'Free Space Percentage' = "$PercentFree%"
    }

    # Accumulate totals
    $TotalSize += $siz
    $TotalUsed += ($siz - $sizer)
    $TotalFree += $sizer
}

# Display individual drive information in tabular form
$DriveTable | Format-Table -AutoSize

# Display total information
Write-Host "`nTotal Size of All Drives: $TotalSize TB"
Write-Host "Total Used Space: $TotalUsed TB"
Write-Host "Total Free Space: $TotalFree TB"
Write-Host "Total Used Space Percentage: $([Math]::Round(($TotalUsed / $TotalSize) * 100, 2))%"
Write-Host "Total Free Space Percentage: $([Math]::Round(($TotalFree / $TotalSize) * 100, 2))%"
