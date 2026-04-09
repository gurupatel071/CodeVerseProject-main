package com.Grownited.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "hackathon_result")
public class HackathonResultEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer hackathonResultId;

	private Integer hackathonId;
	private Integer judgeId;
	private Integer teamId;
	private Integer innovation;
	private Integer implementation;
	private Integer codingStandard;
	private String round;

	public Integer getHackathonResultId() {
		return hackathonResultId;
	}

	public void setHackathonResultId(Integer hackathonResultId) {
		this.hackathonResultId = hackathonResultId;
	}

	public Integer getHackathonId() {
		return hackathonId;
	}

	public void setHackathonId(Integer hackathonId) {
		this.hackathonId = hackathonId;
	}

	public Integer getJudgeId() {
		return judgeId;
	}

	public void setJudgeId(Integer judgeId) {
		this.judgeId = judgeId;
	}

	public Integer getTeamId() {
		return teamId;
	}

	public void setTeamId(Integer teamId) {
		this.teamId = teamId;
	}

	public Integer getInnovation() {
		return innovation;
	}

	public void setInnovation(Integer innovation) {
		this.innovation = innovation;
	}

	public Integer getImplementation() {
		return implementation;
	}

	public void setImplementation(Integer implementation) {
		this.implementation = implementation;
	}

	public Integer getCodingStandard() {
		return codingStandard;
	}

	public void setCodingStandard(Integer codingStandard) {
		this.codingStandard = codingStandard;
	}

	public String getRound() {
		return round;
	}

	public void setRound(String round) {
		this.round = round;
	}
}
