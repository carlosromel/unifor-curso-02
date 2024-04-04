create table pje.tb_pais (
    id_pais                  bigserial     not null
  , cd_iso                   char(3)       not null
  , cd_pais                  char(2)       not null
  , cd_sigla                 char(3)       not null
  , ds_pais                  varchar(100)  not null /* sigla 2 digitos, sigla 3 dígitos, código iso (3 dígitos) */

  , constraint tb_pais_id_pais_pk  primary key (id_pais)
  , constraint tb_pais_cd_iso_un   unique (cd_iso)
  , constraint tb_pais_cd_pais_un  unique (cd_pais)
  , constraint tb_pais_ds_sigla_un unique (cd_sigla)
  , constraint tb_pais_ds_pais_un  unique (ds_pais)
);

create table pje.tb_estado (
    id_estado                       serial       not null
  , id_pais                         bigint       not null
  , cd_uf                           char(2)      not null
  , ds_estado                       varchar(50)  not null
  , in_ativo                        boolean      not null default (true)

  , constraint tb_estado_id_estado_pk primary key (id_estado)
  , constraint tb_estado_id_pais_fk   foreign key (id_pais) references pje.tb_pais (id_pais)
  , constraint tb_estado_cd_uf_un     unique      (cd_uf)
  , constraint tb_estado_ds_estado_un unique      (ds_estado)
);

create table pje.tb_municipio (
    id_municipio                    bigserial    not null
  , id_estado                       bigint       not null
  , ds_municipio                    varchar(256) not null
  , id_municipio_ibge               boolean      not null default (true)
  , in_ativo                        boolean      not null default (true)

  , constraint tb_municipio_id_municipio_pk      primary key (id_municipio)
  , constraint tb_municipio_id_estado_fk         foreign key (id_estado) references pje.tb_estado (id_estado)
  , constraint tb_municipio_ds_municipio_uk      unique      (ds_municipio)
  , constraint tb_municipio_id_municipio_ibge_uk unique      (id_municipio_ibge)
);

create table pje.tb_endereco (
    id_endereco                     bigserial    not null
  , nm_logradouro                   varchar(256)
  , nr_endereco                     varchar(10)
  , ds_complemento                  varchar(20)
  , nm_bairro                       varchar(50)
  , nm_cidade                       varchar(50)
  , id_estado                       integer
  , dt_alteracao_endereco           timestamp    not null default (now())
  , in_correspondencia              boolean      not null default (true)

  , constraint tb_endereco_id_endereco_pk primary key (id_endereco)
  , constraint tb_endereco_cd_uf_fk       foreign key (id_estado) references pje.tb_estado (id_estado)
);

create table pje.tb_cep (
    id_cep                          bigserial    not null
  , id_municipio                    bigint       not null
  , nr_cep                          char(8)      not null
  , nm_logradouro                   varchar(256)
  , nm_bairro                       varchar(256)
  , ds_complemento                  varchar(256)
  , nr_endereco_cep                 varchar(40)
  , in_ativo                        boolean      not null default (true)

  , constraint tb_cep_id_cep_pk       primary key (id_cep)
  , constraint tb_cep_id_municipio_fk foreign key (id_municipio) references pje.tb_municipio (id_municipio)
);
