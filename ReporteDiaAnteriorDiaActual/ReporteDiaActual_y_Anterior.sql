--USANDO LA BASE DE DATOS NORTHWND
USE NORTHWND
GO

--ACTUALIZANDO LA FECHA DE ORDEN ACTUAL
UPDATE Orders
SET OrderDate=GETDATE()
WHERE YEAR(OrderDate)=1997
GO

--ACTUALIZANDO LA FECHA DE ORDEN DIA ANTERIOR
UPDATE Orders
SET OrderDate=DATEADD(DAY,-1,GETDATE())
WHERE YEAR(OrderDate)=1996
GO


--REPORTE DÍA ACTUAL
CREATE PROCEDURE SP_ReporteDiaActual
AS
select c.Country,c.CompanyName,c.CustomerID,o.OrderID,o.OrderDate,
DATEPART(YYYY,o.orderdate) as año,DATEPART(mm,o.orderdate) as mes,
p.ProductName,d.UnitPrice,d.Quantity,d.UnitPrice*d.Quantity as parcial
from Customers as c inner join Orders o on c.CustomerID=o.CustomerID
					inner join [Order Details] as d on d.OrderID=o.OrderID
					inner join Products as p on p.ProductID=d.ProductID
Where CAST(o.OrderDate AS DATE)=CAST(GETDATE() AS DATE)
GO

exec SP_ReporteDiaActual
GO



--REPORTE DÍA ANTERIOR
CREATE PROCEDURE SP_ReporteDiaAnterior
AS
select c.Country,c.CompanyName,c.CustomerID,o.OrderID,o.OrderDate,
DATEPART(YYYY,o.orderdate) as año,DATEPART(mm,o.orderdate) as mes,
p.ProductName,d.UnitPrice,d.Quantity,d.UnitPrice*d.Quantity as parcial
from Customers as c inner join Orders o on c.CustomerID=o.CustomerID
					inner join [Order Details] as d on d.OrderID=o.OrderID
					inner join Products as p on p.ProductID=d.ProductID
Where CAST(o.OrderDate AS DATE)=CAST(DATEADD(DAY,-1,GETDATE()) AS DATE)
GO


EXEC SP_ReporteDiaAnterior
GO