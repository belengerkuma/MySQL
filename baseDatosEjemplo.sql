create database sistema;

use sistema;

grant privileges on database.sistema to 'Edward' @ 'localhost' identified by 'alpha';

create table clasicos (autor varchar(50),
                        titulo varchar(50),
                        tipo varchar(50),
                        año char(4), primary key (autor)) ENGINE MyISAM;
                        
describe clasicos;
