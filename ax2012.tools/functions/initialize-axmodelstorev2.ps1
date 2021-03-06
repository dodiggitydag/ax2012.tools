﻿
<#
    .SYNOPSIS
        Initialize an AX 2012 modelstore
        
    .DESCRIPTION
        Initialize an AX 2012 modelstore against a modelstore database
        
    .PARAMETER DatabaseServer
        Server name of the database server
        
        Default value is: "localhost"
        
    .PARAMETER ModelstoreDatabase
        Name of the modelstore database
        
        Default value is: "MicrosoftDynamicsAx_model"
        
        Note: From AX 2012 R2 and upwards you need to provide the full name for the modelstore database. E.g. "AX2012R3_PROD_model"
        
    .PARAMETER SchemaName
        Name of the schema in the modelstore database that you want to work against
        
        Default value is: "TempSchema"
        
    .PARAMETER DropSchema
        Switch to instruct the cmdlet to drop the schema supplied with the -SchemaName parameter
        
    .PARAMETER CreateSchema
        Switch to instruct the cmdlet to create the schema supplied with the -SchemaName parameter
        
    .PARAMETER CreateDb
        Switch to instruct the cmdlet to create a new modelstore inside the supplied -ModelstoreDatabase parameter
        
    .PARAMETER GenerateScript
        Switch to instruct the cmdlet to only generate the needed command and not execute it
        
    .EXAMPLE
        PS C:\> Initialize-AXModelStoreV2 -SchemaName TempSchema -CreateSchema
        
        This will execute the cmdlet with some of the default values.
        This will work against the SQL server that is on localhost.
        The database is expected to be "MicrosoftDynamicsAx_model".
        The cmdlet will create the "TempSchema" schema inside the modelstore database.
        
    .EXAMPLE
        PS C:\> Initialize-AXModelStoreV2 -SchemaName TempSchema -DropSchema
        
        This will execute the cmdlet with some of the default values.
        This will work against the SQL server that is on localhost.
        The database is expected to be "MicrosoftDynamicsAx_model".
        The cmdlet will drop the "TempSchema" schema inside the modelstore database.
        
    .NOTES
        Author: Mötz Jensen (@Splaxi)
        
#>
function Initialize-AXModelStoreV2 {
    [CmdletBinding(DefaultParameterSetName = "CreateSchema")]
    [OutputType('System.String')]
    param (
        [string] $DatabaseServer = $Script:ActiveAosDatabaseserver,

        [string] $ModelstoreDatabase = $Script:ActiveAosModelstoredatabase,

        [Parameter(ParameterSetName = "Drop")]
        [Parameter(ParameterSetName = "CreateSchema")]
        [string] $SchemaName = "TempSchema",

        [Parameter(ParameterSetName = "Drop")]
        [switch] $DropSchema,

        [Parameter(ParameterSetName = "CreateSchema")]
        [switch] $CreateSchema,

        [Parameter(ParameterSetName = "CreateDB")]
        [switch] $CreateDb,
        
        [switch] $GenerateScript
    )

    Invoke-TimeSignal -Start
    
    if (-not (Test-PathExists -Path $Script:AxPowerShellModule -Type Leaf)) { return }

    $null = Import-Module $Script:AxPowerShellModule

    $params = @{
        Server   = $DatabaseServer
        Database = $ModelstoreDatabase
    }

    if ($PSCmdlet.ParameterSetName -eq "CreateSchema") {
        $params.SchemaName = $SchemaName
    }
    elseif ($PSCmdlet.ParameterSetName -eq "Drop") {
        $params.Drop = $SchemaName
    }
    elseif ($PSCmdlet.ParameterSetName -eq "CreateDB") {
        $params.CreateDB = $true
    }

    if ($GenerateScript) {
        $arguments = Convert-HashToArgString -InputObject $params

        "Initialize-AXModelStore $($arguments -join ' ')"
    }
    else {
        Write-PSFMessage -Level Verbose -Message "Starting the initialization of the model store"
        
        Initialize-AXModelStore @params
    }

    Invoke-TimeSignal -End
}