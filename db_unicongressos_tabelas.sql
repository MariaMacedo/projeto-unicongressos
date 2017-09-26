-- UNICONGRESSOS BD - 
--drop database db_unicongressos -- NÃO RETIRAR O COMENTÁRIO SE NÃO APAGA O BANCO !!


-- DATABASE UNICONGRESSOS

create database db_unicongressos

use db_unicongressos

-- TABELA LOGIN

create table tb_loginusuario(
id_login int identity(1,1) not null, 
email_login varchar(100) not null,
senha_login varchar(8) not null,
constraint pk_login primary key (id_login)
)

-- TABELA CONGRESSO

create table tb_congresso(
id_congresso int identity (1,1) not null,
tema_congresso varchar(200) not null,
endereco_congresso varchar (50),
bairro_congresso varchar (50), 
cidade_congresso varchar (50),
estado_congresso varchar (50),
data_congresso datetime,
hora_congresso datetime,
valor_congresso money,
descricao_congresso varchar(max),
id_palestra int,
constraint pk_congresso primary key (id_congresso),
)

alter table tb_congresso
add constraint fk_congressopalest foreign key (id_palestra)
references tb_palestra (id_palestra)

-- **************************//********************************

-- TABELA PALESTRA
create table tb_palestra (
id_palestra int identity (1,1) not null,
tema_palestra varchar(100) not null,
local_palestra varchar (50),
hora_palestra time,
data_palestra date,
descricao_palestra varchar(max),
nome_palestrante varchar (100),
contatos_palestrante varchar(50),
telefone_palestrante int,
descricao_palestrante varchar (max),
id_congresso int,

constraint pk_palestra primary key (id_palestra),
constraint fk_palestcongresso foreign key (id_congresso)
 references tb_congresso (id_congresso),
)

--***************************************//*************************************

-- TABELA USUÁRIO
create table tb_usuario(
id_usuario int identity (1,1) not null,
cpf_usuario char(11) not null,
cnpj_usuario int,
nome_usuario varchar (100),
endereco_usuario varchar (50),
bairro_usuario varchar (50),
cidade_usuario varchar (50),
estado_usuario varchar (50),
telefone_usuario int,
email_usuario varchar(50),
senha_usuario varchar(8),
id_congresso int,
id_palestra int
constraint pk_usuario primary key (id_usuario),
constraint fk_usuariocongresso foreign key (id_congresso)
references tb_congresso (id_congresso),
constraint fk_usuariopalestra foreign key (id_palestra)
references tb_palestra (id_palestra)
)
