create database cinema;
GO
use cinema;
GO
create table productos
(
id_Cod int identity primary key,
cod_prod varchar(4) not null,
nombre varchar(50)not null,
existencia int not null,
)
GO

Create table historial
(fecha date,
descripcion varchar(100), 
usuario varchar(20))
GO

create table confiteria
(cod_prod varchar(4),
precio money,
cantidad int
)
GO

insert into productos values('01','chocolatina',1750);
insert into productos values('02','palomitas pequeñas',8000);
insert into productos values('03','palomitas grandes',16000);
insert into productos values('04','gomitas',3000);
insert into productos values('05','mani',1500);
insert into productos values('06','perro caliente',7000);
insert into productos values('07','hamburguesa',9000);
insert into productos values('08','chicles',3000);
insert into productos values('09','caramelo',9000);
insert into productos values('10','menta',900);
go

select * from historial
select * from productos 
go

create trigger TR_ProductoInsertado
on productos for insert
as
set nocount on
declare @cod_prod varchar(4)
select @cod_prod = cod_prod from inserted 
insert into historial values(getdate(), 'producto insertado', 'admin' )
go


alter trigger TR_ProductoDañado
on productos for delete
as
set nocount on
declare @cod_prod varchar(4)
select @cod_prod = cod_prod from deleted  
insert into historial values(getdate(), 'producto eliminado', 'admin')
go

select * from historial 
select * from productos 
go

delete from productos  where cod_prod = '03'
GO

create trigger TR_ProductoActualizado
on productos for update	
as
set nocount on
declare @cod_prod varchar(4)
select @cod_prod = cod_prod from inserted   
insert into historial values(getdate(), 'producto actualizado', 'admin')
go


select * from historial
select * from productos 
go

update productos set existencia =180 where cod_prod = '01'
go

select * from confiteria
select * from productos 
go
