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
