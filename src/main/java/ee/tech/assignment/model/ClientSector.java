package ee.tech.assignment.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "clientsector")
public class ClientSector {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "clientsector_id_generator")
    @SequenceGenerator(name = "clientsector_id_generator", sequenceName = "seq_clientsector", allocationSize = 1)
    private Long id;

    @Column(name = "clientid")
    private Long clientId;

    @Column(name = "sectorid")
    private Long sectorId;
}