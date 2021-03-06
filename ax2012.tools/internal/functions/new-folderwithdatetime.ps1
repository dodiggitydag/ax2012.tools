﻿
<#
    .SYNOPSIS
        Create a new folder with datetime in its name
        
    .DESCRIPTION
        Create a new folder with current date and time as part of its name
        
    .PARAMETER Path
        Path to the parent folder where you want the new folder created
        
    .PARAMETER NoCreate
        Switch to instruct the cmdlet not to create the folder
        
    .EXAMPLE
        PS C:\> New-FolderWithDateTime -Path "c:\temp\ax2012.tools"
        
        This will create a new folder with the current date and time as a child to the "c:\temp\ax2012.tools" folder.
        
    .NOTES
        Author: Mötz Jensen (@Splaxi)
        
#>
Function New-FolderWithDateTime {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseShouldProcessForStateChangingFunctions", "")]
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true, Position = 1)]
        [string] $Path,

        [Parameter(Mandatory = $false, Position = 2)]
        [switch] $NoCreate
    )

    $dateString = (Get-Date).ToString("yyyy-MM-dd_HH.mm.ss")
    
    $backUpPath = Join-Path $Path $dateString
    
    Write-PSFMessage -Level Verbose -Message "Creating the new directory: $backUpPath" -Target $backUpPath
    
    if (-not ($NoCreate)) {
        $null = New-Item -Path $backUpPath -ItemType Directory -Force
    }
    
    $backUpPath
}