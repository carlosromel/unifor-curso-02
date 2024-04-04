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
package com.example.demo.service;

import com.example.demo.model.Pais;
import com.example.demo.repository.IPaisRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;

/**
 *
 * @author Carlos Romel Pereira da Silva, <carlos.romel@gmail.com>
 */
@Service
public class PaisService {

    private final IPaisRepository repository;

    @Autowired
    public PaisService(IPaisRepository repository) {
        this.repository = repository;
    }

    public Optional<Pais> findByCodigo(String codigo) {
        return this.repository.findByCodgio(codigo);
    }

    public Optional<Pais> findByCodgioISO(@Param("codigoISO") String codigoISO) {
        return this.repository.findByCodigoISO(codigoISO);
    }

    public Optional<Pais> findBySigla(String sigla) {
        return this.repository.findBySigla(sigla);
    }

    public List<Pais> findAll() {
        return this.repository.findAll();
    }
}
