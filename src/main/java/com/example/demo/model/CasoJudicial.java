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
import java.util.Date;

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
    private long id;

    @Column(name = "nr_numero_unico", nullable = false)
    private long numeroUnico;

    @Column(name = "cd_decisao", nullable = false)
    private char decisao;

    @Column(name = "ds_deccricao", nullable = false)
    private String descricao;

    @Column(name = "dt_data_abertura", nullable = false)
    private Date dataAbertura;
}
