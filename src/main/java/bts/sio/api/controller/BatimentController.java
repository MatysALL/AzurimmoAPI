package bts.sio.api.controller;

import java.time.LocalDate;

import bts.sio.api.model.Batiment;
import bts.sio.api.service.BatimentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.Optional;

@RestController
public class BatimentController {

    @Autowired
    private BatimentService batimentService;

    @GetMapping("/batiments")
    public Iterable<Batiment> getAllBatiments() {
        return batimentService.getBatiments();
    }

    @GetMapping("/batiment/{id}")
    public Batiment getBatiment(@PathVariable final Long id) {
        Optional<Batiment> batiment = batimentService.getBatimentById(id);
        return batiment.orElse(null);
    }

    @PostMapping("/batiment")
    public Batiment addBatiment(@RequestBody Batiment batiment) {
        return batimentService.saveBatiment(batiment);
    }

    @PutMapping("/batiment/{id}")
    public Batiment updateBatiment(@PathVariable("id") final Long id, @RequestBody Batiment batiment) {
        Optional<Batiment> b = batimentService.getBatimentById(id);
        if (b.isPresent()) {
            Batiment currentBatiment = b.get();

            String adresse = batiment.getAdresse();
            if (adresse != null) {
                currentBatiment.setAdresse(adresse);
            }

            String ville = batiment.getVille();
            if (ville != null) {
                currentBatiment.setVille(ville);
            }

            batimentService.saveBatiment(currentBatiment);
            return currentBatiment;
        } else {
            return null;
        }
    }

    @DeleteMapping("/batiment/{id}")
    public void deleteBatiment(@PathVariable("id") final Long id) {

        batimentService.deleteBatiment(id);
    }
}
