package bts.sio.api.controller;


import bts.sio.api.model.*;
import bts.sio.api.service.ReparationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.Optional;

@RestController
public class ReparationController {

    @Autowired
    private ReparationService reparationService;

    @GetMapping("/reparations")
    public Iterable<Reparation> getAllReparations() {
        return reparationService.getReparations();
    }

    @GetMapping("/reparation/{id}")
    public Reparation getReparation(@PathVariable final Long id) {
        Optional<Reparation> reparation = reparationService.getReparationById(id);
        return reparation.orElse(null);
    }

    @PostMapping("/reparation")
    public Reparation addReparation(@RequestBody Reparation reparation) {
        return reparationService.saveReparation(reparation);
    }

    @PutMapping("/reparation/{id}")
    public Reparation updateReparation(@PathVariable("id") final Long id, @RequestBody Reparation reparation) {
        Optional<Reparation> r = reparationService.getReparationById(id);
        if(r.isPresent()) {
            Reparation currentReparation = r.get();

            LocalDate dateReparation = reparation.getDateReparation();
            if (dateReparation != null) {
                currentReparation.setDateReparation(dateReparation);
            }

            String description = reparation.getDescription();
            if(description != null) {
                currentReparation.setDescription(description);
            }

            String type = reparation.getType();
            if(type != null) {
                currentReparation.setType(type);
            }

            Societe societe = reparation.getSociete();
            if(societe != null) {
                currentReparation.setSociete(societe);
            }

            Appartement appartement = reparation.getAppartement();
            if(appartement != null) {
                currentReparation.setAppartement(appartement);
            }

            reparationService.saveReparation(currentReparation);
            return currentReparation;
        } else {
            return null;
        }
    }

    @DeleteMapping("/reparation/{id}")
    public void deleteReparation(@PathVariable("id") final Long id) {
        reparationService.deleteReparation(id);
    }

}
