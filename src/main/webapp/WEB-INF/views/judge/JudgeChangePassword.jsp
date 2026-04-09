<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Judge - Change Password</title>

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
  .password-container {
    max-width: 500px;
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
    font-size: 1.8rem;
    font-weight: 700;
    color: var(--oxford);
    margin-bottom: 0.5rem;
  }

  .page-subtitle {
    color: var(--muted);
    font-size: 0.9rem;
    margin-bottom: 1.5rem;
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

  /* Password hint */
  .password-hint {
    font-size: 0.7rem;
    color: var(--muted);
    margin-top: 0.4rem;
  }

  /* ===========================
     BUTTON
  =========================== */
  .btn-submit {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
    width: 100%;
    padding: 11px 24px;
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
    margin-top: 0.5rem;
  }
  .btn-submit:hover {
    background: var(--eton);
    color: var(--white);
    transform: translateY(-2px);
    box-shadow: var(--shadow-sm);
  }

  /* ===========================
     ERROR MESSAGE
  =========================== */
  .cv-error {
    display: flex;
    align-items: center;
    gap: 8px;
    padding: 10px 14px;
    border-radius: var(--radius-sm);
    font-size: 0.85rem;
    font-weight: 500;
    background: rgba(168,88,88,0.1);
    border: 1px solid rgba(168,88,88,0.25);
    color: var(--rose);
    margin-top: 1rem;
  }
  .cv-error-icon {
    font-size: 0.9rem;
  }

  /* ===========================
     FOOTER LINKS
  =========================== */
  .footer-links {
    margin-top: 1.5rem;
    text-align: center;
    padding-top: 1rem;
    border-top: 1px solid var(--cream);
  }
  .footer-links a {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    padding: 6px 14px;
    border-radius: var(--radius-sm);
    font-family: 'DM Sans', sans-serif;
    font-size: 0.75rem;
    font-weight: 600;
    text-decoration: none;
    background: rgba(201,168,76,0.12);
    color: #8a6e1e;
    border: 1px solid rgba(201,168,76,0.25);
    transition: all 0.18s ease;
  }
  .footer-links a:hover {
    background: var(--gold);
    color: var(--oxford);
    transform: translateY(-1px);
    text-decoration: none;
  }

  /* ===========================
     FOOTER NOTE
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
    .form-body {
      padding: 1.5rem;
    }
    .form-card-header {
      padding: 1rem 1.5rem;
    }
  }

</style>
</head>

<body>

<div class="password-container">

  <!-- ===== PAGE HEADER ===== -->
  <div class="welcome-badge">Security</div>
  <h3 class="page-title">Change Password</h3>
  <p class="page-subtitle">Set your own password before accessing the judge dashboard</p>

  <!-- ===== MAIN CARD ===== -->
  <div class="form-card">

    <!-- Card Header -->
    <div class="form-card-header">
      <div class="form-card-header-icon">🔐</div>
      <div class="form-card-header-text">
        <h5>Update Password</h5>
        <p>Choose a strong and secure password</p>
      </div>
    </div>

    <!-- Form Body -->
    <div class="form-body">
      <form action="/judge/update-password" method="post">

        <div class="form-group">
          <label>New Password</label>
          <input type="password" name="newPassword" class="cv-input" placeholder="Enter new password" required>
          <div class="password-hint">Use at least 8 characters with a mix of letters, numbers, and symbols</div>
        </div>

        <div class="form-group">
          <label>Confirm Password</label>
          <input type="password" name="confirmPassword" class="cv-input" placeholder="Confirm your new password" required>
        </div>

        <button type="submit" class="btn-submit">
          🔒 Update Password
        </button>

        <c:if test="${not empty error}">
          <div class="cv-error">
            <span class="cv-error-icon">⚠</span>
            <span>${error}</span>
          </div>
        </c:if>

      </form>

      <!-- Footer Links -->
      <div class="footer-links">
        <a href="/judge-dashboard">← Back to Dashboard</a>
      </div>
    </div>

  </div>

  <!-- Footer Note -->
  <div class="footer-note">
    <div>CodeVerse Judge Panel</div>
  </div>

</div>

</body>
</html>