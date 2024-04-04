/**
 * Eventos.
 */
create table pje.tb_evento_agrupamento (
    id_evento_agrupamento           bigserial    not null
  , in_multiplo                     boolean      not null default (false)

  , constraint tb_evento_agrupamento_id_evento_agrupamento_fk primary key (id_evento_agrupamento)
);

create table pje.tb_evento (
    id_evento                       bigserial    not null
  , in_ativo                        boolean      not null default (true)
  , in_complementar                 boolean      not null default (false)
  , in_segredo_justica              boolean      not null default (false)
  , in_visibilidade_externa         boolean      not null default (true)
  , in_eletronico                   boolean      not null default (true)
  , in_papel                        boolean      not null default (false)
  , in_permite_lancar_lote          boolean      not null default (false)
  , in_padrao_sgt                   boolean      not null default (false)
  , nr_faixa_inferior               integer
  , nr_faixa_superior               integer
  , nr_nivel                        integer
  , ds_evento                       varchar(256)
  , ds_observacao                   varchar(256)
  , ds_caminho_completo             varchar(256)
  , cd_evento                       varchar(256)
  , cd_eveno_outro                  varchar(256)
  , ds_movimento                    varchar(256)
  , ds_norma                        varchar(256)
  , ds_lei                          varchar(256)
  , ds_lei_artigo                   varchar(256)
  , ds_glossario                    varchar(256)
  , ds_evento_completo              varchar(256)
  , ds_complemento                  varchar(256)
  , ds_breadcrumb                   varchar(256)
  , ds_motivo_inativacao            varchar(256)

  , constraint tb_evento_id_evento_pk primary key (id_evento)
);

create table pje.tb_processo_evento (
    id_processo_evento              bigserial    not null
  , id_jbpm_task                    bigint
  , in_processado                   boolean      not null default (false)
  , in_verificado_processado        boolean      not null default (false)
  , in_visibilidade_externa         boolean      not null default (true)
  , in_ativo                        boolean      not null default (true)
  , tp_processo_evento              char(1)      not null
  , dt_atualizacao                  timestamp    not null default (now())
  , ds_nome_usuario                 varchar(64)  not null
  , ds_cpf_usuario                  char(11)
  , ds_cnpj_usuario                 char(14)
  , ds_texto_final_externo          varchar(256)
  , ds_texto_final_interno          varchar(256)
  , ds_texto_parametrizado          varchar(256)
  , ds_processo_evento              varchar(256)
  , ds_observacao                   varchar(256)

  , constraint tb_processo_evento_id_processo_evento_pk primary key (id_processo_evento)
);
