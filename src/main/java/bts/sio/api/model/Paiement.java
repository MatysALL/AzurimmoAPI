package bts.sio.api.model;

import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDate;

@Data
@Entity
@Table(name = "paiement")
public class Paiement {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name="montant")
    private Double montant;

    @Column(name="datePaiement")
    private LocalDate datePaiement;

    @ManyToOne
    @JoinColumn(name = "contrat_id")
    private Contrat contrat;

}