--USANDO LA BASE DE DATOS AdventureWorksDW2016
USE AdventureWorksDW2016
GO

--CONSULTANDO LA TABLA DimCustomer
SELECT * FROM DimCustomer
GO


--COMANDO PARA EXPORTAR DESDE CMD(COMO ADMINISTRADOR)
BCP [AdventureWorksDW2016].[DBO].DimCustomer out "C:\SQL Server Integration Services - Casos Practicos\Bulk Copy Porgram(BCP)\Capitulo 1\Cliente.txt" -T -c


--COMANDO PARA EJECUTAR DESDE EL SQL SERVER(NOS DA ERROR)
EXEC master..xp_cmdshell 'BCP [AdventureWorksDW2016].[DBO].DimCustomer out "C:\SQL Server Integration Services - Casos Practicos\Bulk Copy Porgram(BCP)\Capitulo 1\Cliente.txt" -T -c'



--BRINDANDO LOS PERMISOS NECESARIOS PARA QUE NO NOS PROVOQUE ERROR--
--USANDO LA BASE DE DATOS MASTER
USE master
GO

--Esto activa las opciones avanzadas y es necesario para configurar xp_cmdshell
sp_configure 'show advanced options','1'
RECONFIGURE

--Esto habilita xp_cmdshell
sp_configure 'xp_cmdshell','1'
RECONFIGURE


--VOLVIENDO A EJECUTAR LA INSTRUCCION BCP DESDE EL SQL SERVER(EJECUTA SIN ERRORES)
EXEC master..xp_cmdshell 'BCP [AdventureWorksDW2016].[DBO].DimCustomer out "C:\SQL Server Integration Services - Casos Practicos\Bulk Copy Porgram(BCP)\Capitulo 1\Cliente.txt" -T -c'