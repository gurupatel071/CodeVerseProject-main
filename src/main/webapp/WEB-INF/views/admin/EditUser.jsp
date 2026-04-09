<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Edit User | CodeVerse</title>

<jsp:include page="AdminCSS.jsp"></jsp:include>

<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=DM+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet">

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
    --shadow-sm: 0 2px 12px rgba(27,42,74,0.06);
    --shadow-md: 0 8px 28px rgba(27,42,74,0.1);
    --radius:    16px;
    --radius-sm: 10px;
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
  }

  /* ===========================
     PAGE CONTAINER - CENTERED
  =========================== */
  .page-container {
    max-width: 800px;
    width: 100%;
    margin: 0 auto;
    padding: 2rem;
  }

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
     FORM BODY
  =========================== */
  .form-body {
    padding: 2rem;
  }

  .form-group {
    margin-bottom: 1.5rem;
  }

  .form-group label {
    font-size: 0.7rem;
    font-weight: 700;
    letter-spacing: 1px;
    text-transform: uppercase;
    color: var(--muted);
    margin-bottom: 0.5rem;
    display: block;
  }

  .cv-input {
    width: 100%;
    padding: 11px 14px;
    font-family: 'DM Sans', sans-serif;
    font-size: 0.9rem;
    border: 1.5px solid var(--cream);
    border-radius: var(--radius-sm);
    background: var(--white);
    color: var(--navy);
    transition: all 0.2s ease;
  }
  .cv-input:focus {
    outline: none;
    border-color: var(--gold);
    box-shadow: 0 0 0 3px rgba(201,168,76,0.1);
  }
  .cv-input::placeholder {
    color: var(--muted);
    font-size: 0.85rem;
    opacity: 0.5;
  }

  .cv-select {
    width: 100%;
    padding: 11px 14px;
    font-family: 'DM Sans', sans-serif;
    font-size: 0.9rem;
    border: 1.5px solid var(--cream);
    border-radius: var(--radius-sm);
    background: var(--white);
    color: var(--navy);
    cursor: pointer;
    transition: all 0.2s ease;
  }
  .cv-select:focus {
    outline: none;
    border-color: var(--gold);
    box-shadow: 0 0 0 3px rgba(201,168,76,0.1);
  }

  /* Field hint */
  .field-hint {
    font-size: 0.7rem;
    color: var(--muted);
    margin-top: 0.4rem;
  }

  /* ===========================
     BUTTONS
  =========================== */
  .button-group {
    display: flex;
    gap: 1rem;
    margin-top: 1.5rem;
    flex-wrap: wrap;
  }

  .btn-primary {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
    padding: 10px 28px;
    border-radius: var(--radius-sm);
    font-family: 'DM Sans', sans-serif;
    font-size: 0.85rem;
    font-weight: 700;
    text-decoration: none;
    border: none;
    background: var(--oxford);
    color: var(--gold);
    cursor: pointer;
    transition: all 0.22s ease;
  }
  .btn-primary:hover {
    background: var(--eton);
    color: var(--white);
    transform: translateY(-2px);
    box-shadow: var(--shadow-sm);
  }

  .btn-secondary {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 6px;
    padding: 10px 28px;
    border-radius: var(--radius-sm);
    font-family: 'DM Sans', sans-serif;
    font-size: 0.85rem;
    font-weight: 600;
    text-decoration: none;
    background: rgba(75,91,110,0.1);
    color: var(--slate);
    border: 1px solid rgba(75,91,110,0.2);
    transition: all 0.18s ease;
  }
  .btn-secondary:hover {
    background: var(--slate);
    color: var(--white);
    transform: translateY(-1px);
    text-decoration: none;
  }

  /* ===========================
     RESPONSIVE
  =========================== */
  @media (max-width: 768px) {
    .page-container {
      padding: 1rem;
    }
    .form-body {
      padding: 1.5rem;
    }
    .button-group {
      flex-direction: column;
    }
    .btn-primary, .btn-secondary {
      width: 100%;
      justify-content: center;
    }
  }

  /* Background fix */
  .main-panel {
    background: #F3EFE7 !important;
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

        <div class="page-container">

          <!-- ===== PAGE HEADER ===== -->
          <div class="welcome-badge">User Management</div>
          <h3 class="page-title">Edit User</h3>
          <p class="page-subtitle">Update user information and account status</p>

          <div class="section-label">User Details</div>

          <!-- ===== MAIN CARD ===== -->
          <div class="form-card">

            <!-- Card Header -->
            <div class="form-card-header">
              <div class="form-card-header-icon">✏️</div>
              <div class="form-card-header-text">
                <h5>Edit User</h5>
                <p>Modify user details and account settings</p>
              </div>
            </div>

            <!-- Form Body -->
            <div class="form-body">
              <form action="updateUser" method="post">
                <input type="hidden" name="userId" value="${user.userId}"/>

                <div class="form-group">
                  <label>First Name <span style="color: var(--rose);">*</span></label>
                  <input type="text" name="firstName" class="cv-input" value="${user.firstName}" required>
                </div>

                <div class="form-group">
                  <label>Last Name <span style="color: var(--rose);">*</span></label>
                  <input type="text" name="lastName" class="cv-input" value="${user.lastName}" required>
                </div>

                <div class="form-group">
                  <label>Email <span style="color: var(--rose);">*</span></label>
                  <input type="email" name="email" class="cv-input" value="${user.email}" required>
                </div>

                <div class="form-group">
                  <label>Status</label>
                  <select name="active" class="cv-select">
                    <option value="true" ${user.active ? 'selected' : ''}>Active</option>
                    <option value="false" ${!user.active ? 'selected' : ''}>Inactive</option>
                  </select>
                  <div class="field-hint">Inactive users will not be able to log in to the platform</div>
                </div>

                <div class="button-group">
                  <button type="submit" class="btn-primary">💾 Update User</button>
                  <a href="listUser" class="btn-secondary">← Cancel</a>
                </div>
              </form>
            </div>

          </div>

        </div>

      </div>
      <jsp:include page="AdminFooter.jsp"></jsp:include>
    </div>
  </div>
</div>

</body>
</html>