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

import com.example.demo.model.CasoJudicial;
import com.example.demo.repository.ICasoJudicialRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Carlos Romel Pereira da Silva, <carlos.romel@gmail.com>
 */
@Service
public class CasoJudicialService {

    private final ICasoJudicialRepository repository;

    @Autowired
    private Patcher patcher;

    @Autowired
    public CasoJudicialService(ICasoJudicialRepository repository) {
        this.repository = repository;
    }

    public Optional<CasoJudicial> findById(Long id) {
        return this.repository.findById(id);
    }

    public List<CasoJudicial> getTodosOsCasos() {
        return this.repository.findAll();
    }

    public boolean existe(CasoJudicial novoCaso) {
        Optional<CasoJudicial> casos = this.repository.findByNumeroUnico(novoCaso.getNumeroUnico());

        return !casos.isEmpty();
    }

    /**
     * Tratamento do verbo POST.
     *
     * @param novoCaso
     * @return
     */
    public CasoJudicial criarCaso(CasoJudicial novoCaso) {

        return this.repository.save(novoCaso);
    }

    /**
     * Tratamento do método GET.
     *
     * @param numeroUnico
     * @return
     */
    public Optional<CasoJudicial> getCasoByNumeroUnico(String numeroUnico) {
        return this.repository.findByNumeroUnico(numeroUnico);
    }

    /**
     * Tratamento do método PATCH.
     *
     * @param id
     * @param atualizacoes
     * @return
     */
    public Optional<CasoJudicial> atualizarCaso(Long id, CasoJudicial atualizacoes) {
        CasoJudicial atual = findById(id).get();

        try {
            Patcher.patch(atual, atualizacoes);
            this.repository.saveAndFlush(atual);
        } catch (IllegalAccessException e) {
        }

        return this.repository.findById(id);
    }

    /**
     * Tratamento do verbo PUT.
     *
     * @param casoAtualizado
     * @return
     */
    public CasoJudicial substituirCaso(CasoJudicial casoAtualizado) {
        return this.repository.saveAndFlush(casoAtualizado);
    }

    /**
     * Tratament do verbo DELETE.
     *
     * @param id
     */
    public void deletarCaso(Long id) {
        this.repository.deleteById(id);
    }
}
