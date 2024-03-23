package ee.tech.assignment.controller;

import ee.tech.assignment.dto.ClientDto;
import ee.tech.assignment.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/client")
public class ClientController {

    @Autowired
    ClientService clientService;

    @PostMapping("")
    public ClientDto saveOrUpdateClientSelections(@RequestBody ClientDto clientDto) {
        return clientService.saveOrUpdateClientSelections(clientDto);
    }
}
