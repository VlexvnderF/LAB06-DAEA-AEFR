--Creacion de table producto--
create table tbl_producto (
  idProducto int IDENTITY(1,1) primary key, 
  nombre varchar(50),
  precio decimal(10,2),
  fecha_creacion datetime,
  estado varchar(50)
);
-------------------------------------------------------------
--Listar--
CREATE PROCEDURE GetAllProducts
AS
BEGIN
    SELECT * FROM tbl_producto WHERE estado != 'Eliminado'
END

--Registrar--
CREATE PROCEDURE InsertProduct
(
    @nombre VARCHAR(50),
    @precio DECIMAL(10, 2),
	@estado VARCHAR(50)	
)
AS
BEGIN
    DECLARE @fecha_creacion DATETIME
    SET @fecha_creacion = CONVERT(DATETIME, GETDATE())

    INSERT INTO tbl_producto (nombre, precio, fecha_creacion, estado)
    VALUES (@nombre, @precio, @fecha_creacion, @estado)
END

--Update--
CREATE PROCEDURE UpdateProduct
    @idProducto INT,
    @nombre VARCHAR(50),
    @precio DECIMAL(10,2),
    @estado VARCHAR(20)
AS
BEGIN
    UPDATE tbl_producto
    SET nombre = @nombre,
        precio = @precio,
        estado = @estado
    WHERE idProducto = @idProducto
END

--Delete--
CREATE PROCEDURE DeleteProduct
    @idProducto INT
AS
BEGIN
    UPDATE tbl_producto
    SET estado = 'Eliminado'
    WHERE idProducto = @idProducto
END

-------------------------------------------------------------

--Ejecuciones de los procesos almacenados--
EXEC InsertProduct 'Chizito', 2.00, 'Vencido'
EXEC GetAllProducts
EXEC UpdateProduct @idProducto = 1 , @nombre = 'Pepsi', @precio = 2.80, @estado = 'Actualizado'
EXEC DeleteProduct @idProducto = 5