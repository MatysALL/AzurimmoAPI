package bts.sio.api.controller;

import bts.sio.api.model.Pays;
import bts.sio.api.service.PaysService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Tag(name = "Pays", description = "API pour la gestion des pays")
public class PaysController {

    @Autowired
    private PaysService paysService;

    /**
     * Read - Get all apys
     * @return - An Iterable object of Pays full filled
     */

    @Operation(summary = "Récupérer tous les pays", description = "Permet de récupérer la liste des pays")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "Liste des pays récupérée avec succès"),
            @ApiResponse(responseCode = "500", description = "Erreur interne du serveur")
    })
    @GetMapping("/pays")
    public Iterable<Pays> getAthletes() {
        return paysService.getLesPays();
    }
}
