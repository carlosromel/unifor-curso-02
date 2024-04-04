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
