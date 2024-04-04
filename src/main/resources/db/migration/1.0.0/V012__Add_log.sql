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
