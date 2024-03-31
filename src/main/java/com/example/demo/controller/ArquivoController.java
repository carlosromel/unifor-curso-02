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
/**
 *
 * @author Carlos Romel Pereira da Silva, <carlos.romel@gmail.com>
 */
package com.example.demo.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/api/arquivos")
public class ArquivoController {

    private static final String DIR_UPLOAD = "uploads/";
    private static final String DIR_DOWNLOAD = "downloads/";

    @PostMapping("/upload")
    public ResponseEntity<String> uploadArquivo(@RequestParam("file") MultipartFile file) {
        if (file.isEmpty()) {
            return new ResponseEntity<>(
                    "Selecione um arquivo para fazer upload",
                    HttpStatus.BAD_REQUEST);
        } else {
            try {
                byte[] bytes = file.getBytes();
                Path path = Paths.get(DIR_UPLOAD + file.getOriginalFilename());
                Files.write(path, bytes);
                return new ResponseEntity<>("Arquivo carregado com sucesso!",
                        HttpStatus.OK);
            } catch (IOException e) {
                return new ResponseEntity<>("Falha ao fazer upload do arquivo.",
                        HttpStatus.INTERNAL_SERVER_ERROR);
            }
        }
    }

    @GetMapping("/download/{filename}")
    public ResponseEntity<byte[]> downloadFile(@PathVariable("filename") String filename) {
        String header = String.format("Content-Disposition",
                "attachment; filename='%s'", filename);

        try {
            Path filePath = Paths.get(DIR_DOWNLOAD + filename);
            byte[] fileBytes = Files.readAllBytes(filePath);

            return ResponseEntity
                    .ok()
                    .header(header)
                    .body(fileBytes);
        } catch (IOException e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
