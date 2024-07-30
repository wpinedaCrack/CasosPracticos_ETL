--UTILIZANDO LA BASE DE DATOS AdventureWorksDW2016
USE AdventureWorksDW2016
GO

--CONSULTANDO LA TABLA DimPromotion
SELECT * FROM DimPromotion
GO


--GENERANDO LA ESTRUCTURA CON AUTENTIFICACION DE WINDOWS
BCP [AdventureWorksDW2016].[dbo].[DimPromotion] FORMAT null -T -c -x -f "C:\SQL Server Integration Services - Casos Practicos\Bulk Copy Porgram(BCP)\Capitulo 5\Promotion.xml"



--GENERANDO LA ESTRUCTURA CON AUTENTIFICACION DE SQL SERVER
BCP [AdventureWorksDW2016].[dbo].[DimPromotion] FORMAT null -c -x -f "C:\SQL Server Integration Services - Casos Practicos\Bulk Copy Porgram(BCP)\Capitulo 5\Promotion.xml" -UUser01 -P1234 -SDESKTOP-L9L5INA


--REALIZANDO LA CONSULTA A LA TABLA DimPromotion
SELECT * FROM DimPromotion
GO

--INSERTANDO DATOS A TRAVES DEL BULK INSERT
BULK INSERT [AdventureWorksDW2016].[dbo].[DimPromotion]
FROM 'C:\SQL Server Integration Services - Casos Practicos\Bulk Copy Porgram(BCP)\Capitulo 5\LoadPromotion.csv'
WITH(
	KEEPIDENTITY,
	FORMATFILE='C:\SQL Server Integration Services - Casos Practicos\Bulk Copy Porgram(BCP)\Capitulo 5\Promotion.xml',
	FIRSTROW=2
)
GO


--LIMPIAR LOS REGISTROS QUE SE INSERTARON
DELETE FROM DimPromotion WHERE PromotionKey IN(17,18,19,20,21)


--CONSULTANDO LA DATA CON LOS REGISTROS INSERTADOS DESDE EL SSIS
SELECT * FROM DimPromotion
GO