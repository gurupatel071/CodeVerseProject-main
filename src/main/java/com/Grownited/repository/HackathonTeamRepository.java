package com.Grownited.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Grownited.entity.HackathonTeamEntity;

@Repository
public interface HackathonTeamRepository extends JpaRepository<HackathonTeamEntity, Integer> {

	boolean existsByHackathonIdAndTeamLeaderId(Integer hackathonId, Integer teamLeaderId);

	long countByHackathonId(Integer hackathonId);

	Optional<HackathonTeamEntity> findFirstByHackathonIdAndTeamLeaderId(Integer hackathonId, Integer teamLeaderId);

	List<HackathonTeamEntity> findByHackathonId(Integer hackathonId);

	List<HackathonTeamEntity> findByTeamLeaderId(Integer teamLeaderId);
}
