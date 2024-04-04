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
