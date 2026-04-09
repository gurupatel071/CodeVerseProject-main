<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Hackathon Submission</title>
<link href="https://fonts.googleapis.com/css2?family=Space+Mono:wght@400;700&family=Syne:wght@400;600;700;800&display=swap" rel="stylesheet">
<style>
*{box-sizing:border-box;margin:0;padding:0}
:root{--bg:#0a0a0f;--surface:#13131a;--surface2:#1c1c27;--border:#2a2a3d;--text:#e2e8f0;--muted:#64748b;--accent:#7c3aed}
body{font-family:'Syne',sans-serif;background:var(--bg);color:var(--text)}
.page{max-width:860px;margin:0 auto;padding:24px 20px 36px}
.top a{color:var(--muted);text-decoration:none;font-weight:700}
.title{font-size:28px;margin-top:8px}
.sub{color:var(--muted);font-size:14px;margin-top:6px}
.card{margin-top:16px;background:var(--surface);border:1px solid var(--border);border-radius:16px;padding:18px}
.group{margin-top:12px}
.group label{display:block;font-size:13px;color:#aabed0;margin-bottom:6px}
.group input{width:100%;height:44px;border-radius:10px;border:1px solid var(--border);background:var(--surface2);color:var(--text);padding:0 12px}
.btn{margin-top:14px;border:0;border-radius:10px;background:linear-gradient(135deg,var(--accent),#5b27bd);color:#fff;height:42px;padding:0 16px;font-weight:700;cursor:pointer}
.msg{margin-top:10px;padding:10px 12px;border-radius:10px;font-size:14px}
.ok{background:rgba(34,197,94,.14);border:1px solid rgba(34,197,94,.4);color:#86efac}
.err{background:rgba(239,68,68,.12);border:1px solid rgba(239,68,68,.35);color:#fca5a5}
</style>
</head>
<body>
	<%@ include file="ParticipantTopNav.jsp"%>
	<div class="page">
		<div class="top">
			<a href="/participant/my-hackathons">&larr; Back to My Hackathons</a>
			<h1 class="title">Submission</h1>
			<p class="sub">${hackathon.title}</p>
		</div>

		<c:if test="${success == 'saved'}"><div class="msg ok">Submission saved successfully.</div></c:if>
		<c:if test="${not empty error}"><div class="msg err">${error}</div></c:if>

		<div class="card">
			<form action="/participant/hackathon/${hackathon.hackathonId}/submission/save" method="post">
				<input type="hidden" name="hackathonSubmissionId" value="${submission.hackathonSubmissionId}">
				<div class="group">
					<label>Code Base URL</label>
					<input type="url" name="codeBaseUrl" value="${submission.codeBaseUrl}" placeholder="https://github.com/your-repo" required>
				</div>
				<div class="group">
					<label>Documentation URL</label>
					<input type="url" name="documentationUrl" value="${submission.documentationUrl}" placeholder="https://docs.google.com/..." required>
				</div>
				<button class="btn" type="submit">Save Submission</button>
			</form>
			<c:if test="${not empty submission.submitedDate}">
				<p style="margin-top:10px;color:#9fb0c2;font-size:13px;">Last submitted: ${submission.submitedDate}</p>
			</c:if>
		</div>
	</div>
</body>
</html>
