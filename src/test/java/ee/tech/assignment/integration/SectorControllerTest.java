package ee.tech.assignment.integration;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;

import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;

import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class SectorControllerTest {

    @Autowired
    private TestRestTemplate restTemplate;

    private static final ObjectMapper objectMapper = new ObjectMapper();
    private JsonNode expectedResponse;

    @BeforeEach
    public void setup() throws IOException {
        ClassPathResource resource = new ClassPathResource("sectors.json");
        String responseJson = FileCopyUtils.copyToString(new InputStreamReader(resource.getInputStream(), StandardCharsets.UTF_8));
        expectedResponse = objectMapper.readTree(responseJson);
    }

    @Test
    public void testGetAllSectors() throws Exception {
        ResponseEntity<String> response = restTemplate.getForEntity("/sector", String.class);

        assertThat(response.getStatusCodeValue()).isEqualTo(200);
        assertThat(response.getBody()).isNotNull();

        JsonNode actualResponse = objectMapper.readTree(response.getBody());

        assertThat(actualResponse).isEqualTo(expectedResponse);
    }
}