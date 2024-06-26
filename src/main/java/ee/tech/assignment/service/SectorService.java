package ee.tech.assignment.service;

import ee.tech.assignment.dao.SectorDao;
import ee.tech.assignment.dto.SectorDto;
import ee.tech.assignment.model.Sector;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class SectorService {

    @Autowired
    SectorDao sectorDao;

    public List<SectorDto> getAllSectors() {
        List<Sector> sectors = sectorDao.getAllSectors();
        return sectors.stream()
                .map(sector -> new SectorDto(sector.getId(), sector.getSectorName(), sector.getParentId()))
                .collect(Collectors.toList());
    }
}
