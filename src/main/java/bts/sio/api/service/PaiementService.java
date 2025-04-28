package bts.sio.api.service;

import bts.sio.api.model.Paiement;
import bts.sio.api.repository.PaiementRepository;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Data
@Service
public class PaiementService {
    @Autowired
    private PaiementRepository paiementRepository;

    public Iterable<Paiement> getPaiements() {
        return paiementRepository.findAll();
    }

    public Optional<Paiement> getPaiementById(final Long id) {
        return paiementRepository.findById(id);
    }

    public void deletePaiement(final Long id) {
        paiementRepository.deleteById(id);
    }

    public Paiement savePaiement(Paiement paiement) {
        Paiement saved = paiementRepository.save(paiement);
        return saved;
    }
}