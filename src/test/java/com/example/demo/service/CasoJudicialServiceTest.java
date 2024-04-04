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
import java.util.List;
import java.util.Optional;
import org.junit.jupiter.api.AfterEach;
import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import static org.springframework.test.util.AssertionErrors.assertFalse;
import static org.springframework.test.util.AssertionErrors.assertNotNull;
import static org.springframework.test.util.AssertionErrors.assertTrue;

/**
 *
 * @author Carlos Romel Pereira da Silva, <carlos.romel@gmail.com>
 */
@SpringBootTest
public class CasoJudicialServiceTest {

    @Autowired
    CasoJudicialService instance;

    /**
     * Relacionar o inventário de casos judiciais existentes.
     */
    @BeforeEach
    private void head() {
        lista("Casos iniciais");
    }

    @AfterEach
    private void tail() {
        lista("Casos finais");
    }

    private void lista(String titulo) {
        System.out.printf("--- 8< [ %s ] --- 8< ---", titulo);

        for (CasoJudicial caso : instance.getTodosOsCasos()) {
            System.out.println(caso);
        }
        System.out.println("--- >8 ---");
    }

    @Test
    public void testPOSTCriarCaso() {
        CasoJudicial caso = new CasoJudicial(
                "0000002-02.2024.5.18.0002",
                "A",
                "FGTS");

        CasoJudicial recuperado = instance.criarCaso(caso);
        assertNotNull("Caso Judicial não criado.",
                recuperado);
    }

    @Test
    public void testFindById() {
        Long id = 1L;
        Optional<CasoJudicial> existente = instance.findById(id);

        assertTrue("Caso judicial não encontrado.",
                existente.isPresent());
    }

    @Test
    public void testGetTodosOsCasos() {
        List<CasoJudicial> casos = instance.getTodosOsCasos();

        assertFalse("A lista de casoss judiciais está vazia",
                casos.isEmpty());
    }

    @Test
    public void testExiste() {
        Long id = 1L;
        Optional<CasoJudicial> existente = instance.findById(id);

        assertTrue("O caso judicial procurado não existe",
                existente.isPresent());
    }

    @Test
    public void testPUTSubstituirCaso() {
        String numeroUnico = criarQuartoCasoJudicial();
        Optional<CasoJudicial> existente = instance.getCasoByNumeroUnico(numeroUnico);
        Long id = existente.get().getId();

        existente.get()
                .setNumeroUnico("0000009-09.2024.5.18.0009")
                .setDecisao("I")
                .setDescricao("Aposentadoria");

        CasoJudicial modificado = instance.substituirCaso(existente.get());
        Optional<CasoJudicial> conferencia = instance.findById(id);

        assertEquals(modificado.getDescricao(),
                conferencia.get().getDescricao());
    }

    @Test
    public void testGetCasoByNumeroUnico() {
        String numeroUnico = criarTerceiroCasoJudicial();
        Optional<CasoJudicial> existente = instance.getCasoByNumeroUnico(numeroUnico);

        assertTrue("O caso judicial não foi encontrado.",
                existente.isPresent());
    }

    @Test
    public void testPATCHAtualizarCaso() {
        String numeroUnico = criarPrimeiroCasoJudicial();
        Optional<CasoJudicial> existente = instance.getCasoByNumeroUnico(numeroUnico);
        Long id = existente.get().getId();
        /**
         * Modificamos algum atributo.
         */
        existente.get().setDecisao("I");
        existente.get().setNumeroUnico("0000008-08.2024.5.18.0008");

        Optional<CasoJudicial> atualizado = instance.atualizarCaso(id,
                existente.get());

        assertEquals(existente.get().getDecisao(),
                atualizado.get().getDecisao());
    }

    @Test
    public void testDeletarCaso() {
        String numeroUnico = criarPrimeiroCasoJudicial();
        Optional<CasoJudicial> existente = instance.getCasoByNumeroUnico(numeroUnico);
        Long id = existente.get().getId();

        instance.deletarCaso(id);

        Optional<CasoJudicial> recuperado = instance.getCasoByNumeroUnico(numeroUnico);

        assertFalse("O caso judicial não foi removido",
                recuperado.isPresent());
    }

    private String criarPrimeiroCasoJudicial() {

        return instance.criarCaso(new CasoJudicial(
                "0000001-01.2024.5.18.0001",
                "A",
                "Férias")).getNumeroUnico();
    }

    private String criarSegundoCasoJudicial() {

        return instance.criarCaso(new CasoJudicial(
                "0000002-02.2024.5.18.0002",
                "I",
                "Hora extra")).getNumeroUnico();
    }

    private String criarTerceiroCasoJudicial() {

        return instance.criarCaso(new CasoJudicial(
                "0000003-03.2024.5.18.0003",
                "C",
                "Banco de horas")).getNumeroUnico();
    }

    private String criarQuartoCasoJudicial() {

        return instance.criarCaso(new CasoJudicial(
                "0000004-04.2024.5.18.0004",
                "A",
                "Retenção de verbas")).getNumeroUnico();
    }
}
