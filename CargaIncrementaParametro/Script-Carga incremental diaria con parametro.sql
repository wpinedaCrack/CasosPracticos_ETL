use MONROE
go

SELECT distinct Fecha FROM ACCIDENTES2
GO


USE SSISDB
GO

EXEC catalog.stop_operation @operation_id=113
go