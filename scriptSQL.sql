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

/* Reposicionar o  campo email para que ele fique após o campo login*/
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

insert into funcionarios(nomeFunc, login, senha, cargo, email) values ("Kethelyn Alencar", "kethelynalencar", md5("123@senac"), "Gerência", "kethelynalencar@gmail.com");

/* READ */
/* Ler as informações da tabela funcionários */
select * from funcionarios;

select * from funcionarios where cargo = 'Gerência';



/* Buscar o login e a senha da tabela funcionarios em que login seja admin e senha seja admin */
select login as Login, senha from funcionarios where login = "admin" and senha = md5("admin");

/* Buscar o ID e o nome do funcionário da tabela funcionarios ordenando o nome alfabeticamente (ascendente, de A a Z) */
select idFunc as ID_Funcionario, nomeFunc as Nome_Funcionario from funcionarios order by nomeFunc asc;

/* Buscar o ID e o nome do funcionário da tabela funcionarios ordenando o nome alfabeticamente (descendente, de A a Z) */
select idFunc as ID_Funcionario, nomeFunc as Nome_Funcionario from funcionarios order by nomeFunc desc;

/* ATIVIDADE: Busque os campos ID com o apelido ID_Funcionario, nome com o apelido Nome_Funcionario e cargo com o apelido Crago_Funcionario
da tabela funcionarios e ordene de forma descendente (do maior ID para o menor) */
select idFunc as ID_Funcionario, nomeFunc as Nome_Funcionario, cargo as Cargo_Funcionarios from funcionarios order by idFunc desc;

/* Buscar os campos ID com apelido ID_Funcionario, nomeFunc com o apelido Nome_Funcionario e cargo com apelido Cargo_Funcionario 
da tabela funcionarios onde cargo seja diferente de nulo e ordenando de forma ascendente o ID (do maior para o menor) 
<> ESTE SINAL SIGNIFICA DIFERENTE, SIGNIFICA ESSE CARINHA AQUI --> # */

select idFunc as ID_Funcionario, nomeFunc as Nome_Funcionario, cargo as Cargo_Funcionarios from funcionarios where cargo <> 'null' order by idFunc desc;


/* UPDATE */

/* Atualizar o campo login na tabela funcionarios especificando o id */
update funcionarios set login = "fellipecoelho" where idFunc = 28;

update funcionarios set cargo = "Gerência" where idFunc = 5;

update funcionarios set cargo = "Contabilidade" where idFunc = 4;

/* DELETE*/ 
delete from funcionarios where idFunc = 1;

create table quartos (
	idQuartos int primary key auto_increment,
    andar varchar(10) not null,
    tipoQuarto varchar (50) not null,
    ocupacaoMax int not null,
    situacao char(3) not null,
    nome varchar(50) not null,
    descricao text,
    preco decimal(10,2) not null,
    tipoCama varchar(20),
    varanda char(3)
);

describe quartos;

alter table quartos add column numeroQuarto varchar(10) not null after andar;

alter table quartos add column cafeDaManha char(3) not null after preco;
alter table quartos add column foto varchar(255) not null after descricao;

insert into quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, situacao, nome, descricao, preco, tipoCama, varanda) values ("5º", "505", "Superior Premier", 3, "não", "Familiar", "O quarto de 32m² com piso frio, varanda - vista para o mar. Oferece ar condicionado individual, TV LCD 42, wi-fi grátis, cofre digital, frigobar abastecido e banheiro com secador de cabelo e amenities e mesa de trabalho.", 750.90, "Queen Size", "sim");
insert into quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, situacao, nome, descricao, foto, preco, cafeDaManha, tipoCama, varanda) values ("11º", "1008", "Superior Premier", 4, "sim", "Familiar", "O quarto de 40m² com piso frio, varanda - vista para o mar. Oferece ar condicionado individual, TV LCD 50, wi-fi grátis, cofre digital, frigobar abastecido e banheiro com secador de cabelo e amenities e mesa de trabalho.", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSN1riPx8oEW-kk7d9PjHeo5YbD9O_jm93QFg&usqp=CAU", 1200.90, "sim", "king Size", "não");
insert into quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, situacao, nome, descricao, foto, preco, cafeDaManha, tipoCama, varanda) values ("2º", "100", "Superior Premier", 3, "não", "Familiar", "O quarto de 40m² com piso frio, varanda - vista para o mar. Oferece ar condicionado individual, TV LCD 40, wi-fi grátis, cofre digital, frigobar abastecido e banheiro com secador de cabelo e amenities e mesa de trabalho.", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSN1riPx8oEW-kk7d9PjHeo5YbD9O_jm93QFg&usqp=CAU", 900.90, "não", "king Size", "sim");
insert into quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, situacao, nome, descricao, foto, preco, cafeDaManha, tipoCama, varanda) values ("9º", "765", "Superior Premier Twin", 4, "não", "Familiar", "O quarto de 40m² com piso frio, varanda - vista para o mar. Oferece ar condicionado individual, TV LCD 45, wi-fi grátis, cofre digital, frigobar abastecido e banheiro com secador de cabelo e amenities e mesa de trabalho.", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSN1riPx8oEW-kk7d9PjHeo5YbD9O_jm93QFg&usqp=CAU", 1100.90, "sim", "king Size", "não");
insert into quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, situacao, nome, descricao, foto, preco, cafeDaManha, tipoCama, varanda) values ("4º", "240", "Superior Premier Twin", 2, "não", "Familiar", "O quarto de 40m² com piso frio, varanda - vista para o mar. Oferece ar condicionado individual, TV LCD 32, wi-fi grátis, cofre digital, frigobar abastecido e banheiro com secador de cabelo e amenities e mesa de trabalho.", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSN1riPx8oEW-kk7d9PjHeo5YbD9O_jm93QFg&usqp=CAU", 400, "não", "king Size", "não");
insert into quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, situacao, nome, descricao, foto, preco, cafeDaManha, tipoCama, varanda) values ("1º", "90", "Superior Premier Twin", 2, "não", "Familiar", "O quarto de 45m² com piso frio, varanda - vista para o mar. Oferece ar condicionado individual, TV LCD 32, wi-fi grátis, cofre digital, frigobar abastecido e banheiro com secador de cabelo e amenities e mesa de trabalho.", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSN1riPx8oEW-kk7d9PjHeo5YbD9O_jm93QFg&usqp=CAU", 500, "sim", "king Size", "sim");

update quartos set cafeDaManha = "sim" where idQuartos = 1;
update quartos set foto = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTi4N9Y4c5EqCTKp2hCaO-LSe5qn_HXJoP9eA&usqp=CAU" where idQuartos = 1;

select * from quartos;

select * from quartos where situacao = "não";

select * from quartos where cafeDaManha = "sim" and situacao = "não";

select * from quartos where varanda = "sim" and cafeDaManha = "sim" and situacao = "não";

select * from quartos where preco < 700 and situacao = "não";

select * from quartos where situacao = "não" order by preco desc;

/*dataPedido timestamp default current_timestamp significa que a data do pedido será a mesma  do sistema, ou seja, a data atual
statusPedido significa que a situação do pedido será uma das seguintes opções: Pendente, Finalizado, Cancelado*/ 

create table pedidos ( 
idPedido int primary key auto_increment,
dataPedido timestamp default current_timestamp,
statusPedido enum("Pendente", "Finalizado", "Cancelado") not null,
idCliente int not null,
foreign key (idCliente) references clientes(idCliente)
);

drop table pedidos;

insert into pedidos (statusPedido, idCliente) values ("Pendente", 1);
insert into pedidos (statusPedido, idCliente) values ("Finalizado", 2);

select * from pedidos;

create table reservas (
idReserva int primary key auto_increment,
idPedido int not null,
idQuartos int not null,
foreign key (idPedido) references pedidos(idPedido),
foreign key (idQuartos) references quartos(idQuartos)
);  

drop table reservas;

describe pedidos;

create table clientes (
idCliente int primary key auto_increment,
nomeCompleto varchar(100) not null,
cpf char(14) not null unique,
rg char(12) not null unique, 
email varchar(50) unique,
celular varchar(20) not null,
numeroCartao varchar(20) not null,
nomeTitular varchar(100) not null,
validade date not null,
cvv char(3) not null,
checkin datetime not null,
checkout datetime not null
);
 
 describe clientes;
 
 drop table clientes;
 
 select * from quartos where situacao = "não";
 
 insert into clientes (nomeCompleto, cpf, rg, email, celular, numeroCartao, nomeTitular, validade, cvv, checkin, checkout) values
 ("José de Assis", "829.942.570-09", "48.353.888-7", "josedeassis@gmail.com", "(96) 99338-2803", "5526 4863 8286 2543", "José de Assis", "2025-03-24", "452",
 "2023-11-02 14:00:00", "2023-11-05 12:00:00");
 
  insert into clientes (nomeCompleto, cpf, rg, email, celular, numeroCartao, nomeTitular, validade, cvv, checkin, checkout) values
 ("Victória Cardoso", "159.317.140-49", "31.410.137-8", "victoriacardoso@gmail.com", "(11) 98608-0091", "5526 4863 8286 2543", "Victória Cardoso", "2031-07-25", "263",
 "2023-12-15 16:00:00", "2023-12-20 18:00:00");
 
 select * from clientes;
 
 /* Buscar nome completo e o celular do cliente que alugou o quarto de número 505, pois a tabela quartos está vinculada à tabela clientes pelo campo idQuartos */
 select clientes.nomeCompleto,
 clientes.celular
 from quartos inner join clientes
 on quartos.idQuartos = clientes.idQuartos where numeroQuarto = 100;
  
/* Buscar TODAS AS INFORMAÇÕES da tabela quartos que está vinculada à tabela clientes pelo campo idQuartos */
select * from quartos inner join clientes
on quartos.idQuartos = clientes.idQuartos;
  
  
/* Buscar o nome completo e data/horário do checkout do cliente que alugou o quarto de número 505 */
select clientes.nomeCompleto, date_format(clientes.checkout, '%d/%m/%Y - %H:%i') as Checkout from quartos inner join clientes on quartos.idQuartos = clientes.idQuartos where numeroQuarto = 100;

/* ATIVIDADE AVALIATIVA */