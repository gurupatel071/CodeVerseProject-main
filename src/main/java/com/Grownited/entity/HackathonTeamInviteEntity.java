package com.Grownited.entity;

import java.time.LocalDate;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "hackathon_team_invites")
public class HackathonTeamInviteEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer hackathonTeamInviteId;

	private Integer teamId;
	private Integer hackathonId;
	private Integer invitedBy;
	private String inviteType;
	private Integer invitedUserId;
	private String invitedEmail;
	private String roleTitle;
	private String inviteStatus;
	private LocalDate createdAt;

	public Integer getHackathonTeamInviteId() {
		return hackathonTeamInviteId;
	}

	public void setHackathonTeamInviteId(Integer hackathonTeamInviteId) {
		this.hackathonTeamInviteId = hackathonTeamInviteId;
	}

	public Integer getTeamId() {
		return teamId;
	}

	public void setTeamId(Integer teamId) {
		this.teamId = teamId;
	}

	public Integer getHackathonId() {
		return hackathonId;
	}

	public void setHackathonId(Integer hackathonId) {
		this.hackathonId = hackathonId;
	}

	public Integer getInvitedBy() {
		return invitedBy;
	}

	public void setInvitedBy(Integer invitedBy) {
		this.invitedBy = invitedBy;
	}

	public String getInviteType() {
		return inviteType;
	}

	public void setInviteType(String inviteType) {
		this.inviteType = inviteType;
	}

	public Integer getInvitedUserId() {
		return invitedUserId;
	}

	public void setInvitedUserId(Integer invitedUserId) {
		this.invitedUserId = invitedUserId;
	}

	public String getInvitedEmail() {
		return invitedEmail;
	}

	public void setInvitedEmail(String invitedEmail) {
		this.invitedEmail = invitedEmail;
	}

	public String getRoleTitle() {
		return roleTitle;
	}

	public void setRoleTitle(String roleTitle) {
		this.roleTitle = roleTitle;
	}

	public String getInviteStatus() {
		return inviteStatus;
	}

	public void setInviteStatus(String inviteStatus) {
		this.inviteStatus = inviteStatus;
	}

	public LocalDate getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDate createdAt) {
		this.createdAt = createdAt;
	}
}
