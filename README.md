# PowerShell Disk Management Script

This PowerShell script provides a detailed overview of all the volumes on a system, displaying information about individual drives and calculating total disk usage metrics.

## Features

1. Retrieves and displays the following details for each volume:
   - Drive Letter
   - File System Label
   - File System Type
   - Drive Type
   - Health Status
   - Operational Status
   - Total Size (in TB)
   - Used Space (in TB and percentage)
   - Free Space (in TB and percentage)

2. Calculates and displays the following totals across all drives:
   - Total Size
   - Total Used Space
   - Total Free Space
   - Total Used Space Percentage
   - Total Free Space Percentage

3. Outputs the results in a tabular format for easy readability.

## Requirements

- **PowerShell 5.0 or later**
- Administrative privileges may be required to access volume information.

## Usage

1. Copy the script into a `.ps1` file, for example: `DiskManagement.ps1`.
2. Open PowerShell with appropriate permissions.
3. Run the script:
   ```powershell
   .\DiskManagement.ps1
