package bts.sio.api.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
@Entity
@Table(name = "olympiade")
public class Olympiade {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String numero ;
    private Integer annee;
    private String ville ;

    @ManyToOne
    @JoinColumn(name = "pays_id")
    private Pays pays;

    @ManyToMany(mappedBy = "olympiades")
    @JsonBackReference
    private List<Athlete> athletes = new ArrayList<>();

}
