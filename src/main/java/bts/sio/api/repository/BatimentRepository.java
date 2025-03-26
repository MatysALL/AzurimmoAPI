package bts.sio.api.repository;

import bts.sio.api.model.Batiment;
import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.JpaRepository;

@Repository
public interface BatimentRepository extends  JpaRepository<Batiment, Long> {
}

