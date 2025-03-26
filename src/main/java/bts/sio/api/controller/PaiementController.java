package bts.sio.api.controller;

import bts.sio.api.model.*;
import bts.sio.api.service.PaiementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.Optional;

@RestController
public class PaiementController {

    @Autowired
    private PaiementService paiementService;

    @GetMapping("/paiements")
    public Iterable<Paiement> getAllPaiements() {
        return paiementService.getPaiements();
    }

    @GetMapping("/paiement/{id}")
    public Paiement getPaiement(@PathVariable final Long id) {
        Optional<Paiement> paiement = paiementService.getPaiementById(id);
        return paiement.orElse(null);
    }

    @PostMapping("/paiement")
    public Paiement addPaiement(@RequestBody Paiement paiement) {
        return paiementService.savePaiement(paiement);
    }

    @PutMapping("/paiement/{id}")
    public Paiement updatePaiement(@PathVariable("id") final Long id, @RequestBody Paiement paiement) {
        Optional<Paiement> p = paiementService.getPaiementById(id);
        if(p.isPresent()) {
            Paiement currentPaiement = p.get();

            Double montant = paiement.getMontant();
            if (montant != null) {
                currentPaiement.setMontant(montant);
            }

            LocalDate datePaiement = paiement.getDatePaiement();
            if (datePaiement != null) {
                currentPaiement.setDatePaiement(datePaiement);
            }

            Contrat contrat = paiement.getContrat();
            if (contrat != null) {
                currentPaiement.setContrat(contrat);
            }

            paiementService.savePaiement(currentPaiement);
            return currentPaiement;
        } else {
            return null;
        }
    }

    @DeleteMapping("/paiement/{id}")
    public void deletePaiement(@PathVariable("id") final Long id) {
        paiementService.deletePaiement(id);
    }
}