<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Hackathon Details</title>

<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">

<style>

  /* ===========================
     CODEVERSE THEME — Variables
  =========================== */
  :root {
    --navy:      #1B2A4A;
    --oxford:    #0E1F3D;
    --eton:      #2E6B72;
    --sage:      #4A7C6F;
    --ivory:     #F7F4EE;
    --cream:     #EDE9E0;
    --slate:     #4B5B6E;
    --muted:     #8C97A4;
    --gold:      #C9A84C;
    --rose:      #A85858;
    --white:     #FFFFFF;
    --shadow-sm: 0 2px 12px rgba(27,42,74,0.08);
    --shadow-md: 0 8px 32px rgba(27,42,74,0.12);
    --radius:    14px;
    --radius-sm: 8px;
  }

  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
  }

  body {
    font-family: 'DM Sans', sans-serif;
    background: #F3EFE7;
    color: var(--navy);
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 2rem;
  }

  /* ===========================
     MAIN CONTAINER - CENTERED
  =========================== */
  .details-container {
    max-width: 1100px;
    width: 100%;
    margin: 0 auto;
    animation: pageFadeIn 0.7s ease both;
  }

  @keyframes pageFadeIn {
    from { opacity: 0; transform: translateY(18px); }
    to   { opacity: 1; transform: translateY(0); }
  }

  @keyframes cardSlideUp {
    from { opacity: 0; transform: translateY(24px); }
    to   { opacity: 1; transform: translateY(0); }
  }

  /* ===========================
     HERO SECTION
  =========================== */
  .hero-section {
    background: linear-gradient(135deg, var(--oxford) 0%, var(--navy) 100%);
    border-radius: var(--radius);
    padding: 2rem 2rem;
    margin-bottom: 1.5rem;
    position: relative;
    overflow: hidden;
    animation: cardSlideUp 0.6s ease both;
  }
  .hero-section::before {
    content: '';
    position: absolute;
    top: -30%;
    right: -10%;
    width: 300px;
    height: 300px;
    background: radial-gradient(circle, rgba(201,168,76,0.1) 0%, transparent 70%);
    border-radius: 50%;
  }

  .hero-title {
    font-family: 'Playfair Display', serif;
    font-size: 1.8rem;
    font-weight: 700;
    color: var(--white);
    margin-bottom: 0.5rem;
    position: relative;
    z-index: 1;
  }
  .hero-subtitle {
    color: rgba(255,255,255,0.7);
    font-size: 0.9rem;
    margin-bottom: 1rem;
    position: relative;
    z-index: 1;
  }
  .btn-back {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    padding: 8px 18px;
    border-radius: var(--radius-sm);
    font-family: 'DM Sans', sans-serif;
    font-size: 0.78rem;
    font-weight: 600;
    text-decoration: none;
    background: rgba(255,255,255,0.15);
    backdrop-filter: blur(4px);
    color: var(--white);
    border: 1px solid rgba(255,255,255,0.2);
    transition: all 0.22s ease;
    position: relative;
    z-index: 1;
  }
  .btn-back:hover {
    background: var(--gold);
    color: var(--oxford);
    transform: translateY(-2px);
    text-decoration: none;
    border-color: var(--gold);
  }

  /* ===========================
     PANEL / CARD
  =========================== */
  .panel {
    background: var(--white);
    border-radius: var(--radius);
    box-shadow: var(--shadow-sm);
    overflow: hidden;
    margin-bottom: 1.5rem;
    animation: cardSlideUp 0.6s 0.1s ease both;
    border: 1px solid var(--cream);
  }

  .panel-header {
    background: var(--oxford);
    padding: 1rem 1.5rem;
    display: flex;
    align-items: center;
    gap: 0.75rem;
  }
  .panel-header h3 {
    font-family: 'Playfair Display', serif;
    font-size: 1.1rem;
    color: var(--gold);
    margin: 0;
  }
  .panel-header-icon {
    font-size: 1.2rem;
  }

  .panel-body {
    padding: 1.5rem;
  }

  /* ===========================
     META GRID
  =========================== */
  .meta-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
    gap: 1rem;
  }

  .meta-box {
    background: var(--ivory);
    border-radius: var(--radius-sm);
    padding: 0.9rem 1rem;
    border: 1px solid var(--cream);
    transition: all 0.2s ease;
  }
  .meta-box:hover {
    border-color: var(--gold);
  }

  .meta-label {
    font-size: 0.65rem;
    font-weight: 700;
    letter-spacing: 1px;
    text-transform: uppercase;
    color: var(--muted);
    margin-bottom: 0.4rem;
  }
  .meta-value {
    font-size: 0.9rem;
    font-weight: 600;
    color: var(--oxford);
  }

  /* ===========================
     DESCRIPTION
  =========================== */
  .description-text {
    color: var(--slate);
    line-height: 1.6;
    margin-bottom: 1rem;
  }

  .html-content {
    background: var(--ivory);
    border: 1px solid var(--cream);
    border-radius: var(--radius-sm);
    padding: 1rem;
    font-size: 0.9rem;
    line-height: 1.6;
    color: var(--slate);
  }
  .html-content p {
    margin-bottom: 0.5rem;
  }

  /* ===========================
     JUDGE GRID
  =========================== */
  .judge-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(260px, 1fr));
    gap: 1rem;
  }

  .judge-card {
    background: var(--ivory);
    border-radius: var(--radius-sm);
    padding: 1rem;
    display: flex;
    align-items: center;
    gap: 1rem;
    border: 1px solid var(--cream);
    transition: all 0.2s ease;
  }
  .judge-card:hover {
    border-color: var(--gold);
    transform: translateY(-2px);
  }

  .judge-avatar {
    width: 52px;
    height: 52px;
    border-radius: 50%;
    object-fit: cover;
    border: 2px solid var(--cream);
    flex-shrink: 0;
  }

  .judge-info {
    flex: 1;
  }
  .judge-name {
    font-weight: 700;
    font-size: 0.9rem;
    color: var(--oxford);
    margin-bottom: 0.2rem;
  }
  .judge-email {
    font-size: 0.7rem;
    color: var(--muted);
    margin-bottom: 0.2rem;
  }
  .judge-detail {
    font-size: 0.7rem;
    color: var(--slate);
  }

  /* ===========================
     TABLE STYLES
  =========================== */
  .table-responsive {
    overflow-x: auto;
  }

  .cv-table {
    width: 100%;
    border-collapse: collapse;
    font-size: 0.85rem;
  }
  .cv-table th {
    text-align: left;
    padding: 12px 12px;
    font-size: 0.65rem;
    font-weight: 700;
    letter-spacing: 1px;
    text-transform: uppercase;
    color: var(--muted);
    border-bottom: 2px solid var(--cream);
  }
  .cv-table td {
    padding: 12px 12px;
    border-bottom: 1px solid var(--cream);
    color: var(--navy);
  }
  .cv-table tr:last-child td {
    border-bottom: none;
  }
  .cv-table tr:hover {
    background: rgba(201,168,76,0.04);
  }

  /* Badges */
  .pill {
    display: inline-flex;
    align-items: center;
    padding: 3px 10px;
    border-radius: 50px;
    font-size: 0.68rem;
    font-weight: 700;
    letter-spacing: 0.5px;
    text-transform: uppercase;
  }
  .pill-pending {
    background: rgba(201,168,76,0.15);
    color: #8a6e1e;
  }
  .pill-reviewed {
    background: rgba(46,107,114,0.12);
    color: var(--eton);
  }

  /* Action Button */
  .action-btn {
    display: inline-flex;
    align-items: center;
    gap: 4px;
    padding: 5px 12px;
    border-radius: 6px;
    font-family: 'DM Sans', sans-serif;
    font-size: 0.7rem;
    font-weight: 600;
    text-decoration: none;
    background: rgba(201,168,76,0.12);
    color: #8a6e1e;
    border: 1px solid rgba(201,168,76,0.25);
    transition: all 0.18s ease;
  }
  .action-btn:hover {
    background: var(--gold);
    color: var(--oxford);
    transform: translateY(-1px);
    text-decoration: none;
  }

  /* ===========================
     EMPTY STATE
  =========================== */
  .empty-state {
    text-align: center;
    padding: 2rem;
  }
  .empty-state-icon {
    font-size: 2rem;
    opacity: 0.4;
    margin-bottom: 0.5rem;
  }
  .empty-state p {
    color: var(--muted);
    font-size: 0.85rem;
    margin: 0;
  }

  /* ===========================
     FOOTER
  =========================== */
  .footer-note {
    margin-top: 1rem;
    padding: 1rem 0;
    text-align: center;
    border-top: 1px solid var(--cream);
    color: var(--muted);
    font-size: 0.8rem;
  }
  .footer-note a {
    color: var(--gold);
    text-decoration: none;
    font-weight: 600;
  }
  .footer-note a:hover {
    text-decoration: underline;
  }

  /* ===========================
     RESPONSIVE
  =========================== */
  @media (max-width: 767.98px) {
    body {
      padding: 1rem;
    }
    .hero-section {
      padding: 1.5rem;
    }
    .hero-title {
      font-size: 1.4rem;
    }
    .panel-body {
      padding: 1rem;
    }
    .meta-grid {
      grid-template-columns: 1fr 1fr;
      gap: 0.75rem;
    }
    .judge-grid {
      grid-template-columns: 1fr;
    }
    .cv-table th, .cv-table td {
      padding: 8px 8px;
    }
  }

</style>
</head>

<body>

<div class="details-container">

  <!-- ===== HERO SECTION ===== -->
  <div class="hero-section">
    <h1 class="hero-title">${hackathon.title}</h1>
    <p class="hero-subtitle">Judge view for assigned hackathon details</p>
    <a class="btn-back" href="/judge-dashboard">← Back to Dashboard</a>
  </div>

  <!-- ===== HACKATHON INFORMATION ===== -->
  <div class="panel">
    <div class="panel-header">
      <span class="panel-header-icon">📋</span>
      <h3>Hackathon Information</h3>
    </div>
    <div class="panel-body">
      <div class="meta-grid">
        <div class="meta-box">
          <div class="meta-label">Status</div>
          <div class="meta-value">${hackathon.status}</div>
        </div>
        <div class="meta-box">
          <div class="meta-label">Event Type</div>
          <div class="meta-value">${hackathon.eventType}</div>
        </div>
        <div class="meta-box">
          <div class="meta-label">Payment</div>
          <div class="meta-value">${hackathon.payment}</div>
        </div>
        <div class="meta-box">
          <div class="meta-label">Team Size</div>
          <div class="meta-value">${hackathon.minTeamSize} - ${hackathon.maxTeamSize}</div>
        </div>
        <div class="meta-box">
          <div class="meta-label">Location</div>
          <div class="meta-value">${hackathon.location}</div>
        </div>
        <div class="meta-box">
          <div class="meta-label">Registration Period</div>
          <div class="meta-value">${hackathon.registrationStartDate} → ${hackathon.registrationEndDate}</div>
        </div>
      </div>
    </div>
  </div>

  <!-- ===== OVERVIEW ===== -->
  <div class="panel">
    <div class="panel-header">
      <span class="panel-header-icon">📖</span>
      <h3>Overview</h3>
    </div>
    <div class="panel-body">
      <p class="description-text">${hackathon.description}</p>
      <div class="html-content">
        <c:choose>
          <c:when test="${not empty hackathonDescription}">
            <c:out value="${hackathonDescription.hackathonDetails}" escapeXml="false" />
          </c:when>
          <c:otherwise>
            <span style="color: var(--muted);">No detailed description provided.</span>
          </c:otherwise>
        </c:choose>
      </div>
    </div>
  </div>

  <!-- ===== ASSIGNED JUDGES ===== -->
  <div class="panel">
    <div class="panel-header">
      <span class="panel-header-icon">⚖️</span>
      <h3>Assigned Judges</h3>
    </div>
    <div class="panel-body">
      <c:choose>
        <c:when test="${empty judgeUsers}">
          <div class="empty-state">
            <div class="empty-state-icon">👥</div>
            <p>No judges assigned to this hackathon.</p>
          </div>
        </c:when>
        <c:otherwise>
          <div class="judge-grid">
            <c:forEach items="${judgeUsers}" var="j">
              <div class="judge-card">
                <c:choose>
                  <c:when test="${not empty j.profilePicURL}">
                    <img src="${j.profilePicURL}" class="judge-avatar" alt="judge">
                  </c:when>
                  <c:otherwise>
                    <img src="/assets/images/faces/dummy.jpg" class="judge-avatar" alt="judge">
                  </c:otherwise>
                </c:choose>
                <div class="judge-info">
                  <div class="judge-name">${j.firstName} ${j.lastName}</div>
                  <div class="judge-email">${j.email}</div>
                  <c:if test="${not empty j.designation}">
                    <div class="judge-detail">${j.designation}</div>
                  </c:if>
                  <c:if test="${not empty j.organization}">
                    <div class="judge-detail">${j.organization}</div>
                  </c:if>
                </div>
              </div>
            </c:forEach>
          </div>
        </c:otherwise>
      </c:choose>
    </div>
  </div>

  <!-- ===== PRIZE DETAILS ===== -->
  <div class="panel">
    <div class="panel-header">
      <span class="panel-header-icon">🏆</span>
      <h3>Prize Details</h3>
    </div>
    <div class="panel-body">
      <c:choose>
        <c:when test="${empty prizeList}">
          <div class="empty-state">
            <div class="empty-state-icon">🏆</div>
            <p>No prize details available.</p>
          </div>
        </c:when>
        <c:otherwise>
          <div class="table-responsive">
            <table class="cv-table">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Prize Title</th>
                  <th>Prize Description</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach items="${prizeList}" var="p" varStatus="i">
                  <tr>
                    <td>${i.count}</td>
                    <td><strong>${p.prizeTitle}</strong></td>
                    <td>${p.prizeDescription}</td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </c:otherwise>
      </c:choose>
    </div>
  </div>

  <!-- ===== PENDING SUBMISSIONS ===== -->
  <div class="panel">
    <div class="panel-header">
      <span class="panel-header-icon">⏳</span>
      <h3>Pending Submissions</h3>
    </div>
    <div class="panel-body">
      <c:choose>
        <c:when test="${empty pendingSubmissionList}">
          <div class="empty-state">
            <div class="empty-state-icon">📝</div>
            <p>No pending submissions for this hackathon.</p>
          </div>
        </c:when>
        <c:otherwise>
          <div class="table-responsive">
            <table class="cv-table">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Team</th>
                  <th>Submitted Date</th>
                  <th>Status</th>
                  <th>Action</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach items="${pendingSubmissionList}" var="s" varStatus="i">
                  <tr>
                    <td>${i.count}</td>
                    <td><strong>${submissionTeamMap[s.teamId].teamName}</strong></td>
                    <td>${s.submitedDate}</td>
                    <td><span class="pill pill-pending">Pending</span></td>
                    <td><a class="action-btn" href="/judge/submissions/review?submissionId=${s.hackathonSubmissionId}">⭐ Review</a></td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </c:otherwise>
      </c:choose>
    </div>
  </div>

  <!-- ===== REVIEWED SUBMISSIONS ===== -->
  <div class="panel">
    <div class="panel-header">
      <span class="panel-header-icon">✅</span>
      <h3>Reviewed Submissions</h3>
    </div>
    <div class="panel-body">
      <c:choose>
        <c:when test="${empty reviewedSubmissionList}">
          <div class="empty-state">
            <div class="empty-state-icon">📋</div>
            <p>No reviewed submissions yet for this hackathon.</p>
          </div>
        </c:when>
        <c:otherwise>
          <div class="table-responsive">
            <table class="cv-table">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Team</th>
                  <th>Submitted Date</th>
                  <th>Status</th>
                  <th>Action</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach items="${reviewedSubmissionList}" var="s" varStatus="i">
                  <tr>
                    <td>${i.count}</td>
                    <td><strong>${submissionTeamMap[s.teamId].teamName}</strong></td>
                    <td>${s.submitedDate}</td>
                    <td><span class="pill pill-reviewed">Reviewed</span></td>
                    <td><a class="action-btn" href="/judge/submissions/review?submissionId=${s.hackathonSubmissionId}">✏ Update</a></td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </c:otherwise>
      </c:choose>
    </div>
  </div>

  <!-- Footer -->
  <div class="footer-note">
    <div>CodeVerse Judge Panel</div>
    <div style="margin-top: 6px;">Need help? <a href="/judge-dashboard">Go to Dashboard</a></div>
  </div>

</div>

</body>
</html>