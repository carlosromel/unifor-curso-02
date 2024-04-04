set database sql syntax pgs true;

create schema curso2;
create schema pje;

create table curso2.tb_caso_judicial (
     id_caso_judicial        bigserial     not null
   , nr_numero_unico         varchar(25)
   , cd_decisao              char(1)
   , ds_descricao            varchar(256)
   , dt_abertura             timestamp     not null default (now())

   , constraint tb_caso_judicial_id_caso_judicial_pk primary key (id_caso_judicial)
);

/**
 * Endereçamento.
 */
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

/**
 * Credenciais.
 */
create table pje.tb_usuario (
    id_usuario                      bigserial     not null
  , in_bloqueio                     boolean       not null default (false)
  , in_provisorio                   boolean       not null default (false)

  , constraint tb_usuario_id_usuario_pk primary key (id_usuario)
);

create table pje.tb_bloqueio_usuario (
    id_bloqueio_usuario             bigserial     not null
  , id_usuario                      bigint        not null
  , dt_bloqueio                     timestamp     not null default (now())
  , dt_previsao_desbloqueio         timestamp
  , ds_motivo_bloqueio              varchar(256)  not null
  , dt_desbloqueio                  timestamp

  , constraint tb_bloqueio_usuario_id_bloqueio_usuario_pk primary key (id_bloqueio_usuario)
  , constraint tb_bloqueio_usuario_id_usuario_fk          foreign key (id_usuario) references pje.tb_usuario(id_usuario)
);

/**
 * Localização.
 */
create table pje.tb_localizacao (
    id_localizacao                  bigserial     not null
  , nr_faixa_inferior               integer
  , nr_faixa_superior               integer
  , in_estrutura                    boolean      not null default (false)
  , in_ativo                        boolean      not null default (true)

  , constraint tb_localizacao_id_localizacao_pk primary key (id_localizacao)
);

create table pje.tb_usuario_localizacao (
    id_usuario_localizacao          bigserial     not null
  , id_localizacao                  bigint        not null
  , in_responsavel_localizacao      boolean       not null default (false)
  , id_localizacao_backup           bigint
  , id_estrutura_backup             bigint

  , constraint tb_usuario_localizacao_id_usuario_localizacao_pk primary key (id_usuario_localizacao)
  , constraint tb_usuario_localizacao_id_usuario                foreign key (id_localizacao) references pje.tb_localizacao (id_localizacao)
);

/**
 * Processos.
 */
create table pje.tb_processo_trf (
    id_processo_trf                 bigserial     not null

  , constraint tb_processo_trf_id_processo_trf_pk primary key (id_processo_trf)
);

create table pje.tb_processo_transicao (
    id_transicao                    bigserial     not null

  , constraint tb_processo_trf_id_transicao_pk primary key (id_transicao)
);

create table pje.tb_processo (
    id_processo                     bigserial     not null
  , id_ibpm                         bigint
  , id_pk_tb_processo_pg            bigint
  , id_sessao_pg                    bigint
  , dt_inicio                       timestamp
  , dt_fim                          timestamp
  , ds_complemento                  varchar(256)
  , nr_processo                     varchar(25)
  , nr_processo_origem              varchar(25)
  , nr_duracao                      bigint
  , nr_actor_id                     bigint
  , nr_processo_temp                varchar(25)
  , ds_nm_su_cadastro_processo      varchar(256)

  , constraint tb_processo_id_processo_pk primary key (id_processo)
);

create table pje.tb_processo_instance (
    id_proc_inst               bigserial     not null
  , id_orgao_julgador_cargo    bigint        not null
  , id_orgao_julgador_colegiado bigint       not null

  , constraint tb_processo_instance_id_proc_inst_pk primary key (id_proc_inst)
);

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

/**
 * Movimentação em lote.
 */
create table pje.tb_hist_movimentacao_lote (
    id_hist_movimentacao_lote       bigserial    not null
  , id_usuario                      bigint       not null
  , dt_movimentacao                 timestamp    not null default (now())
  , nm_tipo_atividade_lote          varchar(256) not null

  , constraint tb_hist_movimentacao_lote_id_hist_movimentaco_lote_pk primary key (id_hist_movimentacao_lote)
  , constraint tb_hist_movimentacao_lote_id_usuario_fk               foreign key (id_usuario) references pje.tb_usuario (id_usuario)
);

create table pje.tb_hist_proc_moviment_lote (
    id_hist_proc_moviment_lote      bigserial    not null
  , id_processo_trf                 bigint       not null
  , id_transicao                    bigint       not null
  , id_process_instance_origem      bigint       not null
  , id_task_instance_origem         bigint       not null
  , id_task_origem                  bigint       not null
  , nm_fluxo                        varchar(256) not null
  , nm_tarefa_origem                varchar(256) not null

  , constraint tb_hist_proc_moviment_lote_id_hist_proc_moviment_lote_pk primary key (id_hist_proc_moviment_lote)
  , constraint tb_hist_proc_moviment_lote_id_processo_trf_fk            foreign key (id_processo_trf)            references pje.tb_processo_trf (id_processo_trf)
  , constraint tb_hist_proc_moviment_lote_id_transicao_fk               foreign key (id_transicao)               references pje.tb_processo_transicao (id_transicao)
  , constraint tb_hist_proc_moviment_lote_id_process_instance_origem_fk foreign key (id_process_instance_origem) references pje.tb_process_instance (id_process_instance)
  , constraint tb_hist_proc_moviment_lote_id_task_instance_origem_fk    foreign key (id_task_instance_origem)    references pje.tb_task_instance (id_task_instance)
  , constraint tb_hist_proc_moviment_lote_id_task_origem_fk             foreign key (id_task_origem)             references pje.tb_task_instance (id_task_instance)
);

/**
 * JBPM.
 */
create table pje.tb_jbpm_variavel_label (
    id_jbpm_variavel_label          bigserial    not null
  , nm_variavel                     varchar(50)  not null
  , ds_label_variavel               varchar(50)  not null
  , ds_nome_tarefa                  varchar(50)  not null
  , ds_nome_fluxo                   varchar(50)  not null

  , constraint tb_jbpm_variavel_label_id_jbpm_variavel_label_pk primary key (id_jbpm_variavel_label)
);

/**
 * Log.
 */
create table pje.tb_log (
    id_log                          bigserial    not null
  , id_pagina                       bigint       not null
  , ds_ip                           varchar(100) not null
  , ds_entidade                     varchar(256) not null
  , ds_id_entidade                  varchar(64)
  , tp_operacao                     varchar(10)
  , dt_log                          timestamp    not null default (now())
  , ds_package                      varchar(256)

  , constraint tb_log_id_log_pk primary key (id_log)
);

create table pje.tb_log_detalhe (
    id_log_detalhe                  bigserial    not null
  , id_log                          bigint       not null
  , ds_valor_anterior               varchar(256)
  , ds_valor_atual                  varchar(256)

  , constraint tb_log_detalhe_id_log_detalhe_pk primary key (id_log_detalhe)
  , constraint tb_log_detalhe_id_log_fk         foreign key (id_log) references pje.tb_log (id_log)
);

/**
 * Pesquisa.
 */
create table pje.tb_pesquisa (
    id_pesquisa                     bigserial    not null
  , ds_nome                         varchar(256) not null
  , ds_descricao                    varchar(256) not null
  , ds_coluna_ordenadao             varchar(256) not null
  , ds_operador_logico              varchar(10)  not null
  , ds_entity_list                  varchar(256)

  , constraint tb_pesquisa_id_pesquisa_pk primary key (id_pesquisa)
);

create table pje.tb_pesquisa_campo (
    id_pesquisa_campo               bigserial    not null
  , id_pesquisa                     bigint       not null
  , ds_nome                         varchar(64)  not null
  , ds_valor                        varchar(64)  not null

  , constraint tb_pesquisa_campo_id_pesquisa_campo_pk primary key (id_pesquisa_campo)
  , constraint tb_pesquisa_campo_id_pesquisa_fk       foreign key (id_pesquisa) references pje.tb_pesquisa (id_pesquisa)
);

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
  , constraint tb_variavel_id_variavel_fk                foreign key (id_variavel) references pje.tb_variavel (id_variavel)
  , constraint tb_variavel_id_fluxo_fk                   foreign key (id_fluxo)    references pje.tb_fluxo (id_fluxo)
);

create table pje.tb_variavel_tipo_modelo (
    id_variavel_tipo_modelo         bigserial    not null
  , id_variavel                     bigint       not null
  , id_tipo_modelo_documento        bigint       not null

  , constraint tb_variavel_tipo_modelo_id_variavel_tipo_modleo_pk  primary key (id_variavel_tipo_modelo)
  , constraint tb_variavel_tipo_modelo_id_variavel_fk              foreign key (id_variavel)              references pje.tb_variavel (id_variavel)
  , constraint tb_variavel_tipo_modelo_id_tipo_modelo_documento_fk foreign key (id_tipo_modelo_documento) references pje.tb_tipo_modelo_documento (id_tipo_modelo_documento)
);

/**
 * Tarefas.
 */
create table pje.tb_tarefa (
    id_tarefa                       bigserial    not null
  , ds_tarefa                       varchar(256) not null

  , constraint tb_tarefa_id_tarefa_pk primary key (id_tarefa)
  , constraint tb_tarefa_ds_tarefa_uk unique (ds_tarefa)
);

create table pje.tb_tarefa_evento (
    id_tarefa_evento                bigserial    not null
  , id_tarefa                       bigint       not null

  , constraint tb_tarefa_evento_id_tarefa_evento_pk primary key (id_tarefa_evento)
  , constraint tb_tarefa_id_tarefa_fk               foreign key (id_tarefa) references pje.tb_tarefa (id_tarefa)
);

create table pje.tb_tarefa_jbpm (
    id_tarefa_jbpm                  bigserial    not null
  , id_tarefa                       bigint       not null

  , constraint tb_tarefa_jbpm_id_tarefa_jbpm_pk primary key (id_tarefa_jbpm)
  , constraint tb_tarefa_jbpm_id_tarefa_fv      foreign key (id_tarefa) references pje.tb_tarefa (id_tarefa)
);

create table pje.tb_tarefa_transicao_evento (
    id_tarefa_transmissao_evento    bigserial    not null
  , id_tarefa                       bigint       not null

  , constraint tb_tarefa_transmissao_evento_id_tarefa_transmissao_evento_pk primary key (id_tarefa_transmissao_evento)
  , constraint tb_tarefa_transmissao_evento_id_tarefa_fk                    foreign key (id_tarefa) references pje.tb_tarefa (id_tarefa)
);

create table pje.tb_processo_tarefa_evento (
    id_processo_tarefa_evento       bigserial    not null
  , id_processo                     bigint       not null
  , id_tarefa_evento                bigint       not null
  , in_registrado                   boolean      not null default (false)

  , constraint tb_processo_tarefa_evento_id_proceso_tarefa_evento primary key (id_processo_tarefa_evento)
  , constraint tb_processo_tarefaid_processo                      foreign key (id_processo)      references pje.tb_processo (id_processo)
  , constraint tb_processo_tarefa_id_tarefa_evento_fk             foreign key (id_tarefa_evento) references pje.tb_tarefa_evento (id_tarefa_evento)
);

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

/**
 * Tabelas avulsas.
 */
create table pje.tb_item_tipo_documento (
    id_item_tipo_documento          bigserial    not null
);

create table pje.tb_lista_email (
    id_lista_email                  bigserial    not null
);

create table pje.tb_proc_localizacao_ibpm (
    id_processo_localizacao         bigserial    not null
);

create table pje.tb_processo_conexao (
    dt_processo_conexao             timestamp    default (now())
);

create table pje.tb_documento_certidao (
    id_documento_certidao           bigserial    not null
  , id_documento                    bigint       not null
);

create table pje.tb_locks (
    cd_lock                         bigserial    not null
);

create table pje.tb_tipo_modelo_doc_papel (
    id_tipo_modelo_documento_papel  bigserial    not null
);

create table pje.tb_tarefa_trans_even_agrupamento (
    id_tarefa_evento_agrupamento    bigserial    not null
);
