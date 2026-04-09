<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Judge Submissions</title>

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
  .submissions-container {
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
     PAGE HEADER
  =========================== */
  .back-link {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    font-size: 0.85rem;
    color: var(--muted);
    text-decoration: none;
    margin-bottom: 0.5rem;
    transition: color 0.2s ease;
  }
  .back-link:hover {
    color: var(--gold);
    text-decoration: none;
  }

  .welcome-badge {
    display: inline-block;
    background: var(--oxford);
    color: var(--gold);
    font-family: 'Playfair Display', serif;
    font-size: 0.7rem;
    letter-spacing: 2px;
    text-transform: uppercase;
    padding: 4px 12px;
    border-radius: 50px;
    margin-bottom: 0.5rem;
  }

  .page-title {
    font-family: 'Playfair Display', serif;
    font-size: 2rem;
    font-weight: 700;
    color: var(--oxford);
    margin-bottom: 0.25rem;
  }

  .page-subtitle {
    color: var(--muted);
    font-size: 0.9rem;
    margin-bottom: 2rem;
  }

  /* ===========================
     ALERT MESSAGES
  =========================== */
  .cv-alert {
    display: flex;
    align-items: center;
    gap: 10px;
    padding: 12px 16px;
    border-radius: var(--radius-sm);
    font-size: 0.88rem;
    font-weight: 500;
    margin-bottom: 1.2rem;
    animation: cardSlideUp 0.4s ease both;
  }
  .cv-alert-success {
    background: rgba(46,107,114,0.1);
    border: 1px solid rgba(46,107,114,0.25);
    color: var(--eton);
  }
  .cv-alert-icon {
    font-size: 1rem;
    flex-shrink: 0;
  }

  /* ===========================
     FORM CARD
  =========================== */
  .form-card {
    background: var(--white);
    border-radius: var(--radius);
    box-shadow: var(--shadow-md);
    overflow: hidden;
    animation: cardSlideUp 0.6s 0.1s ease both;
  }

  .form-card-header {
    background: var(--oxford);
    padding: 1.4rem 2rem;
    display: flex;
    align-items: center;
    gap: 1rem;
    position: relative;
  }
  .form-card-header::before {
    content: '';
    position: absolute;
    top: 0; left: 0; right: 0;
    height: 3px;
    background: linear-gradient(90deg, transparent, var(--gold), transparent);
  }

  .form-card-header-icon {
    width: 42px;
    height: 42px;
    border-radius: 50%;
    background: rgba(201,168,76,0.15);
    border: 1.5px solid rgba(201,168,76,0.35);
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.1rem;
    flex-shrink: 0;
  }

  .form-card-header-text h5 {
    font-family: 'Playfair Display', serif;
    font-size: 1.05rem;
    color: var(--white);
    margin: 0 0 2px;
  }
  .form-card-header-text p {
    font-size: 0.75rem;
    color: rgba(255,255,255,0.4);
    margin: 0;
  }

  /* ===========================
     TABLE
  =========================== */
  .cv-table-wrapper {
    overflow-x: auto;
  }

  .cv-table {
    width: 100%;
    border-collapse: collapse;
    font-size: 0.875rem;
  }

  .cv-table thead tr {
    background: var(--oxford);
  }
  .cv-table thead th {
    padding: 13px 16px;
    font-size: 0.65rem;
    font-weight: 700;
    letter-spacing: 1.5px;
    text-transform: uppercase;
    color: rgba(255,255,255,0.55);
    border: none;
    white-space: nowrap;
  }

  .cv-table tbody tr {
    border-bottom: 1px solid var(--cream);
    transition: background 0.15s;
  }
  .cv-table tbody tr:last-child {
    border-bottom: none;
  }
  .cv-table tbody tr:hover {
    background: rgba(201,168,76,0.04);
  }

  .cv-table tbody td {
    padding: 14px 16px;
    color: var(--navy);
    vertical-align: middle;
  }

  /* Serial number cell */
  .cv-table tbody td:first-child {
    font-size: 0.75rem;
    color: var(--muted);
    font-weight: 600;
    width: 40px;
  }

  /* Hackathon title */
  .hackathon-title {
    font-weight: 600;
    font-size: 0.9rem;
    color: var(--oxford);
  }

  /* Team name */
  .team-name {
    font-weight: 500;
    font-size: 0.85rem;
    color: var(--slate);
  }

  /* Date cell */
  .date-cell {
    font-size: 0.8rem;
    color: var(--slate);
    white-space: nowrap;
  }

  /* ===========================
     BADGES
  =========================== */
  .cv-badge {
    display: inline-flex;
    align-items: center;
    padding: 3px 11px;
    border-radius: 50px;
    font-size: 0.68rem;
    font-weight: 700;
    letter-spacing: 0.6px;
    text-transform: uppercase;
    white-space: nowrap;
  }

  .badge-reviewed {
    background: rgba(46,107,114,0.15);
    color: var(--eton);
  }
  .badge-pending {
    background: rgba(201,168,76,0.15);
    color: #8a6e1e;
  }

  /* ===========================
     ACTION BUTTON
  =========================== */
  .cv-btn-review {
    display: inline-flex;
    align-items: center;
    gap: 4px;
    padding: 5px 14px;
    border-radius: 6px;
    font-family: 'DM Sans', sans-serif;
    font-size: 0.73rem;
    font-weight: 600;
    text-decoration: none;
    background: rgba(201,168,76,0.12);
    color: #8a6e1e;
    border: 1px solid rgba(201,168,76,0.25);
    transition: all 0.18s ease;
    white-space: nowrap;
  }
  .cv-btn-review:hover {
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
    padding: 56px 24px;
  }
  .empty-state-icon {
    font-size: 3rem;
    margin-bottom: 14px;
    opacity: 0.35;
  }
  .empty-state h4 {
    font-family: 'Playfair Display', serif;
    font-size: 1.2rem;
    color: var(--oxford);
    margin-bottom: 6px;
  }
  .empty-state p {
    color: var(--muted);
    font-size: 0.88rem;
    margin-bottom: 0;
  }

  /* ===========================
     FOOTER
  =========================== */
  .footer-note {
    margin-top: 2rem;
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
    .form-card-header {
      padding: 1rem 1.5rem;
    }
    .cv-table th, .cv-table td {
      padding: 10px 12px;
    }
    .cv-table tbody td:first-child {
      width: 30px;
    }
    .hackathon-title, .team-name {
      white-space: normal;
      word-break: break-word;
    }
  }

</style>
</head>

<body>

<div class="submissions-container">

  <!-- ===== BACK LINK ===== -->
  <a href="/judge-dashboard" class="back-link">← Back to Dashboard</a>

  <!-- ===== PAGE HEADER ===== -->
  <div class="welcome-badge">Judge Review Panel</div>
  <h3 class="page-title">Hackathon Submissions</h3>
  <p class="page-subtitle">Review and evaluate team submissions assigned to you</p>

  <!-- ===== ALERT MESSAGES ===== -->
  <c:if test="${param.saved == 'true'}">
    <div class="cv-alert cv-alert-success">
      <span class="cv-alert-icon">✓</span>
      Review score saved successfully.
    </div>
  </c:if>

  <!-- ===== MAIN CARD ===== -->
  <div class="form-card">

    <!-- Card Header -->
    <div class="form-card-header">
      <div class="form-card-header-icon">📋</div>
      <div class="form-card-header-text">
        <h5>All Submissions</h5>
        <p>Submissions pending review and already reviewed</p>
      </div>
    </div>

    <!-- Table -->
    <div class="cv-table-wrapper">
      <table class="cv-table">
        <thead>
          <tr>
            <th>#</th>
            <th>Hackathon</th>
            <th>Team</th>
            <th>Submitted Date</th>
            <th>Status</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>

          <c:choose>
            <c:when test="${empty submissions}">
              <tr>
                <td colspan="6">
                  <div class="empty-state">
                    <div class="empty-state-icon">📭</div>
                    <h4>No Submissions Assigned</h4>
                    <p>You haven't been assigned any submissions to review yet.</p>
                  </div>
                </td>
              </tr>
            </c:when>

            <c:otherwise>
              <c:forEach items="${submissions}" var="s" varStatus="i">
                <tr>

                  <!-- # -->
                  <td>${i.count}</td>

                  <!-- Hackathon -->
                  <td>
                    <div class="hackathon-title">${hackathonMap[s.hackathonId].title}</div>
                  </td>

                  <!-- Team -->
                  <td>
                    <div class="team-name">${teamMap[s.teamId].teamName}</div>
                  </td>

                  <!-- Submitted Date -->
                  <td class="date-cell">${s.submitedDate}</td>

                  <!-- Status -->
                  <td>
                    <c:choose>
                      <c:when test="${reviewedMap[s.hackathonSubmissionId]}">
                        <span class="cv-badge badge-reviewed">Reviewed</span>
                      </c:when>
                      <c:otherwise>
                        <span class="cv-badge badge-pending">Pending</span>
                      </c:otherwise>
                    </c:choose>
                  </td>

                  <!-- Action -->
                  <td>
                    <a href="/judge/submissions/review?submissionId=${s.hackathonSubmissionId}" class="cv-btn-review">
                      <c:choose>
                        <c:when test="${reviewedMap[s.hackathonSubmissionId]}">
                          ✏ Update Review
                        </c:when>
                        <c:otherwise>
                          ⭐ Review
                        </c:otherwise>
                      </c:choose>
                    </a>
                  </td>

                </tr>
              </c:forEach>
            </c:otherwise>
          </c:choose>

        </tbody>
      </table>
    </div>
    <!-- /.cv-table-wrapper -->

  </div>
  <!-- /.form-card -->

  <!-- Footer Note -->
  <div class="footer-note">
    <div>CodeVerse Judge Panel</div>
    <div style="margin-top: 6px;">Need help? <a href="/judge-dashboard">Go to Dashboard</a></div>
  </div>

</div>

</body>
</html>