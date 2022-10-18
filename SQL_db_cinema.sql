CREATE DATABASE cinema;
USE cinema;

CREATE TABLE Venta (
  IdVenta NOT NULL PRIMARY KEY IDENTITY(1,1),
  Producto VARCHAR(50) NOT NULL,
  Total MONEY
);

CREATE TABLE Concepto (
  Id NOT NULL PRIMARY KEY IDENTITY(1,1),
  Cantidad INT,
  Precio Money
);

CREATE TRIGGER RecalcularTotal
ON Concepto
FOR UPDATE
AS
  DECLARE @registro INT = (SELECT Id FROM INSERTED)
  UPDATE Venta SET Total = (SELECT SUM(Precio) FROM Concepto WHERE Id = @registro)
  WHERE Id = @registro
