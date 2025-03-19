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
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.parameters.RequestBody;


import java.util.Optional;

@RestController
@Tag(name = "Athlètes", description = "API pour la gestion des athlètes")
public class AthleteController {

    @Autowired
    private AthleteService athleteService;

    /**
     * Create - Add a new athlete
     * @param athlete An object athlete
     * @return The athlete object saved
     */

    @Operation(
            summary = "Ajouter un athlète",
            description = "Permet d'ajouter un athlète"
    )
    @ApiResponses({
            @ApiResponse(responseCode = "201", description = "Athlète ajouté avec succès"),
            @ApiResponse(responseCode = "400", description = "Requête invalide"),
            @ApiResponse(responseCode = "409", description = "Athlète existe déjà"),
            @ApiResponse(responseCode = "500", description = "Erreur interne du serveur")
    })
    @PostMapping("/athlete")
    public Athlete createAthlete(@RequestBody Athlete athlete) {
        return athleteService.saveAthlete(athlete);
    }


    /**
     * Read - Get one athlete
     * @param id The id of the athlete
     * @return An Athlete object full filled
     */

    @Operation(
            summary = "Récupérer un athlète",
            description = "Permet de récupérer un athlète par son ID"
    )
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Athlète trouvé"),
            @ApiResponse(responseCode = "404", description = "Athlète non trouvé"),
            @ApiResponse(responseCode = "500", description = "Erreur interne du serveur")
    })
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

    @Operation(
            summary = "Récupérer tous les athlètes",
            description = "Permet de récupérer la liste de tous les athlètes"
    )
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Liste des athlètes récupérée avec succès"),
            @ApiResponse(responseCode = "500", description = "Erreur interne du serveur")
    })
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

    @Operation(
            summary = "Mettre à jour un athlète",
            description = "Permet de modifier un athlète existant"
    )
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Athlète mis à jour avec succès"),
            @ApiResponse(responseCode = "404", description = "Athlète non trouvé"),
            @ApiResponse(responseCode = "400", description = "Requête invalide"),
            @ApiResponse(responseCode = "500", description = "Erreur interne du serveur")
    })
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

    @Operation(
            summary = "Supprimer un athlète",
            description = "Permet de supprimer un athlète existant"
    )
    @ApiResponses({
            @ApiResponse(responseCode = "204", description = "Athlète supprimé avec succès"),
            @ApiResponse(responseCode = "404", description = "Athlète non trouvé"),
            @ApiResponse(responseCode = "500", description = "Erreur interne du serveur")
    })
    @DeleteMapping("/athlete/{id}")
    public void deleteAthlete(@PathVariable("id") final Long id) {
        athleteService.deleteAthlete(id);
    }

    @Operation(
            summary = "Récupérer les épreuves d'un athlète",
            description = "Permet de récupérer toutes les épreuves associées à un athlète"
    )
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Liste des épreuves récupérée avec succès"),
            @ApiResponse(responseCode = "404", description = "Athlète non trouvé"),
            @ApiResponse(responseCode = "500", description = "Erreur interne du serveur")
    })
    @GetMapping("/athlete/{athleteId}/epreuves")
    public List<Epreuve> getEpreuvesByAthlete(@PathVariable Long athleteId) {
        return athleteService.getEpreuvesByAthleteId(athleteId);
    }
}
