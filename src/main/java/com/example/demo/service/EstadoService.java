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

import com.example.demo.model.Estado;
import com.example.demo.repository.IEstadoRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Carlos Romel Pereira da Silva, <carlos.romel@gmail.com>
 */
@Service
public class EstadoService {

    private final IEstadoRepository repository;

    @Autowired
    public EstadoService(IEstadoRepository repository) {
        this.repository = repository;
    }

    public List<Optional<Estado>> findBySiglaPais(String sigla) {
        return this.repository.findBySiglaPais(sigla);
    }

    public Optional<Estado> findByUF(String uf) {
        return this.repository.findByUF(uf);
    }

    public List<Estado> findAll() {
        return this.repository.findAll();
    }
}
