package bts.sio.api.model;

import jakarta.persistence.Entity;
import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDate;

@Data
@Entity
@Table(name = "reparation")
public class Reparation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name="dateReparation")
    private LocalDate dateReparation;

    @Column(name="description")
    private String description;

    @Column(name="type")
    private String type;

    @Column(name="societe")
    private String societe;

    @ManyToOne
    @JoinColumn(name = "appartement_id")
    private Appartement appartement;
}