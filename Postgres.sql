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

DELIMITER $$
USE `videojuegos`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insertars`(
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
;


DELIMITER $$
USE `videojuegos`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `borrars`(
parId int
)
BEGIN

delete from Plataformas where id=parId;

END$$

DELIMITER ;
;

DELIMITER $$
USE `videojuegos`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizars`(
parId int,
parTipoPlataforma VARCHAR(50), 
parNombrePlataforma varchar(50)
)
BEGIN

update Plataformas set 
tipoPlataforma=parTipoPlataforma,
nombrePlataforma=parNombrePlataforma 
where id=parId;

END$$

DELIMITER ;
;

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LeerEventoDias`(
parId INT
)
BEGIN

select * from EventoDias 
where id=parId;

END$$

DELIMITER ;
;

call LeerEventoDias(2);

call insertar('xz<x', 'hola');
call Actualizar (5,'consola','hola');
call borrar (6);

select*from videojuegos.Plataformas;

CALL hola();

DELIMITER $$

DROP procedure IF exists `VideoJUegos`.`hola2`$$
CREATE procedure `VideoJUegos`.`hola2`()
BEGIN
 
 START TRANSACTION;
 
 insert into Constructores(nombreEmpresa) value ('CAPCOM');

COMMIT;

select * from Constructores;

end $$

DELIMITER ;

update constructores
set nombreEmpresa='VALVE'
where id=1
and nombreEmpresa='HOLA';

select * from PlataformasPorConstructores;

INSERT INTO Plataformas (tipoPlataforma,nombrePlataforma) 
VALUES ('PC','PC');
INSERT INTO Plataformas (tipoPlataforma,nombrePlataforma)  
VALUES ('Consola','Xbox');
INSERT INTO Plataformas (tipoPlataforma,nombrePlataforma) 
VALUES ('Consola','Psc4');
INSERT INTO Plataformas (tipoPlataforma,nombrePlataforma) 
VALUES ('Consola','Wii');

select * from Plataformas;
 
INSERT INTO Constructores (nombreEmpresa) 
VALUES ('VALVE');
INSERT INTO Constructores (nombreEmpresa)  
VALUES ('Maicrosoft');
INSERT INTO Constructores (nombreEmpresa) 
VALUES ('Sony');
INSERT INTO Constructores (nombreEmpresa)  
VALUES ('Nintendo');

select * from Constructores;

INSERT INTO Torneos (ubicacion,nombrejuego,premio,idConstructores) 
VALUES ('Canada','Dota2', '1 millon de dolares',1);
INSERT INTO Torneos (ubicacion,nombrejuego,premio,idConstructores) 
VALUES ('Europa','Fifa', '------',2);
INSERT INTO Torneos (ubicacion,nombrejuego,premio,idConstructores) 
VALUES ('Canada','God Of War', '-------',3);
INSERT INTO Torneos (ubicacion,nombrejuego,premio,idConstructores) 
VALUES ( 'Rusia','Boxeo', '1 millon de dolares',4);

select * from Torneos;

INSERT INTO Comunidades (nombreForos,idTorneos) 
VALUES ('dOTAPLUS',1);
INSERT INTO Comunidades (nombreForos,idTorneos) 
VALUES ('ComConsola',2);
INSERT INTO Comunidades (nombreForos,idTorneos) 
VALUES ('ComConsola',3);
INSERT INTO Comunidades (nombreForos,idTorneos) 
VALUES ('ComConsola',4);

select * from Comunidades;

INSERT INTO PlataformasPorConstructores (idConstructores,idPlataformas ) 
VALUES (1,1);
INSERT INTO PlataformasPorConstructores1 (idConstructores,idPlataformas ) 
VALUES (2,2);
INSERT INTO PlataformasPorConstructores1 (idConstructores,idPlataformas ) 
VALUES (3,3);
INSERT INTO PlataformasPorConstructores1 (idConstructores,idPlataformas ) 
VALUES (4,4);

select * from PlataformasPorConstructores1;

select count(*) from Plataformas1;

select id,nombrePlataforma  from Plataformas1 where id >0 and id < 3;

select * from comunidades1 inner join plataformas1 on comunidades1.id= plataformas1.id;

select * from Torneos1 
inner join Constructores1 
on Torneos1.id= Constructores1.id 
where torneos1.nombrejuego='Dota2';

select * from Constructores1 
inner join PlataformasPorConstructores1 
on Constructores1.id= PlataformasPorConstructores1.id 
where Constructores1.id >0 and Constructores1.id < 3;

select * from Constructores1 
left join PlataformasPorConstructores1 
on Constructores1.id= PlataformasPorConstructores1.id 
where Constructores1.id >0 and Constructores1.id < 3;

select * from Constructores1 
right join PlataformasPorConstructores1 
on Constructores1.id= PlataformasPorConstructores1.id 
where Constructores1.id >0 and Constructores1.id < 3;

select * from Torneos1 
inner join Comunidades1 
on Torneos1.id= Comunidades1.id 
where Comunidades1.id >0 and Comunidades1.id < 3
group by nombrejuego order by id
;


