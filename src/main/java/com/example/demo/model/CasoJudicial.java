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
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Objects;

/**
 *
 * @author Carlos Romel Pereira da Silva, <carlos.romel@gmail.com>
 */
@Entity
@Table(schema = "curso2", name = "tb_caso_judicial")
public class CasoJudicial {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_caso_judicial")
    private Long id;

    @Column(name = "nr_numero_unico", nullable = false)
    private String numeroUnico;

    @Column(name = "cd_decisao", nullable = false)
    private String decisao;

    @Column(name = "ds_descricao", nullable = false)
    private String descricao;

    @Column(name = "dt_abertura", nullable = false)
    private Timestamp dataAbertura;

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
}
