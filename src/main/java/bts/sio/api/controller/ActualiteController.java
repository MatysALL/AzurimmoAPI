package bts.sio.api.controller;

import bts.sio.api.model.Actualite;
import bts.sio.api.model.Epreuve;
import bts.sio.api.model.Sport;
import bts.sio.api.service.ActualiteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.Optional;


@RestController
public class ActualiteController {

    @Autowired
    private ActualiteService actualiteService;

    /**
     * Read - Get all actualites
     * @return - An Iterable object of actualite full filled
     */
    @GetMapping("/actualites")
    public Iterable<Actualite> getActualites() {
        return actualiteService.getActualites();
    }

    /**
     * Read - Get one actualite
     * @param id The id of the actualite
     * @return An actualite object full filled
     */
    @GetMapping("/actualite/{id}")
    public Actualite getActualite(@PathVariable("id") final Long id) {
        Optional<Actualite> actualite = actualiteService.getActualite(id);
        if(actualite.isPresent()) {
            return actualite.get();
        } else {
            return null;
        }
    }

    /**
     * Create - Add a new actualite
     * @param actualite An object actualite
     * @return The actualite object saved
     */
    @PostMapping("/actualite")
    public Actualite createActualite(@RequestBody Actualite actualite) {
        return actualiteService.saveActualite(actualite);
    }

    @PutMapping("/actualite/{id}")
    public Actualite updateActualite(@PathVariable("id") final Long id, @RequestBody Actualite actualite) {
        Optional<Actualite> a = actualiteService.getActualite(id);
        if (a.isPresent()) {
            Actualite currentActualite = a.get();

            String titre = actualite.getTitre();
            if (titre != null) {
                currentActualite.setTitre(titre);
            }

            // Modification de la date
            LocalDate date = actualite.getDate();
            if (date != null) {
                currentActualite.setDate(date);
            }

            String contenu = actualite.getContenu();
            if (contenu != null) {
                currentActualite.setContenu(contenu);
            }

            // Modification du sport
            Sport sport = actualite.getSport();
            if (sport != null) {
                currentActualite.setSport(sport);
            }

            // Modification du epreuve
            Epreuve epreuve = actualite.getEpreuve();
            if (epreuve != null) {
                currentActualite.setEpreuve(epreuve);
            }

            actualiteService.saveActualite(currentActualite);
            return currentActualite;
        } else {
            return null;
        }
    }

}
