/*
 * Copyright (C) 2024 Carlos Romel Pereira da Silva, <carlos.romel@gmail.com>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 */
package com.example.demo.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Objects;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;

/**
 *
 * @author Carlos Romel Pereira da Silva, <carlos.romel@gmail.com>
 */
@Entity
@Table(schema = "curso2", name = "tb_caso_judicial")
@NoArgsConstructor
@Getter
public class CasoJudicial {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_caso_judicial", insertable = false)
    private Long id;

    @Column(name = "nr_numero_unico")
    private String numeroUnico;

    @Column(name = "cd_decisao")
    private String decisao;

    @Column(name = "ds_descricao")
    private String descricao;

    @Column(name = "dt_abertura", insertable = false, updatable = false)
    @CreationTimestamp
    @Temporal(TemporalType.TIMESTAMP)
    private Timestamp dataAbertura;
    
    public CasoJudicial(String numeroUnico, String decisao, String descricao) {
        this.numeroUnico = numeroUnico;
        this.decisao = decisao;
        this.descricao = descricao;
    }

    @Override
    public String toString() {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        String data = Objects.isNull(this.dataAbertura)
                ? null
                : sdf.format(dataAbertura.getTime());
        return new StringBuilder()
                .append(String.format("%7d: %s - %1s - %s - %s",
                        id,
                        numeroUnico,
                        decisao,
                        data,
                        descricao))
                .toString();
    }

    public CasoJudicial setId(Long id) {
        this.id = id;

        return this;
    }

    public CasoJudicial setNumeroUnico(String numeroUnico) {
        this.numeroUnico = numeroUnico;

        return this;
    }

    public CasoJudicial setDecisao(String decisao) {
        this.decisao = decisao;

        return this;
    }

    public CasoJudicial setDescricao(String descricao) {
        this.descricao = descricao;

        return this;
    }
    public CasoJudicial setDataAbertura(Timestamp dataAbertura) {
        this.dataAbertura = dataAbertura;

        return this;
    }
}
