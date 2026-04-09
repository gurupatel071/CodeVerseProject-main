<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Review Submission</title>

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
  .review-container {
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

  .back-link {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    font-size: 0.85rem;
    color: var(--muted);
    text-decoration: none;
    margin-bottom: 1rem;
    transition: color 0.2s ease;
  }
  .back-link:hover {
    color: var(--gold);
    text-decoration: none;
  }

  /* ===========================
     PANEL / CARD
  =========================== */
  .panel {
    background: var(--white);
    border-radius: var(--radius);
    box-shadow: var(--shadow-sm);
    overflow: hidden;
    margin-bottom: 1.5rem;
    animation: cardSlideUp 0.6s 0.1s ease both;
    border: 1px solid var(--cream);
  }

  .panel-header {
    background: var(--oxford);
    padding: 1rem 1.5rem;
    display: flex;
    align-items: center;
    gap: 0.75rem;
  }
  .panel-header h3 {
    font-family: 'Playfair Display', serif;
    font-size: 1rem;
    color: var(--gold);
    margin: 0;
  }
  .panel-header-icon {
    font-size: 1.1rem;
  }

  .panel-body {
    padding: 1.5rem;
  }

  /* ===========================
     META GRID
  =========================== */
  .meta-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
    gap: 1rem;
    margin-bottom: 1.5rem;
  }

  .meta-box {
    background: var(--ivory);
    border-radius: var(--radius-sm);
    padding: 0.9rem 1rem;
    border: 1px solid var(--cream);
  }
  .meta-box:hover {
    border-color: var(--gold);
  }

  .meta-label {
    font-size: 0.65rem;
    font-weight: 700;
    letter-spacing: 1px;
    text-transform: uppercase;
    color: var(--muted);
    margin-bottom: 0.4rem;
  }
  .meta-value {
    font-size: 0.9rem;
    font-weight: 600;
    color: var(--oxford);
  }

  /* ===========================
     LINKS
  =========================== */
  .link-group {
    display: flex;
    gap: 1rem;
    flex-wrap: wrap;
    margin-top: 0.5rem;
  }

  .link-btn {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    padding: 8px 16px;
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
  .link-btn:hover {
    background: var(--gold);
    color: var(--oxford);
    transform: translateY(-1px);
    text-decoration: none;
  }

  /* ===========================
     FORM GRID
  =========================== */
  .form-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
    gap: 1.25rem;
    margin-bottom: 1.5rem;
  }

  .form-group {
    margin-bottom: 0;
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
    padding: 10px 14px;
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
    padding: 10px 14px;
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

  .helper-text {
    font-size: 0.7rem;
    color: var(--muted);
    margin-top: 0.4rem;
  }

  /* ===========================
     ACTION BUTTONS
  =========================== */
  .action-buttons {
    display: flex;
    gap: 1rem;
    flex-wrap: wrap;
    margin-top: 0.5rem;
  }

  .btn-primary {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
    padding: 10px 24px;
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
    padding: 10px 24px;
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
     FOOTER
  =========================== */
  .footer-note {
    margin-top: 1rem;
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
    .panel-body {
      padding: 1rem;
    }
    .form-grid {
      grid-template-columns: 1fr;
      gap: 1rem;
    }
    .action-buttons {
      flex-direction: column;
    }
    .btn-primary, .btn-secondary {
      width: 100%;
      justify-content: center;
    }
    .meta-grid {
      grid-template-columns: 1fr 1fr;
    }
  }

</style>
</head>

<body>

<div class="review-container">

  <!-- ===== BACK LINK ===== -->
  <a href="/judge/submissions" class="back-link">← Back to Submissions</a>

  <!-- ===== PAGE HEADER ===== -->
  <div class="welcome-badge">Judge Review</div>
  <h3 class="page-title">Review Team Submission</h3>

  <!-- ===== SUBMISSION INFO CARD ===== -->
  <div class="panel">
    <div class="panel-header">
      <span class="panel-header-icon">📋</span>
      <h3>Submission Information</h3>
    </div>
    <div class="panel-body">
      <div class="meta-grid">
        <div class="meta-box">
          <div class="meta-label">Hackathon</div>
          <div class="meta-value">${hackathon.title}</div>
        </div>
        <div class="meta-box">
          <div class="meta-label">Team</div>
          <div class="meta-value">${team.teamName}</div>
        </div>
        <div class="meta-box">
          <div class="meta-label">Submitted Date</div>
          <div class="meta-value">${submission.submitedDate}</div>
        </div>
      </div>

      <div class="link-group">
        <a href="${submission.codeBaseUrl}" target="_blank" class="link-btn">💻 Open Code Base</a>
        <a href="${submission.documentationUrl}" target="_blank" class="link-btn">📄 Open Documentation</a>
      </div>
    </div>
  </div>

  <!-- ===== REVIEW FORM CARD ===== -->
  <div class="panel">
    <div class="panel-header">
      <span class="panel-header-icon">⭐</span>
      <h3>Evaluation Criteria</h3>
    </div>
    <div class="panel-body">
      <form action="/judge/submissions/review/save" method="post">
        <input type="hidden" name="hackathonResultId" value="${result.hackathonResultId}">
        <input type="hidden" name="hackathonId" value="${submission.hackathonId}">
        <input type="hidden" name="teamId" value="${submission.teamId}">

        <div class="form-grid">
          <div class="form-group">
            <label>Innovation (1-10)</label>
            <input type="number" name="innovation" min="1" max="10" class="cv-input" value="${result.innovation}" required>
            <div class="helper-text">How unique and creative is the solution?</div>
          </div>

          <div class="form-group">
            <label>Implementation (1-10)</label>
            <input type="number" name="implementation" min="1" max="10" class="cv-input" value="${result.implementation}" required>
            <div class="helper-text">How complete and functional is the build?</div>
          </div>

          <div class="form-group">
            <label>Coding Standard (1-10)</label>
            <input type="number" name="codingStandard" min="1" max="10" class="cv-input" value="${result.codingStandard}" required>
            <div class="helper-text">Code quality, readability, and maintainability.</div>
          </div>

          <div class="form-group">
            <label>Round</label>
            <select name="round" class="cv-select" required>
              <option value="">Select Round</option>
              <option value="ROUND_1" ${result.round == 'ROUND_1' ? 'selected' : ''}>Round 1</option>
              <option value="ROUND_2" ${result.round == 'ROUND_2' ? 'selected' : ''}>Round 2</option>
              <option value="FINAL" ${result.round == 'FINAL' ? 'selected' : ''}>Final</option>
            </select>
            <div class="helper-text">Select the evaluation round for this submission</div>
          </div>
        </div>

        <div class="action-buttons">
          <button type="submit" class="btn-primary">💾 Save Review</button>
          <a href="/judge/submissions" class="btn-secondary">✖ Cancel</a>
        </div>
      </form>
    </div>
  </div>

  <!-- Footer Note -->
  <div class="footer-note">
    <div>CodeVerse Judge Panel</div>
    <div style="margin-top: 6px;">Need help? <a href="/judge-dashboard">Go to Dashboard</a></div>
  </div>

</div>

</body>
</html>