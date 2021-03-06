create database bpjubx2z4oc4ch7gkr0r;
use bpjubx2z4oc4ch7gkr0r;

-- tbl_user, tbl_doc, tbl_corp, 

-- USER TABLE
CREATE TABLE tbl_user(
    	id_user           int auto_increment primary key,
    	user	          varchar(50) not null,
    	name              varchar(255)not null,
    	email             varchar(50) not null unique,
    	password          varchar(50) not null,
    	religion          varchar(50) not null,
    	localization      varchar(60) not null,
    	ip      	  varchar(20) not null,
    	type          	  varchar(15) not null,
    	estatus           integer(1) not null,
    	dtCreate          datetime default now()
);

select * from tbl_user;
ALTER TABLE tbl_user DROP COLUMN ip;

INSERT INTO tbl_user(user, name, religion, email, password, localization, ip, type, estatus) VALUES
	("Marlom" , "Marlom Raul dos Santos Romero"  , "Católico"  , "marlinho.123@gmail.com", md5('123456'), "SP/Cotia"                , '192.168.0.2'    , 1 , 1 ),
    	("Igor"   , "Igor Costa Braz"    	     , "Evangélico", "igor.123@gmail.com"    , md5('123456'), "SP/Embu das artes"       , '45.174.181.149' , 1 , 1 ),
    	("Luis"   , "Luis Fernando Pedro Bom Pereira", "Budista"   , "luis.123@gmail.com"    , md5('123456'), "SP/Embu das artes"       , '192.168.0.245'  , 1 , 1 ),
    	("Gabriel", "Gabriel Vitor Araujo De Lima"   , "Judeu"     , "gabriel.123@gmail.com" , md5('123456'), "SP/Itapecerica da serra" , '192.168.0.21'   , 2 , 1 ),
    	("Kaike"  , "Kaike Santos Rocha"	     , "Espírita"  , "kaike.123@gmail.com"   , md5('123456'), "SP/Embu das artes"       , '192.168.0.22'   , 2 , 1 ),
    	("Jhonata", "Jhonata Pereira Rodrigues"	     , "Católico"  , "jhonata.123@gmail.com" , md5('123456'), "SP/Embu das artes" 	, '192.168.0.32'   , 2 , 1 ),
    	("Pedro"  , "Pedro Lemes Da Cruz"	     , "Evangélico", "pedro.123@gmail.com"   , md5('123456'), "SP/Embu das artes"       , '192.168.0.14'   , 2 , 1 );

select * from tbl_user;
-- NOTE:
-- TYPES: 1 = Pattern, 2 = Corporation
-- ESTATUS: 0 = Deactivated , 1 = Active, 2 = Suspended

-- USER TABLE

-- DOCUMENT TABLE
create table tbl_doc(
	id_doc            int auto_increment primary key,
	cpf               varchar(14) not null,
	cnpj              varchar(18) not null
);

SELECT * FROM tbl_doc;

INSERT INTO tbl_doc(cpf, cnpj) VALUES
	('453.945.408-02', '00.000.000/0000-00'),
	('000.000.000-00', '11.111.111/1111-11');
-- DOCUMENT TABLE

-- CORPORATION TABLE
CREATE TABLE tbl_corp(
	id_corp           int auto_increment primary key,
	FK_id_user        int,
	FK_id_doc         int,
	corpName          varchar(50) not null,
	coordinate        varchar(150) not null,
    
	CONSTRAINT FK_id_user FOREIGN KEY(FK_id_user) REFERENCES tbl_user(id_user),
	CONSTRAINT FK_id_doc FOREIGN KEY(FK_id_doc) REFERENCES tbl_doc(id_doc)
);
INSERT INTO tbl_corp(FK_id_user, FK_id_doc, corpName, coordinate) VALUES
	(1, 1 ,'Igreja Deus e amor' , '000000, 00000, -000000'),
	(2, 2 ,'Jubileu'	    , '100000, 10000, -100000');
-- CORPORATION TABLE

-- RELATION TABLE
CREATE TABLE tbl_relation(
	FK_id_corp        int,
	FK_id_user 	      int,
	relation          int(1),
	descrip           varchar(10),
	
	CONSTRAINT RFK_id_user FOREIGN KEY(FK_id_user) REFERENCES tbl_user(id_user),
	CONSTRAINT RFK_id_corp FOREIGN KEY(FK_id_corp) REFERENCES tbl_corp(id_corp)
);

INSERT INTO tbl_relation(FK_id_corp, FK_id_user, relation, descrip) VALUES
	(1, 1, 0, 'desativado'),
	(1, 4, 1, 'ativo'),
	(2, 2, 2, 'suspenso');
    
SELECT * FROM tbl_relation;
-- NOTE:
-- RELATION: 0 = Deactivated, 1 = Active, 2 = Suspended

-- RELATION TABLE
create table tbl_devices(
	id_device  	int primary key auto_increment,
    FK_id_user 	int,
	ip      	varchar(20) not null,
    status		int(1) default(2),
    dtCreate 	datetime default now(),
    
    CONSTRAINT FK_id_userip FOREIGN KEY(FK_id_user) REFERENCES tbl_user(id_user)
);
select * from tbl_devices;

INSERT INTO tbl_devices(FK_id_user, ip, status) VALUES
	 (1, '45.174.181.245', 1),
	 (2, '156.146.59.35', 1),
	 (3, '45.174.183.162', 1),
	 (4, '192.168.0.21', 1),
	 (5, '192.168.0.22', 1),
	 (6, '192.168.0.32', 1),
	 (7, '192.168.0.14', 1),
	 (8, '45.238.41.14', 1),
	 (9, '45.238.41.14', 1),
	 (18, '190.83.120.128', 1),
	 (19, '201.49.176.191', 1),
	 (20, '179.247.153.43', 1),
	 (21, '189.113.210.90', 1),
	 (22, '189.40.91.144', 1),
	 (23, '45.238.41.149', 1);
     
     
