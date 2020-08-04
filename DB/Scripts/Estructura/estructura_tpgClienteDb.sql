--Tablas Principales

create table TipoUsuario( --1
	
	id int identity primary key,
	tipo_usuario varchar(25) unique

);

create table ServicioAsociado( --2
	
	id int identity primary key,
	nombre varchar(50) unique

);

create table Cliente ( --3
	
	cedula varchar(20) primary key,
	nombre varchar(50),
	apellido varchar(50),
	email varchar(100),
	numero_celular varchar(15),
	nota varchar(200)


);

create table CompaniaTelefonica( --5
	
	id int identity primary key,
	compania_telefonica varchar(30) unique

);

create table BancoPreferenciaCliente( --6
	
	id int identity primary key,
	banco_preferencia varchar(30) unique

);

--Tablas secundarias o con clave foraneas

create table Usuario( /*1*/
	
	id int identity primary key,
	usuario varchar (30) unique,
	contrasena varchar (50),

	--Claves foraneas

	id_tipoUsuario int,

	constraint fk_tpUsuarioUs foreign key (id_tipoUsuario) references TipoUsuario(id)

);

create table ServicioAs_Cliente( /*2,3*/
	
	id_servicioAsociado int,
	id_cliente varchar(20),

	constraint fk_servicioAsCl foreign key (id_servicioAsociado) references ServicioAsociado(id),
	constraint fk_clienteSv foreign key (id_cliente) references Cliente(cedula)
);

create table CuentaAsociada( --4 /*3*/
	
	id int identity primary key,
	cuenta varchar(100) unique,

	--Claves foraneas

	cedula_cliente varchar(20),

	constraint fk_cedulaClienteCu foreign key (cedula_cliente) references Cliente(cedula)


);

create table ServicioAs_CuentaAs( /*2,4*/
	
	id_servicioAsociado int,
	id_cuentaAsociada int,

	constraint fk_servicioAsCu foreign key (id_servicioAsociado) references ServicioAsociado(id),
	constraint fk_cuentaAsCu foreign key (id_cuentaAsociada) references CuentaAsociada(id)
);

create table Cliente_CompaniaTelefonica(  /*3,5*/
	
	id_cliente varchar(20),
	id_companiaTelefonica int,

	constraint fk_clienteCo foreign key (id_cliente) references Cliente(cedula),
	constraint fk_companiaTelefonicaCl foreign key (id_companiaTelefonica) references CompaniaTelefonica(id)
);

create table Cliente_BancoPreferenciaCliente(  /*3,6*/
	
	id_cliente varchar(20),
	id_bancoPreferenciaCliente int,

	constraint fk_clienteBa foreign key (id_cliente) references Cliente(cedula),
	constraint fk_bancoPreferenciaClienteCl foreign key (id_bancoPreferenciaCliente) references BancoPreferenciaCliente(id)
);

/*Isertando Datos principales*/

--TipoUsuario
insert into TipoUsuario (tipo_usuario) values ('administrador');

select * from TipoUsuario;

--ServicioAsociado
insert into ServicioAsociado (nombre) values ('Paypal');

select * from ServicioAsociado;

--CompaniaTelefonica
insert into CompaniaTelefonica (compania_telefonica) values ('Viva');
insert into CompaniaTelefonica (compania_telefonica) values ('Altice');
insert into CompaniaTelefonica (compania_telefonica) values ('Claro');

select * from CompaniaTelefonica;

--BancoPreferenciaCliente

insert into BancoPreferenciaCliente (banco_preferencia) values ('Scotiabank');
insert into BancoPreferenciaCliente (banco_preferencia) values ('BHD Leon');
insert into BancoPreferenciaCliente (banco_preferencia) values ('Popular');
insert into BancoPreferenciaCliente (banco_preferencia) values ('Banreservas');

select * from BancoPreferenciaCliente;

--Usuario

insert into Usuario (usuario,contrasena,id_tipoUsuario) values ('Admin01','123456Admin01',1);

select * from Usuario;
select * from Usuario inner join TipoUsuario on TipoUsuario.id=Usuario.id_tipoUsuario;

/*Borrar Tablas*/

drop table TipoUsuario;
drop table ServicioAsociado;
drop table Cliente;
drop table CompaniaTelefonica;
drop table BancoPreferenciaCliente;
drop table Usuario;
drop table ServicioAs_Cliente;
drop table CuentaAsociada;
drop table ServicioAs_CuentaAs;
drop table Cliente_CompaniaTelefonica;
drop table Cliente_BancoPreferenciaCliente;