create database ped_compra

go

create table fornecedor 
(
	cod_forne		integer			identity (1,1)		primary key not null,
	raz_social		varchar (60)	not null,
	nom_fantasia	varchar (30)	not null,
	cnpj			varchar (15)	not null,
	nom_contato		varchar	(30)	not null
);

create table empresa
(
	cod_emp			integer			identity (1,1)		primary key not null,
	raz_social		varchar (60)	not null,
	nom_fantasia	varchar (30)	not null,
	cnpj			numeric (14)	not null,
	ie_emp			integer (6)		not null,
	end_emp			varchar (60)	not null
);

create table produto
(
	cod_produto				integer			identity (1,1)	primary key not null,
	fornecedor_cod_forne	integer			not null		constraint cod_forne_produto_fk references fornecedor (cod_forne),
	dsc_prod				varchar	(50)	not null,
	uni_cpra_prod			varchar (5)		not null,
	qtd_uni_cpra_prod		numeric (5,2)	not null,
	uni_vda_prod			varchar	(5)		not null,
	qtd_uni_vda_prod		numeric (5,2)	not null
);

create table ped_compra 
(
	cod_ped					integer			identity (1,1)	primary key not null,
	empresa_cod_emp			integer			not null		constraint cod_emp_ped_compra_fk	references empresa		(cod_emp),
	fonecedor_cod_forne		integer			not null		constraint cod_forne_ped_compra_fk	references fornecedor	(cod_forne),
	dat_ped					date			not null,
	val_tot_ped				numeric	(7,2)	not null,
	dat_entr_ped			date			not null,
);


create table itens_pedcompra
(
	ped_compra_cod_ped		integer			not null		constraint cod_ped_intens_pedcompra_fk	references ped_compra	(cod_ped),
	produto_cod_prod		integer			not null		constraint cod_prod_intens_pedcompra_fk	references produto		(cod_produto)
);

/* inserindo dados */


insert into fornecedor
values	('Produtos Alimenticios'	, 'Nestle_S'	, 123456789000199 , 'José Camargo'),
		('Confecção Bela'			, 'Belissima'	, 987654321000100 , 'Carlos Araujo');


		insert into empresa
values	('Mercado 1 Ltda' , 'Hiper Bom Preço' , 111111111000190 , 11111111110 , 'Rua do sol, 20'),
		('Roupas 1 Ltda'  , 'Roupas Bom Preço', 222222222000188 , 33333333330 , 'Rua da chuva, 15');


insert into produto 
values	(1 , 'papinha de bebe'			, 'cx' , 10.00	, 'uni' , 1.00),
		(1 , 'Suco de Maça Infantil'	, 'cx' , 2.00	, 'cx'  , 2.00),
		(2 , 'Macarrão'					, 'pc' , 1.00   , 'pc'	, 1.00),
		(2 , 'Vestido'					, 'pc' , 1.00	, 'pc'  , 1.00),
		(1 , 'Sopa'						, 'uni', 1.00	, 'uni' , 1.00);



insert into ped_compra
values	(10 , 1 , '20-08-2018' , 455.40	 , '22-08-2018'),
		(20 , 2 , '25-08-2018' , 4020.00 , '28-08-2018'),
		(10 , 1 , '25-08-2018' , 9900.00 , '30-08-2018');


insert into itens_pedcompra
values	(5 , 1 , 20.00 , 15.12),
		(5 , 2 , 15.00 , 10.20),
		(10, 3 , 20.00 , 88.50),
		(10, 4 , 30.00 , 75.00);


/* Mostrar estrutura das tabelas */

sp_help fornecedor;
sp_help empresa;
sp_help produto;
sp_help ped_compra;
sp_help itens_pedcompra;

/* Incluindo colunas */

alter table fornecedor add
	telefone_vendedor varchar (10);

alter table fornecedor drop column	
	nom_contato;

/* Atualizando os dados das tabelas */

update 	ped_compra
set dat_ped = 26/08/2018
where dat_ped = 25/08/2018;

update produto
set dsc_prod = 'Calça Comprida'
where dsc_prod = 'Macação';

/* Excluindo a tabela */

drop table empresa;

/* Excluir o Banco de Dados */

drop database ped_compra;









