package bts.sio.api.controller;

import bts.sio.api.model.Epreuve;
import bts.sio.api.model.Sport;
import bts.sio.api.service.EpreuveService;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;


import java.util.Optional;

@RestController
@Tag(name = "Epreuves", description = "API pour la gestion des épreuves")
public class EpreuveController {

    @Autowired
    private EpreuveService epreuveService;

    /**
     * Create - Add a new epreuve
     * @param epreuve An object epreuve
     * @return The epreuve object saved
     */
    @Operation(
            summary = "Ajouter une épreuve",
            description = "Permet d'ajouter une épreuve"
    )
    @ApiResponses({
            @ApiResponse(responseCode = "201", description = "Épreuve ajoutée avec succès"),
            @ApiResponse(responseCode = "400", description = "Requête invalide"),
            @ApiResponse(responseCode = "409", description = "Épreuve existe déjà"),
            @ApiResponse(responseCode = "500", description = "Erreur interne du serveur")
    })
    @PostMapping("/epreuve")
    public Epreuve createEpreuve(@RequestBody Epreuve epreuve) {
        return epreuveService.saveEpreuve(epreuve);
    }


    /**
     * Read - Get one epreuve
     * @param id The id of the epreuve
     * @return An epreuve object full filled
     */

    @Operation(summary = "Récupérer une épreuve", description = "Permet de récupérer une épreuve par son ID")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Épreuve trouvée"),
            @ApiResponse(responseCode = "404", description = "Épreuve non trouvée"),
            @ApiResponse(responseCode = "500", description = "Erreur interne du serveur")
    })
    @GetMapping("/epreuve/{id}")
    public Epreuve getEpreuve(@PathVariable("id") final Long id) {
        Optional<Epreuve> epreuve = epreuveService.getEpreuve(id);
        if(epreuve.isPresent()) {
            return epreuve.get();
        } else {
            return null;
        }
    }

    /**
     * Read - Get all epreuves
     * @return - An Iterable object of Athlete full filled
     */

    @Operation(summary = "Récupérer toutes les épreuves", description = "Permet de récupérer la liste de toutes les épreuves")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Liste des épreuves récupérée avec succès"),
            @ApiResponse(responseCode = "500", description = "Erreur interne du serveur")
    })
    @GetMapping("/epreuves")
    public Iterable<Epreuve> getEpreuves() {
        return epreuveService.getEpreuves();
    }

    /**
     * Update - Update an existing epreuve
     * @param id - The id of the epreuve to update
     * @param epreuve - The epreuve object updated
     * @return
     */

    @Operation(summary = "Mettre à jour une épreuve", description = "Permet de modifier une épreuve existante")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Épreuve mise à jour avec succès"),
            @ApiResponse(responseCode = "404", description = "Épreuve non trouvée"),
            @ApiResponse(responseCode = "400", description = "Requête invalide"),
            @ApiResponse(responseCode = "500", description = "Erreur interne du serveur")
    })
    @PutMapping("/epreuve/{id}")
    public Epreuve updateEpreuve(@PathVariable("id") final Long id, @RequestBody Epreuve epreuve) {
        Optional<Epreuve> e = epreuveService.getEpreuve(id);
        if (e.isPresent()) {
            Epreuve currentEpreuve = e.get();

            String nom = epreuve.getNom();
            if (nom != null) {
                currentEpreuve.setNom(nom);
            }

            Sport sport = epreuve.getSport(); // Assurez-vous que l'objet Sport est correctement récupéré
            if (sport != null) {
                currentEpreuve.setSport(sport);
            }


            epreuveService.saveEpreuve(currentEpreuve);
            return currentEpreuve;
        } else {
            return null; // Gérer l'absence d'athlète
        }
    }



    /**
     * Delete - Delete an epreuve
     * @param id - The id of the athlete to epreuve
     */
    @Operation(summary = "Supprimer une épreuve", description = "Permet de supprimer une épreuve existante")
    @ApiResponses({
            @ApiResponse(responseCode = "204", description = "Épreuve supprimée avec succès"),
            @ApiResponse(responseCode = "404", description = "Épreuve non trouvée"),
            @ApiResponse(responseCode = "500", description = "Erreur interne du serveur")
    })
    @DeleteMapping("/epreuve/{id}")
    public void deleteEpreuve(@PathVariable("id") final Long id) {
        epreuveService.deleteEpreuve(id);
    }

}
