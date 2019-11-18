--Oracle XE
create user bodega identified by bodega;
grant resource, connect to bodega;

connect bodega/bodega;

drop table fact_educacion;
drop table dim_sexo;
drop table dim_estrato;
drop table dim_clase;
drop table dim_dominio;
drop table dim_mes;
DROP TABLE dim_nivel_educativo;

create table dim_sexo
    (
    id number not null primary key,
    valor varchar2(10) not null
    );

create table dim_estrato
    (
    id number not null primary key,
    valor varchar2(10) not null
    );

create table dim_clase
    (
    id number not null primary key,
    valor varchar2(10) not null
    );

create table dim_dominio
    (
    id number not null primary key,
    valor varchar2(50) not null
    );

create table dim_mes
    (
    id number not null primary key,
    valor varchar2(50) not null
    );

create table dim_nivel_educativo
    (
    id number not null primary key,
    valor varchar2(50) not null
    );
	
create table fact_educacion(
    id number not null primary key,
    unnivel_x_persona number not null,
    fk_dim_nivel_educativo number not null,
    fk_dim_mes number not null,
    fk_dim_dominio number not null,
    fk_dim_estrato number not null,
    fk_dim_sexo number not null,
    fk_dim_clase number not null,
    constraint fk_dimniveleduca_educacion foreign key (fk_dim_nivel_educativo) references dim_nivel_educativo(id),
    constraint fk_dimmes_educacion foreign key (fk_dim_mes) references dim_mes(id),
    constraint fk_dimdominio_educacion foreign key (fk_dim_dominio) references dim_dominio(id),
    constraint fk_dimestrato_educacion foreign key (fk_dim_estrato) references dim_estrato(id),
    constraint fk_dimsexo_educacion foreign key (fk_dim_sexo) references dim_sexo(id),
    constraint fk_dimclase_educacion foreign key (fk_dim_clase) references dim_clase(id)
);