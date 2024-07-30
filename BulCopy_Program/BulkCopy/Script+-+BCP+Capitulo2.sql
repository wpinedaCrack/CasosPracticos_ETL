--UTILIZANDO LA BASE DE DATOS AdventureWorksDW2016
USE AdventureWorksDW2016
GO


--CONSULTANDO LA TABLA DimGeography
SELECT * FROM DimGeography
GO


--EJECUTANDO LA INSTRUCCION BCP DESDE EL CMD SIN PASSWORD COMO PARAMETRO
BCP [AdventureWorksDW2016].[DBO].[DimGeography] OUT "C:\SQL Server Integration Services - Casos Practicos\Bulk Copy Porgram(BCP)\Capitulo 2\Geografia.txt" -c -UUser01 -SDESKTOP-L9L5INA


--EJECUTANDO LA INSTRUCCION BCP DESDE EL SQL SERVER CON EL PASSWORD COMO PARAMETRO
EXEC master..xp_cmdshell 'BCP [AdventureWorksDW2016].[DBO].[DimGeography] OUT "C:\SQL Server Integration Services - Casos Practicos\Bulk Copy Porgram(BCP)\Capitulo 2\Geografia.txt" -c -UUser01 -SDESKTOP-L9L5INA -P1234'



--EJECUTANDO LA INSTRUCCION BCP DESDE EL CMD CON PASSWORD COMO PARAMETRO
BCP [AdventureWorksDW2016].[DBO].[DimGeography] OUT "C:\SQL Server Integration Services - Casos Practicos\Bulk Copy Porgram(BCP)\Capitulo 2\Geografia.txt" -c -UUser01 -SDESKTOP-L9L5INA -P1234 -t,



--CONSULTANDO LA TABLA DimCurrency
SELECT * FROM DimCurrency
GO


--CREANDO LA INSTRUCCION BCP PARA EJECUTARLO DESDE EL SSIS
BCP [AdventureWorksDW2016].[DBO].[DimCurrency] OUT "C:\SQL Server Integration Services - Casos Practicos\Bulk Copy Porgram(BCP)\Capitulo 2\Moneda.txt" -c -UUser01 -P1234 -SDESKTOP-L9L5INA -t,