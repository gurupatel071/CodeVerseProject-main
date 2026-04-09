<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>New Hackathon Description</title>

<%-- <jsp:include page="AdminCSS.jsp"></jsp:include> --%>

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
     PAGE CONTAINER - CENTERED
  =========================== */
  .page-container {
    max-width: 900px;
    width: 100%;
    margin: 0 auto;
    padding: 2rem;
  }

  /* ===========================
     ANIMATIONS
  =========================== */
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
    justify-content: space-between;
    flex-wrap: wrap;
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

  /* View All Link */
  .view-all-link {
    display: inline-flex;
    align-items: center;
    gap: 5px;
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
  .view-all-link:hover {
    background: var(--gold);
    color: var(--oxford);
    transform: translateY(-1px);
    text-decoration: none;
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

  .cv-textarea {
    width: 100%;
    padding: 12px 14px;
    font-family: 'DM Sans', sans-serif;
    font-size: 0.9rem;
    border: 1.5px solid var(--cream);
    border-radius: var(--radius-sm);
    background: var(--white);
    color: var(--navy);
    resize: vertical;
    transition: all 0.2s ease;
    line-height: 1.5;
  }
  .cv-textarea:focus {
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
    margin-top: 1rem;
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
    .form-card-header {
      flex-direction: column;
      align-items: flex-start;
    }
    .button-group {
      flex-direction: column;
    }
    .btn-primary, .btn-secondary {
      width: 100%;
      justify-content: center;
    }
  }

</style>
</head>

<body>

<div class="container-scroller">
 <%--  <jsp:include page="AdminHeader.jsp"></jsp:include> --%>
  <div class="container-fluid page-body-wrapper">
   <%--  <jsp:include page="AdminLeftSidebar.jsp"></jsp:include> --%>
    <div class="main-panel">
      <div class="content-wrapper">

        <div class="page-container">

          <!-- ===== PAGE HEADER ===== -->
          <div class="welcome-badge">Hackathon Module</div>
          <h3 class="page-title">New Hackathon Description</h3>
          <p class="page-subtitle">Add a detailed description for your hackathon event</p>

          <div class="section-label">Description Details</div>

          <!-- ===== MAIN CARD ===== -->
          <div class="form-card">

            <!-- Card Header -->
            <div class="form-card-header">
              <div class="form-card-header-left">
                <div class="form-card-header-icon">📝</div>
                <div class="form-card-header-text">
                  <h5>Add Description</h5>
                  <p>Create a new hackathon description with HTML formatting</p>
                </div>
              </div>
              <a href="/admin/hackathon/description/list" class="view-all-link">
                📋 View All
              </a>
            </div>

            <!-- Form Body -->
            <div class="form-body">
              <form action="/admin/hackathon/description/save" method="post">

                <div class="form-group">
                  <label>Hackathon <span style="color: var(--rose);">*</span></label>
                  <select name="hackathonId" class="cv-select" required>
                    <option value="">-- Select Hackathon --</option>
                    <c:forEach var="h" items="${allHackthon}">
                      <option value="${h.hackathonId}" ${hackathonId == h.hackathonId ? 'selected' : ''}>${h.title}</option>
                    </c:forEach>
                  </select>
                  <div class="field-hint">Select the hackathon this description belongs to</div>
                </div>

                <div class="form-group">
                  <label>Hackathon Details (HTML) <span style="color: var(--rose);">*</span></label>
                  <textarea name="hackathonDetails" class="cv-textarea" rows="12" placeholder="Enter detailed description with HTML formatting...&#10;&#10;Example:&#10;&lt;h3&gt;About the Hackathon&lt;/h3&gt;&#10;&lt;p&gt;This is a 48-hour event focusing on...&lt;/p&gt;&#10;&lt;ul&gt;&#10;  &lt;li&gt;Problem Statement 1&lt;/li&gt;&#10;  &lt;li&gt;Problem Statement 2&lt;/li&gt;&#10;&lt;/ul&gt;" required></textarea>
                  <div class="field-hint">You can use HTML tags: &lt;h3&gt;, &lt;p&gt;, &lt;ul&gt;, &lt;li&gt;, &lt;strong&gt;, etc.</div>
                </div>

                <div class="button-group">
                  <button type="submit" class="btn-primary">💾 Save Description</button>
                  <a href="/admin/hackathon/description/list" class="btn-secondary">← Cancel</a>
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