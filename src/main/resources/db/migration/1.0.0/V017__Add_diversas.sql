/**
 * Diversas.
 */
create table pje.tb_estatistica (
    id_estatistica                  bigserial    not null
  , nm_task                         varchar(256) not null
  , nm_node                         varchar(256) not null
  , dt_inicio                       timestamp    not null default (now())
  , dt_fim                          timestamp
  , nr_duracao                      bigint
  , ds_fluxo                        varchar(256)

  , constraint tb_estatistica_id_estatistica_pk primary key (id_estatistica)
);

create table pje.tb_caixa (
    id_caixa                        bigserial    not null
  , nm_caixa                        varchar(256) not null
  , ds_caixa                        varchar(256) not null
  , in_sistema                      boolean      not null default (false)

  , constraint tb_caixa_id_caixa_pk primary key (id_caixa)
  , constraint tb_caixa_ds_caixa_uk unique (ds_caixa)
);

create table pje.tb_status (
    id_status                       bigserial    not null
  , in_ativo                        boolean      not null default (true)
  , ds_status                       varchar(256) not null

  , constraint tb_status_id_status_pk primary key (id_status)
  , constraint tb_status_ds_status_uk unique (ds_status)
);

create table pje.tb_parametro (
    id_parametro                    bigserial    not null
  , in_ativo                        boolean      not null default (true)
  , in_dados_sensiveis              boolean      not null default (true)
  , in_sistema                      boolean      not null default (false)
  , nm_variavel                     varchar(256)
  , ds_variavel                     varchar(256)
  , vl_variavel                     varchar(256)
  , ds_atualizacao                  timestamp    not null default (now())
  , ds_esquema_tabela_id            bigint

  , constraint tb_parametero_id_parametro_pk primary key (id_parametro)
);

create table pje.tb_assunto (
    id_assunto                      bigserial    not null
  , in_ativo                        boolean      not null default (true)
  , cd_assunto                      varchar(10)  not null
  , ds_assunto                      varchar(256) not null
  , ds_caminho_completo             varchar(512) not null

  , constraint tbv_assunto_id_assunto_pk primary key (id_assunto)
);

create table pje.tb_pagina (
    id_pagina                       bigserial    not null
  , ds_descricao                    varchar(256) not null
  , ds_url                          varchar(512) not null
);

create table pje.tb_ajuda (
    id_ajuda                        bigserial    not null
  , dt_registo                      timestamp    not null default (now())
  , ds_texto                        text         not null

  , constraint tb_ajuda_id_ajuda_pk primary key (id_ajuda)
);

create table pje.tb_historico_ajuda (
    id_historico_ajuda              bigserial    not null
  , dt_registo                      timestamp    not null default (now())
  , ds_texto                        text         not null

  , constraint tb_historico_ajuda_id_historico_ajuda_pk primary key (id_historico_ajuda)
);
