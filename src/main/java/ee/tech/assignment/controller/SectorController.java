package ee.tech.assignment.controller;

import ee.tech.assignment.dto.SectorDto;
import ee.tech.assignment.service.SectorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/sector")
public class SectorController {

    @Autowired
    SectorService sectorService;

    @GetMapping("")
    public List<SectorDto> getAllSectors() {
        return sectorService.getAllSectors();
    }
}
