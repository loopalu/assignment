package ee.tech.assignment.dao;

import ee.tech.assignment.model.ClientSector;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class ClientSectorDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Transactional
    public void save(ClientSector clientSector) {
        entityManager.merge(clientSector);
    }

    @Transactional
    public void deleteByClientId(Long clientId) {
        entityManager.createQuery("DELETE FROM ClientSector cs WHERE cs.clientId = :clientId")
                .setParameter("clientId", clientId)
                .executeUpdate();
    }
}
