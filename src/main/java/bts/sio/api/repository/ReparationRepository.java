package bts.sio.api.repository;

import bts.sio.api.model.Reparation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ReparationRepository  extends JpaRepository<Reparation, Long> {
}