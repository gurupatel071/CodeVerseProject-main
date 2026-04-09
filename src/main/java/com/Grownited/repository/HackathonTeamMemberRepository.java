package com.Grownited.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Grownited.entity.HackathonTeamMemberEntity;

@Repository
public interface HackathonTeamMemberRepository extends JpaRepository<HackathonTeamMemberEntity, Integer> {

	boolean existsByHackathonIdAndMemberId(Integer hackathonId, Integer memberId);

	Optional<HackathonTeamMemberEntity> findFirstByHackathonIdAndMemberId(Integer hackathonId, Integer memberId);

	Optional<HackathonTeamMemberEntity> findFirstByTeamIdAndMemberId(Integer teamId, Integer memberId);

	List<HackathonTeamMemberEntity> findByTeamIdOrderByHackathonTeamMemberIdAsc(Integer teamId);

	List<HackathonTeamMemberEntity> findByMemberId(Integer memberId);

	long countByTeamId(Integer teamId);
}
