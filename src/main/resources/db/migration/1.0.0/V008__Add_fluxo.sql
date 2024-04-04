/**
 * Fluxo.
 */
create table pje.tb_tipo_processo_documento (
    id_tipo_processo_documento      bigserial     not null
  , id_fluxo                        bigint        not null
  , ds_tipo_processo_documento      varchar(256)  not null
  , cd_tipo_documento               varchar(256)  not null
  , cd_documento                    varchar(256)  not null
  , ds_tp_proc_documento_observacao varchar(256)  not null
  , ds_mascara                      varchar(256)  not null
  , tp_visibilidade                 varchar(256)  not null
  , nr_codigo_materia               varchar(256)  not null
  , nr_notifica_advogado            bigint        not null
  , ds_variavel_fluxo               varchar(256)  not null
  , ds_url_bnmp                     varchar(256)  not null
  , in_sistema                      boolean       not null default (true)
  , in_tipo_documento               boolean       not null default (true)
  , in_anexar                       boolean       not null default (true)
  , in_numera                       boolean       not null default (true)
  , in_obriga_assinatura            boolean       not null default (true)
  , in_publico                      boolean       not null default (true)
  , in_tipo_coumunicacao            boolean       not null default (true)
  , in_tipo_expediente              boolean       not null default (true)
  , in_pesquisavel                  boolean       not null default (true)
  , in_ato_proferido                boolean       not null default (true)
  , in_exibe_juntada_ducumento      boolean       not null default (true)
  , in_possui_custas                boolean       not null default (true)
  , in_ativo                        boolean       not null default (true)

  , constraint tb_tipo_processo_documento_id_tipo_processo_documento_pk primary key (id_tipo_processo_documento)
);

create table pje.tb_processo_documento (
    id_processo_documento           bigserial     not null
  , id_processo                     bigint        not null
  , ds_processo_documento           varchar(256)
  , ds_motivo_exclusao              varchar(256)
  , ds_observacao_procedimento      varchar(256)
  , id_jbpm_mask                    bigint
  , ds_nome_usuario_inclusao        varchar(256)
  , ds_nome_papel                   varchar(256)
  , ds_nome_usuario_alteracao       varchar(256)
  , ds_nome_usuario_exclusao        varchar(256)
  , ds_nome_localizacao             varchar(256)
  , id_pk_tb_processo_documento_pg  bigint
  , id_sessao_pg                    bigint
  , nr_documento                    bigint
  , ds_instancia                    varchar(256)
  , dt_inclusao                     timestamp
  , dt_alteracao                    timestamp
  , dt_exclusao                     timestamp
  , dt_juntada                      timestamp
  , nr_ordem                        bigint
  , id_instancia_origem             bigint
  , ds_nome_usuario_juntada         varchar(256)
  , ds_localizacao_usuario_juntada  varchar(256)
  , ds_numero_guia                  varchar(256)
  , in_documento_sigiloso           boolean       not null default (false)
  , in_lido                         boolean       not null default (false)
  , in_tipo_origem_juntada          boolean       not null default (false)
  , in_atividade_especifica         boolean       not null default (false)
  , in_destacar_processo            boolean       not null default (false)
  , in_bloquear_visualizacao        boolean       not null default (false)
  , id_localizacao_bloqueio         boolean       not null default (false)
  , in_sincroniza_sessao_ms         boolean       not null default (false)
  , in_inteiro_teor                 boolean       not null default (false)
  , in_ativo                        boolean       not null default (true)

  , constraint tb_processo_documento_id_processo_documento_pk primary key (id_processo_documento)
  , constraint tb_processo_documento_id_processo_fk           foreign key (id_processo) references pje.tb_processo (id_processo)
);

create table pje.tb_processo_documento_bin (
    id_processo_documento_bin       bigserial     not null
  , id_processo_documento           bigint        not null
  , id_pk_tb_pro_docum_bin_pg       bigint
  , ds_extensao                     varchar(256)
  , ds_modelo_documento             varchar(256)
  , ds_md5_documento                varchar(512)
  , nm_arquivo                      varchar(256)
  , dt_inclusao                     timestamp
  , nr_tamanho                      bigint
  , ds_signature                    varchar(512)
  , ds_cert_chain                   varchar(512)
  , ds_nome_usuario_ultimo_assinar  varchar(256)
  , ds_nome_usuario                 varchar(256)
  , ds_primeira_assinatura          varchar(256)
  , id_sessao_pg                    bigint
  , in_binario                      boolean       not null default (false)
  , nr_documento_storage            bigint
  , nm_documento_wopi               varchar(256)
  , ob_processo_documento           bytea
  , in_valido                       boolean       not null default (true)

  , constraint tb_processo_documento_bin_id_processo_documento_bin_pk primary key (id_processo_documento_bin)
  , constraint tb_processo_documento_bin_id_processo_documento_fk     foreign key (id_processo_documento) references pje.tb_processo_documento (id_processo_documento)
);

create table pje.tb_fluxo (
    id_fluxo                        bigserial     not null
  , in_ativo                        boolean       not null default (true)
  , in_publicado                    boolean       not null default (false)
  , cd_fluxo                        varchar(256)  not null
  , ds_fluxo                        varchar(256)  not null
  , qt_prazo                        integer
  , dt_inicio_publicacao            timestamp    default (now())
  , dt_fim_publicacao               timestamp    default (now())
  , dt_ultima_publicacao            timestamp
  , ds_xml                          text         not null

  , constraint tb_fluxo_id_fluxo_pk primary key (id_fluxo)
);

create table pje.tb_process_instance (
    id_process_instance             bigserial     not null

  , constraint tb_process_instance_id_process_instance_pk primary key (id_process_instance)
);

create table pje.tb_task_instance (
    id_task_instance                bigserial     not null

  , constraint tb_task_instance_id_task_instance_pk primary key (id_task_instance)
);
