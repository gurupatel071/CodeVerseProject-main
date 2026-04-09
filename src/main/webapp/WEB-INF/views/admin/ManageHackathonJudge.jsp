<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Manage Hackathon Judges</title>

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

  .hackathon-info {
    background: var(--ivory);
    border-left: 4px solid var(--gold);
    padding: 0.75rem 1rem;
    border-radius: var(--radius-sm);
    margin-bottom: 1.5rem;
  }
  
  .hackathon-info p {
    margin: 0;
    font-size: 0.9rem;
    color: var(--slate);
  }
  
  .hackathon-info strong {
    color: var(--oxford);
    font-weight: 700;
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
  .cv-alert-warning {
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
    flex-wrap: wrap;
    gap: 1rem;
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
     BACK BUTTON
  =========================== */
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
    background: rgba(201,168,76,0.12);
    color: #8a6e1e;
    border: 1px solid rgba(201,168,76,0.25);
    transition: all 0.18s ease;
  }
  .btn-back:hover {
    background: var(--gold);
    color: var(--oxford);
    transform: translateY(-1px);
    text-decoration: none;
  }

  /* ===========================
     ASSIGN FORM
  =========================== */
  .assign-section {
    padding: 1.5rem 2rem;
    border-bottom: 1px solid var(--cream);
    background: var(--ivory);
  }

  .assign-form {
    display: flex;
    flex-wrap: wrap;
    gap: 1rem;
    align-items: flex-end;
  }

  .assign-form-group {
    flex: 1;
    min-width: 250px;
  }

  .assign-form-group label {
    font-size: 0.7rem;
    font-weight: 700;
    letter-spacing: 1px;
    text-transform: uppercase;
    color: var(--muted);
    margin-bottom: 0.5rem;
    display: block;
  }

  .cv-select {
    width: 100%;
    padding: 10px 14px;
    font-family: 'DM Sans', sans-serif;
    font-size: 0.9rem;
    border: 1.5px solid var(--cream);
    border-radius: var(--radius-sm);
    background: var(--white);
    color: var(--navy);
    transition: all 0.2s ease;
    cursor: pointer;
  }
  .cv-select:focus {
    outline: none;
    border-color: var(--gold);
    box-shadow: 0 0 0 3px rgba(201,168,76,0.1);
  }

  .btn-assign {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    padding: 10px 24px;
    border-radius: var(--radius-sm);
    font-family: 'DM Sans', sans-serif;
    font-size: 0.85rem;
    font-weight: 700;
    border: none;
    background: var(--oxford);
    color: var(--gold);
    cursor: pointer;
    transition: all 0.22s ease;
    letter-spacing: 0.3px;
    margin-bottom: 0;
  }
  .btn-assign:hover {
    background: var(--eton);
    color: var(--white);
    transform: translateY(-2px);
    box-shadow: var(--shadow-sm);
  }

  /* ===========================
     TABLE
  =========================== */
  .cv-table-wrapper {
    overflow-x: auto;
    padding: 0 2rem 2rem 2rem;
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

  /* Judge name cell */
  .judge-name {
    font-weight: 600;
    font-size: 0.9rem;
    color: var(--oxford);
    white-space: nowrap;
  }

  /* Email cell */
  .judge-email {
    font-size: 0.82rem;
    color: var(--slate);
  }

  /* Contact cell */
  .judge-contact {
    font-size: 0.82rem;
    color: var(--slate);
    white-space: nowrap;
  }

  /* ===========================
     REMOVE BUTTON
  =========================== */
  .btn-remove {
    display: inline-flex;
    align-items: center;
    gap: 5px;
    padding: 5px 14px;
    border-radius: 6px;
    font-family: 'DM Sans', sans-serif;
    font-size: 0.73rem;
    font-weight: 600;
    text-decoration: none;
    border: none;
    cursor: pointer;
    transition: all 0.18s ease;
    white-space: nowrap;
    background: rgba(168,88,88,0.09);
    color: var(--rose);
    border: 1px solid rgba(168,88,88,0.2);
  }
  .btn-remove:hover {
    background: var(--rose);
    color: var(--white);
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
    margin-bottom: 20px;
  }

  /* ===========================
     RESPONSIVE
  =========================== */
  @media (max-width: 767.98px) {
    .assign-form {
      flex-direction: column;
      align-items: stretch;
    }
    .assign-form-group {
      min-width: 100%;
    }
    .btn-assign {
      justify-content: center;
    }
    .cv-table-wrapper {
      padding: 0 1rem 1rem 1rem;
    }
    .judge-name,
    .judge-email,
    .judge-contact {
      white-space: normal;
      word-break: break-word;
    }
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
        <div class="welcome-badge">Judge Assignment</div>
        <h3 class="page-title">Manage Hackathon Judges</h3>
        <p class="page-subtitle">Assign or remove judges for evaluating hackathon projects</p>

        <!-- ===== HACKATHON INFO ===== -->
        <div class="hackathon-info">
          <p><strong>Hackathon:</strong> ${hackathon.title}</p>
        </div>

        <!-- ===== ALERT MESSAGES ===== -->
        <c:if test="${success == 'added'}">
          <div class="cv-alert cv-alert-success">
            <span class="cv-alert-icon">✓</span>
            Judge assigned successfully.
          </div>
        </c:if>
        <c:if test="${success == 'removed'}">
          <div class="cv-alert cv-alert-success">
            <span class="cv-alert-icon">✓</span>
            Judge removed from hackathon.
          </div>
        </c:if>
        <c:if test="${error == 'alreadyAssigned'}">
          <div class="cv-alert cv-alert-warning">
            <span class="cv-alert-icon">⚠</span>
            Judge already assigned to this hackathon.
          </div>
        </c:if>
        <c:if test="${error == 'invalidJudge'}">
          <div class="cv-alert cv-alert-danger">
            <span class="cv-alert-icon">✗</span>
            Invalid judge selection.
          </div>
        </c:if>

        <div class="section-label">Assign New Judge</div>

        <!-- ===== MAIN CARD ===== -->
        <div class="form-card">

          <!-- Card Header -->
          <div class="form-card-header">
            <div class="form-card-header-left">
              <div class="form-card-header-icon">⚖️</div>
              <div class="form-card-header-text">
                <h5>Judge Assignment</h5>
                <p>Add judges to evaluate this hackathon</p>
              </div>
            </div>
            <a href="listHackathon" class="btn-back">
              ← Back to Hackathons
            </a>
          </div>

          <!-- Assign Form Section -->
          <div class="assign-section">
            <form action="saveHackathonJudge" method="post" class="assign-form">
              <input type="hidden" name="hackathonId" value="${hackathon.hackathonId}">
              <div class="assign-form-group">
                <label>Select Judge to Assign</label>
                <select name="userId" class="cv-select" required>
                  <option value="">Choose a judge...</option>
                  <c:forEach items="${availableJudges}" var="j">
                    <option value="${j.userId}">${j.firstName} ${j.lastName} - ${j.email}</option>
                  </c:forEach>
                </select>
              </div>
              <div>
                <button type="submit" class="btn-assign">
                  + Assign Judge
                </button>
              </div>
            </form>
          </div>

          <div class="section-label" style="margin: 0 2rem 1rem 2rem;">Assigned Judges</div>

          <!-- Table Section -->
          <div class="cv-table-wrapper">
            <table class="cv-table">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Name</th>
                  <th>Email</th>
                  <th>Contact</th>
                  <th>Action</th>
                </tr>
              </thead>
              <tbody>

                <c:choose>
                  <c:when test="${empty assignedJudges}">
                    <tr>
                      <td colspan="5">
                        <div class="empty-state">
                          <div class="empty-state-icon">⚖️</div>
                          <h4>No Judges Assigned</h4>
                          <p>This hackathon doesn't have any judges assigned yet. Use the form above to add judges.</p>
                        </div>
                      </td>
                    </tr>
                  </c:when>

                  <c:otherwise>
                    <c:forEach items="${assignedJudges}" var="a" varStatus="i">
                      <tr>

                        <!-- # -->
                        <td>${i.count}</td>

                        <!-- Name -->
                        <td>
                          <div class="judge-name">${judgeMap[a.userId].firstName} ${judgeMap[a.userId].lastName}</div>
                        </td>

                        <!-- Email -->
                        <td class="judge-email">${judgeMap[a.userId].email}</td>

                        <!-- Contact -->
                        <td class="judge-contact">${judgeMap[a.userId].contactNum}</td>

                        <!-- Action -->
                        <td>
                          <a class="btn-remove"
                            href="deleteHackathonJudge?hackathonJudgeId=${a.hackathonJudgeId}&hackathonId=${hackathon.hackathonId}"
                            onclick="return confirm('Remove this judge from hackathon?')">
                            🗑 Remove
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