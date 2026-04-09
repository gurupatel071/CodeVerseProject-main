package com.Grownited.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "hackathon_team")
public class HackathonTeamEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer hackathonTeamId;

	private Integer hackathonId;
	private Integer teamLeaderId;
	private String teamName;
	private String teamStatus;

	public Integer getHackathonTeamId() {
		return hackathonTeamId;
	}

	public void setHackathonTeamId(Integer hackathonTeamId) {
		this.hackathonTeamId = hackathonTeamId;
	}

	public Integer getHackathonId() {
		return hackathonId;
	}

	public void setHackathonId(Integer hackathonId) {
		this.hackathonId = hackathonId;
	}

	public Integer getTeamLeaderId() {
		return teamLeaderId;
	}

	public void setTeamLeaderId(Integer teamLeaderId) {
		this.teamLeaderId = teamLeaderId;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public String getTeamStatus() {
		return teamStatus;
	}

	public void setTeamStatus(String teamStatus) {
		this.teamStatus = teamStatus;
	}
}
