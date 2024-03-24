package ee.tech.assignment.dao;

import ee.tech.assignment.model.ClientSector;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.Arrays;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.anyString;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class ClientSectorDaoTest {

    @Mock
    private EntityManager entityManager;

    @InjectMocks
    private ClientSectorDao clientSectorDao;

    @Test
    void testSave() {
        ClientSector clientSector = new ClientSector();
        clientSector.setClientId(10L);
        clientSector.setSectorId(519L);

        clientSectorDao.save(clientSector);

        verify(entityManager, times(1)).persist(eq(clientSector));
    }

    @Test
    void testDeleteByClientId() {
        Long clientId = 1L;

        Query mockQuery = mock(Query.class);
        when(entityManager.createQuery(anyString())).thenReturn(mockQuery);
        when(mockQuery.setParameter(eq("clientId"), eq(clientId))).thenReturn(mockQuery);

        clientSectorDao.deleteByClientId(clientId);

        verify(entityManager).createQuery("DELETE FROM ClientSector cs WHERE cs.clientId = :clientId");
        verify(mockQuery).setParameter("clientId", clientId);
        verify(mockQuery).executeUpdate();
    }

    @Test
    void testGetClientSectorsByClientId() {
        Long clientId = 1L;
        List<Long> sectorIds = Arrays.asList(17L, 21L, 300L);

        TypedQuery<Long> query = mock(TypedQuery.class);
        when(entityManager.createQuery(any(String.class), eq(Long.class))).thenReturn(query);
        when(query.getResultList()).thenReturn(sectorIds);

        List<String> clientSectors = clientSectorDao.getClientSectorsByClientId(clientId);

        assertEquals(Arrays.asList("17", "21", "300"), clientSectors);
        verify(query, times(1)).setParameter(eq("clientId"), eq(clientId));
        verify(query, times(1)).getResultList();
    }
}
