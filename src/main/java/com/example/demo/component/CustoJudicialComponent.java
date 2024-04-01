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
package com.example.demo.component;

import java.time.LocalDate;
import org.springframework.stereotype.Component;

/**
 *
 * @author Carlos Romel Pereira da Silva, <carlos.romel@gmail.com>
 */
@Component
public class CustoJudicialComponent {

    private double custo;
    private int anoJulgamento;

    public CustoJudicialComponent() {
        this.custo = 0;
        this.anoJulgamento = 0;
    }

    public double adicionarCusto(int anoJulgamento) {
        this.anoJulgamento = anoJulgamento;
        int idade = LocalDate.now().getYear() - anoJulgamento;
        return this.custo + (idade * 1.1);
    }

    public double getCusto() {
        return this.custo;
    }

    public int getAnoJulgamento() {
        return this.anoJulgamento;
    }
}
