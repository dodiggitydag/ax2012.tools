<#
.SYNOPSIS
Export a modelstore file

.DESCRIPTION
Export a modelstore file from the database

.PARAMETER DatabaseServer
Server name of the database server

Default value is: "localhost"

.PARAMETER ModelstoreDatabase
Name of the modelstore database

Default value is: "MicrosoftDynamicsAx_model"

Note: From AX 2012 R2 and upwards you need to provide the full name for the modelstore database. E.g. "AX2012R3_PROD_model"

.PARAMETER InstanceName
Name of the instance that you are working against

If not supplied the cmdlet will take the name of the database and use that

.PARAMETER Suffix
A suffix text value that you want to add to the name of the file while it is exported

The default value is: (Get-Date).ToString("yyyyMMdd")

This will always name you file with the current date

.PARAMETER Path
Path to the location where you want the file to be exported

Default value is: "c:\temp\ax2012.tools"

.PARAMETER GenerateScript
Switch to instruct the cmdlet to only generate the needed command and not execute it

.EXAMPLE
Invoke-AxExportModelstore

This will execute the cmdlet will all the default values.
This will work against the SQL server that is on localhost.
The database is expected to be "MicrosoftDynamicsAx_model".
The path where the exported modelstore file will be saved is: "c:\temp\ax2012.tools".

.NOTES
Author: Mötz Jensen (@Splaxi)

#>
Function Invoke-AxExportModelstore {    
    Param(
        [string] $DatabaseServer = "localhost",

        [string] $ModelstoreDatabase = "MicrosoftDynamicsAx_model",

        [string] $InstanceName, 

        [string] $Suffix = $((Get-Date).ToString("yyyyMMdd")),
        
        [string] $Path = "c:\temp\ax2012.tools",

        [switch] $GenerateScript
    )

    Invoke-TimeSignal -Start       

    if (-not (Test-PathExists -Path $Path -Type Container -Create)) { return }

    if (-not (Test-PathExists -Path $Script:AxPowerShellModule -Type Leaf)) { return }

    $null = Import-Module $Script:AxPowerShellModule
        
    $DateString = $((Get-Date).ToString("yyyyMMdd"))
        
    if ([System.String]::IsNullOrEmpty($InstanceName)) {
        $InstanceName = "{0}" -f $ModelstoreDatabase.Replace("_model", "")
    }

    $ExportPath = Join-Path $Path "$($InstanceName)_$($Suffix)"

    $params = @{
        DatabaseServer = $DatabaseServer
        ModelstoreDatabase = $ModelstoreDatabase
        File = $ExportPath
    }

    if($GenerateScript) 
    {
        $arguments = Convert-HashToArgString -Inputs $params

        "Export-AxModelStore $($arguments -join ' ')"
    }
    else {
        Write-PSFMessage -Level Verbose -Message "Starting the export of the model store"
        
        Export-AxModelStore @params
    }

    Invoke-TimeSignal -End
}