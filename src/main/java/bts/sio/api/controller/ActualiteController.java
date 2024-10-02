package bts.sio.api.controller;

import bts.sio.api.model.Actualite;
import bts.sio.api.service.ActualiteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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

}
