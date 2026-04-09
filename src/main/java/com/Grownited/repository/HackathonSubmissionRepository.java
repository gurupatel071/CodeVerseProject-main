package com.Grownited.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Grownited.entity.HackathonSubmissionEntity;

@Repository
public interface HackathonSubmissionRepository extends JpaRepository<HackathonSubmissionEntity, Integer> {

	Optional<HackathonSubmissionEntity> findByHackathonIdAndTeamId(Integer hackathonId, Integer teamId);

	List<HackathonSubmissionEntity> findByHackathonIdIn(List<Integer> hackathonIds);
}
