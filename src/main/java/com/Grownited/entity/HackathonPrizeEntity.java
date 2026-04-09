package com.Grownited.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "hackathon_prize")
public class HackathonPrizeEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer hackathonPrizeId;

	private Integer hackathonId;

	private String prizeTitle;

	@Column(columnDefinition = "TEXT")
	private String prizeDescription;

	public Integer getHackathonPrizeId() {
		return hackathonPrizeId;
	}

	public void setHackathonPrizeId(Integer hackathonPrizeId) {
		this.hackathonPrizeId = hackathonPrizeId;
	}

	public Integer getHackathonId() {
		return hackathonId;
	}

	public void setHackathonId(Integer hackathonId) {
		this.hackathonId = hackathonId;
	}

	public String getPrizeTitle() {
		return prizeTitle;
	}

	public void setPrizeTitle(String prizeTitle) {
		this.prizeTitle = prizeTitle;
	}

	public String getPrizeDescription() {
		return prizeDescription;
	}

	public void setPrizeDescription(String prizeDescription) {
		this.prizeDescription = prizeDescription;
	}
}
