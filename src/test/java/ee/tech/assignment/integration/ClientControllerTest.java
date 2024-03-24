package ee.tech.assignment.integration;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class ClientControllerTest {

    @Autowired
    private TestRestTemplate restTemplate;

    private static final ObjectMapper objectMapper = new ObjectMapper();

    private JsonNode requestBody;
    private JsonNode expectedResponse;

    @BeforeEach
    public void setup() throws Exception {
        String requestJson = "{\"name\":\"LinkedIn\",\"selectedSectors\":[\"25\",\"122\"],\"agreedToTerms\":true}";
        String responseJson = "{\"name\":\"LinkedIn\",\"selectedSectors\":[\"25\",\"122\"],\"agreedToTerms\":true}";
        requestBody = objectMapper.readTree(requestJson);
        expectedResponse = objectMapper.readTree(responseJson);
    }

    @Test
    public void testSaveOrUpdateClientSelections() throws Exception {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        HttpEntity<String> requestEntity = new HttpEntity<>(requestBody.toString(), headers);

        ResponseEntity<String> response = restTemplate.postForEntity("/client", requestEntity, String.class);

        assertThat(response.getStatusCode()).isEqualTo(HttpStatus.OK);
        assertThat(response.getBody()).isNotNull();

        JsonNode actualResponse = objectMapper.readTree(response.getBody());

        assertThat(actualResponse).isEqualTo(expectedResponse);
    }
}
