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
package com.example.demo;

import com.example.demo.component.CasoJudicialComponent;
import com.example.demo.model.CasoJudicial;
import com.example.demo.service.CasoJudicialService;
import org.springframework.amqp.rabbit.annotation.EnableRabbit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 *
 * @author Carlos Romel Pereira da Silva, <carlos.romel@gmail.com>
 */
@EnableRabbit
@SpringBootApplication
public class ProjetoApplication implements CommandLineRunner {

    @Autowired
    private CasoJudicialComponent casoComponent;

    @Autowired
    private CasoJudicialService servico;

    public static void main(String[] args) {
        SpringApplication.run(ProjetoApplication.class, args);
    }

    @Override
    public void run(String... args) throws Exception {
        System.out.println("Teste2");
        casoComponent.finalizarCusto(100, "GO", 2017);

        System.out.println(casoComponent);

        for (CasoJudicial caso : servico.getTodosOsCasos()) {
            System.out.println(caso);
        }

        System.out.println(this.servico.getCasoByNumeroUnico("x0000003-01.2024.5.18.0001"));
    }
}
