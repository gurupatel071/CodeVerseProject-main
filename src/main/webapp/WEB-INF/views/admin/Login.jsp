<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Login</title>



<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">

<style>

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
    --shadow-lg: 0 20px 60px rgba(27,42,74,0.18);
    --radius:    16px;
    --radius-sm: 8px;
  }

  * { box-sizing: border-box; margin: 0; padding: 0; }

  body {
    font-family: 'DM Sans', sans-serif;
    background: var(--ivory);
    color: var(--navy);
  }

  /* ===========================
     FULL PAGE LAYOUT
  =========================== */
  .content-wrapper {
    padding: 0 !important;
  }

  .login-wrapper {
    min-height: 82vh;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 2rem;
    position: relative;
    overflow: hidden;
  }

  /* Decorative background circles */
  .login-wrapper::before {
    content: '';
    position: absolute;
    top: -120px; right: -120px;
    width: 380px; height: 380px;
    border-radius: 50%;
    background: radial-gradient(circle, rgba(46,107,114,0.08), transparent 70%);
    pointer-events: none;
  }

  .login-wrapper::after {
    content: '';
    position: absolute;
    bottom: -100px; left: -100px;
    width: 300px; height: 300px;
    border-radius: 50%;
    background: radial-gradient(circle, rgba(201,168,76,0.07), transparent 70%);
    pointer-events: none;
  }

  /* ===========================
     LOGIN CARD
  =========================== */
  .login-card {
    width: 100%;
    max-width: 440px;
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

  /* Dark top strip */
  .login-card-header {
    background: var(--oxford);
    padding: 2rem 2.2rem 1.8rem;
    text-align: center;
    position: relative;
  }

  /* Gold accent line at top */
  .login-card-header::before {
    content: '';
    position: absolute;
    top: 0; left: 0; right: 0;
    height: 3px;
    background: linear-gradient(90deg, transparent, var(--gold), transparent);
  }

  .login-logo {
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

  .login-card-header h4 {
    font-family: 'Playfair Display', serif;
    font-size: 1.5rem;
    font-weight: 700;
    color: var(--white);
    margin-bottom: 4px;
  }

  .login-card-header p {
    font-size: 0.78rem;
    color: rgba(255,255,255,0.42);
    letter-spacing: 0.3px;
  }

  /* ===========================
     CARD BODY
  =========================== */
  .login-card-body {
    padding: 2rem 2.2rem 2.2rem;
  }

  /* ===========================
     ERROR ALERT
  =========================== */
  .error-alert {
    background: rgba(168,88,88,0.1);
    border: 1px solid rgba(168,88,88,0.3);
    border-radius: var(--radius-sm);
    color: var(--rose);
    padding: 10px 14px;
    font-size: 0.85rem;
    font-weight: 500;
    margin-bottom: 1.4rem;
    display: flex;
    align-items: center;
    gap: 8px;
  }

  /* ===========================
     FORM FIELDS
  =========================== */
  .form-group-custom {
    margin-bottom: 1.2rem;
  }

  .form-label-custom {
    display: block;
    font-size: 0.72rem;
    font-weight: 700;
    letter-spacing: 1px;
    text-transform: uppercase;
    color: var(--slate);
    margin-bottom: 6px;
  }

  .input-wrap {
    position: relative;
  }

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

  /* ===========================
     FORGOT PASSWORD ROW
  =========================== */
  .forgot-row {
    display: flex;
    justify-content: flex-end;
    margin-top: -0.6rem;
    margin-bottom: 1.4rem;
  }

  .forgot-link {
    font-size: 0.78rem;
    color: var(--eton);
    text-decoration: none;
    font-weight: 500;
    transition: color 0.2s;
  }

  .forgot-link:hover { color: var(--oxford); }

  /* ===========================
     SUBMIT BUTTON
  =========================== */
  .btn-login {
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

  .btn-login:hover {
    background: var(--eton);
    color: var(--white);
    transform: translateY(-2px);
    box-shadow: var(--shadow-md);
  }

  .btn-login:active {
    transform: translateY(0);
  }

  /* ===========================
     DIVIDER
  =========================== */
  .divider {
    display: flex;
    align-items: center;
    gap: 10px;
    margin-bottom: 1.2rem;
  }

  .divider::before,
  .divider::after {
    content: '';
    flex: 1;
    height: 1px;
    background: var(--cream);
  }

  .divider span {
    font-size: 0.72rem;
    color: var(--muted);
    font-weight: 600;
    letter-spacing: 1px;
    text-transform: uppercase;
    white-space: nowrap;
  }

  /* ===========================
     SIGNUP LINK
  =========================== */
  .signup-row {
    text-align: center;
    font-size: 0.85rem;
    color: var(--muted);
  }

  .signup-row a {
    color: var(--eton);
    font-weight: 600;
    text-decoration: none;
    transition: color 0.2s;
  }

  .signup-row a:hover { color: var(--oxford); }

</style>
</head>

<body>

<div class="container-scroller">

  

  <div class="container-fluid page-body-wrapper">

    

    <div class="main-panel">
      <div class="content-wrapper">

        <div class="login-wrapper">

          <div class="login-card">

            <!-- ===========================
                 DARK HEADER
            =========================== -->
            <div class="login-card-header">
              <div class="login-logo">🔐</div>
              <h4>Welcome Back</h4>
              <p>Sign in to your admin account to continue</p>
            </div>

            <!-- ===========================
                 FORM BODY
            =========================== -->
            <div class="login-card-body">

              <!-- Error Message -->
              <c:if test="${not empty error}">
                <div class="error-alert">
                  ⚠ ${error}
                </div>
              </c:if>

              <form action="authenticate" method="post">

                <!-- Email -->
                <div class="form-group-custom">
                  <label class="form-label-custom">Email Address</label>
                  <div class="input-wrap">
                    <span class="input-icon">✉</span>
                    <input
                      type="email"
                      name="email"
                      class="form-control-custom"
                      placeholder="Enter your email"
                      required
                    >
                  </div>
                </div>

                <!-- Password -->
                <div class="form-group-custom">
                  <label class="form-label-custom">Password</label>
                  <div class="input-wrap">
                    <span class="input-icon">🔒</span>
                    <input
                      type="password"
                      name="password"
                      class="form-control-custom"
                      placeholder="Enter your password"
                      required
                    >
                  </div>
                </div>

                <!-- Forgot password -->
                <div class="forgot-row">
                  <a href="forgetpassword" class="forgot-link">Forgot password?</a>
                </div>

                <!-- Submit -->
                <button type="submit" class="btn-login">Sign In →</button>

                <!-- Divider -->
                <div class="divider"><span>or</span></div>

                <!-- Sign up -->
                <div class="signup-row">
                  Don't have an account? <a href="signup">Create one</a>
                </div>

              </form>

            </div>

          </div>

        </div>

      </div>

      

    </div>
  </div>
</div>

</body>
</html>
