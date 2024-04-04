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
