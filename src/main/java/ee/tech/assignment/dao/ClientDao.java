package ee.tech.assignment.dao;

import ee.tech.assignment.dto.ClientDto;
import ee.tech.assignment.model.Client;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class ClientDao {

    @PersistenceContext
    private EntityManager entityManager;

    public Client findByName(ClientDto clientDto) {
        Client client;
        try {
            client = entityManager
                    .createQuery("SELECT c FROM Client c WHERE c.name = :name", Client.class)
                    .setParameter("name", clientDto.getName())
                    .getSingleResult();
        } catch (NoResultException e) {
            // If no client is found, create a new client
            client = new Client();
            client.setName(clientDto.getName());
            client.setAgreedToTerms(clientDto.isAgreedToTerms());
            entityManager.persist(client);
        }
        return client;
    }
}
