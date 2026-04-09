package com.Grownited.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "hackathon_judge")
public class HackathonJudgeEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer hackathonJudgeId;

	private Integer hackathonId;
	private Integer userId;

	public Integer getHackathonJudgeId() {
		return hackathonJudgeId;
	}

	public void setHackathonJudgeId(Integer hackathonJudgeId) {
		this.hackathonJudgeId = hackathonJudgeId;
	}

	public Integer getHackathonId() {
		return hackathonId;
	}

	public void setHackathonId(Integer hackathonId) {
		this.hackathonId = hackathonId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}
}
