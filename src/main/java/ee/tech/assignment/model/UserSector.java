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
@Table(name = "usersector")
public class UserSector {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "usersector_id_seq")
    @SequenceGenerator(name = "usersector_id_seq", sequenceName = "seq_usersector", allocationSize = 1)
    private int id;

    @ManyToOne
    @JoinColumn(name = "userid", nullable = false)
    private User user;

    @ManyToOne
    @JoinColumn(name = "sectorid", nullable = false)
    private Sector sector;

    @Column(name = "selected", nullable = false)
    private boolean selected;
}