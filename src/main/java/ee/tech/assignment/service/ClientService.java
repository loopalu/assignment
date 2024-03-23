package ee.tech.assignment.service;

import ee.tech.assignment.dao.ClientDao;
import ee.tech.assignment.dao.ClientSectorDao;
import ee.tech.assignment.dto.ClientDto;
import ee.tech.assignment.model.Client;
import ee.tech.assignment.model.ClientSector;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ClientService {

    @Autowired
    ClientDao clientDao;

    @Autowired
    ClientSectorDao clientSectorDao;

    public void saveOrUpdateClientSelections(ClientDto clientDto) {
        Client client = clientDao.findByName(clientDto);

        clientSectorDao.deleteByClientId(client.getId());
        for (String sectorId : clientDto.getSelectedSectors()) {
            ClientSector clientSector = new ClientSector();
            clientSector.setClientId(client.getId());
            clientSector.setSectorId(Long.parseLong(sectorId));
            clientSectorDao.save(clientSector);
        }
    }
}
