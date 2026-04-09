<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Judge Profile</title>

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
  .profile-container {
    max-width: 800px;
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
     BUTTONS
  =========================== */
  .action-buttons {
    display: flex;
    gap: 10px;
    flex-wrap: wrap;
  }

  .btn-outline {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    padding: 8px 18px;
    border-radius: var(--radius-sm);
    font-family: 'DM Sans', sans-serif;
    font-size: 0.78rem;
    font-weight: 600;
    text-decoration: none;
    background: transparent;
    color: var(--gold);
    border: 1.5px solid var(--gold);
    transition: all 0.18s ease;
  }
  .btn-outline:hover {
    background: var(--gold);
    color: var(--oxford);
    transform: translateY(-1px);
    text-decoration: none;
  }

  .btn-primary {
    display: inline-flex;
    align-items: center;
    gap: 8px;
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
  .btn-primary:hover {
    background: var(--gold);
    color: var(--oxford);
    transform: translateY(-1px);
    text-decoration: none;
  }

  /* ===========================
     PROFILE SECTION
  =========================== */
  .profile-section {
    padding: 2rem;
  }

  .avatar-container {
    display: flex;
    align-items: center;
    gap: 1.5rem;
    margin-bottom: 2rem;
    flex-wrap: wrap;
  }

  .avatar {
    width: 100px;
    height: 100px;
    border-radius: 50%;
    object-fit: cover;
    border: 4px solid var(--cream);
    background: var(--ivory);
  }

  .avatar-upload {
    flex: 1;
  }

  .avatar-upload label {
    font-size: 0.7rem;
    font-weight: 700;
    letter-spacing: 1px;
    text-transform: uppercase;
    color: var(--muted);
    margin-bottom: 0.5rem;
    display: block;
  }

  .file-input {
    width: 100%;
    padding: 8px 12px;
    font-family: 'DM Sans', sans-serif;
    font-size: 0.85rem;
    border: 1.5px solid var(--cream);
    border-radius: var(--radius-sm);
    background: var(--ivory);
    color: var(--navy);
  }
  .file-input:focus {
    outline: none;
    border-color: var(--gold);
  }

  /* ===========================
     FORM FIELDS
  =========================== */
  .form-row {
    display: flex;
    gap: 1.5rem;
    margin-bottom: 1.25rem;
    flex-wrap: wrap;
  }

  .form-group {
    flex: 1;
    min-width: 200px;
  }

  .form-group-full {
    margin-bottom: 1.25rem;
  }

  .form-group label,
  .form-group-full label {
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
  .cv-input:disabled {
    background: var(--ivory);
    color: var(--muted);
    cursor: not-allowed;
  }
  .cv-input::placeholder {
    color: var(--muted);
    font-size: 0.85rem;
    opacity: 0.5;
  }

  /* Required field indicator */
  .required-star {
    color: var(--rose);
    margin-left: 3px;
  }

  /* Field hint */
  .field-hint {
    font-size: 0.7rem;
    color: var(--muted);
    margin-top: 4px;
  }

  /* ===========================
     SUBMIT BUTTON
  =========================== */
  .button-section {
    margin-top: 1.5rem;
    text-align: right;
  }

  .btn-submit {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
    padding: 11px 32px;
    min-width: 160px;
    border-radius: var(--radius-sm);
    font-family: 'DM Sans', sans-serif;
    font-size: 0.85rem;
    font-weight: 700;
    text-decoration: none;
    border: none;
    background: var(--oxford);
    color: var(--gold);
    cursor: pointer;
    letter-spacing: 0.3px;
    transition: all 0.22s ease;
  }
  .btn-submit:hover {
    background: var(--eton);
    color: var(--white);
    transform: translateY(-2px);
    box-shadow: var(--shadow-sm);
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
    .profile-section {
      padding: 1.5rem;
    }
    .form-row {
      flex-direction: column;
      gap: 1rem;
    }
    .form-group {
      min-width: 100%;
    }
    .form-card-header {
      flex-direction: column;
      align-items: flex-start;
    }
    .action-buttons {
      width: 100%;
      justify-content: flex-start;
    }
    .button-section {
      text-align: center;
    }
    .btn-submit {
      width: 100%;
    }
    .avatar-container {
      flex-direction: column;
      align-items: flex-start;
    }
  }

</style>
</head>

<body>

<div class="profile-container">

  <!-- ===== PAGE HEADER ===== -->
  <div class="welcome-badge">Judge Panel</div>
  <h3 class="page-title">Judge Profile</h3>
  <p class="page-subtitle">Manage your profile details visible in assigned hackathons</p>

  <!-- ===== ALERT MESSAGES ===== -->
  <c:if test="${param.updated == 'true'}">
    <div class="cv-alert cv-alert-success">
      <span class="cv-alert-icon">✓</span>
      Profile updated successfully.
    </div>
  </c:if>
  <c:if test="${not empty error}">
    <div class="cv-alert cv-alert-danger">
      <span class="cv-alert-icon">⚠</span>
      ${error}
    </div>
  </c:if>

  <div class="section-label">Profile Information</div>

  <!-- ===== MAIN CARD ===== -->
  <div class="form-card">

    <!-- Card Header -->
    <div class="form-card-header">
      <div class="form-card-header-left">
        <div class="form-card-header-icon">👤</div>
        <div class="form-card-header-text">
          <h5>My Profile</h5>
          <p>Update your personal and professional details</p>
        </div>
      </div>
      <div class="action-buttons">
        <a href="/judge/change-password" class="btn-outline">🔐 Change Password</a>
        <a href="/judge-dashboard" class="btn-primary">← Back to Dashboard</a>
      </div>
    </div>

    <!-- Form Body -->
    <div class="profile-section">
      <form action="/judge/profile/update" method="post" enctype="multipart/form-data">

        <!-- Avatar Upload Section -->
        <div class="avatar-container">
          <c:choose>
            <c:when test="${not empty judge.profilePicURL}">
              <img src="${judge.profilePicURL}" class="avatar" alt="Profile Picture">
            </c:when>
            <c:otherwise>
              <img src="/assets/images/faces/dummy.jpg" class="avatar" alt="Profile Picture">
            </c:otherwise>
          </c:choose>
          <div class="avatar-upload">
            <label>Profile Picture</label>
            <input type="file" name="profilePic" class="file-input" accept="image/*">
            <div class="field-hint">Recommended: Square image, max 2MB</div>
          </div>
        </div>

        <!-- Form Fields -->
        <div class="form-row">
          <div class="form-group">
            <label>First Name <span class="required-star">*</span></label>
            <input type="text" name="firstName" class="cv-input" value="${judge.firstName}" required>
          </div>
          <div class="form-group">
            <label>Last Name <span class="required-star">*</span></label>
            <input type="text" name="lastName" class="cv-input" value="${judge.lastName}" required>
          </div>
        </div>

        <div class="form-row">
          <div class="form-group">
            <label>Email</label>
            <input type="email" class="cv-input" value="${judge.email}" disabled>
          </div>
          <div class="form-group">
            <label>Contact Number</label>
            <input type="text" name="contactNum" class="cv-input" value="${judge.contactNum}" placeholder="+1 234 567 8900">
          </div>
        </div>

        <div class="form-row">
          <div class="form-group">
            <label>Qualification</label>
            <input type="text" name="qualification" class="cv-input" value="${judge.qualification}" placeholder="e.g., M.Tech, PhD">
          </div>
          <div class="form-group">
            <label>Designation</label>
            <input type="text" name="designation" class="cv-input" value="${judge.designation}" placeholder="e.g., Senior Engineer, Professor">
          </div>
        </div>

        <div class="form-group-full">
          <label>Organization</label>
          <input type="text" name="organization" class="cv-input" value="${judge.organization}" placeholder="Company or Institute name">
        </div>

        <!-- Submit Button -->
        <div class="button-section">
          <button type="submit" class="btn-submit">
            💾 Save Profile
          </button>
        </div>

      </form>
    </div>
    <!-- /.profile-section -->

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