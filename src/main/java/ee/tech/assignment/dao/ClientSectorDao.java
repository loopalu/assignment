package ee.tech.assignment.dao;

import ee.tech.assignment.model.ClientSector;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Repository
public class ClientSectorDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Transactional
    public void save(ClientSector clientSector) {
        entityManager.persist(clientSector);
    }

    @Transactional
    public void deleteByClientId(Long clientId) {
        entityManager.createQuery("DELETE FROM ClientSector cs WHERE cs.clientId = :clientId")
                .setParameter("clientId", clientId)
                .executeUpdate();
    }

    @Transactional
    public List<String> getClientSectorsByClientId(Long clientId) {
        String jpql = "SELECT cs.sectorId FROM ClientSector cs WHERE cs.clientId = :clientId";
        TypedQuery<Long> query = entityManager.createQuery(jpql, Long.class);
        query.setParameter("clientId", clientId);

        List<Long> sectorIds = query.getResultList();
        return sectorIds.stream().map(String::valueOf).collect(Collectors.toList());
    }
}
