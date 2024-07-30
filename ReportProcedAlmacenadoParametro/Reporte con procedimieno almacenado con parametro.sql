USE NORTHWND
GO

CREATE PROCEDURE sp_ReporteEnvioClientes
@FechaIni int,
@FechaFin int
AS
select c.Country,c.CompanyName,c.CustomerID,o.OrderID,o.OrderDate,
DATEPART(YYYY,o.orderdate) as año,DATEPART(mm,o.orderdate) as mes,
p.ProductName,d.UnitPrice,d.Quantity,d.UnitPrice*d.Quantity as parcial
from Customers as c inner join Orders o on c.CustomerID=o.CustomerID
					inner join [Order Details] as d on d.OrderID=o.OrderID
					inner join Products as p on p.ProductID=d.ProductID
where DATEPART(YYYY,o.orderdate)>=@FechaIni and DATEPART(YYYY,o.orderdate)<=@FechaFin
GO

EXECUTE sp_ReporteEnvioClientes 1996, 1997