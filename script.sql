create database torneio;

use torneio;

create table grupo(
idGrupo int primary key auto_increment,
nome varchar(45));

insert into grupo values
(default,'A'),
(default,'B'),
(default,'C'),
(default,'D');

select * from grupo;

create table viking(
idViking int auto_increment,
fkGrupo int,
nome varchar(45),
peso int,
idade int,
foreign key (fkGrupo) references grupo(idGrupo),
primary key (idViking, fkGrupo)
);

insert into viking values -- GRUPO A
(default,1,'Ragnart',93,21),
(default,1,'Harold',95,19),
(default,1,'Soluço',90,20),
(default,1,'Sigurd',98,21);

insert into viking (fkGrupo,nome,peso,idade) values -- GRUPO B
(2,'Ragnar Lothbrok',100,20),
(2,'Bjorn Ironside',105,21),
(2,'Lagertha', 104,20),
(2,'Ubbe', 109,22);

insert into viking (fkGrupo,nome,peso,idade) values -- GRUPO C
(3,'Ivar',112,24),
(3,'Rollo',119,24),
(3,'Floki',116,22),
(3,'Aslaug',114,21);

insert into viking (fkGrupo,nome,peso,idade) values -- GRUPO D
(3,'Harald', 120,25),
(3,'Finehair', 122,25),
(3,'Gunnar',125,26),
(3,'Freydis',121,22);

select * from viking;

create table etapa(
idEtapa int primary key auto_increment,
descricao varchar(45));

insert into etapa values
(default,'Fase de grupo'),
(default,'Oitavas'),
(default,'Quartas'),
(default,'Semi'),
(default,'Final');

select * from etapa;

create table luta(
idLuta int auto_increment,
fkViking int,
fkGrupoViking int,
fkEtapa int,
dtLuta datetime,
vencedor int,
foreign key (fkViking) references viking(idViking),
foreign key (fkGrupoViking) references viking(fkGrupo),
foreign key (fkEtapa) references etapa(idEtapa),
primary key (idLuta,fkViking,fkGrupoViking,fkEtapa));

insert into luta values 
(default,1,1,1,'2024-05-20 00:00:00',1),
(default,1,1,1,'2024-05-20 00:00:00',0);

select * from luta;

select luta.idLuta as 'Identificador da luta',
	viking.nome as 'Nome Viking',
    grupo.nome as 'Nome do Grupo',
    etapa.descricao as 'Fase do Lutador',
    luta.dtLuta as 'Data e Hora da Luta',
    luta.vencedor as 'Venceu a luta?'
    from viking 
    join grupo on viking.fkGrupo = grupo.idGrupo
    join luta on luta.fkViking = viking.idViking
    join etapa on luta.fkEtapa = etapa.idEtapa;