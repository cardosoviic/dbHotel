/* Mostrar os bancos de dados existentes no servidor */

show databases;

/*Criar novo banco */
create database dbHotel;

/* SELECIONAR O BANCO */
use dbHotel;

/* Excluir a tabela do banco */
drop table funcionarios;

/* Adicionar o campo email à tabela funcionarios */
alter table funcionarios add column email varchar(50);

/* Excluir um campo da tabela */
alter table funcionários drop column email; 

alter table funcionarios add column nomeFunc varchar (100);

/* Reposicionar o  campo email para que ele fique após o acmpo login*/
alter table funcionarios modify column email varchar(50) not null after login;

alter table funcionarios modify column nomeFunc varchar(500) not null after idFunc;

/* Modificar o campo email para que se torne obrigatório, ou seja, não nulo (not null) */
alter table funcionarios modify column email varchar(50) not null;


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
insert into funcionarios(nomeFunc, login, senha, cargo, email) values ("Administrador", "admin", md5("admin"), "Administrador", "admin@gmail.com");

insert into funcionarios(nomeFunc, login, senha, cargo, email) values ("Pamella Pereto", "pamellapereto", md5("123@senac"), "TI", "pamellapereto@gmail.com");

insert into funcionarios(nomeFunc, login, senha, cargo, email) values ("Breno Silva", "brenosilva", md5("123@senac"), "Contabilidade", "brenosilva@gmail.com");

insert into funcionarios(nomeFunc, login, senha, cargo, email) values ("Victória Cardoso", "victoriacardoso", md5("123@senac"), "RH", "victoriacardoso@gmail.com");

insert into funcionarios(nomeFunc, login, senha, email) values ("Laura Lopes", "lauralopes", md5("123@senac"), "lauralopes@gmail.com");

insert into funcionarios(nomeFunc, login, senha, email) values ("Fellipe Coelho", "fellipe", md5("123@senac"), "fellipecoelho@gmail.com");





/* READ */
/* Ler as informações da tabela funcionários */
select * from funcionarios;

/* Buscar o login e a senha da tabela funcionarios em que login seja admin e senha seja admin */
select login as Login, senha from funcionarios where login = "admin" and senha = md5("admin");


/* UPDATE */
/* Atualizar o campo login na tabela funcionarios especificando o id */
update funcionarios set login = "fellipecoelho" where idFunc = 28;

update funcionarios set cargo = "Gerência" where idFunc = 5;

update funcionarios set cargo = "Contabilidade" where idFunc = 4;