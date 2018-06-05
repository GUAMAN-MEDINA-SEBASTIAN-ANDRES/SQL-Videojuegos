
CREATE DATABASE VideoJUegos;
USE VideoJUegos;
CREATE TABLE Proceso (
 id INT PRIMARY KEY , 
 tipo VARCHAR(20) not null, 
 tiempoDeDiseño varchar(20)not null,
 tiempoDePlanificacion Varchar(20)not null,
 nombreDelJuego varchar (20)not null
 );
 INSERT INTO Proceso (id,tipo,tiempoDeDiseño,tiempoDePlanificacion,nombreDelJuego) 
 VALUES ( 1, 'terror','40h','70h','Crocuro' );
 INSERT INTO Proceso (id,tipo,tiempoDeDiseño,tiempoDePlanificacion,nombreDelJuego) 
 VALUES ( 2, 'rol','40h','70h','warrior' );
 INSERT INTO Proceso (id,tipo,tiempoDeDiseño,tiempoDePlanificacion,nombreDelJuego) 
 VALUES ( 3, 'tersera persona','40h','70h','3D My eyes' );
 INSERT INTO Proceso (id,tipo,tiempoDeDiseño,tiempoDePlanificacion,nombreDelJuego) 
 VALUES ( 4, 'misterio','40h','70h','Camino hacia la nostalgia' );
 
 select id, tipo from Proceso where id=1; 
 alter table Revicion add N°Mantenimientos int default true;