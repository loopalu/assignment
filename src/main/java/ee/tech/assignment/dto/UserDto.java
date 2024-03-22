package ee.tech.assignment.dto;

import lombok.Data;

import java.util.List;

@Data
public class UserDto {
    private int userId;
    private String name;
    private List<SectorDto> selectedSectors;
    private boolean agreedToTerms;
}
