package com.Grownited.entity;

public class LeaderboardRow {

		private Integer teamId;
		private String teamName;
		private int totalScore;
		private int evaluationCount;
		private double averageScore;
		private int rank;

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

		public int getTotalScore() {
			return totalScore;
		}

		public void setTotalScore(int totalScore) {
			this.totalScore = totalScore;
		}

		public int getEvaluationCount() {
			return evaluationCount;
		}

		public void setEvaluationCount(int evaluationCount) {
			this.evaluationCount = evaluationCount;
		}

		public double getAverageScore() {
			return averageScore;
		}

		public void setAverageScore(double averageScore) {
			this.averageScore = averageScore;
		}

		public int getRank() {
			return rank;
		}

		public void setRank(int rank) {
			this.rank = rank;
		}
	}
	
