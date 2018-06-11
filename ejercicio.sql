create database Promedios;
use Promedios;
create table Persona(
id int not null AUTO_INCREMENT primary key,
nombre1 varchar(20) not null,
nombre2 varchar(20) not null,
apellido1 varchar (20) not null,
apellido2 varchar (20) not null,
fechaNac date not null,
nota_POO float not null,
nota_BDD float not null,
genero varchar (10)not null,
cedula varchar(10)
);
 
 INSERT INTO Persona (id,nombre1,nombre2,apellido1,apellido2,fechaNac,nota_POO,genero,cedula,nota_BDD ) VALUES ( 1, 'Juan','Jose','Perez','Alvarado','1998-10-5',5,'masculino','1234567890',8 );
 INSERT INTO Persona (id,nombre1,nombre2,apellido1,apellido2,fechaNac,nota_POO,genero,cedula,nota_BDD ) VALUES ( 2, 'Manuel','Alexander','Perez','Rosario','1998-12-5',10,'masculino','6543217890',5.5 );
 INSERT INTO Persona (id,nombre1,nombre2,apellido1,apellido2,fechaNac,nota_POO,genero,cedula,nota_BDD ) VALUES ( 3, 'Pepe','Landa','Pancho','Samuel','1999-2-10',6.9,'masculino','1234560987',7 );
 INSERT INTO Persona (id,nombre1,nombre2,apellido1,apellido2,fechaNac,nota_POO,genero,cedula,nota_BDD ) VALUES ( 4, 'Juana','Maribel','Cubana','Mercedes','2000-10-5',5.8,'Fememnino','1237897890',2 );
 INSERT INTO Persona (id,nombre1,nombre2,apellido1,apellido2,fechaNac,nota_POO,genero,cedula,nota_BDD ) VALUES ( 5, 'Jacinto','Joel','Elver','Dugo','1997-9-8',9,'masculino','4561237890',6.5 );
 INSERT INTO Persona (id,nombre1,nombre2,apellido1,apellido2,fechaNac,nota_POO,genero,cedula,nota_BDD ) VALUES ( 6,'Elviro', 'Melano','Salasar','Rosa','1998-12-12',7.5,'masculino','7895641237',8.5 );
 INSERT INTO Persona (id,nombre1,nombre2,apellido1,apellido2,fechaNac,nota_POO,genero,cedula,nota_BDD ) VALUES ( 7, 'Maria','Aya','Otonashi','Otonashi','1999-1-5',10,'femenino','4152789990',9 );
 INSERT INTO Persona (id,nombre1,nombre2,apellido1,apellido2,fechaNac,nota_POO,genero,cedula,nota_BDD ) VALUES ( 8, 'Juana','Elizabeth','DeArco','Simpson','1989-10-5',5,'femenino','4444455569',10 );
 INSERT INTO Persona (id,nombre1,nombre2,apellido1,apellido2,fechaNac,nota_POO,genero,cedula,nota_BDD) VALUES ( 9, 'Yoko','Marta','Ono','Sacro','1998-2-10',1,'femenino','7775552221',4.5 );
 INSERT INTO Persona (id,nombre1,nombre2,apellido1,apellido2,fechaNac,nota_POO,genero,cedula,nota_BDD ) VALUES ( 10, 'Mario','Luigi','Mario','Yoshi','2000-9-5',5,'masculino','5556669998',6.5 );
 INSERT INTO Persona (id,nombre1,nombre2,apellido1,apellido2,fechaNac,nota_POO,genero,cedula,nota_BDD ) VALUES ( 11, 'Juan','Esteban','Gonzales','Gonzalo','1998-11-5',9.5,'masculino','4440123658',8 );
 INSERT INTO Persona (id,nombre1,nombre2,apellido1,apellido2,fechaNac,nota_POO,genero,cedula,nota_BDD) VALUES ( 12, 'Arturo','Suarez','Pendragon','Kinto','1998-10-5',8.5,'masculino','4566651207',7 );
 INSERT INTO Persona (id,nombre1,nombre2,apellido1,apellido2,fechaNac,nota_POO,genero,cedula,nota_BDD ) VALUES ( 13, 'Rodrigo','Alexander','Trolencio','Andrade','1998-10-10',8.6,'masculino','1726918939',5 );
 INSERT INTO Persona (id,nombre1,nombre2,apellido1,apellido2,fechaNac,nota_POO,genero,cedula,nota_BDD ) VALUES ( 14, 'Sebatian','Andres','Durandarte','Guaman','1999-04-23',8.5,'masculino','1751390855',7 );
 select cedula, nombre1,nombre2, apellido1,apellido2  from Persona ;
 
 SELECT AVG(nota_POO) AS preciomedio FROM Persona;
  SELECT AVG(nota_BDD) AS preciomedio FROM Persona;

 select max(nota_POO)as Maxima_nota,nombre1,id,min(nota_POO)as Minima_nota,
 (select min(nota_POO)from Persona)as maxima_nota,
 (select min(nota_POO)from Persona)as minimo_nota,avg(nota_POO)as media from Persona ;
   
   
 select * from Persona ;