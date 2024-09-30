package bts.sio.api.controller;

import bts.sio.api.model.Athlete;
import bts.sio.api.model.Epreuve;
import java.time.LocalDate;
import bts.sio.api.model.Sport;
import bts.sio.api.model.Pays;
import bts.sio.api.service.AthleteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;


import java.util.Optional;

@RestController
public class AthleteController {

    @Autowired
    private AthleteService athleteService;

    /**
     * Create - Add a new athlete
     * @param athlete An object athlete
     * @return The athlete object saved
     */
    @PostMapping("/athlete")
    public Athlete createAthlete(@RequestBody Athlete athlete) {
        return athleteService.saveAthlete(athlete);
    }


    /**
     * Read - Get one athlete
     * @param id The id of the athlete
     * @return An Athlete object full filled
     */
    @GetMapping("/athlete/{id}")
    public Athlete getAthlete(@PathVariable("id") final Long id) {
        Optional<Athlete> athlete = athleteService.getAthlete(id);
        if(athlete.isPresent()) {
            return athlete.get();
        } else {
            return null;
        }
    }

    /**
     * Read - Get all athletes
     * @return - An Iterable object of Athlete full filled
     */
    @GetMapping("/athletes")
    public Iterable<Athlete> getAthletes() {
        return athleteService.getAthletes();
    }

    /**
     * Update - Update an existing athlete
     * @param id - The id of the athlete to update
     * @param athlete - The athlete object updated
     * @return
     */
    @PutMapping("/athlete/{id}")
    public Athlete updateAthlete(@PathVariable("id") final Long id, @RequestBody Athlete athlete) {
        Optional<Athlete> e = athleteService.getAthlete(id);
        if (e.isPresent()) {
            Athlete currentAthlete = e.get();

            String nom = athlete.getNom();
            if (nom != null) {
                currentAthlete.setNom(nom);
            }

            String prenom = athlete.getPrenom();
            if (prenom != null) {
                currentAthlete.setPrenom(prenom);
            }

            // Modification de la date de naissance
            LocalDate dateNaissance = athlete.getDateNaiss();
            if (dateNaissance != null) {
                currentAthlete.setDateNaiss(dateNaissance);
            }

            // Modification du sport
            Sport sport = athlete.getSport(); // Assurez-vous que l'objet Sport est correctement récupéré
            if (sport != null) {
                currentAthlete.setSport(sport);
            }

            // Modification du pays
            Pays pays = athlete.getPays(); // Assurez-vous que l'objet Pays est correctement récupéré
            if (pays != null) {
                currentAthlete.setPays(pays);
            }

            athleteService.saveAthlete(currentAthlete);
            return currentAthlete;
        } else {
            return null; // Gérer l'absence d'athlète
        }
    }

    /**
     * Delete - Delete an athlete
     * @param id - The id of the athlete to delete
     */
    @DeleteMapping("/athlete/{id}")
    public void deleteAthlete(@PathVariable("id") final Long id) {
        athleteService.deleteAthlete(id);
    }

    @GetMapping("/athlete/{athleteId}/epreuves")
    public List<Epreuve> getEpreuvesByAthlete(@PathVariable Long athleteId) {
        return athleteService.getEpreuvesByAthleteId(athleteId);
    }

    @PostMapping("/athlete/{athleteId}/addEpreuves")
    public Athlete addEpreuves(@PathVariable Long athleteId, @RequestBody List<Long> epreuveIds) {
        return athleteService.addEpreuvesToAthlete(athleteId, epreuveIds);
    }
}
