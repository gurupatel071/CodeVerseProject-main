<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${hackathon.title} | Hackathon Details</title>

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
    --shadow-sm: 0 2px 12px rgba(27,42,74,0.08);
    --shadow-md: 0 8px 32px rgba(27,42,74,0.12);
    --shadow-lg: 0 12px 48px rgba(27,42,74,0.16);
    --radius:    14px;
    --radius-sm: 8px;
    --radius-lg: 20px;
  }

  * { box-sizing: border-box; margin: 0; padding: 0; }

  body {
    font-family: 'DM Sans', sans-serif;
    background: #F3EFE7;
    color: var(--navy);
    min-height: 100vh;
  }

  /* ===========================
     PAGE WRAPPER
  =========================== */
  .page {
    max-width: 1200px;
    margin: 0 auto;
    padding: 28px 24px 56px;
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
     TOPBAR
  =========================== */
  .topbar {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-bottom: 28px;
    flex-wrap: wrap;
    gap: 12px;
  }

  .back-link {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    color: var(--slate);
    text-decoration: none;
    font-size: 0.85rem;
    font-weight: 500;
    padding: 8px 18px;
    border: 1.5px solid var(--cream);
    border-radius: var(--radius-sm);
    background: var(--white);
    transition: all 0.2s ease;
  }
  .back-link:hover {
    border-color: var(--oxford);
    background: var(--oxford);
    color: var(--white);
    text-decoration: none;
    transform: translateY(-1px);
  }

  /* ===========================
     HERO SECTION
  =========================== */
  .hero {
    background: linear-gradient(135deg, var(--oxford) 0%, #0a172f 100%);
    border-radius: var(--radius-lg);
    padding: 2.2rem 2.5rem;
    position: relative;
    overflow: hidden;
    margin-bottom: 28px;
    animation: cardSlideUp 0.6s 0.05s ease both;
    box-shadow: var(--shadow-lg);
  }

  .hero::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 4px;
    background: linear-gradient(90deg, var(--gold), rgba(201,168,76,0.3), transparent);
  }

  .hero::after {
    content: '';
    position: absolute;
    top: -40%;
    right: -20%;
    width: 400px;
    height: 400px;
    background: radial-gradient(circle, rgba(201,168,76,0.08) 0%, transparent 70%);
    border-radius: 50%;
    pointer-events: none;
  }

  .hero-eyebrow {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    background: rgba(201,168,76,0.12);
    border: 1px solid rgba(201,168,76,0.25);
    color: var(--gold);
    font-size: 0.7rem;
    font-weight: 700;
    letter-spacing: 1.5px;
    text-transform: uppercase;
    padding: 5px 14px;
    border-radius: 50px;
    margin-bottom: 16px;
    position: relative;
    z-index: 1;
  }

  .hero h1 {
    font-family: 'Playfair Display', serif;
    font-size: clamp(28px, 5vw, 44px);
    line-height: 1.2;
    color: var(--white);
    margin-bottom: 14px;
    position: relative;
    z-index: 1;
    letter-spacing: -0.02em;
  }

  .hero-desc {
    font-size: 1rem;
    color: rgba(255,255,255,0.65);
    line-height: 1.65;
    max-width: 720px;
    position: relative;
    z-index: 1;
  }

  /* Meta Chips */
  .meta {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
    margin-top: 20px;
    position: relative;
    z-index: 1;
  }

  .chip {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    padding: 6px 14px;
    border-radius: 50px;
    font-size: 0.75rem;
    font-weight: 600;
    letter-spacing: 0.3px;
    border: 1px solid rgba(255,255,255,0.12);
    background: rgba(255,255,255,0.06);
    color: rgba(255,255,255,0.75);
    backdrop-filter: blur(2px);
  }

  .chip.status-UPCOMING  { background: rgba(201,168,76,0.2); border-color: rgba(201,168,76,0.35); color: var(--gold); }
  .chip.status-ONGOING   { background: rgba(46,107,114,0.25); border-color: rgba(46,107,114,0.4); color: #6fd9c8; }
  .chip.status-COMPLETED { background: rgba(255,255,255,0.08); border-color: rgba(255,255,255,0.15); color: rgba(255,255,255,0.55); }
  .chip.status-open      { background: rgba(46,107,114,0.25); border-color: rgba(46,107,114,0.4); color: #6fd9c8; }
  .chip.status-closed    { background: rgba(168,88,88,0.2); border-color: rgba(168,88,88,0.35); color: #e8a0a0; }

  /* Alert Messages */
  .msg {
    display: flex;
    align-items: center;
    gap: 12px;
    margin-top: 20px;
    padding: 12px 18px;
    border-radius: var(--radius-sm);
    font-size: 0.875rem;
    font-weight: 500;
    position: relative;
    z-index: 1;
    backdrop-filter: blur(2px);
  }
  .msg.success {
    background: rgba(46,107,114,0.2);
    border: 1px solid rgba(46,107,114,0.35);
    color: #8ce6db;
  }
  .msg.error {
    background: rgba(168,88,88,0.2);
    border: 1px solid rgba(168,88,88,0.35);
    color: #f0b8b8;
  }
  .msg-icon { font-size: 1.1rem; flex-shrink: 0; }

  /* Join Panel */
  .join-panel {
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    justify-content: space-between;
    gap: 20px;
    border-top: 1px solid rgba(255,255,255,0.1);
    padding-top: 22px;
    margin-top: 22px;
    position: relative;
    z-index: 1;
  }

  .join-info {
    font-size: 0.9rem;
    color: rgba(255,255,255,0.6);
    line-height: 1.5;
    flex: 1;
  }

  .btn-row {
    display: flex;
    gap: 12px;
    flex-wrap: wrap;
  }

  .join-btn {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    padding: 12px 28px;
    border: none;
    border-radius: var(--radius-sm);
    background: var(--gold);
    color: var(--oxford);
    font-family: 'DM Sans', sans-serif;
    font-size: 0.9rem;
    font-weight: 700;
    cursor: pointer;
    letter-spacing: 0.3px;
    text-decoration: none;
    transition: all 0.25s ease;
    white-space: nowrap;
  }
  .join-btn:hover {
    background: #e2bc6a;
    transform: translateY(-2px);
    box-shadow: 0 6px 20px rgba(201,168,76,0.4);
    text-decoration: none;
    color: var(--oxford);
  }
  .join-btn:disabled {
    opacity: 0.5;
    cursor: not-allowed;
    transform: none;
    box-shadow: none;
  }

  .join-btn.danger {
    background: rgba(168,88,88,0.9);
    color: var(--white);
  }
  .join-btn.danger:hover {
    background: var(--rose);
    box-shadow: 0 4px 16px rgba(168,88,88,0.35);
    color: var(--white);
  }

  .ghost-btn {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    padding: 10px 22px;
    border-radius: var(--radius-sm);
    border: 1.5px solid rgba(255,255,255,0.2);
    background: rgba(255,255,255,0.05);
    color: rgba(255,255,255,0.8);
    font-family: 'DM Sans', sans-serif;
    font-weight: 600;
    font-size: 0.85rem;
    text-decoration: none;
    transition: all 0.22s ease;
    margin-top: 16px;
  }
  .ghost-btn:hover {
    border-color: var(--gold);
    color: var(--gold);
    background: rgba(201,168,76,0.1);
    text-decoration: none;
    transform: translateY(-1px);
  }

  /* ===========================
     MAIN CONTENT GRID
  =========================== */
  .content-grid {
    display: grid;
    grid-template-columns: 1.5fr 0.9fr;
    gap: 24px;
    margin-bottom: 24px;
  }

  /* Cards */
  .cv-card {
    background: var(--white);
    border: 1px solid var(--cream);
    border-radius: var(--radius);
    overflow: hidden;
    box-shadow: var(--shadow-sm);
    transition: all 0.25s ease;
    animation: cardSlideUp 0.6s 0.15s ease both;
  }
  .cv-card:hover {
    box-shadow: var(--shadow-md);
    transform: translateY(-2px);
  }

  .cv-card-header {
    padding: 1.2rem 1.6rem;
    border-bottom: 1px solid var(--cream);
    display: flex;
    align-items: center;
    gap: 12px;
    background: var(--ivory);
  }

  .cv-card-icon {
    width: 36px;
    height: 36px;
    border-radius: 10px;
    background: rgba(14,31,61,0.08);
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.1rem;
    flex-shrink: 0;
  }

  .cv-card-header h2 {
    font-family: 'Playfair Display', serif;
    font-size: 1.1rem;
    color: var(--oxford);
    font-weight: 700;
    margin: 0;
  }

  .cv-card-body {
    padding: 1.5rem 1.6rem;
  }

  /* HTML Description */
  .html-desc {
    font-size: 0.92rem;
    color: var(--slate);
    line-height: 1.7;
  }
  .html-desc p { margin-bottom: 12px; }
  .html-desc ul, .html-desc ol { margin-bottom: 12px; padding-left: 22px; }
  .html-desc h1, .html-desc h2, .html-desc h3 {
    font-family: 'Playfair Display', serif;
    color: var(--oxford);
    margin-bottom: 10px;
    margin-top: 16px;
  }

  .empty-text {
    color: var(--muted);
    font-size: 0.875rem;
    text-align: center;
    padding: 24px 0;
  }

  /* Quick Info List */
  .kinfo-list { display: flex; flex-direction: column; gap: 12px; }

  .kinfo-item {
    background: var(--ivory);
    border: 1px solid var(--cream);
    border-radius: var(--radius-sm);
    padding: 14px 16px;
    transition: all 0.2s ease;
  }
  .kinfo-item:hover {
    border-color: rgba(201,168,76,0.4);
    background: #fefcf8;
  }

  .kinfo-label {
    display: block;
    font-size: 0.65rem;
    font-weight: 700;
    letter-spacing: 1px;
    text-transform: uppercase;
    color: var(--muted);
    margin-bottom: 6px;
  }

  .kinfo-value {
    font-size: 1rem;
    font-weight: 600;
    color: var(--navy);
  }

  /* Prize List */
  .prize-list { display: flex; flex-direction: column; gap: 16px; }

  .prize-card {
    background: var(--ivory);
    border: 1px solid var(--cream);
    border-radius: var(--radius-sm);
    padding: 16px 18px;
    transition: all 0.2s ease;
  }
  .prize-card:hover {
    border-color: rgba(201,168,76,0.5);
    background: #fefcf8;
    transform: translateX(4px);
  }

  .prize-rank-badge {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    font-size: 0.7rem;
    font-weight: 700;
    letter-spacing: 0.8px;
    text-transform: uppercase;
    margin-bottom: 8px;
    padding: 2px 8px;
    border-radius: 20px;
    background: rgba(201,168,76,0.1);
  }
  .prize-rank-badge.rank-1 { color: #b8860b; background: rgba(184,134,11,0.1); }
  .prize-rank-badge.rank-2 { color: var(--slate); background: rgba(75,91,110,0.08); }
  .prize-rank-badge.rank-3 { color: var(--sage); background: rgba(74,124,111,0.08); }

  .prize-title {
    font-family: 'Playfair Display', serif;
    font-size: 1.05rem;
    font-weight: 700;
    color: var(--oxford);
    margin-bottom: 6px;
  }

  .prize-desc {
    font-size: 0.85rem;
    color: var(--slate);
    line-height: 1.55;
  }

  /* ===========================
     RESPONSIVE
  =========================== */
  @media (max-width: 900px) {
    .content-grid { grid-template-columns: 1fr; gap: 20px; }
    .page { padding: 20px 16px 40px; }
    .hero { padding: 1.8rem 1.6rem; }
    .join-panel { flex-direction: column; align-items: flex-start; }
    .btn-row { width: 100%; }
    .join-btn { flex: 1; justify-content: center; }
  }

  @media (max-width: 640px) {
    .meta { gap: 8px; }
    .chip { font-size: 0.7rem; padding: 4px 10px; }
    .cv-card-header { padding: 1rem 1.2rem; }
    .cv-card-body { padding: 1.2rem; }
  }

</style>
</head>

<body>

  <%@ include file="ParticipantTopNav.jsp"%>

  <div class="page">

    <!-- ===== TOPBAR ===== -->
    <div class="topbar">
      <a href="/participant/home" class="back-link">
        <span>←</span> Back to Hackathons
      </a>
    </div>

    <!-- ===== HERO SECTION ===== -->
    <section class="hero">
      <div class="hero-eyebrow">
        <span>💻</span> Hackathon Event
      </div>
      <h1>${hackathon.title}</h1>
      <c:if test="${not empty hackathon.description}">
        <p class="hero-desc">${hackathon.description}</p>
      </c:if>

      <!-- Meta Chips -->
      <div class="meta">
        <span class="chip status-${hackathon.status}">📌 ${hackathon.status}</span>
        <span class="chip">📍 ${hackathon.eventType}</span>
        <span class="chip">
          <c:choose>
            <c:when test="${hackathon.payment == 'FREE'}">🆓 Free</c:when>
            <c:otherwise>💳 Paid</c:otherwise>
          </c:choose>
        </span>
        <span class="chip">👥 ${hackathon.minTeamSize}–${hackathon.maxTeamSize} Members</span>
        <span class="chip ${registrationOpen ? 'status-open' : 'status-closed'}">
          ${registrationOpen ? '✓ Registration Open' : '✗ Registration Closed'}
        </span>
        <span class="chip">🏁 ${teamCount} Teams Joined</span>
      </div>

      <!-- Flash Messages -->
      <c:if test="${joined == 'true'}">
        <div class="msg success"><span class="msg-icon">✓</span> You have successfully joined this hackathon.</div>
      </c:if>
      <c:if test="${success == 'inviteAccepted'}">
        <div class="msg success"><span class="msg-icon">✓</span> Invitation accepted. You are now part of this team.</div>
      </c:if>
      <c:if test="${success == 'inviteRejected'}">
        <div class="msg success"><span class="msg-icon">ℹ</span> Invitation rejected successfully.</div>
      </c:if>
      <c:if test="${error == 'alreadyRegistered'}">
        <div class="msg error"><span class="msg-icon">⚠</span> You are already registered in this hackathon.</div>
      </c:if>
      <c:if test="${error == 'registrationClosed'}">
        <div class="msg error"><span class="msg-icon">⚠</span> Registration is currently closed for this hackathon.</div>
      </c:if>
      <c:if test="${error == 'inviteNotFound' || error == 'inviteInvalid'}">
        <div class="msg error"><span class="msg-icon">⚠</span> Invitation is invalid or no longer available.</div>
      </c:if>
      <c:if test="${error == 'teamFull'}">
        <div class="msg error"><span class="msg-icon">⚠</span> This team is full and the invite cannot be accepted.</div>
      </c:if>
      <c:if test="${error == 'alreadyInHackathon'}">
        <div class="msg error"><span class="msg-icon">⚠</span> You are already part of another team in this hackathon.</div>
      </c:if>
      <c:if test="${error == 'leaderboardNotReady'}">
        <div class="msg error"><span class="msg-icon">⚠</span> Leaderboard will be available only after the hackathon is marked complete.</div>
      </c:if>

      <!-- Join / Action Panel -->
      <div class="join-panel">
        <div class="join-info">
          <c:choose>
            <c:when test="${alreadyRegistered}">
              ✅ You are already part of this hackathon. Manage your team below.
            </c:when>
            <c:when test="${not empty pendingInvite}">
              📩 You have a pending team invitation for this hackathon.
            </c:when>
            <c:when test="${registrationOpen}">
              🚀 Registration is open — join now and start building your team.
            </c:when>
            <c:otherwise>
              📅 Registrations can only be submitted during the official registration window.
            </c:otherwise>
          </c:choose>
        </div>

        <c:choose>
          <c:when test="${alreadyRegistered}">
            <a href="/participant/hackathon/${hackathon.hackathonId}/team" class="join-btn">
              👥 Manage Team
            </a>
          </c:when>
          <c:when test="${not empty pendingInvite}">
            <div class="btn-row">
              <form action="/participant/hackathon/${hackathon.hackathonId}/invite/${pendingInvite.hackathonTeamInviteId}/accept" method="post">
                <button type="submit" class="join-btn">✓ Accept Invitation</button>
              </form>
              <form action="/participant/hackathon/${hackathon.hackathonId}/invite/${pendingInvite.hackathonTeamInviteId}/reject" method="post">
                <button type="submit" class="join-btn danger">✗ Reject</button>
              </form>
            </div>
          </c:when>
          <c:when test="${canJoin}">
            <form action="/participant/hackathon/${hackathon.hackathonId}/join" method="post">
              <button type="submit" class="join-btn">🚀 Join Hackathon</button>
            </form>
          </c:when>
          <c:otherwise>
            <button type="button" class="join-btn" disabled>🔒 Registration Closed</button>
          </c:otherwise>
        </c:choose>
      </div>

      <!-- Leaderboard Link -->
      <c:if test="${leaderboardAvailable}">
        <a class="ghost-btn" href="/participant/hackathon/${hackathon.hackathonId}/leaderboard">
          🏆 View Leaderboard →
        </a>
      </c:if>

    </section>
    <!-- /.hero -->

    <!-- ===== CONTENT GRID ===== -->
    <div class="content-grid">

      <!-- About Card -->
      <div class="cv-card">
        <div class="cv-card-header">
          <div class="cv-card-icon">📄</div>
          <h2>About This Hackathon</h2>
        </div>
        <div class="cv-card-body">
          <div class="html-desc">
            <c:choose>
              <c:when test="${not empty hackathonDescription}">
                <c:out value="${hackathonDescription.hackathonDetails}" escapeXml="false" />
              </c:when>
              <c:otherwise>
                <div class="empty-text">✨ Detailed description is not available yet. Stay tuned!</div>
              </c:otherwise>
            </c:choose>
          </div>
        </div>
      </div>

      <!-- Quick Info Card -->
      <div class="cv-card">
        <div class="cv-card-header">
          <div class="cv-card-icon">📅</div>
          <h2>Quick Info</h2>
        </div>
        <div class="cv-card-body">
          <div class="kinfo-list">
            <div class="kinfo-item">
              <span class="kinfo-label">Registration Opens</span>
              <span class="kinfo-value">${hackathon.registrationStartDate}</span>
            </div>
            <div class="kinfo-item">
              <span class="kinfo-label">Registration Closes</span>
              <span class="kinfo-value">${hackathon.registrationEndDate}</span>
            </div>
            <div class="kinfo-item">
              <span class="kinfo-label">Location</span>
              <span class="kinfo-value">
                <c:choose>
                  <c:when test="${not empty hackathon.location}">${hackathon.location}</c:when>
                  <c:otherwise><span style="color:var(--muted)">—</span></c:otherwise>
                </c:choose>
              </span>
            </div>
            <div class="kinfo-item">
              <span class="kinfo-label">Team Composition</span>
              <span class="kinfo-value">${hackathon.minTeamSize} – ${hackathon.maxTeamSize} members per team</span>
            </div>
            <div class="kinfo-item">
              <span class="kinfo-label">Event Format</span>
              <span class="kinfo-value">${hackathon.eventType}</span>
            </div>
            <div class="kinfo-item">
              <span class="kinfo-label">Registered Teams</span>
              <span class="kinfo-value">${teamCount} teams</span>
            </div>
          </div>
        </div>
      </div>

    </div>
    <!-- /.content-grid -->

    <!-- ===== PRIZES CARD ===== -->
    <div class="cv-card" style="animation-delay: 0.25s;">
      <div class="cv-card-header">
        <div class="cv-card-icon">🏆</div>
        <h2>Prizes & Recognition</h2>
      </div>
      <div class="cv-card-body">
        <c:choose>
          <c:when test="${empty prizeList}">
            <div class="empty-text">🎁 Prize details are not published yet. Check back soon!</div>
          </c:when>
          <c:otherwise>
            <div class="prize-list">
              <c:forEach items="${prizeList}" var="p" varStatus="i">
                <div class="prize-card">
                  <div class="prize-rank-badge rank-${i.count}">
                    <c:choose>
                      <c:when test="${i.count == 1}">🥇 First Prize</c:when>
                      <c:when test="${i.count == 2}">🥈 Second Prize</c:when>
                      <c:when test="${i.count == 3}">🥉 Third Prize</c:when>
                      <c:otherwise>🏅 Prize ${i.count}</c:otherwise>
                    </c:choose>
                  </div>
                  <div class="prize-title">${p.prizeTitle}</div>
                  <div class="prize-desc">${p.prizeDescription}</div>
                </div>
              </c:forEach>
            </div>
          </c:otherwise>
        </c:choose>
      </div>
    </div>

  </div>
  <!-- /.page -->

</body>
</html>