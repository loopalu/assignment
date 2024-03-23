package ee.tech.assignment.dao;

import ee.tech.assignment.model.Sector;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class SectorDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Transactional(readOnly = true)
    public List<Sector> getAllSectors() {
        return entityManager.createQuery("SELECT s FROM Sector s", Sector.class).getResultList();
    }
}