--UTILIZANDO LA BASE DE DATOS AdventureWorksDW2016
USE AdventureWorksDW2016
GO

--CONSULTANDO LA TABLA DimEmployee
SELECT * FROM DimEmployee
GO


--EXPORTANDO A TRAVES DEL COMANDO BCP CON LA COLUMNA PHOTO
BCP [AdventureWorksDW2016].[dbo].[DimEmployee] OUT "C:\SQL Server Integration Services - Casos Practicos\Bulk Copy Porgram(BCP)\Capitulo 4\Empleado.txt" -c -UUser01 -P1234 -SDESKTOP-L9L5INA -t,


--CONSULTANDO LA TABLA DimEmployee
SELECT * FROM DimEmployee
GO


--CONSULTANDO LA TABLA DimEmployee CON LAS COLUMNAS QUE NECESITAMOS
SELECT EmployeeKey, FirstName, LastName, MiddleName, Title,
		HireDate, BirthDate, EmailAddress, MaritalStatus
FROM DimEmployee
GO

--EXPORTANDO A TRAVES DEL COMANDO BCP CON LA COLUMNA QUE NECESITAMOS
--PARA ESPORTAR UTILIZAR QUERYOUT
BCP "SELECT EmployeeKey, FirstName, LastName, MiddleName, Title, HireDate, BirthDate, EmailAddress, MaritalStatus FROM [AdventureWorksDW2016].[dbo].[DimEmployee]" QUERYOUT "C:\SQL Server Integration Services - Casos Practicos\Bulk Copy Porgram(BCP)\Capitulo 4\Empleado.txt" -c -UUser01 -P1234 -SDESKTOP-L9L5INA -t,



--GENERANDO CONSULTA PARA EL REPORTE DE PRODUCTOS
SELECT PC.EnglishProductCategoryName, PS.EnglishProductSubcategoryName, P.EnglishProductName,
		P.EnglishDescription, P.Color, P.StartDate, P.Status
FROM DimProduct AS P
		INNER JOIN DimProductSubcategory AS PS
		ON PS.ProductSubcategoryKey=P.ProductSubcategoryKey
		INNER JOIN DimProductCategory AS PC
		ON PS.ProductCategoryKey = PC.ProductCategoryKey
GO


--EXPORTANDO A TRAVES DEL SSIS CON LA COLUMNA QUE NECESITAMOS
--PARA ESPORTAR UTILIZAR QUERYOUT
"SELECT PC.EnglishProductCategoryName, PS.EnglishProductSubcategoryName, P.EnglishProductName, P.EnglishDescription, P.Color, P.StartDate, P.Status FROM DimProduct AS P INNER JOIN DimProductSubcategory AS PS ON PS.ProductSubcategoryKey=P.ProductSubcategoryKey INNER JOIN DimProductCategory AS PC ON PS.ProductCategoryKey = PC.ProductCategoryKey" QUERYOUT "C:\SQL Server Integration Services - Casos Practicos\Bulk Copy Porgram(BCP)\Capitulo 4\ReporteProducto.txt" -c -UUser01 -P1234 -SDESKTOP-L9L5INA -t,