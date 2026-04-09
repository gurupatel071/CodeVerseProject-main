package com.Grownited.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Grownited.entity.HackathonTeamInviteEntity;

@Repository
public interface HackathonTeamInviteRepository extends JpaRepository<HackathonTeamInviteEntity, Integer> {

	List<HackathonTeamInviteEntity> findByTeamIdOrderByHackathonTeamInviteIdDesc(Integer teamId);

	boolean existsByTeamIdAndInvitedUserIdAndInviteStatus(Integer teamId, Integer invitedUserId, String inviteStatus);

	boolean existsByTeamIdAndInvitedEmailAndInviteStatus(Integer teamId, String invitedEmail, String inviteStatus);

	boolean existsByHackathonIdAndInvitedUserIdAndInviteStatus(Integer hackathonId, Integer invitedUserId, String inviteStatus);

	Optional<HackathonTeamInviteEntity> findFirstByHackathonIdAndInvitedUserIdAndInviteStatus(Integer hackathonId,
			Integer invitedUserId, String inviteStatus);

	long countByTeamIdAndInviteStatus(Integer teamId, String inviteStatus);
}
