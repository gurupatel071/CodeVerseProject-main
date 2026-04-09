<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Add New User Type</title>

<jsp:include page="AdminCSS.jsp"></jsp:include>

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
    --radius:    14px;
    --radius-sm: 8px;
  }

  * { box-sizing: border-box; }

  body {
    font-family: 'DM Sans', sans-serif;
    background: var(--ivory);
    color: var(--navy);
  }

  .content-wrapper {
    padding: 2rem 2rem 1rem !important;
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
     PAGE TITLE
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
    padding: 1.6rem 2rem;
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
    font-size: 0.78rem;
    color: rgba(255,255,255,0.4);
    margin: 0;
  }

  .view-all-link {
    font-size: 0.78rem;
    font-weight: 600;
    color: rgba(201,168,76,0.8);
    text-decoration: none;
    transition: color 0.2s;
  }

  .view-all-link:hover { color: var(--gold); }

  .form-card-body {
    padding: 2rem 2.2rem;
  }

  /* ===========================
     FORM FIELD
  =========================== */
  .form-group-custom {
    margin-bottom: 1.3rem;
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

  .form-label-custom .req { color: var(--rose); margin-left: 2px; }

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
    opacity: 0.4;
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

  /* Helper text */
  .field-hint {
    font-size: 0.75rem;
    color: var(--muted);
    margin-top: 5px;
  }

  /* ===========================
     FORM FOOTER
  =========================== */
  .form-footer {
    padding: 1.3rem 2.2rem;
    background: var(--ivory);
    border-top: 1px solid var(--cream);
    display: flex;
    justify-content: flex-end;
    gap: 0.75rem;
    align-items: center;
  }

  .btn-cancel {
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

  .btn-cancel:hover {
    background: var(--slate);
    color: var(--white);
  }

  .btn-submit {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    padding: 10px 28px;
    border-radius: var(--radius-sm);
    font-family: 'DM Sans', sans-serif;
    font-size: 0.88rem;
    font-weight: 700;
    border: none;
    background: var(--oxford);
    color: var(--gold);
    cursor: pointer;
    transition: all 0.22s ease;
    letter-spacing: 0.3px;
  }

  .btn-submit:hover {
    background: var(--eton);
    color: var(--white);
    transform: translateY(-2px);
    box-shadow: var(--shadow-md);
  }
  
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

  <jsp:include page="AdminHeader.jsp"></jsp:include>

  <div class="container-fluid page-body-wrapper">

    <jsp:include page="AdminLeftSidebar.jsp"></jsp:include>

    <div class="main-panel">
      <div class="content-wrapper">

        <!-- ===========================
             PAGE TITLE
        =========================== -->
        <div class="welcome-badge">Admin Panel</div>
        <h3 class="page-title">New User Type</h3>
        <p class="page-subtitle">Define a new user role or classification</p>

        <div class="section-label">User Type Details</div>

        <div class="row justify-content-center">
          <div class="col-md-7 col-lg-6">

            <div class="form-card">

              <!-- Card Header -->
              <div class="form-card-header">
                <div class="form-card-header-left">
                  <div class="form-card-header-icon">🏷️</div>
                  <div class="form-card-header-text">
                    <h5>Create User Type</h5>
                    <p>This will be available when assigning roles to users</p>
                  </div>
                </div>
                <a href="listUserType" class="view-all-link">View All →</a>
              </div>

              <!-- Card Body -->
              <div class="form-card-body">

                <form action="saveUserType" method="post">

                  <div class="form-group-custom">
                    <label class="form-label-custom">
                      User Type Name <span class="req">*</span>
                    </label>
                    <div class="input-wrap">
                      <span class="input-icon">🏷️</span>
                      <input
                        type="text"
                        name="userType"
                        class="form-control-custom"
                        placeholder="e.g. Student, Professional, Mentor"
                        required
                      >
                    </div>
                    <div class="field-hint">This label will appear in dropdowns when registering users.</div>
                  </div>

                </form>

              </div>

              <!-- Footer -->
              <div class="form-footer">
                <a href="admin-dashboard" class="btn-cancel">← Cancel</a>
                <button type="submit" onclick="document.querySelector('form').submit()" class="btn-submit">
                  ✓ Save User Type
                </button>
              </div>

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
