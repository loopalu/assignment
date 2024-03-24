package ee.tech.assignment.dao;

import ee.tech.assignment.dto.ClientDto;
import ee.tech.assignment.model.Client;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class ClientDaoTest {

    @Mock
    private EntityManager entityManager;

    @InjectMocks
    private ClientDao clientDao;

    private final String clientName = "Aivar";
    private ClientDto clientDto;

    @BeforeEach
    void setUp() {
        clientDto = new ClientDto();
        clientDto.setName(clientName);
        clientDto.setAgreedToTerms(true);
    }

    @Test
    void testFindExistingClientByName() {
        Client existingClient = new Client();
        existingClient.setName(clientName);

        TypedQuery<Client> query = mock(TypedQuery.class);
        when(entityManager.createQuery(anyString(), eq(Client.class))).thenReturn(query);
        when(query.setParameter("name", clientName)).thenReturn(query);
        when(query.getSingleResult()).thenReturn(existingClient);

        Client foundClient = clientDao.findByName(clientDto);

        assertEquals(clientName, foundClient.getName(), "The client name should match.");
        verify(entityManager, never()).persist(any(Client.class));
    }

    @Test
    void testCreateNewClientWhenNotFound() {
        TypedQuery<Client> query = mock(TypedQuery.class);
        when(entityManager.createQuery(anyString(), eq(Client.class))).thenReturn(query);
        when(query.setParameter("name", clientName)).thenReturn(query);
        when(query.getSingleResult()).thenThrow(new NoResultException());

        Client newClient = clientDao.findByName(clientDto);

        assertEquals(clientName, newClient.getName(), "The client name should match.");
        assertTrue(newClient.isAgreedToTerms(), "The terms agreement state should match.");
        verify(entityManager, times(1)).persist(any(Client.class));
    }
}
