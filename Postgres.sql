CREATE DATABASE VideoJUegos;
USE VideoJUegos;

CREATE TABLE Plataformas(
 id   int not null primary KEY auto_increment , 
 tipoPlataforma VARCHAR(50) not null, 
 nombrePlataforma varchar(50)not null
);

CREATE TABLE Constructores(
 id   int not null primary KEY auto_increment , 
 nombreEmpresa VARCHAR(20) not null
 );

CREATE TABLE Torneos(
 id   int not null primary KEY auto_increment , 
 ubicacion VARCHAR(20) not null, 
 nombrejuego varchar(20)not null,
 premio varchar(20) not null,
 idConstructores int not null,
 FOREIGN KEY ( idConstructores) REFERENCES Constructores( id)
);

CREATE TABLE Comunidades(
 id   int not null primary KEY auto_increment , 
 nombreForos VARCHAR(20) not null, 
 idTorneos int not null,
 FOREIGN KEY ( idTorneos) REFERENCES Torneos( id)
);
 
 CREATE TABLE PlataformasPorConstructores(
 id   int not null  ,
 idConstructores int not null,
 idPlataformas int not null,
 FOREIGN KEY ( idConstructores) REFERENCES Constructores( id),
 FOREIGN KEY ( idPlataformas) REFERENCES Plataformas( id)
);

-- drop database VideoJUegos ;

-- Todos los delimiter se ejecutaran creando un sp por la herramienta de mysql
-- para ver mejoer su funcionamiento creelos mediante esa herramienta 
-- solo copie y pegue los comandos.



-- CRUD


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insertar`(
partipoPlataforma VARCHAR(50), 
parNombrePlataforma varchar(50)
)
BEGIN

insert into Plataformas
(tipoPlataforma, nombrePlataforma)
value (
partipoPlataforma, 
parNombrePlataforma);
END$$

DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Leer`(
)
BEGIN
select * from Plataformas;
select * from torneos;
select * from Constructores;
select * from Comunidades;
END$$

DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar`(
parId int,
parTipoPlataforma VARCHAR(50), 
parNombrePlataforma varchar(50)
)
BEGIN

update Plataformas 
set tipoPlataforma=parTipoPlataforma,
nombrePlataforma=parNombrePlataforma 
where id=parId;

END$$

DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `borrar`(
parId int
)
BEGIN

delete from Plataformas where id=parId;

END$$

DELIMITER ;

DELIMITER $$

-- TRANSACCION

DROP procedure IF exists `VideoJUegos`.`transaccion`$$
CREATE procedure `VideoJUegos`.`transaccion`()
BEGIN
 
 START TRANSACTION;
 
 insert into Constructores(nombreEmpresa) 
 value ('CAPCOM');

COMMIT;

select * from Constructores;

end $$

DELIMITER ;

-- MULTIUSUARIO

update constructores
set nombreEmpresa='VALVE'
where id=1
and nombreEmpresa='HOLA';

-- SELECCIONES Y LLAMADAS

call Leer();
call insertar('xz<x', 'hola');
call Actualizar (5,'consola','hola');
call borrar (6);
CALL transaccion();

select * from PlataformasPorConstructores;

select * from Constructores;

select * from Torneos;

select * from Comunidades;

select * from PlataformasPorConstructores;

select count(*) from Plataformas;

select id,nombrePlataforma  
from Plataformas 
where id >0 
and id < 3;

select * from comunidades 
inner join plataformas 
on comunidades.id= plataformas.id;

select * from Torneos
inner join Constructores 
on Torneos.id= Constructores.id 
where torneos.nombrejuego='Dota2';

select * from Constructores 
inner join PlataformasPorConstructores
on Constructores.id= PlataformasPorConstructores.id 
where Constructores.id >0 
and Constructores.id < 3;

select * from Constructores 
left join PlataformasPorConstructores 
on Constructores.id= PlataformasPorConstructores.id 
where Constructores.id >0 
and Constructores.id < 3;

select * from Constructores
right join PlataformasPorConstructores
on Constructores.id= PlataformasPorConstructores.id 
where Constructores.id >0 
and Constructores.id < 3;

select * from Torneos 
inner join Comunidades 
on Torneos.id= Comunidades.id 
where Comunidades.id >0 
and Comunidades.id < 3
group by nombrejuego order by id;

-- INSERCIONES

INSERT INTO Plataformas (tipoPlataforma,nombrePlataforma) 
VALUES ('PC','PC');
INSERT INTO Plataformas (tipoPlataforma,nombrePlataforma)  
VALUES ('Consola','Xbox');
INSERT INTO Plataformas (tipoPlataforma,nombrePlataforma) 
VALUES ('Consola','Psc4');
INSERT INTO Plataformas (tipoPlataforma,nombrePlataforma) 
VALUES ('Consola','Wii');

INSERT INTO Constructores (nombreEmpresa) 
VALUES ('VALVE');
INSERT INTO Constructores (nombreEmpresa)  
VALUES ('Maicrosoft');
INSERT INTO Constructores (nombreEmpresa) 
VALUES ('Sony');
INSERT INTO Constructores (nombreEmpresa)  
VALUES ('Nintendo');

INSERT INTO Comunidades (nombreForos,idTorneos) 
VALUES ('dOTAPLUS',1);
INSERT INTO Comunidades (nombreForos,idTorneos) 
VALUES ('ComConsola',2);
INSERT INTO Comunidades (nombreForos,idTorneos) 
VALUES ('ComConsola',3);
INSERT INTO Comunidades (nombreForos,idTorneos) 
VALUES ('ComConsola',4);

INSERT INTO Torneos (ubicacion,nombrejuego,premio,idConstructores) 
VALUES ('Canada','Dota2', '1 millon de dolares',1);
INSERT INTO Torneos (ubicacion,nombrejuego,premio,idConstructores) 
VALUES ('Europa','Fifa', '------',2);
INSERT INTO Torneos (ubicacion,nombrejuego,premio,idConstructores) 
VALUES ('Canada','God Of War', '-------',3);
INSERT INTO Torneos (ubicacion,nombrejuego,premio,idConstructores) 
VALUES ( 'Rusia','Boxeo', '1 millon de dolares',4);

INSERT INTO PlataformasPorConstructores (idConstructores,idPlataformas ) 
VALUES (1,1);
INSERT INTO PlataformasPorConstructores1 (idConstructores,idPlataformas ) 
VALUES (2,2);
INSERT INTO PlataformasPorConstructores1 (idConstructores,idPlataformas ) 
VALUES (3,3);
INSERT INTO PlataformasPorConstructores1 (idConstructores,idPlataformas ) 
VALUES (4,4);

