/**
 * O número único do processo é persistido com sua máscara, passando a usar 25 caracteres.
 */
alter table curso2.tb_caso_judicial
    alter column nr_numero_unico type varchar(25);

alter table curso2.tb_caso_judicial
    add constraint nr_numero_unico_unik unique(nr_numero_unico);

alter table curso2.tb_caso_judicial
    add constraint cd_decisao_check check (cd_decisao in ('A' -- Ativo
                                                        , 'I' -- Inativo
                                                        , 'C' -- Concluído
                                                         ));

comment on column curso2.tb_caso_judicial.cd_decisao is
    'Código da decisão judicial(A: Ativo, I: Inativo ou C: Concluído).';

