-- drop database dbPadaria;

show databases;

create database dbPadaria;

use dbPadaria;

create table fornecedores (
idFornecedor int primary key auto_increment,
nomeFornecedor varchar(50) not null,
cnpjFornecedor varchar(20) not null,
telefoneFornecedor varchar(20),
emailFornecedor varchar (50) not null unique,
cep varchar (10),
enderecoFornecedor varchar(100),
numeroEndereco varchar(10),
bairro varchar(40),
cidade varchar(40),
estado char(2)
);

insert into fornecedores (nomeFornecedor, cnpjFornecedor, telefoneFornecedor, emailFornecedor, cep, enderecoFornecedor, numeroEndereco, bairro, cidade, estado) values
("Lucas Silva", "71.965.605/0001-65", "(11) 94933-8216", "lucassilva356@outlook.com", "04763-140", "Praça Jorge Veiga", "357", "Socorro", "São Paulo", "SP" );

select * from fornecedores;

create table produtos (
idProduto int primary key auto_increment,
nomeProduto varchar(50) not null, 
descricaoProduto text, 
precoProduto decimal (10,2) not null, 
estoqueProduto int not null,
categoriaProduto enum ("Pães", "Bolos", "Confeitaria", "Salgados"), 
idFornecedor int not null,
foreign key (idFornecedor) references fornecedores (idFornecedor)
);

describe produtos;

insert into produtos (nomeProduto, descricaoProduto, precoProduto, estoqueProduto, categoriaProduto, idFornecedor) values 
("Pão De Queijo", "É um pão macio por dentro com boa crocância por fora, proporcionada também pelo queijo parmesão que é polvilhado em cada um deles.", 4.00, 2, "Pães", 1);

insert into produtos (nomeProduto, descricaoProduto, precoProduto, estoqueProduto, categoriaProduto, idFornecedor) values 
("Coxinha", "Massa cremosa a base de batata, superfície dourada e crocante, com o empanamento aderente à massa, recheio de peito de frango desfiado, com fragmentos de salsinha e cebolinha.", 12.50, 3, "Salgados", 1);

select * from produtos;

select * from produtos where categoriaProduto = "Pães";

select * from produtos where precoProduto < 50.00 order by precoProduto asc;

create table clientes (
idCliente int primary key auto_increment,
nomeCliente varchar(50),
cpfCliente varchar(15) not null unique,
telefoneCliente varchar(20),
emailCliente varchar (50) unique,
cep varchar (10),
enderecoCliente varchar(100),
numeroEndereco varchar(10),
bairro varchar(40),
cidade varchar(40),
estado char(2)
);

describe clientes;

insert into clientes (nomeCliente, cpfCliente, telefoneCliente, emailCliente, cep, enderecoCliente, numeroEndereco, bairro, cidade, estado) values 
("Alice Nascimento", "218.467.330-73", "(11) 97096-4673", "alicxnascimento2@gmail.com", "04101-000", "Rua Vergueiro", "4667", "Vila Mariana", "São Paulo", "SP");

select * from clientes;

create table pedidos (
idPedido int primary key auto_increment,
dataPedido timestamp default current_timestamp,
statusPedido enum("Pendente", "Finalizado", "Cancelado") not null,
idCliente int not null,
foreign key (idCliente) references clientes (idCliente)
);

insert into pedidos (statusPedido, idCliente) values ("Finalizado", 1);

select * from pedidos;
select * from pedidos inner join clientes on pedidos.idCliente = clientes.idCliente;

create table itensPedidos (
iditensPedido int primary key auto_increment, 
idPedido int not null,
idProduto int not null,
foreign key (idPedido) references pedidos(idPedido),
foreign key (idProduto) references produtos(idProduto),
quantidade int not null
);

select idPedido from pedidos;

insert into itensPedidos (idPedido, idProduto, quantidade) values (1, 2, 1);
insert into itensPedidos (idPedido, idProduto, quantidade) values (1, 1, 3);

select * from itensPedidos;

select clientes.nomeCliente, pedidos.idPedido, pedidos.dataPedido, itensPedidos.quantidade, produtos.nomeProduto, produtos.precoProduto
from clientes inner join pedidos on clientes.idCliente = pedidos.idCliente inner join
itensPedidos on pedidos.idPedido = itensPedidos.idPedido inner join 
produtos on produtos.idProduto = itensPedidos.idProduto;