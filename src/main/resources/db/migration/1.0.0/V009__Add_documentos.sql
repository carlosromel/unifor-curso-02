/**
 * Documentos.
 */
create table pje.tb_grupo_modelo_documento (
    id_grupo_modelo_documento       bigserial    not null
  , in_ativo                        boolean      not null default (true)
  , ds_grupo_modelo_documento       varchar(256) not null

  , constraint tb_grupo_modelo_documento_id_grupo_modelo_documento_pk primary key (id_grupo_modelo_documento)
);

create table pje.tb_tipo_modelo_documento (
    id_tipo_modelo_documento        bigserial    not null
  , in_ativo                        boolean      not null default (true)
  , ds_abreviacao                   varchar(20)  not null
  , ds_tipo_modelo_documento        varchar(256) not null

  , constraint tb_tipo_modelo_documento_id_tipo_modelo_documento_pk primary key (id_tipo_modelo_documento)
);

create table pje.tb_modelo_documento (
    id_modelo_documento             bigserial    not null
  , id_tipo_modelo_documento        bigint       not null
  , ds_titulo_modelo_documento      varchar(256) not null
  , ds_modelo_documento             text         not null
  , in_ativo                        boolean      not null default (true)

  , constraint tb_modelo_documento_id_modelo_documento_pk      primary key (id_modelo_documento)
  , constraint tb_modelo_documento_id_tipo_modelo_documento_fk foreign key (id_tipo_modelo_documento) references pje.tb_tipo_modelo_documento (id_tipo_modelo_documento)
);

create table pje.tb_agrupamento (
    id_agrupamento             bigserial    not null
  , in_ativo                   boolean      not null default (true)
  , ds_agrupamento             varchar(256) not null

  , constraint tb_agrupamento_id_agrupamento_pk primary key (id_agrupamento)
);

create table pje.tb_documento_historico (
    id_documento_historico          bigserial    not null
  , id_documento                    bigint       not null
  , tp_operacao                     char(1)      not null
  , dt_operacao                     timestamp    not null
  , ds_motivo_exclusao              varchar(256) not null
  , id_responsavel                  bigint       not null
  , ds_conteudo_documento           text         not null
);

create table pje.tb_documento_old (
    id_documento                    bigserial    not null
  , in_ativo                        boolean      not null default (true)
  , in_binario                      boolean      not null default (true)
  , in_valido                       boolean      not null default (true)
  , nr_tamanho                      integer
  , ds_documento                    varchar(256) not null
  , ds_mimetype                     varchar(256)
  , ds_identificador_storage        varchar(256)
  , ds_conteudo                     text         not null

  , constraint tb_documento_old_id_documento primary key (id_documento)
);

create table pje.tb_documento (
    id_documento                    bigserial    not null
  , in_ativo                        boolean      not null default (true)
  , in_binario                      boolean      not null default (true)
  , in_valido                       boolean      not null default (true)
  , nr_tamanho                      integer
  , ds_documento                    varchar(256) not null
  , ds_mimetype                     varchar(256)
  , ds_identificador_storage        varchar(256)
  , ds_conteudo                     text         not null

  , constraint tb_documento_id_documento primary key (id_documento)
);

create table pje.tb_tipo_proc_doc_papel (
    id_tipo_modelo_documento_papel  bigserial    not null
  , id_tipo_modelo_documento        bigint       not null

  , constraint tb_tipo_proc_doc_papel_id_tipo_modelo_documento_papel_pk primary key (id_tipo_modelo_documento_papel)
  , constraint tb_tipo_proc_doc_papel_id_tipo_modelo_documento_fk       foreign key (id_tipo_modelo_documento) references pje.tb_tipo_modelo_documento (id_tipo_modelo_documento)
);
