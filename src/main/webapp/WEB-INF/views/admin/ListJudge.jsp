<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>List Judges</title>

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
     NEW JUDGE BUTTON (header)
  =========================== */
  .btn-new-judge {
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
  .btn-new-judge:hover {
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

  /* Name cell */
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

  /* Qualification, Designation, Organization cells */
  .judge-qualification,
  .judge-designation,
  .judge-organization {
    font-size: 0.82rem;
    color: var(--slate);
    max-width: 150px;
    white-space: normal;
    word-break: break-word;
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
  .badge-active { 
    background: rgba(46,107,114,0.15); 
    color: var(--eton); 
  }
  .badge-inactive { 
    background: rgba(168,88,88,0.12); 
    color: var(--rose); 
  }

  /* Password reset badges */
  .badge-pending { 
    background: rgba(201,168,76,0.15); 
    color: #8a6e1e; 
  }
  .badge-completed { 
    background: rgba(46,107,114,0.12); 
    color: var(--eton); 
  }

  /* ===========================
     ACTION BUTTONS (if needed in future)
  =========================== */
  .judge-actions {
    display: flex;
    flex-wrap: wrap;
    gap: 5px;
    min-width: 100px;
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

  /* Edit button (if needed) */
  .cv-btn-edit {
    background: rgba(201,168,76,0.1);
    color: #8a6e1e;
    border: 1px solid rgba(201,168,76,0.25);
  }
  .cv-btn-edit:hover { background: var(--gold); color: var(--oxford); }

  /* View button (if needed) */
  .cv-btn-view {
    background: rgba(46,107,114,0.1);
    color: var(--eton);
    border: 1px solid rgba(46,107,114,0.2);
  }
  .cv-btn-view:hover { background: var(--eton); color: var(--white); }

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
  @media (max-width: 991.98px) { 
    .hide-md { display: none; } 
  }
  @media (max-width: 767.98px) {
    .hide-sm { display: none; }
    .judge-actions { min-width: 100px; }
    .judge-qualification,
    .judge-designation,
    .judge-organization {
      max-width: 120px;
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
        <div class="welcome-badge">Judge Management</div>
        <h3 class="page-title">Judge Directory</h3>
        <p class="page-subtitle">View and manage all judges who evaluate hackathon projects</p>

        <!-- ===== ALERT MESSAGES ===== -->
        <c:if test="${param.invited == 'true'}">
          <div class="cv-alert cv-alert-success">
            <span class="cv-alert-icon">✓</span>
            Judge invited successfully. Email with temporary password sent.
          </div>
        </c:if>

        <div class="section-label">All Judges</div>

        <!-- ===== MAIN CARD ===== -->
        <div class="form-card">

          <!-- Card Header -->
          <div class="form-card-header">
            <div class="form-card-header-left">
              <div class="form-card-header-icon">⚖️</div>
              <div class="form-card-header-text">
                <h5>All Judges</h5>
                <p>Browse, view, and manage all registered judges</p>
              </div>
            </div>
            <a href="newJudge" class="btn-new-judge">
              + Invite New Judge
            </a>
          </div>

          <!-- Table -->
          <div class="cv-table-wrapper">
            <table class="cv-table">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Name</th>
                  <th>Email</th>
                  <th class="hide-sm">Contact</th>
                  <th class="hide-md">Qualification</th>
                  <th class="hide-md">Designation</th>
                  <th class="hide-md">Organization</th>
                  <th>Status</th>
                  <th>Password Reset</th>
                </tr>
              </thead>
              <tbody>

                <c:choose>
                  <c:when test="${empty judgeList}">
                    <tr>
                      <td colspan="9">
                        <div class="empty-state">
                          <div class="empty-state-icon">⚖️</div>
                          <h4>No Judges Found</h4>
                          <p>You haven't invited any judges yet. Start by adding your first judge.</p>
                          <a href="newJudge" class="btn-new-judge">+ Invite First Judge</a>
                        </div>
                      </td>
                    </tr>
                  </c:when>

                  <c:otherwise>
                    <c:forEach var="j" items="${judgeList}" varStatus="i">
                      <tr>

                        <!-- # -->
                        <td>${i.count}</td>

                        <!-- Name -->
                        <td>
                          <div class="judge-name">${j.firstName} ${j.lastName}</div>
                        </td>

                        <!-- Email -->
                        <td class="judge-email">${j.email}</td>

                        <!-- Contact -->
                        <td class="judge-contact hide-sm">${j.contactNum}</td>

                        <!-- Qualification -->
                        <td class="judge-qualification hide-md">${j.qualification}</td>

                        <!-- Designation -->
                        <td class="judge-designation hide-md">${j.designation}</td>

                        <!-- Organization -->
                        <td class="judge-organization hide-md">${j.organization}</td>

                        <!-- Status -->
                        <td>
                          <c:choose>
                            <c:when test="${j.active}">
                              <span class="cv-badge badge-active">Active</span>
                            </c:when>
                            <c:otherwise>
                              <span class="cv-badge badge-inactive">Inactive</span>
                            </c:otherwise>
                          </c:choose>
                        </td>

                        <!-- Password Reset -->
                        <td>
                          <c:choose>
                            <c:when test="${j.passwordResetRequired}">
                              <span class="cv-badge badge-pending">Pending</span>
                            </c:when>
                            <c:otherwise>
                              <span class="cv-badge badge-completed">Completed</span>
                            </c:otherwise>
                          </c:choose>
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