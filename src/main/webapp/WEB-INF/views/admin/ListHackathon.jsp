<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>List Hackathons</title>

<jsp:include page="AdminCSS.jsp"></jsp:include>

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

  * { box-sizing: border-box; }

  body        { font-family: 'DM Sans', sans-serif; background: #F3EFE7 !important; color: var(--navy); }
  .main-panel { background: #F3EFE7 !important; }

  /* ===========================
     ANIMATIONS
  =========================== */
  .content-wrapper {
    padding: 2rem 2rem 1rem !important;
    background: #F3EFE7 !important;
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

  .section-label {
    font-size: 0.7rem;
    font-weight: 700;
    letter-spacing: 2px;
    text-transform: uppercase;
    color: var(--muted);
    margin: 1.6rem 0 1rem;
    display: flex;
    align-items: center;
    gap: 10px;
  }
  .section-label::after {
    content: '';
    flex: 1;
    height: 1px;
    background: var(--cream);
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
  .cv-alert-info {
    background: rgba(201,168,76,0.1);
    border: 1px solid rgba(201,168,76,0.3);
    color: #8a6e1e;
  }
  .cv-alert-danger {
    background: rgba(168,88,88,0.1);
    border: 1px solid rgba(168,88,88,0.25);
    color: var(--rose);
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
    justify-content: space-between;
    position: relative;
  }
  .form-card-header::before {
    content: '';
    position: absolute;
    top: 0; left: 0; right: 0;
    height: 3px;
    background: linear-gradient(90deg, transparent, var(--gold), transparent);
  }

  .form-card-header-left {
    display: flex;
    align-items: center;
    gap: 1rem;
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
     NEW HACKATHON BUTTON (header)
  =========================== */
  .btn-new-hackathon {
    display: inline-flex;
    align-items: center;
    gap: 7px;
    padding: 9px 20px;
    border-radius: var(--radius-sm);
    font-family: 'DM Sans', sans-serif;
    font-size: 0.82rem;
    font-weight: 700;
    text-decoration: none;
    border: none;
    background: var(--gold);
    color: var(--oxford);
    cursor: pointer;
    letter-spacing: 0.3px;
    transition: all 0.22s ease;
    white-space: nowrap;
  }
  .btn-new-hackathon:hover {
    background: #d4b35a;
    color: var(--oxford);
    transform: translateY(-2px);
    box-shadow: 0 4px 16px rgba(201,168,76,0.35);
    text-decoration: none;
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
  .cv-table thead th:first-child { border-radius: 0; }

  .cv-table tbody tr {
    border-bottom: 1px solid var(--cream);
    transition: background 0.15s;
  }
  .cv-table tbody tr:last-child { border-bottom: none; }
  .cv-table tbody tr:hover { background: rgba(201,168,76,0.04); }

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

  /* Title cell */
  .hackathon-title {
    font-weight: 600;
    font-size: 0.9rem;
    color: var(--oxford);
    max-width: 200px;
  }

  /* Team size */
  .team-range {
    display: inline-flex;
    align-items: center;
    gap: 4px;
    font-size: 0.82rem;
    font-weight: 600;
    color: var(--slate);
    background: var(--ivory);
    border: 1px solid var(--cream);
    border-radius: 20px;
    padding: 3px 10px;
    white-space: nowrap;
  }
  .team-range span { color: var(--muted); font-weight: 400; }

  /* Registration dates */
  .date-range {
    font-size: 0.78rem;
    color: var(--slate);
    white-space: nowrap;
  }
  .date-range .date-sep {
    color: var(--muted);
    margin: 0 4px;
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

  /* Status badges */
  .badge-UPCOMING  { background: rgba(201,168,76,0.15);  color: #8a6e1e; }
  .badge-ONGOING   { background: rgba(46,107,114,0.15);  color: var(--eton); }
  .badge-COMPLETED { background: rgba(75,91,110,0.13);   color: var(--slate); }

  /* Payment badges */
  .badge-FREE { background: rgba(74,124,111,0.15); color: var(--sage); }
  .badge-PAID { background: rgba(168,88,88,0.12);  color: var(--rose); }

  /* Leaderboard badges */
  .badge-published { background: rgba(46,107,114,0.15);  color: var(--eton); }
  .badge-draft     { background: rgba(75,91,110,0.1);    color: var(--muted); }

  /* ===========================
     ACTION BUTTONS
  =========================== */
  .hackathon-actions {
    display: flex;
    flex-wrap: wrap;
    gap: 5px;
    min-width: 260px;
  }

  .cv-btn {
    display: inline-flex;
    align-items: center;
    gap: 4px;
    padding: 5px 11px;
    border-radius: 6px;
    font-family: 'DM Sans', sans-serif;
    font-size: 0.75rem;
    font-weight: 600;
    text-decoration: none;
    border: none;
    cursor: pointer;
    transition: all 0.18s ease;
    white-space: nowrap;
    letter-spacing: 0.2px;
  }
  .cv-btn:hover { transform: translateY(-1px); text-decoration: none; }

  /* Description */
  .cv-btn-desc {
    background: rgba(14,31,61,0.08);
    color: var(--oxford);
    border: 1px solid rgba(14,31,61,0.15);
  }
  .cv-btn-desc:hover { background: var(--oxford); color: var(--white); }

  /* Prizes */
  .cv-btn-prize {
    background: rgba(201,168,76,0.12);
    color: #7a5e0e;
    border: 1px solid rgba(201,168,76,0.3);
  }
  .cv-btn-prize:hover { background: var(--gold); color: var(--oxford); }

  /* Judges */
  .cv-btn-judge {
    background: rgba(75,91,110,0.1);
    color: var(--slate);
    border: 1px solid rgba(75,91,110,0.2);
  }
  .cv-btn-judge:hover { background: var(--slate); color: var(--white); }

  /* View */
  .cv-btn-view {
    background: rgba(46,107,114,0.1);
    color: var(--eton);
    border: 1px solid rgba(46,107,114,0.2);
  }
  .cv-btn-view:hover { background: var(--eton); color: var(--white); }

  /* Edit */
  .cv-btn-edit {
    background: rgba(201,168,76,0.1);
    color: #8a6e1e;
    border: 1px solid rgba(201,168,76,0.25);
  }
  .cv-btn-edit:hover { background: var(--gold); color: var(--oxford); }

  /* Delete */
  .cv-btn-delete {
    background: rgba(168,88,88,0.09);
    color: var(--rose);
    border: 1px solid rgba(168,88,88,0.2);
  }
  .cv-btn-delete:hover { background: var(--rose); color: var(--white); }

  /* Publish */
  .cv-btn-publish {
    background: rgba(46,107,114,0.12);
    color: var(--eton);
    border: 1px solid rgba(46,107,114,0.25);
  }
  .cv-btn-publish:hover { background: var(--eton); color: var(--white); }

  /* Unpublish */
  .cv-btn-unpublish {
    background: rgba(75,91,110,0.1);
    color: var(--slate);
    border: 1px solid rgba(75,91,110,0.2);
  }
  .cv-btn-unpublish:hover { background: var(--slate); color: var(--white); }

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
    margin-bottom: 20px;
  }

  /* ===========================
     RESPONSIVE HIDE
  =========================== */
  @media (max-width: 991.98px) { .hide-md { display: none; } }
  @media (max-width: 767.98px) {
    .hide-sm { display: none; }
    .hackathon-actions { min-width: 200px; }
  }

</style>
</head>

<body>
<div class="container-scroller">

  <jsp:include page="AdminHeader.jsp"></jsp:include>

  <div class="container-fluid page-body-wrapper">

    <jsp:include page="AdminLeftSidebar.jsp"></jsp:include>

    <div class="main-panel">
      <div class="content-wrapper">

        <!-- ===== PAGE HEADER ===== -->
        <div class="welcome-badge">Admin Panel</div>
        <h3 class="page-title">Hackathon Management</h3>
        <p class="page-subtitle">View, manage, and control all hackathon events on the platform</p>

        <!-- ===== ALERT MESSAGES ===== -->
        <c:if test="${success == 'leaderboardPublished'}">
          <div class="cv-alert cv-alert-success">
            <span class="cv-alert-icon">✓</span>
            Leaderboard published successfully. It is now visible to all participants.
          </div>
        </c:if>
        <c:if test="${success == 'leaderboardUnpublished'}">
          <div class="cv-alert cv-alert-info">
            <span class="cv-alert-icon">ℹ</span>
            Leaderboard has been unpublished and is no longer visible to participants.
          </div>
        </c:if>
        <c:if test="${error == 'leaderboardNeedsComplete'}">
          <div class="cv-alert cv-alert-danger">
            <span class="cv-alert-icon">⚠</span>
            The hackathon must be marked as <strong>Completed</strong> before publishing the leaderboard.
          </div>
        </c:if>

        <div class="section-label">All Events</div>

        <!-- ===== MAIN CARD ===== -->
        <div class="form-card">

          <!-- Card Header -->
          <div class="form-card-header">
            <div class="form-card-header-left">
              <div class="form-card-header-icon">💻</div>
              <div class="form-card-header-text">
                <h5>All Hackathons</h5>
                <p>Browse, edit, and manage every hackathon event</p>
              </div>
            </div>
            <a href="newHackathon" class="btn-new-hackathon">
              + New Hackathon
            </a>
          </div>

          <!-- Table -->
          <div class="cv-table-wrapper">
            <table class="cv-table">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Title</th>
                  <th>Status</th>
                  <th class="hide-md">Event Type</th>
                  <th class="hide-sm">Payment</th>
                  <th>Team Size</th>
                  <th class="hide-md">Location</th>
                  <th class="hide-sm">Registration Period</th>
                  <th>Leaderboard</th>
                  <th>Actions</th>
                </tr>
              </thead>
              <tbody>

                <c:choose>
                  <c:when test="${empty allHackthon}">
                    <tr>
                      <td colspan="10">
                        <div class="empty-state">
                          <div class="empty-state-icon">💻</div>
                          <h4>No Hackathons Yet</h4>
                          <p>You haven't created any hackathon events. Start by adding your first one.</p>
                          <a href="newHackathon" class="btn-new-hackathon">+ Create First Hackathon</a>
                        </div>
                      </td>
                    </tr>
                  </c:when>

                  <c:otherwise>
                    <c:forEach var="h" items="${allHackthon}" varStatus="i">
                      <tr>

                        <!-- # -->
                        <td>${i.count}</td>

                        <!-- Title -->
                        <td>
                          <div class="hackathon-title">${h.title}</div>
                        </td>

                        <!-- Status -->
                        <td>
                          <span class="cv-badge badge-${h.status}">${h.status}</span>
                        </td>

                        <!-- Event Type -->
                        <td class="hide-md" style="font-size:0.82rem; color:var(--slate);">
                          ${h.eventType}
                        </td>

                        <!-- Payment -->
                        <td class="hide-sm">
                          <span class="cv-badge badge-${h.payment}">${h.payment}</span>
                        </td>

                        <!-- Team Size -->
                        <td>
                          <span class="team-range">
                            ${h.minTeamSize} <span>–</span> ${h.maxTeamSize}
                          </span>
                        </td>

                        <!-- Location -->
                        <td class="hide-md" style="font-size:0.82rem; color:var(--slate);">
                          ${h.location}
                        </td>

                        <!-- Registration Period -->
                        <td class="hide-sm">
                          <div class="date-range">
                            ${h.registrationStartDate}
                            <span class="date-sep">→</span>
                            ${h.registrationEndDate}
                          </div>
                        </td>

                        <!-- Leaderboard -->
                        <td>
                          <c:choose>
                            <c:when test="${h.leaderboardPublished}">
                              <span class="cv-badge badge-published">Published</span>
                            </c:when>
                            <c:otherwise>
                              <span class="cv-badge badge-draft">Draft</span>
                            </c:otherwise>
                          </c:choose>
                        </td>

                        <!-- Actions -->
                        <td>
                          <div class="hackathon-actions">
                          
                          
                          <a href="/admin/hackathon/description/list?hackathonId=${h.hackathonId}"
                            class="cv-btn cv-btn-desc">📄 Desc</a>
                            
                            <a href="/admin/hackathon/prize/list?hackathonId=${h.hackathonId}"
       						class="cv-btn cv-btn-prize">🏆 Prizes</a>

                            <a href="manageHackathonJudge?hackathonId=${h.hackathonId}"
                               class="cv-btn cv-btn-judge">⚖ Judges</a>

                            <c:if test="${h.status == 'COMPLETED' || h.status == 'COMPLETE'}">
                              <c:choose>
                                <c:when test="${h.leaderboardPublished}">
                                  <a href="toggleLeaderboardPublish?hackathonId=${h.hackathonId}"
                                     class="cv-btn cv-btn-unpublish">↓ Unpublish</a>
                                </c:when>
                                <c:otherwise>
                                  <a href="toggleLeaderboardPublish?hackathonId=${h.hackathonId}"
                                     class="cv-btn cv-btn-publish">↑ Publish</a>
                                </c:otherwise>
                              </c:choose>
                            </c:if>

                            <a href="viewHackathon?hackathonId=${h.hackathonId}"
                               class="cv-btn cv-btn-view">👁 View</a>

                            <a href="editHackathon?hackathonId=${h.hackathonId}"
                               class="cv-btn cv-btn-edit">✏ Edit</a>

                            <a href="deleteHackathon?hackathonId=${h.hackathonId}"
                               class="cv-btn cv-btn-delete"
                               onclick="return confirm('Are you sure you want to delete this hackathon? This action cannot be undone.')">
                               🗑 Delete
                            </a>

                          </div>
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

      </div>
      <!-- /.content-wrapper -->

      <jsp:include page="AdminFooter.jsp"></jsp:include>

    </div>
    <!-- /.main-panel -->
  </div>
  <!-- /.page-body-wrapper -->
</div>
<!-- /.container-scroller -->

</body>
</html>
