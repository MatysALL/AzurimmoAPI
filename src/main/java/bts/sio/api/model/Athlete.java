package bts.sio.api.model;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.Data;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Data
@Entity
@Table(name = "athlete")
public class Athlete {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name="nom")
    private String nom;

    @Column(name="prenom")
    private String prenom;

    @Column(name="datenaiss")
    private LocalDate dateNaiss;

    @ManyToOne
    @JoinColumn(name = "pays_id")
    private Pays pays;

    @ManyToOne
    @JoinColumn(name = "sport_id")
    private Sport sport;

    @ManyToMany
    @JoinTable( name = "athlete_olympiade",
            joinColumns = @JoinColumn( name = "athlete_id" ),
            inverseJoinColumns = @JoinColumn( name = "olympiade_id" )
    )
    private List<Olympiade> olympiades = new ArrayList<>();


    @ManyToMany
    @JoinTable(
            name = "athlete_epreuve", // Nom de la table de jointure
            joinColumns = @JoinColumn(name = "athlete_id"),
            inverseJoinColumns = @JoinColumn(name = "epreuve_id")
    )
    private List<Epreuve> epreuves = new ArrayList<>();

}
