CREATE DATABASE VideoJUegos;
USE VideoJUegos;

CREATE TABLE Plataformas(
 id   int not null primary KEY auto_increment , 
 tipoPlataforma VARCHAR(50) not null, 
 nombrePlataforma varchar(50)not null,
 idConstructores1 int
);

INSERT INTO Plataformas (id,tipoPlataforma,nombrePlataforma,idConstructores1 ) 
VALUES ( 1, 'PC','PC',1);
select * from Plataformas ;

CREATE TABLE Constructores(
 id   int not null primary KEY auto_increment , 
 nombreEmpresa VARCHAR(20) not null,
 idPlataformas int not null
 );
 
INSERT INTO Constructores (id,nombreEmpresa,idPlataformas ) 
VALUES ( 1, 'VALVE',1);

CREATE TABLE Torneos(
 id   int not null primary KEY auto_increment , 
 ubicacion VARCHAR(20) not null, 
 nombrejuego varchar(20)not null,
 premio varchar(20) not null,
 idConstructores1 int
);

INSERT INTO Torneos (id,ubicacion,nombrejuego,premio,idConstructores1) 
VALUES ( 1, 'consola','Dota2', '1 millon de dolares',1);

CREATE TABLE Comunidades(
 id   int not null primary KEY auto_increment , 
 nombreForos VARCHAR(20) not null, 
 idTorneos1 int not null
);

INSERT INTO Comunidades (id,nombreForos,idTorneos1) 
VALUES ( 1, 'dOTAPLUS',1);
 
 CREATE TABLE PlataformasPorConstructores(
 id   int not null  ,
 idConstructores int not null,
 idPlataformas int not null,
 FOREIGN KEY ( idConstructores) REFERENCES Constructores( id),
 FOREIGN KEY ( idPlataformas) REFERENCES Plataformas( id)
);

INSERT INTO PlataformasPorConstructores (id,idConstructores,idPlataformas ) 
VALUES ( 1, 1, 1);

CREATE VIEW Visualisacion1 AS SELECT nombreEmpresa,tipoPlataforma FROM Plataformas,Constructores;
