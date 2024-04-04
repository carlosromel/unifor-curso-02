/**
 * Processos.
 */
create table tb_processo_trf (
    id_processo_trf                 bigserial     not null

  , constraint tb_processo_trf_id_processo_trf_pk primary key (id_processo_trf)
);

create table tb_processo_transicao (
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
