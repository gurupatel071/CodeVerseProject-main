<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Hackathons | CodeVerse</title>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
<style>
:root {
  --bg: #f4f2ee;
  --bg1: #ffffff;
  --bg2: #eeecea;
  --bg3: #e5e2de;
  --nv: #0e1f3d;
  --nv2: #1a3260;
  --nv-dim: rgba(14,31,61,0.07);
  --nv-glow: rgba(14,31,61,0.18);
  --tl: #2e6b72;
  --tl-light: #3d8f98;
  --tl-dim: rgba(46,107,114,0.1);
  --tl-glow: rgba(46,107,114,0.2);
  --gd: #c9a84c;
  --gd-light: #e0be73;
  --gd-dim: rgba(201,168,76,0.12);
  --rs: #a85858;
  --rs-dim: rgba(168,88,88,0.1);
  --t1: #1a1f2e;
  --t2: #4b5b6e;
  --t3: #8c97a4;
  --t4: #b8c0ca;
  --bd: rgba(14,31,61,0.08);
  --bd2: rgba(14,31,61,0.13);
  --bd3: rgba(14,31,61,0.22);
  --ff: 'Inter', sans-serif;
  --ease: cubic-bezier(0.16,1,0.3,1);
  --r: 10px;
  --r2: 14px;
  --r3: 18px;
  --sh-sm: 0 1px 3px rgba(14,31,61,0.06),0 1px 2px rgba(14,31,61,0.04);
  --sh-md: 0 4px 16px rgba(14,31,61,0.08),0 1px 4px rgba(14,31,61,0.04);
  --sh-lg: 0 12px 36px rgba(14,31,61,0.11),0 2px 8px rgba(14,31,61,0.06);
}

*,*::before,*::after { box-sizing: border-box; margin: 0; padding: 0; }
html { scroll-behavior: smooth; }
body {
  font-family: var(--ff);
  background: var(--bg);
  color: var(--t1);
  min-height: 100vh;
  -webkit-font-smoothing: antialiased;

  display: flex;
  flex-direction: column;
}
a { text-decoration: none; color: inherit; }
button { font-family: var(--ff); cursor: pointer; border: none; background: none; }

/* BG */
.bg-layer { position: fixed; inset: 0; z-index: 0; pointer-events: none; overflow: hidden; }
.bg-blot { position: absolute; border-radius: 50%; filter: blur(120px); }
.bb1 { width: 550px; height: 450px; opacity: 0.055; background: radial-gradient(circle,var(--tl) 0%,transparent 70%); top: -150px; right: -60px; }
.bb2 { width: 450px; height: 380px; opacity: 0.04; background: radial-gradient(circle,var(--nv) 0%,transparent 70%); bottom: 0; left: -80px; }

/* NAVBAR */
.navbar {
  position: sticky; top: 0; z-index: 500; height: 60px;
  display: flex; align-items: center; justify-content: space-between; padding: 0 48px;
  background: rgba(244,242,238,0.9); backdrop-filter: blur(20px) saturate(180%);
  border-bottom: 1px solid var(--bd); box-shadow: 0 1px 0 var(--bd);
}
.brand { display: flex; align-items: center; gap: 10px; }
.brand-mark { width: 32px; height: 32px; border-radius: 8px; background: var(--nv); display: grid; place-items: center; color: var(--gd-light); }
.brand-name { font-size: 1.1rem; font-weight: 700; color: var(--nv); letter-spacing: -0.3px; }
.brand-name span { color: var(--tl); }
.nav-links { display: flex; align-items: center; gap: 2px; }
.nav-links a { font-size: 0.875rem; font-weight: 500; color: var(--t2); padding: 6px 13px; border-radius: 8px; transition: all 0.18s; }
.nav-links a:hover { color: var(--nv); background: var(--nv-dim); }
.nav-cta {
  display: inline-flex; align-items: center; gap: 6px;
  font-size: 0.85rem !important; font-weight: 600 !important; color: #fff !important;
  background: var(--nv) !important; padding: 7px 16px !important; border-radius: 8px !important;
  margin-left: 6px; transition: all 0.2s var(--ease) !important; box-shadow: var(--sh-sm);
}
.nav-cta:hover { background: var(--nv2) !important; transform: translateY(-1px); box-shadow: var(--sh-md) !important; }

/* PAGE */
.page {
  position: relative;
  z-index: 1;
  max-width: 1200px;
  margin: 0 auto;
  padding: 36px 48px 80px;

  flex: 1;
  width: 100%;
}

/* PAGE HEADER */
.page-header {
  display: flex; align-items: flex-start; justify-content: space-between;
  gap: 16px; flex-wrap: wrap; margin-bottom: 32px;
}
.back-link {
  display: inline-flex; align-items: center; gap: 6px;
  font-size: 0.82rem; font-weight: 500; color: var(--t3);
  margin-bottom: 10px; transition: color 0.18s;
}
.back-link:hover { color: var(--nv); }
.page-title { font-size: 1.9rem; font-weight: 700; color: var(--nv); letter-spacing: -0.6px; }
.page-sub { font-size: 0.88rem; color: var(--t2); margin-top: 5px; line-height: 1.6; }

.count-badge {
  display: inline-flex; align-items: center; gap: 8px;
  background: var(--nv); color: var(--gd-light);
  font-size: 0.78rem; font-weight: 600; letter-spacing: 0.3px;
  padding: 8px 18px; border-radius: 100px;
  box-shadow: var(--sh-sm); white-space: nowrap; margin-top: 4px;
}

/* GRID */
.grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(340px, 1fr));
  gap: 20px;
}

/* CARD */
.card {
  background: var(--bg1); border: 1px solid var(--bd);
  border-radius: var(--r3); overflow: hidden;
  display: flex; flex-direction: column;
  box-shadow: var(--sh-sm);
  transition: transform 0.26s var(--ease), box-shadow 0.26s, border-color 0.26s;
  animation: rise 0.5s var(--ease) both;
}
.card:nth-child(1) { animation-delay:.04s }
.card:nth-child(2) { animation-delay:.08s }
.card:nth-child(3) { animation-delay:.12s }
.card:nth-child(4) { animation-delay:.16s }
.card:nth-child(5) { animation-delay:.20s }
.card:nth-child(6) { animation-delay:.24s }
.card:hover {
  transform: translateY(-4px);
  border-color: rgba(46,107,114,0.4);
  box-shadow: var(--sh-lg), 0 0 0 1px rgba(46,107,114,0.08);
}

/* color bar — nth-child cycling */
.c-bar { height: 3px; width: 100%; flex-shrink: 0; }
.card:nth-child(3n+1) .c-bar { background: linear-gradient(90deg, var(--nv), #2e4a8c); }
.card:nth-child(3n+2) .c-bar { background: linear-gradient(90deg, var(--tl), var(--tl-light), #5fbfca); }
.card:nth-child(3n+0) .c-bar { background: linear-gradient(90deg, var(--gd), var(--gd-light), #f0d080); }

.card-body { padding: 20px 20px 0; flex: 1; display: flex; flex-direction: column; gap: 14px; }

/* icon — nth-child cycling */
.c-ico { width: 42px; height: 42px; border-radius: 10px; display: grid; place-items: center; flex-shrink: 0; }
.card:nth-child(3n+1) .c-ico { background: var(--nv-dim); border: 1px solid rgba(14,31,61,0.12); color: var(--nv); }
.card:nth-child(3n+2) .c-ico { background: var(--tl-dim); border: 1px solid rgba(46,107,114,0.18); color: var(--tl); }
.card:nth-child(3n+0) .c-ico { background: var(--gd-dim); border: 1px solid rgba(201,168,76,0.2); color: var(--gd); }

/* STATUS + ICON ROW */
.card-row1 { display: flex; align-items: flex-start; justify-content: space-between; }

.status-badge {
  display: inline-flex; align-items: center; gap: 5px;
  font-size: 0.62rem; font-weight: 600; letter-spacing: 0.5px; text-transform: uppercase;
  padding: 4px 10px; border-radius: 100px;
}
.st-live { background: rgba(46,107,114,0.1); color: var(--tl); border: 1px solid rgba(46,107,114,0.22); }
.st-soon { background: var(--gd-dim); color: #8a6a1c; border: 1px solid rgba(201,168,76,0.3); }
.st-over { background: var(--bg2); color: var(--t3); border: 1px solid var(--bd); }
.s-dot { width: 6px; height: 6px; border-radius: 50%; flex-shrink: 0; }
.st-live .s-dot { background: var(--tl); animation: pls 2s infinite; }
.st-soon .s-dot { background: var(--gd); }

@keyframes pls {
  0%,100% { box-shadow: 0 0 0 0 rgba(46,107,114,0.6); }
  50% { box-shadow: 0 0 0 5px rgba(46,107,114,0); }
}
@keyframes rise { from { opacity:0; transform:translateY(20px); } to { opacity:1; transform:translateY(0); } }

/* CARD TITLE + DESC */
.card-title { font-size: 1.1rem; font-weight: 600; color: var(--nv); line-height: 1.3; letter-spacing: -0.2px; }
.card-desc {
  font-size: 0.875rem; color: var(--t2); line-height: 1.65;
  display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden;
}

/* CHIPS ROW */
.chips { display: flex; flex-wrap: wrap; gap: 6px; }
.chip {
  display: inline-flex; align-items: center; gap: 4px;
  font-size: 0.65rem; font-weight: 500; letter-spacing: 0.2px;
  padding: 4px 10px; border-radius: 6px; line-height: 1.5;
}
.chip-status { background: var(--bg2); color: var(--t2); border: 1px solid var(--bd); }
.chip-mode   { background: var(--tl-dim); color: var(--tl); border: 1px solid rgba(46,107,114,0.18); }
.chip-team   { background: var(--nv-dim); color: var(--nv); border: 1px solid rgba(14,31,61,0.12); }
.chip-invite { background: var(--gd-dim); color: #7a6020; border: 1px solid rgba(201,168,76,0.3); }
.chip-leader { background: var(--gd-dim); color: #7a6020; border: 1px solid rgba(201,168,76,0.3); font-weight: 600; }
.chip-member { background: var(--tl-dim); color: var(--tl); border: 1px solid rgba(46,107,114,0.2); }

/* CARD FOOTER */
.card-foot {
  display: flex; flex-wrap: wrap; gap: 8px;
  padding: 16px 20px;
  border-top: 1px solid var(--bd);
  margin-top: 14px;
}

.btn {
  display: inline-flex; align-items: center; justify-content: center; gap: 6px;
  font-family: var(--ff); font-size: 0.8rem; font-weight: 600;
  padding: 8px 14px; border-radius: 8px; border: none; cursor: pointer;
  transition: all 0.2s var(--ease); white-space: nowrap; flex: 1; min-width: fit-content;
}
.btn-outline {
  background: transparent; border: 1px solid var(--bd2); color: var(--t2);
}
.btn-outline:hover { background: var(--nv); color: #fff; border-color: var(--nv); transform: translateY(-1px); box-shadow: 0 4px 14px var(--nv-glow); }
.btn-navy { background: var(--nv); color: #fff; box-shadow: 0 2px 8px var(--nv-glow); }
.btn-navy:hover { background: var(--nv2); transform: translateY(-1px); box-shadow: 0 4px 14px var(--nv-glow); }
.btn-teal { background: var(--tl); color: #fff; box-shadow: 0 2px 8px var(--tl-glow); }
.btn-teal:hover { background: var(--tl-light); transform: translateY(-1px); box-shadow: 0 4px 14px var(--tl-glow); }
.btn-gold { background: var(--gd); color: #fff; box-shadow: 0 2px 8px var(--gd-dim); }
.btn-gold:hover { background: var(--gd-light); transform: translateY(-1px); }
.btn-disabled {
  background: var(--bg2); color: var(--t4); border: 1px solid var(--bd);
  cursor: not-allowed; pointer-events: none; opacity: 0.75;
}

/* EMPTY STATE */
.empty-state {
  background: var(--bg1); border: 1px solid var(--bd);
  border-radius: var(--r3); padding: 72px 32px; text-align: center;
  box-shadow: var(--sh-sm); animation: rise 0.5s var(--ease) both;
}
.empty-ico {
  width: 64px; height: 64px; border-radius: 16px;
  background: var(--bg2); border: 1px solid var(--bd);
  display: grid; place-items: center; margin: 0 auto 20px; color: var(--t3);
}
.empty-state h3 { font-size: 1.2rem; font-weight: 600; color: var(--t2); margin-bottom: 8px; }
.empty-state p { font-size: 0.88rem; color: var(--t3); line-height: 1.6; }
.empty-cta {
  display: inline-flex; align-items: center; gap: 8px;
  margin-top: 24px; padding: 10px 22px; border-radius: var(--r);
  background: var(--nv); color: #fff; font-size: 0.875rem; font-weight: 600;
  box-shadow: var(--sh-sm); transition: all 0.2s var(--ease);
}
.empty-cta:hover { background: var(--nv2); transform: translateY(-1px); box-shadow: var(--sh-md); }

/* FOOTER */
.site-footer {
  position: relative; z-index: 1;
  background: var(--nv); padding: 28px 48px;
  display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap; gap: 16px;
}
.f-brand { font-size: 0.95rem; font-weight: 600; color: rgba(255,255,255,0.65); }
.f-brand span { color: var(--gd-light); }
.f-copy { font-size: 0.62rem; color: rgba(255,255,255,0.28); letter-spacing: 0.5px; }

/* RESPONSIVE */
@media (max-width:1100px) { .page { padding: 28px 24px 60px; } .navbar { padding: 0 24px; } .site-footer { padding: 24px; } }
@media (max-width:620px)  { .navbar { padding: 0 16px; } .page { padding: 20px 16px 48px; } .grid { grid-template-columns: 1fr; } .site-footer { padding: 20px 16px; flex-direction: column; text-align: center; } }
</style>
</head>
<body>

<div class="bg-layer">
  <div class="bg-blot bb1"></div>
  <div class="bg-blot bb2"></div>
</div>

<!-- NAVBAR -->
<header class="navbar">
  <a href="#" class="brand">
    <div class="brand-mark">
      <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
        <polyline points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"/>
      </svg>
    </div>
    <span class="brand-name">Code<span>Verse</span></span>
  </a>
  <nav class="nav-links">
			<a href="/participant/home">Explore</a>
			<a href="/participant/my-hackathons">My Hackathons</a> <a href="/logout">Logout</a> <a href="/participant/profile" class="nav-cta">My Profile</a>
				 <svg width="11" height="11" viewBox="0 0 24 24" fill="none"
					stroke="currentColor" stroke-width="2.5" stroke-linecap="round"
					stroke-linejoin="round">
        <line x1="5" y1="12" x2="19" y2="12" />
					<polyline points="12 5 19 12 12 19" />
      </svg>
			</a>
		</nav>
</header>

<!-- PAGE -->
<div class="page">

  <!-- HEADER -->
  <div class="page-header">
    <div>
      <a href="/participant/home" class="back-link">
        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
          <line x1="19" y1="12" x2="5" y2="12"/>
          <polyline points="12 19 5 12 12 5"/>
        </svg>
        Back to Home
      </a>
      <h1 class="page-title">My Hackathons</h1>
      <p class="page-sub">Manage all hackathons where you are part of a team.</p>
    </div>
    <div class="count-badge">
      <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <polyline points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"/>
      </svg>
      Total: ${totalCount}
    </div>
  </div>

  <!-- EMPTY -->
  <c:if test="${empty myHackathons}">
    <div class="empty-state">
      <div class="empty-ico">
        <svg width="26" height="26" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
          <circle cx="11" cy="11" r="8"/>
          <line x1="21" y1="21" x2="16.65" y2="16.65"/>
        </svg>
      </div>
      <h3>No joined hackathons yet</h3>
      <p>Join a hackathon from the home page and it will appear here.</p>
      <a href="/participant/home" class="empty-cta">
        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
          <circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/>
        </svg>
        Browse Hackathons
      </a>
    </div>
  </c:if>

  <!-- GRID -->
  <c:if test="${not empty myHackathons}">
    <div class="grid">
      <c:forEach items="${myHackathons}" var="m" varStatus="loop">

        <article class="card">

          <!-- color bar — CSS nth-child handles cycling -->
          <div class="c-bar"></div>

          <div class="card-body">

            <!-- icon + status -->
            <div class="card-row1">

              <!-- icon — CSS nth-child handles color -->
              <div class="c-ico">
                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <polyline points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"/>
                </svg>
              </div>

              <c:choose>
                <c:when test="${m.hackathon.status eq 'ONGOING'}">
                  <span class="status-badge st-live"><span class="s-dot"></span>Live</span>
                </c:when>
                <c:when test="${m.hackathon.status eq 'UPCOMING'}">
                  <span class="status-badge st-soon"><span class="s-dot"></span>Soon</span>
                </c:when>
                <c:otherwise>
                  <span class="status-badge st-over">Ended</span>
                </c:otherwise>
              </c:choose>

            </div>

            <!-- title -->
            <h3 class="card-title">${m.hackathon.title}</h3>

            <!-- desc -->
            <p class="card-desc">
              <c:choose>
                <c:when test="${not empty m.hackathon.description}">${m.hackathon.description}</c:when>
                <c:otherwise>Showcase your skills, collaborate with talented developers, and build something extraordinary.</c:otherwise>
              </c:choose>
            </p>

            <!-- chips -->
            <div class="chips">
              <span class="chip chip-mode">${m.hackathon.eventType}</span>
              <span class="chip chip-team">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round" style="width:10px;height:10px">
                  <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/>
                  <path d="M23 21v-2a4 4 0 0 0-3-3.87M16 3.13a4 4 0 0 1 0 7.75"/>
                </svg>
                ${m.teamSize} members
              </span>
              <c:if test="${m.pendingInvites > 0}">
                <span class="chip chip-invite">${m.pendingInvites} pending invite<c:if test="${m.pendingInvites > 1}">s</c:if></span>
              </c:if>
              <c:choose>
                <c:when test="${m.leader}">
                  <span class="chip chip-leader">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round" style="width:9px;height:9px">
                      <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/>
                    </svg>
                    Team Leader
                  </span>
                </c:when>
                <c:otherwise>
                  <span class="chip chip-member">${m.roleTitle}</span>
                </c:otherwise>
              </c:choose>
            </div>

          </div><!-- end card-body -->

          <!-- FOOTER ACTIONS -->
          <div class="card-foot">

            <a class="btn btn-outline" href="/participant/hackathon/${m.hackathon.hackathonId}">
              <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/>
              </svg>
              Details
            </a>

            <a class="btn btn-navy" href="/participant/hackathon/${m.hackathon.hackathonId}/team">
              <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/>
                <path d="M23 21v-2a4 4 0 0 0-3-3.87M16 3.13a4 4 0 0 1 0 7.75"/>
              </svg>
              Team
            </a>

            <c:if test="${not empty m.teamId}">
              <c:choose>
                <c:when test="${m.submissionEnabled}">
                  <a class="btn btn-teal" href="/participant/hackathon/${m.hackathon.hackathonId}/submission">
                    <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                      <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/>
                      <polyline points="17 8 12 3 7 8"/>
                      <line x1="12" y1="3" x2="12" y2="15"/>
                    </svg>
                    Submit
                  </a>
                </c:when>
                <c:otherwise>
                  <span class="btn btn-disabled">
                    <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                      <rect x="3" y="11" width="18" height="11" rx="2" ry="2"/>
                      <path d="M7 11V7a5 5 0 0 1 10 0v4"/>
                    </svg>
                    Submit
                  </span>
                </c:otherwise>
              </c:choose>
            </c:if>

            <c:if test="${m.hackathon.status eq 'COMPLETE' || m.hackathon.status eq 'COMPLETED'}">
              <a class="btn btn-gold" href="/participant/hackathon/${m.hackathon.hackathonId}/leaderboard">
                <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                  <line x1="18" y1="20" x2="18" y2="10"/>
                  <line x1="12" y1="20" x2="12" y2="4"/>
                  <line x1="6" y1="20" x2="6" y2="14"/>
                </svg>
                Leaderboard
              </a>
            </c:if>

          </div>

        </article>
      </c:forEach>
    </div>
  </c:if>

</div><!-- end page -->

<!-- FOOTER -->
<footer class="site-footer">
  <div class="f-brand">Code<span>Verse</span> &mdash; Your Gateway to Innovation</div>
  <div class="f-copy">&copy; 2026 CodeVerse. All rights reserved.</div>
</footer>

</body>
</html>
