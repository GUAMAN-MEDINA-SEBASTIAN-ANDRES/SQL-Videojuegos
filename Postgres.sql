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
alter table Torneos add FOREIGN KEY ( idConstructores) REFERENCES Constructores( id);

select Plataformas.tipoPlataforma,Constructores.nombreEmpresa, Torneos.premio,
count(Plataformas.id) As Listado from (Plataformas inner join Constructores on Plataformas.id   )
group by tipoPlataforma,nombrejuego,premio,nombreEmpresa 

CREATE DATABASE VideoJUegos1;
USE VideoJUegos1;

CREATE TABLE Plataformas1(
 id   int not null primary KEY auto_increment , 
 tipoPlataforma VARCHAR(50) not null, 
 nombrePlataforma varchar(50)not null,
 idConstructores int
);

INSERT INTO Plataformas1 (id,tipoPlataforma,nombrePlataforma,idConstructores ) 
VALUES ( 1, 'PC','PC',1);
INSERT INTO Plataformas1 (id,tipoPlataforma,nombrePlataforma,idConstructores ) 
VALUES ( 2, 'Consola','Xbox',1);
INSERT INTO Plataformas1 (id,tipoPlataforma,nombrePlataforma,idConstructores ) 
VALUES ( 3, 'Consola','Psc4',1);
INSERT INTO Plataformas1 (id,tipoPlataforma,nombrePlataforma,idConstructores ) 
VALUES ( 4, 'Consola','Wii',1);
select * from Plataformas1;

CREATE TABLE Constructores1(
 id   int not null primary KEY auto_increment , 
 nombreEmpresa VARCHAR(20) not null,
 idPlataformas int not null
 );
 
INSERT INTO Constructores1 (id,nombreEmpresa,idPlataformas ) 
VALUES ( 1, 'VALVE',1);
INSERT INTO Constructores1 (id,nombreEmpresa,idPlataformas ) 
VALUES ( 2, 'Maicrosoft',2);
INSERT INTO Constructores1 (id,nombreEmpresa,idPlataformas ) 
VALUES ( 3, 'Sony',3);
INSERT INTO Constructores1 (id,nombreEmpresa,idPlataformas ) 
VALUES ( 4, 'Nintendo',4);

select * from Constructores1;

CREATE TABLE Torneos1(
 id   int not null primary KEY auto_increment , 
 ubicacion VARCHAR(20) not null, 
 nombrejuego varchar(20)not null,
 premio varchar(20) not null,
 idConstructores1 int
);

INSERT INTO Torneos1 (id,ubicacion,nombrejuego,premio,idConstructores1) 
VALUES ( 1, 'Canada','Dota2', '1 millon de dolares',1);
INSERT INTO Torneos1 (id,ubicacion,nombrejuego,premio,idConstructores1) 
VALUES ( 2, 'Europa','Fifa', '------',2);
INSERT INTO Torneos1 (id,ubicacion,nombrejuego,premio,idConstructores1) 
VALUES ( 3, 'Canada','God Of War', '-------',3);
INSERT INTO Torneos1 (id,ubicacion,nombrejuego,premio,idConstructores1) 
VALUES ( 4, 'Rusia','Boxeo', '1 millon de dolares',4);

select * from Torneos1;

CREATE TABLE Comunidades1(
 id   int not null primary KEY auto_increment , 
 nombreForos VARCHAR(20) not null, 
 idTorneos1 int not null
);

INSERT INTO Comunidades1 (id,nombreForos,idTorneos1) 
VALUES ( 1, 'dOTAPLUS',1);
INSERT INTO Comunidades1 (id,nombreForos,idTorneos1) 
VALUES ( 2, 'ComConsola',1);
INSERT INTO Comunidades1 (id,nombreForos,idTorneos1) 
VALUES ( 3, 'ComConsola',1);
INSERT INTO Comunidades1 (id,nombreForos,idTorneos1) 
VALUES ( 4, 'ComConsola',1);

select * from Comunidades1;
 
 CREATE TABLE PlataformasPorConstructores1(
 id   int not null  ,
 idConstructores int not null,
 idPlataformas int not null,
 FOREIGN KEY ( idConstructores) REFERENCES Constructores1( id),
 FOREIGN KEY ( idPlataformas) REFERENCES Plataformas1( id)
);

INSERT INTO PlataformasPorConstructores1 (id,idConstructores,idPlataformas ) 
VALUES ( 1, 1, 1);
INSERT INTO PlataformasPorConstructores1 (id,idConstructores,idPlataformas ) 
VALUES ( 2,2,2);
INSERT INTO PlataformasPorConstructores1 (id,idConstructores,idPlataformas ) 
VALUES ( 3,3,3);
INSERT INTO PlataformasPorConstructores1 (id,idConstructores,idPlataformas ) 
VALUES ( 4,4,4);

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


