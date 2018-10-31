---
external help file: ax2012.tools-help.xml
Module Name: ax2012.tools
online version:
schema: 2.0.0
---

# Resolve-AxTableFieldIDs

## SYNOPSIS
Fix table and field ID conflicts

## SYNTAX

```
Invoke-AxExportModelstore [[-DatabaseServer] <String>] [[-ModelstoreDatabase] <String>] [-GenerateScript] [<CommonParameters>]
```

## DESCRIPTION
Fixes both table and field IDs in the AX SqlDictionary (data db) to match the AX code (Model db).
Useful for after a database has been restored and the table or field IDs do not match. Run this
command instead of letting the database synchronization process drop and recreate the table.

Before running:
    Stop the AOS
    Always take the appropriate SQL backups before running this script

After running:
    Start the AOS
    Sync the database within AX

Note: Objects that are new in AOT will get created in SQL dictionary when synchronization happens.

## EXAMPLES

### EXAMPLE 1
```
Resolve-AxTableFieldIDs
```

This will execute the cmdlet with all the default values.
This will work against the SQL server that is on localhost.
The database is expected to be "MicrosoftDynamicsAx_model".

## PARAMETERS

### -DatabaseServer
Server name of the database server

Default value is: "localhost"

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
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
Position: 2
Default value: MicrosoftDynamicsAx_model
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
Author: Dag Calafell, III (@dodiggitydag)

## RELATED LINKS
http://calafell.me/the-ultimate-ax-2012-table-and-field-id-fix-for-synchronization-errors/