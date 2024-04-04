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
package com.example.demo.controller.api;

import com.example.demo.model.Pais;
import com.example.demo.service.PaisService;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Carlos Romel Pereira da Silva, <carlos.romel@gmail.com>
 */
@RestController
@RequestMapping("/api/pais")
public class PaisController {

    @Autowired
    private final PaisService service;

    @Autowired
    public PaisController(PaisService service) {
        this.service = service;
    }

    @RequestMapping(
            consumes = MediaType.APPLICATION_JSON_VALUE,
            method = RequestMethod.GET,
            path = "/{codigo:\\w{2}}",
            produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Optional<Pais>> findPaisPorCodigo(@PathVariable("codigo") String codigo) {
        Optional<Pais> pais = this.service.findByCodigo(codigo);

        return ResponseEntity.ok(pais);
    }

    @RequestMapping(
            consumes = MediaType.APPLICATION_JSON_VALUE,
            method = RequestMethod.GET,
            path = "/{codigoISO:\\d{3}}",
            produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Optional<Pais>> findPaisPorCodigoISO(@PathVariable("codigoISO") String codigoISO) {
        Optional<Pais> pais = this.service.findByCodgioISO(codigoISO);

        return ResponseEntity.ok(pais);
    }

    @RequestMapping(
            consumes = MediaType.APPLICATION_JSON_VALUE,
            method = RequestMethod.GET,
            path = "/{sigla:[a-zA-Z]{3}}",
            produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Optional<Pais>> findPaisPorSigla(@PathVariable String sigla) {
        Optional<Pais> caso = this.service.findBySigla(sigla);

        return ResponseEntity.ok(caso);
    }

    @RequestMapping(
            consumes = MediaType.APPLICATION_JSON_VALUE,
            method = RequestMethod.GET,
            path = "/",
            produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<Pais>> findTodos() {
        List<Pais> caso = this.service.findAll();

        return ResponseEntity.ok(caso);
    }
}
