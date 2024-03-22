package ee.tech.assignment.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "sector")
public class Sector {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "sector_id_seq")
    @SequenceGenerator(name = "sector_id_seq", sequenceName = "seq_sector", allocationSize = 1)
    private int id;

    @Column(name = "sectorname", nullable = false, length = 100)
    private String sectorName;

    @ManyToOne
    @JoinColumn(name = "parentid")
    private Sector parent;
}
