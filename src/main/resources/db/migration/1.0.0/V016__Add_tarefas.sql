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
