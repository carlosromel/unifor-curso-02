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
package com.example.demo.controller.api.casos;

import com.example.demo.exception.CasoDuplicadoException;
import com.example.demo.model.CasoJudicial;
import com.example.demo.service.CasoJudicialService;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Carlos Romel Pereira da Silva, <carlos.romel@gmail.com>
 */
@RestController
@RequestMapping("/api/casos")
public class CasoJudicialController {

    @Autowired
    private final CasoJudicialService service;

    @Autowired
    public CasoJudicialController(CasoJudicialService service) {
        this.service = service;
    }

    @RequestMapping(
            consumes = MediaType.APPLICATION_JSON_VALUE,
            method = RequestMethod.GET,
            path = "/{numeroUnico:[\\d.-]{25}}",
            produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Optional<CasoJudicial>> getCasoJudicial(@PathVariable("numeroUnico") String numeroUnico) {
        Optional<CasoJudicial> caso = this.service.getCasoByNumeroUnico(numeroUnico);

        return ResponseEntity.ok(caso);
    }

    @RequestMapping(
            consumes = MediaType.APPLICATION_JSON_VALUE,
            method = RequestMethod.GET,
            path = "/",
            produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<CasoJudicial>> getTodosOsCasos() {
        List<CasoJudicial> casos = this.service.getTodosOsCasos();

        return ResponseEntity.ok(casos);
    }

    @RequestMapping(
            consumes = MediaType.APPLICATION_JSON_VALUE,
            method = RequestMethod.GET,
            path = "/{id:[\\d]*}",
            produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Optional<CasoJudicial>> getCasoJudicial(@PathVariable Long id) {
        Optional<CasoJudicial> caso = this.service.findById(id);

        return ResponseEntity.ok(caso);
    }

    @RequestMapping(
            consumes = MediaType.APPLICATION_JSON_VALUE,
            method = RequestMethod.POST,
            path = "/",
            produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<CasoJudicial> criarCaso(@RequestBody CasoJudicial novoCaso) throws CasoDuplicadoException {
        if (this.service.existe(novoCaso)) {
            throw new CasoDuplicadoException("Caso duplicado");
        } else {
            CasoJudicial caso = this.service.criarCaso(novoCaso);

            return ResponseEntity
                    .status(HttpStatusCode.valueOf(201))
                    .body(caso);
        }
    }

    @RequestMapping(
            consumes = MediaType.APPLICATION_JSON_VALUE,
            method = RequestMethod.PATCH,
            path = "/{id:[\\d]*}",
            produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Optional<CasoJudicial>> ajustarCaso(@PathVariable Long id,
            @RequestBody CasoJudicial parcial
    ) {
        Optional<CasoJudicial> caso = this.service.atualizarCaso(id, parcial);

        return ResponseEntity.ok(caso);
    }

    @RequestMapping(
            consumes = MediaType.APPLICATION_JSON_VALUE,
            method = RequestMethod.PUT,
            path = "/{id:[\\d]*}",
            produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<CasoJudicial> atualizarCaso(@PathVariable Long id,
            @RequestBody CasoJudicial casoAtualizado) {
        CasoJudicial caso = this.service.substituirCaso(casoAtualizado);

        return ResponseEntity.ok(caso);
    }

    @RequestMapping(
            method = RequestMethod.DELETE,
            path = "/{id:[\\d]*}")
    public ResponseEntity<CasoJudicial> deletarCaso(@PathVariable Long id) {
        this.service.deletarCaso(id);

        return ResponseEntity.noContent().build();
    }
}
