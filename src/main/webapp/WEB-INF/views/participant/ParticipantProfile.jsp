<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>My Profile</title>

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
  }

  /* ===========================
     MAIN CONTAINER - CENTERED
  =========================== */
  .profile-wrapper {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    padding: 2rem;
  }

  .profile-container {
    max-width: 900px;
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

  /* Form Grid */
  .form-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 1.25rem;
  }

  .form-group {
    margin-bottom: 0;
  }

  .form-group-full {
    grid-column: 1 / -1;
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
  .cv-input:read-only,
  .cv-input[readonly] {
    background: var(--ivory);
    color: var(--muted);
    cursor: not-allowed;
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
  }
  .cv-select:focus {
    outline: none;
    border-color: var(--gold);
  }

  /* Required field indicator */
  .required-star {
    color: var(--rose);
    margin-left: 3px;
  }

  /* ===========================
     BUTTON
  =========================== */
  .button-section {
    margin-top: 2rem;
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
    .profile-wrapper {
      padding: 1rem;
    }
    .form-body {
      padding: 1.5rem;
    }
    .form-grid {
      grid-template-columns: 1fr;
      gap: 1rem;
    }
    .form-group-full {
      grid-column: 1;
    }
    .button-section {
      text-align: center;
    }
    .btn-submit {
      width: 100%;
    }
    .form-card-header {
      padding: 1rem 1.5rem;
    }
  }

</style>
</head>

<body>

<!-- Header stays at top, not affected by centering -->
<%@ include file="ParticipantTopNav.jsp"%>

<!-- Centered content wrapper -->
<div class="profile-wrapper">
  <div class="profile-container">

    <!-- ===== BACK LINK ===== -->
    <a href="/participant/home" class="back-link">← Back to Home</a>

    <!-- ===== PAGE HEADER ===== -->
    <div class="welcome-badge">Participant Panel</div>
    <h3 class="page-title">My Profile</h3>
    <p class="page-subtitle">View and update your participant profile details</p>

    <!-- ===== ALERT MESSAGES ===== -->
    <c:if test="${success == 'updated'}">
      <div class="cv-alert cv-alert-success">
        <span class="cv-alert-icon">✓</span>
        Profile updated successfully.
      </div>
    </c:if>
    <c:if test="${error == 'invalidName'}">
      <div class="cv-alert cv-alert-danger">
        <span class="cv-alert-icon">⚠</span>
        First name and last name are required.
      </div>
    </c:if>

    <!-- ===== MAIN CARD ===== -->
    <div class="form-card">

      <!-- Card Header -->
      <div class="form-card-header">
        <div class="form-card-header-icon">👤</div>
        <div class="form-card-header-text">
          <h5>Participant Information</h5>
          <p>Update your personal and professional details</p>
        </div>
      </div>

      <!-- Form Body -->
      <div class="form-body">
        <form action="/participant/profile/save" method="post">

          <div class="form-grid">
            <!-- First Name -->
            <div class="form-group">
              <label>First Name <span class="required-star">*</span></label>
              <input type="text" name="firstName" class="cv-input" value="${user.firstName}" required>
            </div>

            <!-- Last Name -->
            <div class="form-group">
              <label>Last Name <span class="required-star">*</span></label>
              <input type="text" name="lastName" class="cv-input" value="${user.lastName}" required>
            </div>

            <!-- Email (Read Only) -->
            <div class="form-group">
              <label>Email</label>
              <input type="email" class="cv-input" value="${user.email}" readonly>
            </div>

            <!-- Contact Number -->
            <div class="form-group">
              <label>Contact Number</label>
              <input type="text" name="contactNum" class="cv-input" value="${user.contactNum}" placeholder="+1 234 567 8900">
            </div>

            <!-- Gender -->
            <div class="form-group">
              <label>Gender</label>
              <select name="gender" class="cv-select">
                <option value="">Select gender</option>
                <option value="Male" ${user.gender == 'Male' ? 'selected' : ''}>Male</option>
                <option value="Female" ${user.gender == 'Female' ? 'selected' : ''}>Female</option>
                <option value="Other" ${user.gender == 'Other' ? 'selected' : ''}>Other</option>
              </select>
            </div>

            <!-- Birth Year -->
            <div class="form-group">
              <label>Birth Year</label>
              <input type="number" name="birthYear" class="cv-input" min="1950" max="2100" value="${user.birthYear}" placeholder="YYYY">
            </div>

            <!-- Qualification -->
            <div class="form-group">
              <label>Qualification</label>
              <input type="text" name="qualification" class="cv-input" value="${user.qualification}" placeholder="e.g., B.Tech, M.Tech, PhD">
            </div>

            <!-- Designation -->
            <div class="form-group">
              <label>Designation</label>
              <input type="text" name="designation" class="cv-input" value="${user.designation}" placeholder="e.g., Student, Software Engineer">
            </div>

            <!-- Organization (Full Width) -->
            <div class="form-group-full">
              <label>Organization</label>
              <input type="text" name="organization" class="cv-input" value="${user.organization}" placeholder="Company or Institute name">
            </div>

            <!-- City -->
            <div class="form-group">
              <label>City</label>
              <input type="text" name="city" class="cv-input" value="${userDetail.city}" placeholder="Your city">
            </div>

            <!-- State -->
            <div class="form-group">
              <label>State</label>
              <input type="text" name="state" class="cv-input" value="${userDetail.state}" placeholder="Your state">
            </div>

            <!-- Country (Full Width) -->
            <div class="form-group-full">
              <label>Country</label>
              <input type="text" name="country" class="cv-input" value="${userDetail.country}" placeholder="Your country">
            </div>
          </div>

          <!-- Submit Button -->
          <div class="button-section">
            <button type="submit" class="btn-submit">
              💾 Save Profile
            </button>
          </div>

        </form>
      </div>

    </div>

    <!-- Footer Note -->
    <div class="footer-note">
      <div>CodeVerse Participant Panel</div>
      <div style="margin-top: 6px;">Need help? <a href="/participant/home">Go to Dashboard</a></div>
    </div>

  </div>
</div>

</body>
</html>