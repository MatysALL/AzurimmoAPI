package bts.sio.api.repository;

import bts.sio.api.model.Locataire;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LocataireRepository  extends JpaRepository<Locataire, Long> {
}