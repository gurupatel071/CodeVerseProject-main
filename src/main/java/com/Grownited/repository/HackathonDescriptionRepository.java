package com.Grownited.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Grownited.entity.HackathonDescriptionEntity;

@Repository
public interface HackathonDescriptionRepository extends JpaRepository<HackathonDescriptionEntity, Integer> {

	List<HackathonDescriptionEntity> findByHackathonId(Integer hackathonId);

	Optional<HackathonDescriptionEntity> findFirstByHackathonId(Integer hackathonId);
}
