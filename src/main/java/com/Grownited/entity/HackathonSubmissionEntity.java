package com.Grownited.entity;

import java.time.LocalDate;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "hackathon_submission")
public class HackathonSubmissionEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer hackathonSubmissionId;

	private Integer hackathonId;
	private Integer teamId;
	private LocalDate submitedDate;
	private String codeBaseUrl;
	private String documentationUrl;

	public Integer getHackathonSubmissionId() {
		return hackathonSubmissionId;
	}

	public void setHackathonSubmissionId(Integer hackathonSubmissionId) {
		this.hackathonSubmissionId = hackathonSubmissionId;
	}

	public Integer getHackathonId() {
		return hackathonId;
	}

	public void setHackathonId(Integer hackathonId) {
		this.hackathonId = hackathonId;
	}

	public Integer getTeamId() {
		return teamId;
	}

	public void setTeamId(Integer teamId) {
		this.teamId = teamId;
	}

	public LocalDate getSubmitedDate() {
		return submitedDate;
	}

	public void setSubmitedDate(LocalDate submitedDate) {
		this.submitedDate = submitedDate;
	}

	public String getCodeBaseUrl() {
		return codeBaseUrl;
	}

	public void setCodeBaseUrl(String codeBaseUrl) {
		this.codeBaseUrl = codeBaseUrl;
	}

	public String getDocumentationUrl() {
		return documentationUrl;
	}

	public void setDocumentationUrl(String documentationUrl) {
		this.documentationUrl = documentationUrl;
	}
}
