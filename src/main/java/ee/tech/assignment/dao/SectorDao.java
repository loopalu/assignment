package ee.tech.assignment.dao;

import ee.tech.assignment.model.Sector;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Transactional
public class SectorDao {

    @PersistenceContext
    private EntityManager entityManager;

    public List<Sector> getAllSectors() {
        return entityManager.createQuery("SELECT s FROM Sector s", Sector.class).getResultList();
    }
}