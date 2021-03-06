---
external help file: ax2012.tools-help.xml
Module Name: ax2012.tools
online version:
schema: 2.0.0
---

# Invoke-AxImportModelstore

## SYNOPSIS
Import an AX 2012 modelstore file

## SYNTAX

### ImportModelstore (Default)
```
Invoke-AxImportModelstore [-DatabaseServer <String>] [-ModelstoreDatabase <String>] [-SchemaName <String>]
 [-Path <String>] [-IdConflictMode <String>] [-GenerateScript] [<CommonParameters>]
```

### ApplyModelstore
```
Invoke-AxImportModelstore [-DatabaseServer <String>] [-ModelstoreDatabase <String>] [-SchemaName <String>]
 [-Apply] [-GenerateScript] [<CommonParameters>]
```

## DESCRIPTION
Import an AX 2012 modelstore file into the modelstore database

## EXAMPLES

### EXAMPLE 1
```
Invoke-AxImportModelstore -SchemaName TempSchema -Path C:\Temp\ax2012.tools\MicrosoftDynamicsAx.axmodelstore
```

This will execute the cmdlet with some of the default values.
This will work against the SQL server that is on localhost.
The database is expected to be "MicrosoftDynamicsAx_model".
The import will import the modelstore into the "TempSchema".
The path where the modelstore file you want to import must exists is: "c:\temp\ax2012.tools\MicrosoftDynamicsAx.axmodelstore".

## PARAMETERS

### -DatabaseServer
Server name of the database server

Default value is: "localhost"

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: Localhost
Accept pipeline input: False
Accept wildcard characters: False
```

### -ModelstoreDatabase
Name of the modelstore database

Default value is: "MicrosoftDynamicsAx_model"

Note: From AX 2012 R2 and upwards you need to provide the full name for the modelstore database.
E.g.
"AX2012R3_PROD_model"

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: MicrosoftDynamicsAx_model
Accept pipeline input: False
Accept wildcard characters: False
```

### -SchemaName
Name of the schema to import the modelstore into

Default value is: "TempSchema"

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: TempSchema
Accept pipeline input: False
Accept wildcard characters: False
```

### -Path
Path to the location where you want the file to be exported

Default value is: "c:\temp\ax2012.tools"

```yaml
Type: String
Parameter Sets: ImportModelstore
Aliases:

Required: False
Position: Named
Default value: C:\temp\ax2012.tools\MicrosoftDynamicsAx.axmodelstore
Accept pipeline input: False
Accept wildcard characters: False
```

### -IdConflictMode
Parameter to instruct how the import should handle ID conflicts if it hits any during the import

Valid options:
"Reject"
"Push"
"Overwrite"

```yaml
Type: String
Parameter Sets: ImportModelstore
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Apply
Switch to instruct the cmdlet to switch modelstore with the SchemaName in as the current code

```yaml
Type: SwitchParameter
Parameter Sets: ApplyModelstore
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -GenerateScript
Switch to instruct the cmdlet to only generate the needed command and not execute it

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.String
## NOTES
Author: Mötz Jensen (@Splaxi)

## RELATED LINKS
