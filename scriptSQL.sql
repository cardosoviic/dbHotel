/* Banco de dados para gerenciamento de um hotel*/

create database dbHotel;

show databases;

use dbHotel;

create table funcionarios (
	idFunc int primary key auto_increment,
    nomeFunc varchar(100) not null,
    login varchar (20) not null unique,
    email varchar(50) not null,
    senha varchar (255) not null,
    cargo varchar (20) 
);

describe funcionarios;

insert into funcionarios(nomeFunc, login, email, senha, cargo) values ("Administrador", "admin", "admin@gmail.com", md5("admin"), "Administrador");

insert into funcionarios(nomeFunc, login, email, senha, cargo) values ("Pamella Pereto", "pamellapereto", "pamellapereto@gmail.com", md5("123@senac"), "TI");

insert into funcionarios(nomeFunc, login, email, senha, cargo) values ("Breno Silva", "brenosilva", "brenosilva@gmail.com", md5("123@senac"), "Contabilidade");

insert into funcionarios(nomeFunc, login, email, senha, cargo) values ("Victória Cardoso", "victoriacardoso", "victoriacardoso@gmail.com", md5("123@senac"), "Gerência");

insert into funcionarios(nomeFunc, login, email, senha) values ("Laura Lopes", "lauralopes", "lauralopes@gmail.com", md5("123@senac"));

insert into funcionarios(nomeFunc, login, email, senha, cargo) values ("Kethelyn Alencar", "kethelynalencar", "kethelynalencar@gmail.com", md5("123@senac"), "Gerência");

select * from funcionarios;

select login as Login, senha from funcionarios where login = "admin" and senha = md5("admin");

select idFunc as ID_Funcionario, nomeFunc as Nome_Funcionario from funcionarios order by nomeFunc asc;

select idFunc as ID_Funcionario, nomeFunc as Nome_Funcionario from funcionarios order by nomeFunc desc;

select idFunc as ID_Funcionario, nomeFunc as Nome_Funcionario, cargo as Cargo_Funcionarios from funcionarios order by idFunc desc;

select idFunc as ID_Funcionario, nomeFunc as Nome_Funcionario, cargo as Cargo_Funcionarios from funcionarios where cargo <> 'null' order by idFunc desc;

select * from funcionarios where cargo = 'Gerência';

create table quartos (
	idQuartos int primary key auto_increment,
    andar varchar(10) not null,
    numeroQuarto varchar(10) not null,
    tipoQuarto varchar (50) not null,
    ocupacaoMax int not null,
    disponibilidade char(3) not null,
    nome varchar(50) not null,
    descricao text,
    foto varchar(255) not null,
    preco decimal(10,2) not null,
    cafeDaManha char(3) not null,
    precoCafe decimal(10,2),
    tipoCama varchar(20),
    varanda char(3)
);

describe quartos;

insert into quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, disponibilidade, nome, descricao, foto, preco, cafeDaManha, precoCafe, tipoCama, varanda) values ("5º", "505", "Superior Premier", 3, "não", "Familiar", "O quarto de 32m² com piso frio, varanda - vista para o mar. Oferece ar condicionado individual, TV LCD 42, wi-fi grátis, cofre digital, frigobar abastecido e banheiro com secador de cabelo e amenities e mesa de trabalho.", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSN1riPx8oEW-kk7d9PjHeo5YbD9O_jm93QFg&usqp=CAU", 750.90, "sim", 60.00, "Queen Size", "sim");
insert into quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, disponibilidade, nome, descricao, foto, preco, cafeDaManha, precoCafe, tipoCama, varanda) values ("11º", "1008", "Superior Premier", 4, "sim", "Familiar", "O quarto de 40m² com piso frio, varanda - vista para o mar. Oferece ar condicionado individual, TV LCD 50, wi-fi grátis, cofre digital, frigobar abastecido e banheiro com secador de cabelo e amenities e mesa de trabalho.", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSN1riPx8oEW-kk7d9PjHeo5YbD9O_jm93QFg&usqp=CAU", 1200.90, "sim", 60.00, "king Size", "não");
insert into quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, disponibilidade, nome, descricao, foto, preco, cafeDaManha, precoCafe, tipoCama, varanda) values ("2º", "100", "Superior Premier", 3, "não", "Familiar", "O quarto de 40m² com piso frio, varanda - vista para o mar. Oferece ar condicionado individual, TV LCD 40, wi-fi grátis, cofre digital, frigobar abastecido e banheiro com secador de cabelo e amenities e mesa de trabalho.", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSN1riPx8oEW-kk7d9PjHeo5YbD9O_jm93QFg&usqp=CAU", 900.90, "não", 60.00, "king Size", "sim");
insert into quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, disponibilidade, nome, descricao, foto, preco, cafeDaManha, precoCafe, tipoCama, varanda) values ("9º", "765", "Superior Premier Twin", 4, "não", "Familiar", "O quarto de 40m² com piso frio, varanda - vista para o mar. Oferece ar condicionado individual, TV LCD 45, wi-fi grátis, cofre digital, frigobar abastecido e banheiro com secador de cabelo e amenities e mesa de trabalho.", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSN1riPx8oEW-kk7d9PjHeo5YbD9O_jm93QFg&usqp=CAU", 1100.90, "sim", 60.00, "king Size", "não");
insert into quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, disponibilidade, nome, descricao, foto, preco, cafeDaManha, precoCafe, tipoCama, varanda) values ("4º", "240", "Superior Premier Twin", 2, "não", "Familiar", "O quarto de 40m² com piso frio, varanda - vista para o mar. Oferece ar condicionado individual, TV LCD 32, wi-fi grátis, cofre digital, frigobar abastecido e banheiro com secador de cabelo e amenities e mesa de trabalho.", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSN1riPx8oEW-kk7d9PjHeo5YbD9O_jm93QFg&usqp=CAU", 400, "não", 60.00, "king Size", "não");
insert into quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, disponibilidade, nome, descricao, foto, preco, cafeDaManha, precoCafe, tipoCama, varanda) values ("1º", "90", "Superior Premier Twin", 2, "não", "Familiar", "O quarto de 45m² com piso frio, varanda - vista para o mar. Oferece ar condicionado individual, TV LCD 32, wi-fi grátis, cofre digital, frigobar abastecido e banheiro com secador de cabelo e amenities e mesa de trabalho.", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSN1riPx8oEW-kk7d9PjHeo5YbD9O_jm93QFg&usqp=CAU", 500, "sim", 60.00, "king Size", "sim");

select * from quartos;

select * from quartos where disponibilidade = "não";

select * from quartos where cafeDaManha = "sim" and disponibilidade = "não";

select * from quartos where varanda = "sim" and cafeDaManha = "sim" and disponibilidade = "não";

select * from quartos where preco < 700 and disponibilidade = "não";

select * from quartos where disponibilidade = "não" order by preco desc;

create table clientes (
idCliente int primary key auto_increment,
nomeCompleto varchar(100) not null,
cpf char(14) not null unique,
rg char(12) not null unique, 
email varchar(50) unique,
celular varchar(20) not null
);

 describe clientes;
 
 insert into clientes (nomeCompleto, cpf, rg, email, celular) values
 ("José de Assis", "829.942.570-09", "48.353.888-7", "josedeassis@gmail.com", "(96) 99338-2803");
 
  insert into clientes (nomeCompleto, cpf, rg, email, celular) values
 ("Victória Cardoso", "159.317.140-49", "31.410.137-8", "victoriacardoso@gmail.com", "(11) 98608-0091");
 
 select * from clientes;
 
 create table pedidos ( 
idPedido int primary key auto_increment,
dataPedido timestamp default current_timestamp,
statusPedido enum("Pendente", "Finalizado", "Cancelado") not null,
idCliente int not null,
foreign key (idCliente) references clientes(idCliente)
);

describe pedidos;

insert into pedidos (statusPedido, idCliente) values ("Pendente", 1);
insert into pedidos (statusPedido, idCliente) values ("Finalizado", 2);

select * from pedidos;
select * from pedidos inner join clientes on pedidos.idCliente = clientes.idCliente;

create table reservas (
idReserva int primary key auto_increment,
idPedido int not null,
idQuartos int not null,
foreign key (idPedido) references pedidos(idPedido),
foreign key (idQuartos) references quartos(idQuartos),
checkin datetime not null,
checkout datetime not null
);

describe reservas;

insert into reservas (idPedido, idQuartos, checkin, checkout) values (1, 2, "2023-11-02 14:00:00", "2023-11-05 12:00:00");
insert into reservas (idPedido, idQuartos, checkin, checkout) values (1, 4, "2023-11-02 14:00:00", "2023-11-05 12:00:00");
insert into reservas (idPedido, idQuartos, checkin, checkout) values (2, 9, "2023-11-09 17:00:00", "2023-11-13 14:00:00");

select * from reservas;

/* OBJETIVO: selecionar o nome do cliente, seu cpf e email, o id do pedido do cliente, a data do pedido,quais quartos fazem parte desse pedido, os tipos dos quartos e seus nomes, assim como
os andares em que estão, os números de cada quarto, e suas datas de checkin e checkout. */

select clientes.nomeCompleto, clientes.cpf, clientes.email, pedidos.idPedido, pedidos.dataPedido, quartos.tipoQuarto,
 quartos.nome, quartos.andar, quartos.numeroQuarto, quartos.preco, reservas.checkin, reservas.checkout from 
 clientes inner join pedidos on clientes.idCliente = pedidos.idCliente inner join 
 reservas on reservas.idPedido = pedidos.idPedido inner join
 quartos on reservas.idQuartos = quartos.idQuartos;
 
 /* OBJETIVO: somar o total que o cliente deverá pagar ao concluir o pedido dos quartos */
 
 select sum(quartos.preco) as Total from reservas inner join quartos on reservas.idQuartos = quartos.idQuartos where idPedido = 2;
 
 /* Cliente Victória Cardoso - idPedido 2 
 Quarto reservado: Superior Premier Twin (1° Andar, número 90, preço/diária: R$ 500.00)
 Check-in: 27/11/2023 às 10:00h 
 Check-out: 08/12/2023 às 10:00h*/
 /* Atualizar a disponibilidade do quarto somente daqueles cuja data do checkout já passou ou é igual a data do sistema */
 
 update reservas inner join quartos on reservas.idQuartos = quartos.idQuartos
 set quartos.disponibilidade = "sim" 
 where reservas.checkout < current_timestamp();
 
 select * from quartos;
 
 /*Buscar o nome do cliente, andar, número, do quarto e checkout somente daqueles
 cuja data do checkout já passou ou é igual à data do sistema */
 select pedidos.idPedido, clientes.nomeCompleto, quartos.andar, quartos.numeroQuarto, reservas.checkout from
 clientes inner join pedidos on clientes.idCliente = pedidos.idCliente inner join
 reservas on reservas.idPedido = pedidos.idPedido inner join quartos 
 on reservas.idQuartos = quartos.idQuartos where reservas.checkout <= current_timestamp();
 
 /*Buscar o nome do cliente, andar, número do quarto, checkout (com data formatada em 99/99/9999) e
 o cálculo de quantos dias faltam para a reserva do cliente encerrar (dias restantes = data do checkout - data de hoje) */
 
 select pedidos.idPedido, clientes.nomeCompleto, quartos.andar, quartos.numeroQuarto, date_format(reservas.checkout, '%d/%m/%Y') as checkout,
 datediff(reservas.checkout, curdate()) as dias_restantes
 from clientes inner join pedidos on clientes.idCliente = pedidos.idCliente inner join
 reservas on reservas.idPedido = pedidos.idPedido inner join quartos 
 on reservas.idQuartos = quartos.idQuartos where reservas.checkout > current_timestamp();