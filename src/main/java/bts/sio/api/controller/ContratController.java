package bts.sio.api.controller;

import bts.sio.api.model.Appartement;
import bts.sio.api.model.Contrat;
import bts.sio.api.model.Locataire;
import bts.sio.api.service.ContratService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.Optional;

@RestController
public class ContratController {

    @Autowired
    private ContratService contratService;

    @GetMapping("/contrats")
    public Iterable<Contrat> getAllContrats() {
        return contratService.getContrats();
    }

    @GetMapping("/contrat/{id}")
    public Contrat getContrat(@PathVariable final Long id) {
        Optional<Contrat> contrat = contratService.getContratById(id);
        return contrat.orElse(null);
    }

    @PostMapping("/contrat")
    public Contrat addContrat(@RequestBody Contrat contrat) {
        return contratService.saveContrat(contrat);
    }

    @PutMapping("/contrat/{id}")
    public Contrat updateContrat(@PathVariable("id") final Long id, @RequestBody Contrat contrat) {
        Optional<Contrat> c = contratService.getContratById(id);
        if (c.isPresent()) {
            Contrat currentContrat = c.get();

            LocalDate dateDebut = contrat.getDateDebut();
            if(dateDebut != null) {
                currentContrat.setDateDebut(dateDebut);
            }

            LocalDate dateFin = contrat.getDateFin();
            if(dateFin != null) {
                currentContrat.setDateFin(dateFin);
            }

            Locataire locataire = contrat.getLocataire();
            if(locataire != null) {
                currentContrat.setLocataire(locataire);;
            }

            Appartement appartement = contrat.getAppartement();
            if(appartement != null) {
                currentContrat.setAppartement(appartement);;
            }

            contratService.saveContrat(currentContrat);
            return currentContrat;
        } else {
            return null;
        }
    }

    @DeleteMapping("/contrat/{id}")
    public void deleteContrat(@PathVariable("id") final Long id) {

        contratService.deleteContrat(id);
    }
}