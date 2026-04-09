<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>View Hackathon</title>

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
     MAIN VIEW CARD
  =========================== */
  .form-card {
    background: var(--white);
    border-radius: var(--radius);
    box-shadow: var(--shadow-md);
    overflow: hidden;
    animation: cardSlideUp 0.6s 0.1s ease both;
    margin-bottom: 1.6rem;
  }

  .form-card-header {
    background: var(--oxford);
    padding: 1.5rem 2rem;
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
    width: 44px;
    height: 44px;
    border-radius: 50%;
    background: rgba(201,168,76,0.15);
    border: 1.5px solid rgba(201,168,76,0.35);
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.2rem;
    flex-shrink: 0;
  }

  .form-card-header-text h5 {
    font-family: 'Playfair Display', serif;
    font-size: 1.1rem;
    color: var(--white);
    margin: 0 0 2px;
  }
  .form-card-header-text p {
    font-size: 0.75rem;
    color: rgba(255,255,255,0.4);
    margin: 0;
  }

  .form-card-body { padding: 0; }

  /* ===========================
     SECTION TITLE INSIDE CARD
  =========================== */
  .card-section-title {
    font-family: 'Playfair Display', serif;
    font-size: 0.95rem;
    color: var(--oxford);
    padding: 1.4rem 2rem 0.6rem;
    margin: 0;
    display: flex;
    align-items: center;
    gap: 8px;
    border-top: 1px solid var(--cream);
  }
  .card-section-title:first-of-type { border-top: none; }

  .card-section-icon {
    width: 26px;
    height: 26px;
    border-radius: 6px;
    background: rgba(14,31,61,0.07);
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 0.85rem;
    flex-shrink: 0;
  }

  /* ===========================
     INFO GRID — KEY / VALUE PAIRS
  =========================== */
  .info-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
    gap: 0;
    padding: 0.5rem 1.4rem 1.4rem;
  }

  .info-item {
    padding: 0.75rem 0.6rem;
    border-bottom: 1px solid rgba(237,233,224,0.7);
  }
  .info-item:last-child { border-bottom: none; }

  .info-label {
    font-size: 0.65rem;
    font-weight: 700;
    letter-spacing: 1.2px;
    text-transform: uppercase;
    color: var(--muted);
    margin-bottom: 4px;
  }

  .info-value {
    font-size: 0.92rem;
    font-weight: 500;
    color: var(--navy);
  }

  .info-value.empty { color: var(--muted); font-style: normal; font-weight: 400; }

  /* ===========================
     BADGES (inline)
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
  }
  .badge-UPCOMING  { background: rgba(201,168,76,0.15);  color: #8a6e1e; }
  .badge-ONGOING   { background: rgba(46,107,114,0.15);  color: var(--eton); }
  .badge-COMPLETED { background: rgba(75,91,110,0.13);   color: var(--slate); }
  .badge-FREE      { background: rgba(74,124,111,0.15);  color: var(--sage); }
  .badge-PAID      { background: rgba(168,88,88,0.12);   color: var(--rose); }
  .badge-published { background: rgba(46,107,114,0.15);  color: var(--eton); }
  .badge-draft     { background: rgba(75,91,110,0.1);    color: var(--muted); }

  /* Team size pill */
  .team-range {
    display: inline-flex;
    align-items: center;
    gap: 4px;
    font-size: 0.84rem;
    font-weight: 600;
    color: var(--slate);
    background: var(--ivory);
    border: 1px solid var(--cream);
    border-radius: 20px;
    padding: 3px 12px;
  }
  .team-range span { color: var(--muted); font-weight: 400; }

  /* ===========================
     HTML DETAILS BOX
  =========================== */
  .html-content-box {
    margin: 0 2rem 1.6rem;
    background: var(--ivory);
    border: 1.5px solid var(--cream);
    border-radius: var(--radius-sm);
    padding: 1.2rem 1.4rem;
    font-size: 0.9rem;
    line-height: 1.75;
    color: var(--slate);
  }
  .html-content-box.empty-box {
    color: var(--muted);
    font-style: normal;
    text-align: center;
    padding: 2rem;
  }

  /* ===========================
     JUDGES GRID
  =========================== */
  .judges-wrap { padding: 0.8rem 2rem 1.6rem; }

  .judge-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
    gap: 12px;
  }

  .judge-card {
    background: var(--ivory);
    border: 1.5px solid var(--cream);
    border-radius: var(--radius-sm);
    padding: 14px 16px;
    display: flex;
    align-items: center;
    gap: 13px;
    transition: border-color 0.2s, box-shadow 0.2s;
  }
  .judge-card:hover {
    border-color: rgba(201,168,76,0.4);
    box-shadow: var(--shadow-sm);
  }

  .judge-avatar {
    width: 50px;
    height: 50px;
    border-radius: 50%;
    object-fit: cover;
    border: 2px solid var(--cream);
    flex-shrink: 0;
  }

  .judge-name {
    font-weight: 600;
    font-size: 0.92rem;
    color: var(--oxford);
  }

  .judge-email {
    font-size: 0.78rem;
    color: var(--eton);
    margin-top: 2px;
  }

  .judge-meta {
    font-size: 0.73rem;
    color: var(--muted);
    margin-top: 2px;
  }

  .no-data {
    padding: 0 2rem 1.4rem;
    font-size: 0.88rem;
    color: var(--muted);
  }

  /* ===========================
     PRIZE TABLE
  =========================== */
  .prize-wrap { padding: 0.8rem 2rem 1.6rem; }

  .cv-prize-table {
    width: 100%;
    border-collapse: collapse;
    font-size: 0.875rem;
  }
  .cv-prize-table thead tr { background: var(--oxford); }
  .cv-prize-table thead th {
    padding: 11px 16px;
    font-size: 0.65rem;
    font-weight: 700;
    letter-spacing: 1.5px;
    text-transform: uppercase;
    color: rgba(255,255,255,0.55);
    border: none;
  }
  .cv-prize-table tbody tr { border-bottom: 1px solid var(--cream); transition: background 0.15s; }
  .cv-prize-table tbody tr:last-child { border-bottom: none; }
  .cv-prize-table tbody tr:hover { background: rgba(201,168,76,0.04); }
  .cv-prize-table tbody td { padding: 13px 16px; color: var(--navy); vertical-align: middle; }

  .prize-rank {
    font-size: 0.75rem;
    color: var(--muted);
    font-weight: 600;
    width: 40px;
  }

  .prize-title-cell {
    font-weight: 600;
    color: var(--oxford);
  }

  .prize-medal {
    display: inline-flex;
    align-items: center;
    gap: 6px;
  }

  /* ===========================
     CARD FOOTER — ACTIONS
  =========================== */
  .form-footer {
    padding: 1.2rem 2rem;
    background: var(--ivory);
    border-top: 1px solid var(--cream);
    display: flex;
    justify-content: flex-end;
    gap: 0.75rem;
    align-items: center;
  }

  .btn-back {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    padding: 10px 22px;
    border-radius: var(--radius-sm);
    font-family: 'DM Sans', sans-serif;
    font-size: 0.88rem;
    font-weight: 600;
    text-decoration: none;
    border: 1.5px solid var(--slate);
    color: var(--slate);
    background: transparent;
    cursor: pointer;
    transition: all 0.22s ease;
  }
  .btn-back:hover { background: var(--slate); color: var(--white); text-decoration: none; }

  .btn-edit {
    display: inline-flex;
    align-items: center;
    gap: 7px;
    padding: 10px 26px;
    border-radius: var(--radius-sm);
    font-family: 'DM Sans', sans-serif;
    font-size: 0.88rem;
    font-weight: 700;
    text-decoration: none;
    border: none;
    background: var(--oxford);
    color: var(--gold);
    cursor: pointer;
    letter-spacing: 0.3px;
    transition: all 0.22s ease;
  }
  .btn-edit:hover {
    background: var(--eton);
    color: var(--white);
    transform: translateY(-2px);
    box-shadow: var(--shadow-md);
    text-decoration: none;
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
        <h3 class="page-title">Hackathon Details</h3>
        <p class="page-subtitle">Full overview of the selected hackathon event</p>

        <div class="section-label">Event Overview</div>

        <!-- ===== MAIN CARD ===== -->
        <div class="form-card">

          <!-- Card Header -->
          <div class="form-card-header">
            <div class="form-card-header-left">
              <div class="form-card-header-icon">💻</div>
              <div class="form-card-header-text">
                <h5>${hackathon.title}</h5>
                <p>Hackathon ID: ${hackathon.hackathonId}</p>
              </div>
            </div>
            <c:choose>
              <c:when test="${hackathon.leaderboardPublished}">
                <span class="cv-badge badge-published">📢 Leaderboard Published</span>
              </c:when>
              <c:otherwise>
                <span class="cv-badge badge-draft">📝 Leaderboard Draft</span>
              </c:otherwise>
            </c:choose>
          </div>

          <!-- ─── SECTION 1: Basic Details ─── -->
          <div class="card-section-title">
            <span class="card-section-icon">📋</span> Basic Information
          </div>

          <div class="info-grid">

            <div class="info-item">
              <div class="info-label">Title</div>
              <div class="info-value">${hackathon.title}</div>
            </div>

            <div class="info-item">
              <div class="info-label">Status</div>
              <div class="info-value">
                <span class="cv-badge badge-${hackathon.status}">${hackathon.status}</span>
              </div>
            </div>

            <div class="info-item">
              <div class="info-label">Event Type</div>
              <div class="info-value">${hackathon.eventType}</div>
            </div>

            <div class="info-item">
              <div class="info-label">Payment</div>
              <div class="info-value">
                <span class="cv-badge badge-${hackathon.payment}">${hackathon.payment}</span>
              </div>
            </div>

            <div class="info-item">
              <div class="info-label">Location</div>
              <div class="info-value">
                <c:choose>
                  <c:when test="${not empty hackathon.location}">${hackathon.location}</c:when>
                  <c:otherwise><span class="empty">—</span></c:otherwise>
                </c:choose>
              </div>
            </div>

            <div class="info-item">
              <div class="info-label">User Type</div>
              <div class="info-value">${hackathon.userTypeId}</div>
            </div>

          </div>

          <!-- ─── SECTION 2: Participation ─── -->
          <div class="card-section-title">
            <span class="card-section-icon">👥</span> Participation
          </div>

          <div class="info-grid">

            <div class="info-item">
              <div class="info-label">Team Size</div>
              <div class="info-value">
                <span class="team-range">
                  ${hackathon.minTeamSize} <span>–</span> ${hackathon.maxTeamSize} members
                </span>
              </div>
            </div>

            <div class="info-item">
              <div class="info-label">Registration Start</div>
              <div class="info-value">${hackathon.registrationStartDate}</div>
            </div>

            <div class="info-item">
              <div class="info-label">Registration End</div>
              <div class="info-value">${hackathon.registrationEndDate}</div>
            </div>

            <div class="info-item">
              <div class="info-label">Leaderboard Status</div>
              <div class="info-value">
                <c:choose>
                  <c:when test="${hackathon.leaderboardPublished}">
                    <span class="cv-badge badge-published">Published</span>
                  </c:when>
                  <c:otherwise>
                    <span class="cv-badge badge-draft">Draft</span>
                  </c:otherwise>
                </c:choose>
              </div>
            </div>

          </div>

          <!-- ─── SECTION 3: Short Description ─── -->
          <c:if test="${not empty hackathon.description}">
            <div class="card-section-title">
              <span class="card-section-icon">📝</span> Short Description
            </div>
            <div style="padding: 0.4rem 2rem 1.4rem;">
              <div class="html-content-box">${hackathon.description}</div>
            </div>
          </c:if>

          <!-- ─── SECTION 4: Full HTML Details ─── -->
          <div class="card-section-title">
            <span class="card-section-icon">📄</span> Full Hackathon Details
          </div>
          <c:choose>
            <c:when test="${not empty hackathonDescription}">
              <div class="html-content-box">
                <c:out value="${hackathonDescription.hackathonDetails}" escapeXml="false" />
              </div>
            </c:when>
            <c:otherwise>
              <div class="html-content-box empty-box">No detailed description has been added yet.</div>
            </c:otherwise>
          </c:choose>

          <!-- ─── SECTION 5: Assigned Judges ─── -->
          <div class="card-section-title">
            <span class="card-section-icon">⚖</span> Assigned Judges
          </div>
          <c:choose>
            <c:when test="${empty judgeUsers}">
              <div class="no-data">No judges have been assigned to this hackathon yet.</div>
            </c:when>
            <c:otherwise>
              <div class="judges-wrap">
                <div class="judge-grid">
                  <c:forEach items="${judgeUsers}" var="j">
                    <div class="judge-card">
                      <c:choose>
                        <c:when test="${not empty j.profilePicURL}">
                          <img src="${j.profilePicURL}" class="judge-avatar" alt="Judge">
                        </c:when>
                        <c:otherwise>
                          <img src="assets/images/faces/dummy.jpg" class="judge-avatar" alt="Judge">
                        </c:otherwise>
                      </c:choose>
                      <div>
                        <div class="judge-name">${j.firstName} ${j.lastName}</div>
                        <div class="judge-email">${j.email}</div>
                        <c:if test="${not empty j.designation}">
                          <div class="judge-meta">🏷 ${j.designation}</div>
                        </c:if>
                        <c:if test="${not empty j.qualification}">
                          <div class="judge-meta">🎓 ${j.qualification}</div>
                        </c:if>
                        <c:if test="${not empty j.organization}">
                          <div class="judge-meta">🏢 ${j.organization}</div>
                        </c:if>
                      </div>
                    </div>
                  </c:forEach>
                </div>
              </div>
            </c:otherwise>
          </c:choose>

          <!-- ─── SECTION 6: Prize Details ─── -->
          <div class="card-section-title">
            <span class="card-section-icon">🏆</span> Prize Details
          </div>
          <c:choose>
            <c:when test="${empty prizeList}">
              <div class="no-data">No prize details have been added yet.</div>
            </c:when>
            <c:otherwise>
              <div class="prize-wrap">
                <div class="cv-table-wrapper" style="border-radius: var(--radius-sm); overflow: hidden; border: 1px solid var(--cream);">
                  <table class="cv-prize-table">
                    <thead>
                      <tr>
                        <th>#</th>
                        <th>Prize Title</th>
                        <th>Description</th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach var="p" items="${prizeList}" varStatus="i">
                        <tr>
                          <td class="prize-rank">
                            <c:choose>
                              <c:when test="${i.count == 1}">🥇</c:when>
                              <c:when test="${i.count == 2}">🥈</c:when>
                              <c:when test="${i.count == 3}">🥉</c:when>
                              <c:otherwise>${i.count}</c:otherwise>
                            </c:choose>
                          </td>
                          <td class="prize-title-cell">${p.prizeTitle}</td>
                          <td style="color: var(--slate); font-size: 0.875rem;">${p.prizeDescription}</td>
                        </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                </div>
              </div>
            </c:otherwise>
          </c:choose>

          <!-- ===== FOOTER ACTIONS ===== -->
          <div class="form-footer">
            <a href="listHackathon" class="btn-back">← Back to List</a>
            <a href="editHackathon?hackathonId=${hackathon.hackathonId}" class="btn-edit">✏ Edit Hackathon</a>
          </div>

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
