<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${hackathon.title} | Leaderboard</title>
<link href="https://fonts.googleapis.com/css2?family=Space+Mono:wght@400;700&family=Syne:wght@400;600;700;800&display=swap" rel="stylesheet">
<style>
*{box-sizing:border-box;margin:0;padding:0}
:root{
	--bg:#0a0a0f;--surface:#13131a;--surface2:#1c1c27;--border:#2a2a3d;
	--text:#e2e8f0;--muted:#64748b;--accent:#7c3aed;--accent2:#06b6d4;
}
body{font-family:'Syne',sans-serif;background:var(--bg);color:var(--text);min-height:100vh}
.page{max-width:1050px;margin:0 auto;padding:24px 20px 40px}
.top{display:flex;justify-content:space-between;align-items:flex-end;gap:12px;flex-wrap:wrap}
.back{color:var(--muted);text-decoration:none;font-weight:700}
.back:hover{color:var(--text)}
.hero{margin-top:12px;padding:18px;border:1px solid var(--border);border-radius:16px;background:linear-gradient(135deg,rgba(124,58,237,.22),rgba(6,182,212,.17))}
.title{font-size:32px;line-height:1.1}
.subtitle{color:#c2cfdd;margin-top:8px}
.meta{display:flex;flex-wrap:wrap;gap:10px;margin-top:12px}
.chip{padding:6px 10px;border-radius:999px;border:1px solid var(--border);background:var(--surface2);font-size:12px;font-family:'Space Mono',monospace;color:var(--muted)}
.card{margin-top:16px;background:var(--surface);border:1px solid var(--border);border-radius:16px;padding:16px}
.table-wrap{overflow-x:auto}
table{width:100%;border-collapse:collapse;min-width:680px}
th,td{padding:11px 8px;border-bottom:1px solid var(--border);text-align:left}
th{font-size:12px;text-transform:uppercase;letter-spacing:.45px;color:var(--muted)}
td{font-size:14px}
.rank{font-family:'Space Mono',monospace;font-weight:700;color:#f8fafc}
.top3{font-weight:800;background:linear-gradient(90deg,var(--accent),var(--accent2));-webkit-background-clip:text;-webkit-text-fill-color:transparent}
.muted{color:var(--muted)}
.empty{text-align:center;padding:30px 10px;color:var(--muted)}
@media (max-width:760px){.title{font-size:26px}}
</style>
</head>
<body>
	<%@ include file="ParticipantTopNav.jsp"%>
	<div class="page">
		<div class="top">
			<a class="back" href="/participant/hackathon/${hackathon.hackathonId}">&larr; Back to Hackathon</a>
		</div>

		<div class="hero">
			<h1 class="title">Leaderboard</h1>
			<p class="subtitle">${hackathon.title}</p>
			<div class="meta">
				<span class="chip">Status: ${hackathon.status}</span>
				<span class="chip">Teams: ${totalTeams}</span>
				<span class="chip">Total Reviews: ${totalEvaluations}</span>
			</div>
		</div>

		<div class="card">
			<c:choose>
				<c:when test="${empty leaderboardRows}">
					<div class="empty">No scores available yet.</div>
				</c:when>
				<c:otherwise>
					<div class="table-wrap">
						<table>
							<thead>
								<tr>
									<th>Rank</th>
									<th>Team</th>
									<th>Total Score</th>
									<th>Reviews</th>
									<th>Average Score</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${leaderboardRows}" var="r">
									<tr>
										<td class="rank ${r.rank <= 3 ? 'top3' : ''}">#${r.rank}</td>
										<td>${r.teamName}</td>
										<td>${r.totalScore}</td>
										<td>${r.evaluationCount}</td>
										<td><fmt:formatNumber value="${r.averageScore}" type="number" minFractionDigits="2" maxFractionDigits="2" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<p class="muted" style="margin-top:10px;">Ranking is based on highest average score, then total score.</p>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>
