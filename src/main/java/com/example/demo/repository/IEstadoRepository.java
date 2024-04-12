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
package com.example.demo.repository;

import com.example.demo.model.Estado;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

/**
 *
 * @author Carlos Romel Pereira da Silva, <carlos.romel@gmail.com>
 */
public interface IEstadoRepository extends JpaRepository<Estado, Long> {

    @Query("select e from Estado e where e.ativo and e.pais.sigla = :sigla")
    public List<Optional<Estado>> findBySiglaPais(@Param("sigla") String sigla);

    @Query("select e from Estado e where e.ativo and e.uf = :uf")
    public Optional<Estado> findByUF(@Param("uf") String uf);

    @Override
    @Query("select e from Estado e where e.ativo")
    public List<Estado> findAll();

    @Query("select e from Estado e where e.ativo and e.pais.sigla = :sigla and e.uf = :uf")
    public Optional<Estado> findBySiglaUF(String sigla, String uf);
}
