package com.Grownited.entity;

public class MyHackathonRow {
	
		private HackathonEntity hackathon;
		private Integer teamId;
		private String teamName;
		private boolean leader;
		private String roleTitle;
		private int teamSize;
		private int pendingInvites;
		private boolean submissionEnabled;

		public HackathonEntity getHackathon() {
			return hackathon;
		}

		public void setHackathon(HackathonEntity hackathon) {
			this.hackathon = hackathon;
		}

		public Integer getTeamId() {
			return teamId;
		}

		public void setTeamId(Integer teamId) {
			this.teamId = teamId;
		}

		public String getTeamName() {
			return teamName;
		}

		public void setTeamName(String teamName) {
			this.teamName = teamName;
		}

		public boolean isLeader() {
			return leader;
		}

		public void setLeader(boolean leader) {
			this.leader = leader;
		}

		public String getRoleTitle() {
			return roleTitle;
		}

		public void setRoleTitle(String roleTitle) {
			this.roleTitle = roleTitle;
		}

		public int getTeamSize() {
			return teamSize;
		}

		public void setTeamSize(int teamSize) {
			this.teamSize = teamSize;
		}

		public int getPendingInvites() {
			return pendingInvites;
		}

		public void setPendingInvites(int pendingInvites) {
			this.pendingInvites = pendingInvites;
		}

		public boolean isSubmissionEnabled() {
			return submissionEnabled;
		}

		public void setSubmissionEnabled(boolean submissionEnabled) {
			this.submissionEnabled = submissionEnabled;
		}
	}

