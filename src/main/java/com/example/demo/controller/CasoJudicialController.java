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
package com.example.demo.controller;

import com.example.demo.component.CasoJudicialComponent;
import com.example.demo.exception.CasoDuplicadoException;
import com.example.demo.model.CasoJudicial;
import com.example.demo.service.CasoJudicialService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
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

    @GetMapping
    @RequestMapping("/{numeroUnico}")
    public ResponseEntity<CasoJudicial> getCasoJudicial(@PathVariable("numeroUnico") String numeroUnico) {
        CasoJudicial caso = this.service.getCasoByNumeroUnico(numeroUnico);

        return ResponseEntity.ok(caso);
    }

    @GetMapping
    public ResponseEntity<List<CasoJudicial>> getTodosOsCasos() {
        List<CasoJudicial> casos = service.getTodosOsCasos();

        return ResponseEntity.ok(casos);
    }

    @PostMapping
    public ResponseEntity<CasoJudicialComponent> criarCaso(@RequestBody CasoJudicialComponent novoCaso) throws CasoDuplicadoException {
        if (service.existe(novoCaso)) {
            throw new CasoDuplicadoException("Caso duplicado");
        } else {
            CasoJudicialComponent caso = service.criarCaso(novoCaso);

            return ResponseEntity.status(HttpStatusCode.valueOf(201)).body(caso);
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<CasoJudicialComponent> atualizarCaso(@PathVariable Long id,
            @RequestBody CasoJudicialComponent casoAtualizado) {
        CasoJudicialComponent caso = service.atualizarCaso(id, casoAtualizado);

        return ResponseEntity.ok(caso);
    }

    @PatchMapping("/{id}")
    public ResponseEntity<CasoJudicialComponent> ajustarCaso(@PathVariable Long id,
            @RequestBody Map<String, Object> atualizacoes) {
        CasoJudicialComponent caso = service.atualizarCaso(id, atualizacoes);

        return ResponseEntity.ok(caso);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<CasoJudicialComponent> deletarCaso(@PathVariable Long id) {
        CasoJudicialComponent caso = service.deletarCaso(id);

        return ResponseEntity.noContent().build();
    }
}
