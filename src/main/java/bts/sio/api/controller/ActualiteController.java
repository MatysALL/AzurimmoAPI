package bts.sio.api.controller;

import bts.sio.api.model.Actualite;
import bts.sio.api.model.Epreuve;
import bts.sio.api.model.Sport;
import bts.sio.api.service.ActualiteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.Optional;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.tags.Tag;


@RestController
@Tag(name = "Actualités", description = "API pour la gestion des actualités")
public class ActualiteController {

    @Autowired
    private ActualiteService actualiteService;

    /**
     * Read - Get all actualites
     * @return - An Iterable object of actualite full filled
     */

    @Operation(
            summary = "Récupérer toutes les actualités",
            description = "Permet de récupérer la liste de toutes les actualités"
    )
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Liste des actualités récupérée avec succès"),
            @ApiResponse(responseCode = "500", description = "Erreur interne du serveur")
    })
    @GetMapping("/actualites")
    public Iterable<Actualite> getActualites() {
        return actualiteService.getActualites();
    }

    /**
     * Read - Get one actualite
     * @param id The id of the actualite
     * @return An actualite object full filled
     */

    @Operation(
            summary = "Récupérer une actualité",
            description = "Permet de récupérer une actualité par son ID"
    )
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Actualité trouvée"),
            @ApiResponse(responseCode = "404", description = "Actualité non trouvée"),
            @ApiResponse(responseCode = "500", description = "Erreur interne du serveur")
    })
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

    @Operation(
            summary = "Ajouter une actualité",
            description = "Permet d'ajouter une nouvelle actualité"
    )
    @ApiResponses({
            @ApiResponse(responseCode = "201", description = "Actualité ajoutée avec succès"),
            @ApiResponse(responseCode = "400", description = "Requête invalide"),
            @ApiResponse(responseCode = "500", description = "Erreur interne du serveur")
    })
    @PostMapping("/actualite")
    public Actualite createActualite(@RequestBody Actualite actualite) {
        return actualiteService.saveActualite(actualite);
    }


    @Operation(
            summary = "Mettre à jour une actualité",
            description = "Permet de modifier une actualité existante"
    )
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Actualité mise à jour avec succès"),
            @ApiResponse(responseCode = "404", description = "Actualité non trouvée"),
            @ApiResponse(responseCode = "400", description = "Requête invalide"),
            @ApiResponse(responseCode = "500", description = "Erreur interne du serveur")
    })
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
