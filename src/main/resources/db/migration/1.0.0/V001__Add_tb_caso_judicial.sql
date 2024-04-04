create table curso2.tb_caso_judicial (
    id_caso_judicial bigserial    not null
  , nr_numero_unico  varchar(20)  not null
  , cd_decisao       char(1)      not null
  , ds_descricao     varchar(200) not null
  , dt_abertura      timestamp    not null default (now())

  , constraint tb_caso_judicial_pk primary key (id_caso_judicial)
);

comment on column curso2.tb_caso_judicial.id_caso_judicial is
    'Número sequencial dos processo.';
comment on column curso2.tb_caso_judicial.nr_numero_unico is
    'Número único, padronizado pelo CNJ.';
comment on column curso2.tb_caso_judicial.cd_decisao is
    'Código da decisão judicial.';
comment on column curso2.tb_caso_judicial.ds_descricao is
    'Descrição geral do processo.';
comment on column curso2.tb_caso_judicial.dt_abertura is
    'Data e hora da abertura do processo.';