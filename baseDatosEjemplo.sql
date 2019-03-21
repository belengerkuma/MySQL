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
                                      
--busqueda en tabla eliminando registros parecidos
select distinct autor from clasicos;
                                      
--eliminar un registro de una tabla
delete from clasicos where titulo = "mahabarata" limit 1;
                                      
--uso del comando like para busquedas con cadenas de texto parecidas al valor buscado
select * from clasicos where autor like "%les%";
                                      
--uso del comando limit para retornar un numero determinado de resultados empezando desde una posicion determinada, 0 inicio
select * from clasicos where autor = "Carlos Mendoza" limit 1, 2;
                                      
--adicionar un index a la tabla de tipo FULLTEXT
alter table clasicos add FULLTEXT(autor, titulo);
                                      
--uso de comandos match against para comparar texto con elementos en la tabla, para ello se requiere index FULLTEXT
select * from clasicos where match (autor, titulo) against ("Mario", "corona");
                                      
--uso de comandos match against en boolean mode para determinar palabras requeridas + o no - en una busqueda
select * from clasicos where match (autor, titulo) against ('+mario -corona' in boolean mode);
                                      
--uso de comandos match against en boolean mode para determinar la busqueda de una cadena determinada
select * from clasicos where match (autor, titulo) against ('"Mario Mendoza"' in boolean mode);
                                      
--uso del comando update para actualizar informacion en una tabla
update clasicos set titulo = 'amor en los tiempos del colera' where isbn = '12345';
