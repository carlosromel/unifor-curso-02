/**
 * Variaveis.
 */
create table pje.tb_variavel (
    id_variavel                     bigserial    not null
  , in_ativo                        boolean      not null default (true)
  , ds_variavel                     varchar(256) not null
  , vl_variavel                     varchar(256) not null
  , ds_descricao                    varchar(256) not null

  , constraint tb_variavel_id_variavel_pk primary key (id_variavel)
);

create table pje.tb_variavel_fluxo (
    id_variavel                     bigint       not null
  , id_fluxo                        bigint       not null

  , constraint tb_variavel_fluxo_id_variavel_id_fluxo_pk primary key (id_variavel, id_fluxo)
  , constraint tb_variavel_id_variavel_fk                foreign key (id_variavel) references tb_variavel (id_variavel)
  , constraint tb_variavel_id_fluxo_fk                   foreign key (id_fluxo)    references tb_fluxo (id_fluxo)
);

create table pje.tb_variavel_tipo_modelo (
    id_variavel_tipo_modelo         bigserial    not null
  , id_variavel                     bigint       not null
  , id_tipo_modelo_documento        bigint       not null

  , constraint tb_variavel_tipo_modelo_id_variavel_tipo_modleo_pk  primary key (id_variavel_tipo_modelo)
  , constraint tb_variavel_tipo_modelo_id_variavel_fk              foreign key (id_variavel)              references pje.tb_variavel (id_variavel)
  , constraint tb_variavel_tipo_modelo_id_tipo_modelo_documento_fk foreign key (id_tipo_modelo_documento) references pje.tb_tipo_modelo_documento (id_tipo_modelo_documento)
);
