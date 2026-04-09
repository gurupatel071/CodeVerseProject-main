<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Edit Hackathon</title>

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

  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
  }

  body {
    font-family: 'DM Sans', sans-serif;
    background: #F3EFE7 !important;
    color: var(--navy);
    min-height: 100vh;
  }

  .main-panel {
    background: #F3EFE7 !important;
  }

  /* ===========================
     PAGE CONTAINER - CENTERED
  =========================== */
  .page-container {
    max-width: 1100px;
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
    margin-bottom: 1.25rem;
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

  .row {
    display: flex;
    gap: 1rem;
    flex-wrap: wrap;
  }
  .col-md-6 {
    flex: 1;
    min-width: 200px;
  }

  hr {
    margin: 1.5rem 0;
    border: none;
    height: 1px;
    background: var(--cream);
  }

  .prize-section-title {
    font-family: 'Playfair Display', serif;
    font-size: 1rem;
    color: var(--oxford);
    margin-bottom: 1rem;
    font-weight: 600;
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
    .row {
      flex-direction: column;
      gap: 1rem;
    }
    .col-md-6 {
      width: 100%;
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

        <div class="page-container">

          <!-- ===== PAGE HEADER ===== -->
          <div class="welcome-badge">Hackathon Management</div>
          <h3 class="page-title">Edit Hackathon</h3>
          <p class="page-subtitle">Update hackathon details, description, and prizes</p>

          <div class="section-label">Hackathon Information</div>

          <!-- ===== MAIN CARD ===== -->
          <div class="form-card">

            <!-- Card Header -->
            <div class="form-card-header">
              <div class="form-card-header-left">
                <div class="form-card-header-icon">✏️</div>
                <div class="form-card-header-text">
                  <h5>Update Hackathon</h5>
                  <p>Modify hackathon details, description, and prize structure</p>
                </div>
              </div>
              <a href="listHackathon" class="view-all-link">
                📋 View All
              </a>
            </div>

            <!-- Form Body -->
            <div class="form-body">
              <form action="updateHackathon" method="post">
                <input type="hidden" name="hackathonId" value="${hackathon.hackathonId}" />
                <input type="hidden" name="userId" value="${hackathon.userId}" />
                <input type="hidden" name="leaderboardPublished" value="${hackathon.leaderboardPublished}" />

                <!-- Basic Info -->
                <div class="form-group">
                  <label>Hackathon Title <span style="color: var(--rose);">*</span></label>
                  <input type="text" class="cv-input" name="title" value="${hackathon.title}" required />
                </div>

                <div class="form-group">
                  <label>Description</label>
                  <textarea class="cv-textarea" name="description" rows="3">${hackathon.description}</textarea>
                  <div class="field-hint">Short description of the hackathon</div>
                </div>

                <div class="form-group">
                  <label>Hackathon Details (HTML) <span style="color: var(--rose);">*</span></label>
                  <textarea class="cv-textarea" name="hackathonDetails" rows="6" required>${hackathonDescription.hackathonDetails}</textarea>
                  <div class="field-hint">Use HTML tags for formatting: &lt;h3&gt;, &lt;p&gt;, &lt;ul&gt;, &lt;li&gt;</div>
                </div>

                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group">
                      <label>Status <span style="color: var(--rose);">*</span></label>
                      <select name="status" class="cv-select" required>
                        <option value="UPCOMING" ${hackathon.status == 'UPCOMING' ? 'selected' : ''}>Upcoming</option>
                        <option value="ONGOING" ${hackathon.status == 'ONGOING' ? 'selected' : ''}>Ongoing</option>
                        <option value="COMPLETED" ${hackathon.status == 'COMPLETED' ? 'selected' : ''}>Completed</option>
                      </select>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group">
                      <label>Event Type <span style="color: var(--rose);">*</span></label>
                      <select name="eventType" class="cv-select" required>
                        <option value="ONLINE" ${hackathon.eventType == 'ONLINE' ? 'selected' : ''}>Online</option>
                        <option value="OFFLINE" ${hackathon.eventType == 'OFFLINE' ? 'selected' : ''}>Offline</option>
                        <option value="HYBRID" ${hackathon.eventType == 'HYBRID' ? 'selected' : ''}>Hybrid</option>
                      </select>
                    </div>
                  </div>
                </div>

                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group">
                      <label>Payment <span style="color: var(--rose);">*</span></label>
                      <select name="payment" class="cv-select" required>
                        <option value="FREE" ${hackathon.payment == 'FREE' ? 'selected' : ''}>Free</option>
                        <option value="PAID" ${hackathon.payment == 'PAID' ? 'selected' : ''}>Paid</option>
                      </select>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group">
                      <label>Location</label>
                      <input type="text" class="cv-input" name="location" value="${hackathon.location}" placeholder="City, Venue or Online" />
                    </div>
                  </div>
                </div>

                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group">
                      <label>Minimum Team Size <span style="color: var(--rose);">*</span></label>
                      <input class="cv-input" type="number" name="minTeamSize" min="1" value="${hackathon.minTeamSize}" required />
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group">
                      <label>Maximum Team Size <span style="color: var(--rose);">*</span></label>
                      <input class="cv-input" type="number" name="maxTeamSize" min="1" value="${hackathon.maxTeamSize}" required />
                    </div>
                  </div>
                </div>

                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group">
                      <label>Registration Start Date <span style="color: var(--rose);">*</span></label>
                      <input class="cv-input" type="date" name="registrationStartDate" value="${hackathon.registrationStartDate}" required />
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group">
                      <label>Registration End Date <span style="color: var(--rose);">*</span></label>
                      <input class="cv-input" type="date" name="registrationEndDate" value="${hackathon.registrationEndDate}" required />
                    </div>
                  </div>
                </div>

                <div class="form-group">
                  <label>User Type <span style="color: var(--rose);">*</span></label>
                  <select class="cv-select" name="userTypeId" required>
                    <c:forEach var="u" items="${allUserType}">
                      <option value="${u.userTypeId}" ${hackathon.userTypeId == u.userTypeId ? 'selected' : ''}>${u.userType}</option>
                    </c:forEach>
                  </select>
                  <div class="field-hint">Select which user type can participate</div>
                </div>

                <hr />

                <!-- Prize Details Section -->
                <div class="prize-section-title">🏆 Prize Details</div>
                <input type="hidden" name="prizeId1" value="${prize1.hackathonPrizeId}" />
                <input type="hidden" name="prizeId2" value="${prize2.hackathonPrizeId}" />
                <input type="hidden" name="prizeId3" value="${prize3.hackathonPrizeId}" />

                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group">
                      <label>Prize 1 Title <span style="color: var(--rose);">*</span></label>
                      <input type="text" class="cv-input" name="prizeTitle1" value="${prize1.prizeTitle}" required />
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group">
                      <label>Prize 1 Description <span style="color: var(--rose);">*</span></label>
                      <textarea class="cv-textarea" name="prizeDescription1" rows="2" required>${prize1.prizeDescription}</textarea>
                    </div>
                  </div>
                </div>

                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group">
                      <label>Prize 2 Title</label>
                      <input type="text" class="cv-input" name="prizeTitle2" value="${prize2.prizeTitle}" placeholder="Optional" />
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group">
                      <label>Prize 2 Description</label>
                      <textarea class="cv-textarea" name="prizeDescription2" rows="2" placeholder="Optional">${prize2.prizeDescription}</textarea>
                    </div>
                  </div>
                </div>

                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group">
                      <label>Prize 3 Title</label>
                      <input type="text" class="cv-input" name="prizeTitle3" value="${prize3.prizeTitle}" placeholder="Optional" />
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group">
                      <label>Prize 3 Description</label>
                      <textarea class="cv-textarea" name="prizeDescription3" rows="2" placeholder="Optional">${prize3.prizeDescription}</textarea>
                    </div>
                  </div>
                </div>

                <div class="button-group">
                  <button type="submit" class="btn-primary">💾 Update Hackathon</button>
                  <a href="listHackathon" class="btn-secondary">← Cancel</a>
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