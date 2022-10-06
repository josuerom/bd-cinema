CREATE TRIGGER RecalcularTotal
ON Concepto
FOR UPDATE
AS
  DECLARE @IdVenta int = (select Id from INSERTED)
  UPDATE Venta SET Total = 
    (select sum(precio) from Concepto WHERE Id = @IdVenta)
  WHERE Id=@IdVenta
