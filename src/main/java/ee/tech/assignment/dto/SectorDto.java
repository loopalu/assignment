package ee.tech.assignment.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SectorDto {
    private int sectorId;
    private String name;
    private Integer parentId;
}
