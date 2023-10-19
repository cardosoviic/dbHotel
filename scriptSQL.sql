/* Mostrar os bancos de dados existentes no servidor */

show databases;

/*Criar novo banco */
create database dbHotel;

use dbHotel;

/* Excluir a tabela do banco */
drop table funcionarios;

/*Criar uma nova tabela */
create table funcionarios (
    /* int se refere ao tipo do campo na tabela
    primary key determina que o campo seja uma chave primária responsável por identificar cada funcionário
    auto_increment determina que MySQL dê um id novo a cada cadastro */
	idFunc int primary key auto_increment,
    
    /* varchar é a quantidade variável de caracteres no nome (nesse caso, até 100 caracteres)
    not null determina que o campo seja obrigatório */
    
    /* unique determina que o campo seja único e o valor não possa repetir */
    login varchar (20) not null unique,
    senha varchar (255) not null,
    cargo varchar (20) 
);

/* descreve os campos da tabela funcionarios */
describe funcionarios; 



/* Mostrar as tabelas */
show tables;

/* CREATE */
/* inserir um novo funcionário na tabela, com nome, login, senha criptografada e cargo */
insert into funcionarios(nomeFunc, login, senha, cargo) values ("Administrador", "admin", md5("admin"), "Administrador");

insert into funcionarios(nomeFunc, login, senha, cargo) values ("Pamella Pereto", "pamellapereto", md5("123@senac"), "TI");

insert into funcionarios(nomeFunc, login, senha, cargo) values ("Breno Silva", "brenosilva", md5("123@senac"), "Contabilidade");

insert into funcionarios(nomeFunc, login, senha, cargo) values ("Victória Cardoso", "victoriacardoso", md5("123@senac"), "RH");

insert into funcionarios(nomeFunc, login, senha) values ("Laura Lopes", "lauralopes", md5("123@senac"));

insert into funcionarios(nomeFunc, login, senha) values ("Fellipe Coelho", "fellipe", md5("123@senac"));





/* READ */
/* Ler as informações da tabela funcionários */
select * from funcionarios;

/* UPDATE */
/* Atualizar o campo login na tabela funcionarios especificando o id */
update funcionarios set login = "fellipecoelho" where idFunc = 28;

update funcionarios set cargo = "Gerência" where idFunc = 4;