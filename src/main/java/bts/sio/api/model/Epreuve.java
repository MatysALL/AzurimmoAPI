package bts.sio.api.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
@Entity
@Table(name = "epreuve")
public class Epreuve {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name="nom")
    private String nom;

    @ManyToOne
    @JoinColumn(name = "sport_id")
    private Sport sport;
}
