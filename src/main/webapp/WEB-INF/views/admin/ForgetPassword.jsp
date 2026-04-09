<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Forgot Password</title>

<%-- <jsp:include page="AdminCSS.jsp"></jsp:include> --%>

<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">

<style>

  :root {
    --navy:      #1B2A4A;
    --oxford:    #0E1F3D;
    --eton:      #2E6B72;
    --ivory:     #F7F4EE;
    --cream:     #EDE9E0;
    --slate:     #4B5B6E;
    --muted:     #8C97A4;
    --gold:      #C9A84C;
    --rose:      #A85858;
    --white:     #FFFFFF;
    --shadow-lg: 0 20px 60px rgba(27,42,74,0.18);
    --shadow-md: 0 8px 32px rgba(27,42,74,0.12);
    --radius:    16px;
    --radius-sm: 8px;
  }

  * { box-sizing: border-box; margin: 0; padding: 0; }

  body {
    font-family: 'DM Sans', sans-serif;
    background: var(--ivory);
    color: var(--navy);
  }

  .content-wrapper { padding: 0 !important; }

  /* ===========================
     CENTERED WRAPPER
  =========================== */
  .forgot-wrapper {
    min-height: 82vh;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 2rem;
    position: relative;
    overflow: hidden;
  }

  .forgot-wrapper::before {
    content: '';
    position: absolute;
    top: -120px; right: -120px;
    width: 380px; height: 380px;
    border-radius: 50%;
    background: radial-gradient(circle, rgba(46,107,114,0.08), transparent 70%);
    pointer-events: none;
  }

  .forgot-wrapper::after {
    content: '';
    position: absolute;
    bottom: -100px; left: -100px;
    width: 300px; height: 300px;
    border-radius: 50%;
    background: radial-gradient(circle, rgba(201,168,76,0.07), transparent 70%);
    pointer-events: none;
  }

  /* ===========================
     CARD
  =========================== */
  .forgot-card {
    width: 100%;
    max-width: 430px;
    background: var(--white);
    border-radius: var(--radius);
    box-shadow: var(--shadow-lg);
    overflow: hidden;
    position: relative;
    z-index: 1;
    animation: cardSlideUp 0.65s ease both;
  }

  @keyframes cardSlideUp {
    from { opacity: 0; transform: translateY(28px); }
    to   { opacity: 1; transform: translateY(0); }
  }

  /* Dark header */
  .forgot-card-header {
    background: var(--oxford);
    padding: 2rem 2.2rem 1.8rem;
    text-align: center;
    position: relative;
  }

  .forgot-card-header::before {
    content: '';
    position: absolute;
    top: 0; left: 0; right: 0;
    height: 3px;
    background: linear-gradient(90deg, transparent, var(--gold), transparent);
  }

  .forgot-logo {
    width: 52px;
    height: 52px;
    border-radius: 50%;
    background: rgba(201,168,76,0.15);
    border: 1.5px solid rgba(201,168,76,0.4);
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.4rem;
    margin: 0 auto 1rem;
  }

  .forgot-card-header h4 {
    font-family: 'Playfair Display', serif;
    font-size: 1.5rem;
    font-weight: 700;
    color: var(--white);
    margin-bottom: 4px;
  }

  .forgot-card-header p {
    font-size: 0.78rem;
    color: rgba(255,255,255,0.4);
    line-height: 1.5;
    margin: 0;
    padding: 0 1rem;
  }

  /* ===========================
     CARD BODY
  =========================== */
  .forgot-card-body {
    padding: 2rem 2.2rem 2.2rem;
  }

  /* ===========================
     ALERTS
  =========================== */
  .alert-custom {
    border-radius: var(--radius-sm);
    padding: 10px 14px;
    font-size: 0.85rem;
    font-weight: 500;
    margin-bottom: 1.4rem;
    display: flex;
    align-items: center;
    gap: 8px;
  }

  .alert-success-custom {
    background: rgba(45,106,79,0.1);
    border: 1px solid rgba(45,106,79,0.3);
    color: #2D6A4F;
  }

  .alert-error-custom {
    background: rgba(168,88,88,0.1);
    border: 1px solid rgba(168,88,88,0.3);
    color: var(--rose);
  }

  /* ===========================
     FORM FIELDS
  =========================== */
  .form-group-custom { margin-bottom: 1.2rem; }

  .form-label-custom {
    display: block;
    font-size: 0.72rem;
    font-weight: 700;
    letter-spacing: 1px;
    text-transform: uppercase;
    color: var(--slate);
    margin-bottom: 6px;
  }

  .input-wrap { position: relative; }

  .input-icon {
    position: absolute;
    left: 13px;
    top: 50%;
    transform: translateY(-50%);
    font-size: 0.9rem;
    pointer-events: none;
    opacity: 0.45;
  }

  .form-control-custom {
    width: 100%;
    padding: 10px 14px 10px 38px;
    border: 1.5px solid var(--cream);
    border-radius: var(--radius-sm);
    font-family: 'DM Sans', sans-serif;
    font-size: 0.9rem;
    color: var(--navy);
    background: var(--ivory);
    outline: none;
    transition: border-color 0.2s, box-shadow 0.2s, background 0.2s;
  }

  .form-control-custom:focus {
    border-color: var(--eton);
    box-shadow: 0 0 0 3px rgba(46,107,114,0.1);
    background: var(--white);
  }

  .form-control-custom::placeholder { color: var(--muted); }

  .field-hint {
    font-size: 0.75rem;
    color: var(--muted);
    margin-top: 5px;
  }

  /* ===========================
     SUBMIT BUTTON
  =========================== */
  .btn-submit {
    width: 100%;
    padding: 11px;
    border-radius: var(--radius-sm);
    font-family: 'DM Sans', sans-serif;
    font-size: 0.92rem;
    font-weight: 700;
    letter-spacing: 0.5px;
    border: none;
    background: var(--oxford);
    color: var(--gold);
    cursor: pointer;
    transition: all 0.25s ease;
    margin-bottom: 1.4rem;
  }

  .btn-submit:hover {
    background: var(--eton);
    color: var(--white);
    transform: translateY(-2px);
    box-shadow: var(--shadow-md);
  }

  .btn-submit:active { transform: translateY(0); }

  /* ===========================
     BACK TO LOGIN
  =========================== */
  .back-link-row {
    text-align: center;
    font-size: 0.85rem;
    color: var(--muted);
  }

  .back-link-row a {
    color: var(--eton);
    font-weight: 600;
    text-decoration: none;
    transition: color 0.2s;
    display: inline-flex;
    align-items: center;
    gap: 5px;
  }

  .back-link-row a:hover { color: var(--oxford); }
  
  /* ===== DASHBOARD BACKGROUND FIX ===== */

/* main dashboard area */
.content-wrapper{
	background:#F3EFE7 !important;
}

/* page body soft contrast */
body{
	background:#F3EFE7 !important;
}

/* panels/cards area subtle contrast */
.main-panel{
	background:#F3EFE7 !important;
}

</style>
</head>

<body>

<div class="container-scroller">

 <%--  <jsp:include page="AdminHeader.jsp"></jsp:include> --%>

  <div class="container-fluid page-body-wrapper">

    <%-- <jsp:include page="AdminLeftSidebar.jsp"></jsp:include> --%>

    <div class="main-panel">
      <div class="content-wrapper">

        <div class="forgot-wrapper">

          <div class="forgot-card">

            <!-- Dark Header -->
            <div class="forgot-card-header">
              <div class="forgot-logo">🔑</div>
              <h4>Forgot Password?</h4>
              <p>Enter your registered email and we'll send you a reset link</p>
            </div>

            <!-- Body -->
            <div class="forgot-card-body">

              <!-- Success -->
              <c:if test="${not empty success}">
                <div class="alert-custom alert-success-custom">
                  ✓ ${success}
                </div>
              </c:if>

              <!-- Error -->
              <c:if test="${not empty error}">
                <div class="alert-custom alert-error-custom">
                  ⚠ ${error}
                </div>
              </c:if>

              <form action="forgot-password" method="post">

                <div class="form-group-custom">
                  <label class="form-label-custom">Email Address</label>
                  <div class="input-wrap">
                    <span class="input-icon">✉</span>
                    <input
                      type="email"
                      name="email"
                      class="form-control-custom"
                      placeholder="Enter your registered email"
                      required
                    >
                  </div>
                  <div class="field-hint">We'll send a password reset link to this address.</div>
                </div>

                <button type="submit" class="btn-submit">Send Reset Link →</button>

                <div class="back-link-row">
                  <a href="login">← Back to Login</a>
                </div>

              </form>

            </div>

          </div>

        </div>

      </div>

      <%-- <jsp:include page="AdminFooter.jsp"></jsp:include> --%>

    </div>
  </div>
</div>

</body>
</html>
