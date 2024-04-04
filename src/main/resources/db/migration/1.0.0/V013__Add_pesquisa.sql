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
