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
