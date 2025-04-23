package bts.sio.api.controller;

import bts.sio.api.model.Appartement;
import bts.sio.api.model.Batiment;
import bts.sio.api.service.AppartementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import java.util.Optional;

@RestController
public class AppartementController {

    @Autowired
    private AppartementService appartementService;

    @GetMapping("/appartements")
    public Iterable<Appartement> getAllAppartements() {
        return appartementService.getAppartements();
    }

    @GetMapping("/appartements/ville/{ville}")
    public List<Appartement> findByVille(@PathVariable String ville) {
        return appartementService.getAppartementsByVille(ville);
    }

    @GetMapping("/appartement/batiment/{batimentId}")
    public List<Appartement> findByBatimentId(@PathVariable long batimentId) {
        return appartementService.getAppartementsParBatiment(batimentId);
    }

    @GetMapping("/appartement/{id}")
    public Appartement getAppartement(@PathVariable final Long id) {
        Optional<Appartement> appartement = appartementService.getAppartementById(id);
        return appartement.orElse(null);
    }

    @PostMapping("/appartement")
    public Appartement addAppartement(@RequestBody Appartement appartement) {
        return appartementService.saveAppartement(appartement);
    }

    @PutMapping("/appartement/{id}")
    public Appartement updateAppartement(@PathVariable("id") final Long id, @RequestBody Appartement appartement) {
        Optional<Appartement> a = appartementService.getAppartementById(id);
        if(a.isPresent()) {
            Appartement currentAppartement = a.get();

            String description = appartement.getDescription();
            if (description != null) {
                currentAppartement.setDescription(description);
            }

            Integer nbPiece = appartement.getNbPiece();
            if (nbPiece != null) {
                currentAppartement.setNbPiece(nbPiece);
            }

            String numero = appartement.getNumero();
            if (numero != null) {
                currentAppartement.setNumero(numero);
            }

            Float surface = appartement.getSurface();
            if (surface != null) {
                currentAppartement.setSurface(surface);
            }

            Batiment batiment = appartement.getBatiment();
            if (batiment != null) {
                currentAppartement.setBatiment(batiment);
            }

            appartementService.saveAppartement(currentAppartement);
            return currentAppartement;
        } else {
            return null;
        }
    }

    @DeleteMapping("/appartement/{id}")
    public void deleteAppartement(@PathVariable("id") final Long id) {
        appartementService.deleteAppartement(id);
    }
}