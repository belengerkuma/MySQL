create database sistema;

use sistema;

--conceder privilegios a un usuario
grant privileges on database.sistema to 'Edward' @ 'localhost' identified by 'alpha';

--crear tablas
create table clasicos (autor varchar(50),
                        titulo varchar(50),
                        tipo varchar(50),
                        año char(4)) ENGINE MyISAM;
                        
describe clasicos;

--crear campos en una tabla
alter table clasicos add id INT UNSIGNED NOT NULL AUTO_INCREMENT KEY;

--eliminar campos en una tabla
alter table clasicos drop id;
                              
--insertar registros en una tabla
insert into clasicos (autor, titulo, tipo, año) values ('Mark Twain', 'Las aventuras de Tom Sawyer.', 'Novela', '1876');
                                 
--renombrar tablas
alter table clasicos rename clasicosInternacionales;
                                 
--cambiar el tipo de dato en una tabla
alter table clasicos modify año SMALLINT;
                                 
--renombrar una columna en una tabla
alter table clasicos change tipo categoria varchar(50);
                                 
--eliminar tabla
drop table clasicos;
                                 
--agregar indice a una tabla por numero de caracteres permitidos
alter table clasicos add INDEX(autor(20));
create index autor on clasicos (autor(20));
                                      
--adicionar campo para ser clave primaria de una tabla
alter table clasicos add ISBN char(13);
update clasicos set ISBN = '1234' where year = '1876';
alter table clasicos add primary key(ISBN);
