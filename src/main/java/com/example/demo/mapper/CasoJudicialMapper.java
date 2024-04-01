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
package com.example.demo.mapper;

import com.example.demo.component.CasoJudicialComponent;
import com.example.demo.dto.CasoJudicialDTO;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;

/**
 *
 * @author Carlos Romel Pereira da Silva, <carlos.romel@gmail.com>
 */
@Mapper
public interface CasoJudicialMapper {

    CasoJudicialMapper INSTANCE = Mappers.getMapper(CasoJudicialMapper.class);

    @Mapping(source = "numero", target = "numero")
    @Mapping(source = "decisao", target = "decisao")
    @Mapping(source = "descricao", target = "descricao")
    CasoJudicialDTO casoJudicialToDTO(CasoJudicialComponent casoJudicial);

    @Mapping(source = "numero", target = "numero")
    @Mapping(source = "decisao", target = "decisao")
    @Mapping(source = "descricao", target = "descricao")
    CasoJudicialComponent dtoToCasoJudicial(CasoJudicialDTO casoJudicialDTO);
}
