<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Manage Team | ${hackathon.title}</title>
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
body { font-family: var(--ff); background: var(--bg); color: var(--t1); min-height: 100vh; -webkit-font-smoothing: antialiased; }
a { text-decoration: none; color: inherit; }
button { font-family: var(--ff); cursor: pointer; border: none; background: none; }
select, input { font-family: var(--ff); }

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
  position: relative; z-index: 1;
  max-width: 1200px; margin: 0 auto; padding: 36px 48px 80px;
}

/* PAGE HEADER */
.page-header {
  display: flex; align-items: flex-start; justify-content: space-between;
  gap: 16px; flex-wrap: wrap; margin-bottom: 28px;
}
.back-link {
  display: inline-flex; align-items: center; gap: 6px;
  font-size: 0.82rem; font-weight: 500; color: var(--t3);
  margin-bottom: 10px; transition: color 0.18s;
}
.back-link:hover { color: var(--nv); }
.page-title {
  font-size: 1.75rem; font-weight: 700; color: var(--nv);
  letter-spacing: -0.5px; line-height: 1.2;
}
.page-sub { font-size: 0.88rem; color: var(--t2); margin-top: 4px; }

.member-badge {
  display: inline-flex; align-items: center; gap: 8px;
  background: var(--nv); color: var(--gd-light);
  font-size: 0.78rem; font-weight: 600; letter-spacing: 0.3px;
  padding: 8px 18px; border-radius: 100px;
  box-shadow: var(--sh-sm); white-space: nowrap; margin-top: 4px;
}
.member-badge svg { color: var(--gd-light); }

/* MESSAGES */
.msg {
  display: flex; align-items: center; gap: 10px;
  padding: 12px 16px; border-radius: var(--r2);
  font-size: 0.875rem; font-weight: 500;
  margin-bottom: 12px; animation: rise 0.4s var(--ease) both;
}
.msg.success {
  background: rgba(46,107,114,0.1); border: 1px solid rgba(46,107,114,0.3); color: var(--tl);
}
.msg.error {
  background: var(--rs-dim); border: 1px solid rgba(168,88,88,0.25); color: var(--rs);
}

@keyframes rise { from { opacity:0; transform:translateY(12px); } to { opacity:1; transform:translateY(0); } }

/* GRID */
.grid {
  display: grid;
  grid-template-columns: 1.3fr 0.7fr;
  gap: 20px;
}
.grid-full { grid-column: 1 / -1; }

/* CARD */
.card {
  background: var(--bg1); border: 1px solid var(--bd);
  border-radius: var(--r3); overflow: hidden;
  box-shadow: var(--sh-sm); animation: rise 0.5s var(--ease) both;
}
.card:nth-child(1) { animation-delay: .04s }
.card:nth-child(2) { animation-delay: .08s }
.card:nth-child(3) { animation-delay: .12s }
.card:nth-child(4) { animation-delay: .16s }
.card:nth-child(5) { animation-delay: .20s }
.card:nth-child(6) { animation-delay: .24s }

.card-head {
  padding: 16px 20px; background: var(--nv);
  display: flex; align-items: center; justify-content: space-between;
}
.card-head-title {
  font-size: 0.62rem; font-weight: 500; letter-spacing: 2.5px;
  text-transform: uppercase; color: rgba(255,255,255,0.55);
  display: flex; align-items: center; gap: 8px;
}
.card-head-title svg { color: rgba(255,255,255,0.35); }
.card-head-badge {
  font-size: 0.6rem; font-weight: 600; color: var(--nv);
  background: var(--gd-light); padding: 3px 10px; border-radius: 100px;
}
.card-body { padding: 22px 20px; }

/* TABLE */
.table { width: 100%; border-collapse: collapse; }
.table th {
  font-size: 0.62rem; font-weight: 600; letter-spacing: 2px;
  text-transform: uppercase; color: var(--t3);
  padding: 0 12px 10px; text-align: left; border-bottom: 1px solid var(--bd2);
}
.table th:first-child { padding-left: 0; }
.table th:last-child { padding-right: 0; }
.table td {
  font-size: 0.865rem; color: var(--t1);
  padding: 12px 12px; border-bottom: 1px solid var(--bd);
  vertical-align: middle;
}
.table td:first-child { padding-left: 0; }
.table td:last-child { padding-right: 0; }
.table tr:last-child td { border-bottom: none; }
.table tr { transition: background 0.15s; }
.table tbody tr:hover { background: var(--nv-dim); }

/* ROLE CHIP */
.role-chip {
  display: inline-flex; align-items: center;
  font-size: 0.65rem; font-weight: 600; letter-spacing: 0.5px; text-transform: uppercase;
  padding: 3px 10px; border-radius: 100px;
}
.role-leader { background: var(--gd-dim); color: #7a6020; border: 1px solid rgba(201,168,76,0.3); }
.role-member { background: var(--tl-dim); color: var(--tl); border: 1px solid rgba(46,107,114,0.2); }

/* STATUS CHIP */
.status-chip {
  display: inline-flex; align-items: center; gap: 5px;
  font-size: 0.62rem; font-weight: 600; letter-spacing: 0.5px; text-transform: uppercase;
  padding: 3px 10px; border-radius: 100px;
}
.status-pending { background: var(--gd-dim); color: #7a6020; border: 1px solid rgba(201,168,76,0.3); }
.status-accepted { background: var(--tl-dim); color: var(--tl); border: 1px solid rgba(46,107,114,0.2); }
.status-rejected { background: var(--rs-dim); color: var(--rs); border: 1px solid rgba(168,88,88,0.2); }

/* INVITE TYPE */
.type-chip {
  display: inline-flex; align-items: center;
  font-size: 0.63rem; font-weight: 500;
  padding: 3px 9px; border-radius: 6px;
  background: var(--nv-dim); color: var(--nv); border: 1px solid rgba(14,31,61,0.12);
}

/* FORM */
.form-group { margin-bottom: 16px; }
.form-group:last-of-type { margin-bottom: 0; }
.form-label {
  display: block; font-size: 0.78rem; font-weight: 600;
  color: var(--t2); margin-bottom: 7px; letter-spacing: 0.2px;
}
.form-input, .form-select {
  width: 100%; padding: 10px 14px;
  background: var(--bg); border: 1.5px solid var(--bd2);
  border-radius: var(--r); color: var(--t1);
  font-size: 0.88rem; font-family: var(--ff);
  transition: border-color 0.2s, box-shadow 0.2s; outline: none;
}
.form-select {
  appearance: none; cursor: pointer;
  background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='10' height='6' viewBox='0 0 10 6'%3E%3Cpath fill='%238c97a4' d='M0 0l5 6 5-6z'/%3E%3C/svg%3E");
  background-repeat: no-repeat; background-position: right 14px center;
  padding-right: 36px;
}
.form-input:focus, .form-select:focus {
  border-color: var(--tl);
  box-shadow: 0 0 0 3px var(--tl-dim);
}
.form-input::placeholder { color: var(--t4); }
.form-hint { font-size: 0.75rem; color: var(--t3); margin-top: 8px; line-height: 1.5; }

/* BUTTONS */
.btn {
  display: inline-flex; align-items: center; justify-content: center; gap: 7px;
  font-family: var(--ff); font-size: 0.875rem; font-weight: 600;
  padding: 10px 20px; border-radius: var(--r); border: none; cursor: pointer;
  transition: all 0.2s var(--ease);
}
.btn-primary {
  background: var(--tl); color: #fff;
  box-shadow: 0 2px 8px var(--tl-glow);
  margin-top: 16px;
}
.btn-primary:hover { background: var(--tl-light); transform: translateY(-1px); box-shadow: 0 4px 14px var(--tl-glow); }

.btn-navy {
  background: var(--nv); color: #fff;
  box-shadow: 0 2px 8px var(--nv-glow);
  margin-top: 16px;
}
.btn-navy:hover { background: var(--nv2); transform: translateY(-1px); box-shadow: 0 4px 14px var(--nv-glow); }

.btn-danger {
  background: transparent; color: var(--rs);
  border: 1.5px solid rgba(168,88,88,0.35);
  margin-top: 16px;
}
.btn-danger:hover { background: var(--rs-dim); border-color: var(--rs); }

.btn-sm {
  font-size: 0.78rem; padding: 6px 14px; margin-top: 0; border-radius: 8px;
}

.btn-row { display: flex; gap: 10px; flex-wrap: wrap; margin-top: 16px; }
.btn-row .btn { margin-top: 0; }

/* INVITE BANNER */
.invite-banner {
  background: linear-gradient(135deg, var(--nv), var(--nv2));
  border-radius: var(--r2); padding: 20px;
  display: flex; align-items: center; justify-content: space-between;
  flex-wrap: wrap; gap: 16px; margin-bottom: 8px;
}
.invite-banner-text h4 { font-size: 1rem; font-weight: 600; color: #fff; margin-bottom: 4px; }
.invite-banner-text p { font-size: 0.82rem; color: rgba(255,255,255,0.6); }
.invite-team-name { color: var(--gd-light); font-weight: 700; }

/* EMPTY STATE */
.empty-state {
  text-align: center; padding: 32px 16px;
}
.empty-ico {
  width: 48px; height: 48px; border-radius: 12px;
  background: var(--bg2); border: 1px solid var(--bd);
  display: grid; place-items: center; margin: 0 auto 12px; color: var(--t3);
}
.empty-state p { font-size: 0.875rem; color: var(--t3); }

/* DIVIDER */
.section-divider {
  height: 1px; background: var(--bd); margin: 18px 0;
}

/* DISABLED SECTION */
.disabled-notice {
  display: flex; align-items: center; gap: 10px;
  background: var(--bg2); border: 1px solid var(--bd2);
  border-radius: var(--r); padding: 12px 16px;
  font-size: 0.82rem; color: var(--t3);
}
.disabled-notice svg { color: var(--t4); flex-shrink: 0; }

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
@media (max-width: 1100px) { .page { padding: 28px 24px 60px; } .navbar { padding: 0 24px; } .site-footer { padding: 24px; } }
@media (max-width: 900px) { .grid { grid-template-columns: 1fr; } }
@media (max-width: 620px) { .navbar { padding: 0 16px; } .page { padding: 20px 16px 48px; } .site-footer { padding: 20px 16px; flex-direction: column; text-align: center; } }
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
		
		</nav>
</header>

<!-- PAGE -->
<div class="page">

  <!-- PAGE HEADER -->
  <div class="page-header">
    <div>
      <a href="/participant/hackathon/${hackathon.hackathonId}" class="back-link">
        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
          <line x1="19" y1="12" x2="5" y2="12"/>
          <polyline points="12 19 5 12 12 5"/>
        </svg>
        Back to Details
      </a>
      <h1 class="page-title">Manage Team</h1>
      <p class="page-sub">${hackathon.title}</p>
    </div>
    <div class="member-badge">
      <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/>
        <circle cx="9" cy="7" r="4"/>
        <path d="M23 21v-2a4 4 0 0 0-3-3.87M16 3.13a4 4 0 0 1 0 7.75"/>
      </svg>
      Members: ${teamSizeCount} / ${teamMaxSize}
    </div>
  </div>

  <!-- MESSAGES -->
  <c:if test="${success == 'memberInvited'}">
    <div class="msg success">
      <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/><polyline points="22 4 12 14.01 9 11.01"/></svg>
      Invitation sent to participant. They must accept to join.
    </div>
  </c:if>
  <c:if test="${success == 'externalInvited'}">
    <div class="msg success">
      <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/><polyline points="22 4 12 14.01 9 11.01"/></svg>
      External invite saved successfully.
    </div>
  </c:if>
  <c:if test="${success == 'memberRemoved'}">
    <div class="msg success">
      <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/><polyline points="22 4 12 14.01 9 11.01"/></svg>
      Member removed from team successfully.
    </div>
  </c:if>
  <c:if test="${success == 'teamCreated'}">
    <div class="msg success">
      <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/><polyline points="22 4 12 14.01 9 11.01"/></svg>
      Team created successfully. You are now team leader.
    </div>
  </c:if>
  <c:if test="${success == 'teamJoined'}">
    <div class="msg success">
      <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/><polyline points="22 4 12 14.01 9 11.01"/></svg>
      You joined the team successfully.
    </div>
  </c:if>
  <c:if test="${success == 'inviteAccepted'}">
    <div class="msg success">
      <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/><polyline points="22 4 12 14.01 9 11.01"/></svg>
      Invitation accepted. You are now part of that team.
    </div>
  </c:if>
  <c:if test="${success == 'inviteRejected'}">
    <div class="msg success">
      <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/><polyline points="22 4 12 14.01 9 11.01"/></svg>
      Invitation rejected.
    </div>
  </c:if>
  <c:if test="${error == 'teamFull'}">
    <div class="msg error">
      <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/></svg>
      Your team is full. You cannot add more members.
    </div>
  </c:if>
  <c:if test="${error == 'invalidUser'}">
    <div class="msg error">
      <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/></svg>
      Selected user is invalid for team invite.
    </div>
  </c:if>
  <c:if test="${error == 'alreadyInHackathon'}">
    <div class="msg error">
      <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/></svg>
      This participant is already part of a team in this hackathon.
    </div>
  </c:if>
  <c:if test="${error == 'invalidTeamName'}">
    <div class="msg error">
      <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/></svg>
      Please enter a valid team name.
    </div>
  </c:if>
  <c:if test="${error == 'invalidTeam'}">
    <div class="msg error">
      <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/></svg>
      Selected team is invalid for this hackathon.
    </div>
  </c:if>
  <c:if test="${error == 'invalidEmail'}">
    <div class="msg error">
      <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/></svg>
      Please enter a valid external email.
    </div>
  </c:if>
  <c:if test="${error == 'inviteExists'}">
    <div class="msg error">
      <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/></svg>
      Pending invite already exists for this email.
    </div>
  </c:if>
  <c:if test="${error == 'inviteNotFound' || error == 'inviteInvalid'}">
    <div class="msg error">
      <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/></svg>
      Invitation is invalid or no longer available.
    </div>
  </c:if>
  <c:if test="${error == 'submissionLocked'}">
    <div class="msg error">
      <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/></svg>
      Submission is locked until registration period ends.
    </div>
  </c:if>
  <c:if test="${error == 'inviteClosed'}">
    <div class="msg error">
      <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/></svg>
      Invitations are closed after registration end date.
    </div>
  </c:if>
  <c:if test="${error == 'notLeader'}">
    <div class="msg error">
      <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/></svg>
      Only team leader can remove participants.
    </div>
  </c:if>
  <c:if test="${error == 'cannotRemoveLeader'}">
    <div class="msg error">
      <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/></svg>
      Team leader cannot be removed from team.
    </div>
  </c:if>
  <c:if test="${error == 'memberNotFound'}">
    <div class="msg error">
      <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/></svg>
      Selected member was not found in this team.
    </div>
  </c:if>

  <!-- GRID -->
  <div class="grid">

    <!-- ======== NO TEAM STATE ======== -->
    <c:if test="${not hasTeam}">

      <!-- PENDING INVITE BANNER (full width) -->
      <c:if test="${not empty pendingInvite}">
        <div class="card grid-full">
          <div class="card-head">
            <span class="card-head-title">
              <svg width="10" height="10" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"><path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07A19.5 19.5 0 0 1 4.69 12 19.79 19.79 0 0 1 1.61 3.41 2 2 0 0 1 3.6 1.24h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L7.91 8.96a16 16 0 0 0 6 6l.92-.92a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 21.73 16.92z"/></svg>
              Pending Invitation
            </span>
            <span class="card-head-badge">Action Required</span>
          </div>
          <div class="card-body">
            <div class="invite-banner">
              <div class="invite-banner-text">
                <h4>You've been invited to join a team</h4>
                <p>Team: <span class="invite-team-name"><c:out value="${pendingInviteTeam != null ? pendingInviteTeam.teamName : 'a team'}"/></span></p>
              </div>
              <div class="btn-row" style="margin-top:0">
                <form action="/participant/hackathon/${hackathon.hackathonId}/team/invite/${pendingInvite.hackathonTeamInviteId}/accept" method="post">
                  <button type="submit" class="btn btn-primary" style="margin-top:0; background:var(--gd); box-shadow:0 2px 8px var(--gd-dim)">
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"/></svg>
                    Accept Invitation
                  </button>
                </form>
                <form action="/participant/hackathon/${hackathon.hackathonId}/team/invite/${pendingInvite.hackathonTeamInviteId}/reject" method="post">
                  <button type="submit" class="btn btn-danger" style="margin-top:0">
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><line x1="18" y1="6" x2="6" y2="18"/><line x1="6" y1="6" x2="18" y2="18"/></svg>
                    Reject
                  </button>
                </form>
              </div>
            </div>
          </div>
        </div>
      </c:if>

      <!-- CREATE TEAM -->
      <div class="card">
        <div class="card-head">
          <span class="card-head-title">
            <svg width="10" height="10" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
            Create Team
          </span>
        </div>
        <div class="card-body">
          <form action="/participant/hackathon/${hackathon.hackathonId}/team/create" method="post">
            <div class="form-group">
              <label class="form-label">Team Name</label>
              <input type="text" name="teamName" class="form-input" placeholder="Enter a creative team name..." required>
            </div>
            <button type="submit" class="btn btn-navy">
              <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
              Create Team
            </button>
          </form>
          <p class="form-hint" style="margin-top:12px">You can create only one team in this hackathon.</p>
        </div>
      </div>

      <!-- JOIN TEAM -->
      <div class="card">
        <div class="card-head">
          <span class="card-head-title">
            <svg width="10" height="10" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87M16 3.13a4 4 0 0 1 0 7.75"/></svg>
            Join Existing Team
          </span>
        </div>
        <div class="card-body">
          <c:choose>
            <c:when test="${empty availableTeams}">
              <div class="empty-state">
                <div class="empty-ico">
                  <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87M16 3.13a4 4 0 0 1 0 7.75"/></svg>
                </div>
                <p>No open teams available to join right now.</p>
              </div>
            </c:when>
            <c:otherwise>
              <form action="/participant/hackathon/${hackathon.hackathonId}/team/join-existing" method="post">
                <div class="form-group">
                  <label class="form-label">Select Team</label>
                  <select name="joinTeamId" class="form-select" required>
                    <option value="">Choose a team to join...</option>
                    <c:forEach items="${availableTeams}" var="t">
                      <option value="${t.hackathonTeamId}">${t.teamName}</option>
                    </c:forEach>
                  </select>
                </div>
                <button type="submit" class="btn btn-primary">
                  <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M15 3h4a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-4"/><polyline points="10 17 15 12 10 7"/><line x1="15" y1="12" x2="3" y2="12"/></svg>
                  Join Team
                </button>
              </form>
            </c:otherwise>
          </c:choose>
          <p class="form-hint" style="margin-top:12px">After joining one team, you cannot create another team in this hackathon.</p>
        </div>
      </div>

    </c:if>
    <!-- END NO TEAM STATE -->

    <!-- ======== HAS TEAM STATE ======== -->
    <c:if test="${hasTeam}">

      <!-- TEAM MEMBERS TABLE -->
      <div class="card">
        <div class="card-head">
          <span class="card-head-title">
            <svg width="10" height="10" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87M16 3.13a4 4 0 0 1 0 7.75"/></svg>
            Team Members
          </span>
          <span class="card-head-badge">${teamSizeCount} / ${teamMaxSize}</span>
        </div>
        <div class="card-body">
          <table class="table">
            <thead>
              <tr>
                <th>#</th>
                <th>Name</th>
                <th>Email</th>
                <th>Role</th>
                <th>Action</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach items="${teamMembers}" var="m" varStatus="i">
                <tr>
                  <td style="color:var(--t3); font-size:0.8rem">${i.count}</td>
                  <td style="font-weight:500">${memberMap[m.memberId].firstName} ${memberMap[m.memberId].lastName}</td>
                  <td style="color:var(--t2)">${memberMap[m.memberId].email}</td>
                  <td>
                    <c:choose>
                      <c:when test="${m.memberId == team.teamLeaderId}">
                        <span class="role-chip role-leader">
                          <svg width="9" height="9" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" style="margin-right:4px"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/></svg>
                          Leader
                        </span>
                      </c:when>
                      <c:otherwise>
                        <span class="role-chip role-member">${m.roleTitle}</span>
                      </c:otherwise>
                    </c:choose>
                  </td>
                  <td>
                    <c:choose>
                      <c:when test="${isTeamLeader and m.memberId != team.teamLeaderId}">
                        <form action="/participant/hackathon/${hackathon.hackathonId}/team/remove-member" method="post">
                          <input type="hidden" name="memberId" value="${m.memberId}">
                          <button type="submit" class="btn btn-sm" style="background:var(--rs-dim); color:var(--rs); border:1px solid rgba(168,88,88,0.3);"
                            onclick="return confirm('Remove this member from your team?')">
                            Remove
                          </button>
                        </form>
                      </c:when>
                      <c:otherwise>
                        <span style="color:var(--t4); font-size:0.82rem">—</span>
                      </c:otherwise>
                    </c:choose>
                  </td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </div>

      <!-- RIGHT COLUMN: invite cards stacked -->
      <div style="display:flex; flex-direction:column; gap:20px;">

        <!-- INVITE REGISTERED PARTICIPANT -->
        <c:if test="${isTeamLeader and inviteAllowed}">
          <div class="card">
            <div class="card-head">
              <span class="card-head-title">
                <svg width="10" height="10" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="17 8 12 3 7 8"/><line x1="12" y1="3" x2="12" y2="15"/></svg>
                Invite Participant
              </span>
            </div>
            <div class="card-body">
              <form action="/participant/hackathon/${hackathon.hackathonId}/team/invite-member" method="post">
                <div class="form-group">
                  <label class="form-label">Select Participant</label>
                  <select name="invitedUserId" class="form-select" required>
                    <option value="">Choose participant...</option>
                    <c:forEach items="${participantUsers}" var="u">
                      <option value="${u.userId}">${u.firstName} ${u.lastName} — ${u.email}</option>
                    </c:forEach>
                  </select>
                </div>
                <button type="submit" class="btn btn-primary">
                  <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><line x1="22" y1="2" x2="11" y2="13"/><polygon points="22 2 15 22 11 13 2 9 22 2"/></svg>
                  Send Invite
                </button>
              </form>
              <p class="form-hint" style="margin-top:12px">Invite goes to pending state until participant accepts it.</p>
            </div>
          </div>
        </c:if>

        <!-- INVITE EXTERNAL USER -->
        <c:if test="${isTeamLeader and inviteAllowed}">
          <div class="card">
            <div class="card-head">
              <span class="card-head-title">
                <svg width="10" height="10" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"/><polyline points="22,6 12,13 2,6"/></svg>
                Invite External User
              </span>
            </div>
            <div class="card-body">
              <form action="/participant/hackathon/${hackathon.hackathonId}/team/invite-external" method="post">
                <div class="form-group">
                  <label class="form-label">External Email</label>
                  <input type="email" name="externalEmail" class="form-input" placeholder="name@example.com" required>
                </div>
                <div class="form-group">
                  <label class="form-label">Role Title</label>
                  <input type="text" name="roleTitle" class="form-input" placeholder="e.g. MEMBER">
                </div>
                <button type="submit" class="btn btn-primary">
                  <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><line x1="22" y1="2" x2="11" y2="13"/><polygon points="22 2 15 22 11 13 2 9 22 2"/></svg>
                  Send External Invite
                </button>
              </form>
              <p class="form-hint" style="margin-top:12px">External invite is stored as pending until accepted manually.</p>
            </div>
          </div>
        </c:if>

        <!-- INVITES DISABLED — registration ended -->
        <c:if test="${isTeamLeader and not inviteAllowed}">
          <div class="card">
            <div class="card-head">
              <span class="card-head-title">
                <svg width="10" height="10" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/></svg>
                Invite Members
              </span>
            </div>
            <div class="card-body">
              <div class="disabled-notice">
                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/></svg>
                Invitations are disabled because registration has ended.
              </div>
            </div>
          </div>
        </c:if>

        <!-- NOT LEADER -->
        <c:if test="${not isTeamLeader}">
          <div class="card">
            <div class="card-head">
              <span class="card-head-title">
                <svg width="10" height="10" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="17 8 12 3 7 8"/><line x1="12" y1="3" x2="12" y2="15"/></svg>
                Invite Members
              </span>
            </div>
            <div class="card-body">
              <div class="disabled-notice">
                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/></svg>
                Only the team leader can send invitations.
              </div>
            </div>
          </div>
        </c:if>

      </div><!-- end right col -->

      <!-- INVITE ACTIVITY (full width) -->
      <div class="card grid-full">
        <div class="card-head">
          <span class="card-head-title">
            <svg width="10" height="10" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 20h9"/><path d="M16.5 3.5a2.121 2.121 0 0 1 3 3L7 19l-4 1 1-4L16.5 3.5z"/></svg>
            Invite Activity
          </span>
        </div>
        <div class="card-body">
          <table class="table">
            <thead>
              <tr>
                <th>Type</th>
                <th>Invitee</th>
                <th>Status</th>
                <th>Sent On</th>
              </tr>
            </thead>
            <tbody>
              <c:if test="${empty inviteList}">
                <tr>
                  <td colspan="4">
                    <div class="empty-state" style="padding:24px 0">
                      <div class="empty-ico">
                        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"/><polyline points="22,6 12,13 2,6"/></svg>
                      </div>
                      <p>No invites sent yet.</p>
                    </div>
                  </td>
                </tr>
              </c:if>
              <c:forEach items="${inviteList}" var="i">
                <tr>
                  <td><span class="type-chip">${i.inviteType}</span></td>
                  <td style="color:var(--t2)">
                    <c:choose>
                      <c:when test="${not empty i.invitedEmail}">${i.invitedEmail}</c:when>
                      <c:otherwise>User #${i.invitedUserId}</c:otherwise>
                    </c:choose>
                  </td>
                  <td>
                    <c:choose>
                      <c:when test="${i.inviteStatus == 'PENDING'}"><span class="status-chip status-pending">${i.inviteStatus}</span></c:when>
                      <c:when test="${i.inviteStatus == 'ACCEPTED'}"><span class="status-chip status-accepted">${i.inviteStatus}</span></c:when>
                      <c:otherwise><span class="status-chip status-rejected">${i.inviteStatus}</span></c:otherwise>
                    </c:choose>
                  </td>
                  <td style="color:var(--t3); font-size:0.82rem">${i.createdAt}</td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </div>

    </c:if>
    <!-- END HAS TEAM STATE -->

  </div><!-- end grid -->
</div><!-- end page -->

<!-- FOOTER -->
<footer class="site-footer">
  <div class="f-brand">Code<span>Verse</span> &mdash; Your Gateway to Innovation</div>
  <div class="f-copy">&copy; 2026 CodeVerse. All rights reserved.</div>
</footer>

</body>
</html>
