package bts.sio.api.service;


import bts.sio.api.model.Locataire;
import bts.sio.api.repository.LocataireRepository;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Data
@Service
public class LocataireService {

    @Autowired
    private LocataireRepository locataireRepository;

    public Iterable<Locataire> getLocataires() {
        return locataireRepository.findAll();
    }

    public Optional<Locataire> getLocataireById(final Long id) {
        return locataireRepository.findById(id);
    }

    public void deleteLocataire(final Long id) {
        locataireRepository.deleteById(id);
    }

    public Locataire saveLocataire(Locataire locataire) {
        Locataire saved = locataireRepository.save(locataire);
        return saved;
    }
}