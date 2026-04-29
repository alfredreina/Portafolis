drop table assignar;
drop table assignacio;
drop table passatgers;
drop table tripulacio;
drop table vols;
drop table dates;
drop table avions;


create table avions(
ID INT unsigned auto_increment primary key,
Model VARCHAR(20) not null,
Capacitat INT not null,
Matricula VARCHAR (30)  not null,
Estat VARCHAR(10) not null
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

create table dates(
ID INT unsigned auto_increment primary key,
Dia INT not null,
Any INT not null,
Hora TIME not null,
Mes VARCHAR(10) not null
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;


create table vols(
ID INT unsigned auto_increment primary key,
Origen VARCHAR(20) not null,
Desti VARCHAR(20) not null,
idDates INT unsigned,
constraint foreign key(idDates) references dates(ID)
on delete no action on update cascade
)ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;


create table tripulacio (
ID INT unsigned auto_increment primary key,
Nom VARCHAR(20) not null,
Cognom VARCHAR(20) not null,
Carrec VARCHAR(20) not null,
Salari decimal(10,2) not null,
IdSupervisorTripulacio int unsigned,
constraint foreign key (IdSupervisorTripulacio) references tripulacio(Id)
on delete no action on update cascade
)ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

create table passatgers (
ID INT unsigned auto_increment primary key,
Nom VARCHAR(20) not null,
Cognom VARCHAR(20) not null,
Dni VARCHAR(20) not null unique,
DataNaixement DATE not null,
Correu VARCHAR(50) not null,
IdVols INT unsigned not null,
constraint foreign key (IdVols) references vols(Id)
on delete no action on update cascade
)ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

create table assignacio (
IdAvions INT unsigned not null,
IdTripulacio INT unsigned not null,
IdVols INT unsigned not null,
primary key (IdAvions, IdTripulacio, IdVols),
constraint foreign key (IdAvions) references avions(ID)
on delete no action on update cascade,
constraint foreign key (IdTripulacio) references tripulacio(ID)
on delete no action on update cascade,
constraint foreign key (IdVols) references vols(ID)
on delete no action on update cascade
)ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

create table assignar (
IdPassatgers INT unsigned not null,
IdVols INT unsigned not null,
primary key (IdPassatgers, IdVols),
constraint foreign key (IdPassatgers) references passatgers(ID)
on delete no action on update cascade,
constraint foreign key (IdVols) references vols(ID)
on delete no action on update cascade
)ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;















