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

import com.example.demo.component.CasoJudicialComponent;
import com.example.demo.model.CasoJudicial;
import com.example.demo.repository.ICasoJudicialRepository;
import java.util.List;
import java.util.Map;
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
    public CasoJudicialService(ICasoJudicialRepository repository) {
        this.repository = repository;
    }
    
    public List<CasoJudicial> getTodosOsCasos() {
        return repository.findAll();
    }

    public boolean existe(CasoJudicialComponent novoCaso) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public CasoJudicialComponent criarCaso(CasoJudicialComponent novoCaso) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public CasoJudicialComponent atualizarCaso(Long id, CasoJudicialComponent casoAtualizado) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public CasoJudicialComponent deletarCaso(Long id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public CasoJudicialComponent atualizarCaso(Long id, Map<String, Object> atualizacoes) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public CasoJudicial getCasoByNumeroUnico(String numeroUnico) {
        final List<CasoJudicial> resultado = this.repository.findByNumeroUnico(numeroUnico);

        return resultado.isEmpty() ? new CasoJudicial() : resultado.get(0);
    }
}
