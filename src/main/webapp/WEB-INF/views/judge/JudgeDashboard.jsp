<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Judge Dashboard | CodeVerse</title>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
<style>
:root {
  --bg: #f4f2ee; --bg1: #ffffff; --bg2: #eeecea; --bg3: #e5e2de;
  --nv: #0e1f3d; --nv2: #1a3260; --nv-dim: rgba(14,31,61,0.07); --nv-glow: rgba(14,31,61,0.18);
  --tl: #2e6b72; --tl-light: #3d8f98; --tl-dim: rgba(46,107,114,0.1); --tl-glow: rgba(46,107,114,0.2);
  --gd: #c9a84c; --gd-light: #e0be73; --gd-dim: rgba(201,168,76,0.12);
  --rs: #a85858; --rs-dim: rgba(168,88,88,0.1);
  --t1: #1a1f2e; --t2: #4b5b6e; --t3: #8c97a4; --t4: #b8c0ca;
  --bd: rgba(14,31,61,0.08); --bd2: rgba(14,31,61,0.13);
  --ff: 'Inter', sans-serif; --ease: cubic-bezier(0.16,1,0.3,1);
  --r: 10px; --r2: 14px; --r3: 18px;
  --sh-sm: 0 1px 3px rgba(14,31,61,0.06),0 1px 2px rgba(14,31,61,0.04);
  --sh-md: 0 4px 16px rgba(14,31,61,0.08),0 1px 4px rgba(14,31,61,0.04);
  --sh-lg: 0 12px 36px rgba(14,31,61,0.11),0 2px 8px rgba(14,31,61,0.06);
  --sidebar-w: 240px;
}
*,*::before,*::after { box-sizing: border-box; margin: 0; padding: 0; }
html { scroll-behavior: smooth; }
body { font-family: var(--ff); background: var(--bg); color: var(--t1); min-height: 100vh; -webkit-font-smoothing: antialiased; display: flex; flex-direction: column; }
a { text-decoration: none; color: inherit; }
button { font-family: var(--ff); cursor: pointer; border: none; background: none; }

.bg-layer { position: fixed; inset: 0; z-index: 0; pointer-events: none; overflow: hidden; }
.bg-blot  { position: absolute; border-radius: 50%; filter: blur(120px); }
.bb1 { width: 550px; height: 450px; opacity: 0.045; background: radial-gradient(circle,var(--tl) 0%,transparent 70%); top: -150px; right: -60px; }
.bb2 { width: 450px; height: 380px; opacity: 0.035; background: radial-gradient(circle,var(--nv) 0%,transparent 70%); bottom: 0; left: -80px; }

/* ── NAVBAR ── */
.navbar {
  position: fixed; top: 0; left: 0; right: 0; z-index: 600; height: 60px;
  display: flex; align-items: center; justify-content: space-between; padding: 0 28px 0 0;
  background: rgba(244,242,238,0.95); backdrop-filter: blur(20px) saturate(180%);
  border-bottom: 1px solid var(--bd); box-shadow: 0 1px 0 var(--bd);
}
.navbar-left { display: flex; align-items: center; }
.sidebar-toggle { width: 60px; height: 60px; display: grid; place-items: center; color: var(--t3); cursor: pointer; transition: color 0.18s; }
.sidebar-toggle:hover { color: var(--nv); }
.brand { display: flex; align-items: center; gap: 10px; padding-left: 4px; }
.brand-mark { width: 30px; height: 30px; border-radius: 7px; background: var(--nv); display: grid; place-items: center; color: var(--gd-light); }
.brand-name { font-size: 1.05rem; font-weight: 700; color: var(--nv); letter-spacing: -0.3px; }
.brand-name span { color: var(--tl); }
.judge-pill { margin-left: 10px; font-size: 0.58rem; font-weight: 600; letter-spacing: 2px; text-transform: uppercase; color: var(--tl); background: var(--tl-dim); border: 1px solid rgba(46,107,114,0.25); padding: 3px 10px; border-radius: 100px; }
.navbar-right { display: flex; align-items: center; gap: 12px; }
.nav-welcome { font-size: 0.82rem; color: var(--t2); font-weight: 500; }
.nav-welcome strong { color: var(--nv); }
.nav-avatar { width: 32px; height: 32px; border-radius: 50%; background: var(--tl); color: #fff; display: grid; place-items: center; font-size: 0.72rem; font-weight: 700; border: 2px solid var(--bd2); flex-shrink: 0; }

/* ── LAYOUT ── */
.app-body { display: flex; padding-top: 60px; min-height: 100vh; position: relative; z-index: 1; }

/* ── SIDEBAR — same colour as header (light/transparent style) ── */
.sidebar {
  position: fixed; top: 60px; left: 0; bottom: 0; width: var(--sidebar-w);
  background: rgba(244,242,238,0.98); backdrop-filter: blur(20px) saturate(180%);
  display: flex; flex-direction: column;
  overflow-y: auto; overflow-x: hidden; transition: transform 0.3s var(--ease); z-index: 500;
  border-right: 1px solid var(--bd);
}
.sidebar::-webkit-scrollbar { width: 4px; }
.sidebar::-webkit-scrollbar-thumb { background: rgba(14,31,61,0.15); border-radius: 4px; }
.sb-section { padding: 20px 0 8px; }
.sb-label { font-size: 0.55rem; font-weight: 600; letter-spacing: 2.5px; text-transform: uppercase; color: var(--t3); padding: 0 20px; margin-bottom: 6px; display: block; }
.sb-item { display: flex; align-items: center; gap: 10px; padding: 10px 20px; font-size: 0.84rem; font-weight: 500; color: var(--t2); transition: all 0.18s; border-left: 3px solid transparent; text-decoration: none; }
.sb-item svg { flex-shrink: 0; opacity: 0.7; stroke: var(--t2); }
.sb-item:hover { color: var(--nv); background: rgba(14,31,61,0.05); border-left-color: var(--tl); }
.sb-item:hover svg { opacity: 1; stroke: var(--nv); }
.sb-item.active { color: var(--tl); background: rgba(46,107,114,0.08); border-left-color: var(--tl); }
.sb-item.active svg { opacity: 1; stroke: var(--tl); }
.sb-item.danger { color: var(--rs); }
.sb-item.danger:hover { color: var(--rs); background: rgba(168,88,88,0.05); border-left-color: var(--rs); }
.sb-item.danger svg { stroke: var(--rs); }
.sb-div { height: 1px; background: var(--bd); margin: 8px 20px; }

/* ── MAIN ── */
.main { margin-left: var(--sidebar-w); flex: 1; padding: 36px 40px 80px; min-width: 0; }

/* ── PAGE HEADER ── */
.page-header { margin-bottom: 32px; }
.welcome-row { display: flex; align-items: flex-start; justify-content: space-between; gap: 16px; flex-wrap: wrap; }
.welcome-text h1 { font-size: 1.75rem; font-weight: 700; color: var(--nv); letter-spacing: -0.5px; }
.welcome-text p { font-size: 0.9rem; color: var(--t2); margin-top: 5px; }
.welcome-badge { display: inline-flex; align-items: center; gap: 8px; background: var(--nv); color: var(--gd-light); font-size: 0.75rem; font-weight: 600; padding: 8px 18px; border-radius: 100px; box-shadow: var(--sh-sm); white-space: nowrap; margin-top: 4px; }

/* ── STATS ── */
.stats-grid { display: grid; grid-template-columns: repeat(4,1fr); gap: 16px; margin-bottom: 28px; }
.stat-card { background: var(--bg1); border: 1px solid var(--bd); border-radius: var(--r2); padding: 20px; box-shadow: var(--sh-sm); display: flex; align-items: center; gap: 14px; animation: rise 0.5s var(--ease) both; transition: box-shadow 0.2s,transform 0.2s; }
.stat-card:hover { box-shadow: var(--sh-md); transform: translateY(-2px); }
.stat-card:nth-child(1){animation-delay:.04s} .stat-card:nth-child(2){animation-delay:.08s}
.stat-card:nth-child(3){animation-delay:.12s} .stat-card:nth-child(4){animation-delay:.16s}
.stat-ico { width: 44px; height: 44px; border-radius: 10px; display: grid; place-items: center; flex-shrink: 0; }
.ico-nv { background: var(--nv-dim); color: var(--nv); border: 1px solid rgba(14,31,61,0.12); }
.ico-tl { background: var(--tl-dim); color: var(--tl); border: 1px solid rgba(46,107,114,0.18); }
.ico-gd { background: var(--gd-dim); color: var(--gd); border: 1px solid rgba(201,168,76,0.2); }
.ico-rs { background: var(--rs-dim); color: var(--rs); border: 1px solid rgba(168,88,88,0.2); }
.stat-info { min-width: 0; }
.stat-val { font-size: 1.9rem; font-weight: 700; color: var(--nv); letter-spacing: -1.5px; line-height: 1; }
.stat-lbl { font-size: 0.7rem; font-weight: 500; color: var(--t3); margin-top: 4px; letter-spacing: 0.3px; }

/* ── WORKSPACE BANNER ── */
.workspace-banner { background: linear-gradient(135deg,var(--nv) 0%,var(--nv2) 100%); border-radius: var(--r2); padding: 22px 28px; display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap; gap: 16px; margin-bottom: 28px; box-shadow: var(--sh-md); animation: rise 0.5s 0.2s var(--ease) both; }
.workspace-text h3 { font-size: 1.05rem; font-weight: 600; color: #fff; margin-bottom: 4px; }
.workspace-text p { font-size: 0.84rem; color: rgba(255,255,255,0.6); }
.workspace-text .pending-count { color: var(--gd-light); font-weight: 700; }
.btn-workspace { display: inline-flex; align-items: center; gap: 8px; background: var(--tl); color: #fff; font-family: var(--ff); font-size: 0.875rem; font-weight: 600; padding: 10px 22px; border-radius: var(--r); border: none; cursor: pointer; box-shadow: 0 2px 8px var(--tl-glow); transition: all 0.2s var(--ease); white-space: nowrap; }
.btn-workspace:hover { background: var(--tl-light); transform: translateY(-1px); color: #fff; }

/* ── TWO COL ── */
.two-col { display: grid; grid-template-columns: 1fr 1fr; gap: 20px; margin-bottom: 28px; }

/* ── SEC CARD ── */
.sec-card { background: var(--bg1); border: 1px solid var(--bd); border-radius: var(--r3); overflow: hidden; box-shadow: var(--sh-sm); animation: rise 0.5s var(--ease) both; }
.sec-card:nth-child(1){animation-delay:.1s} .sec-card:nth-child(2){animation-delay:.15s}
.sec-card-head { padding: 14px 20px; background: var(--nv); display: flex; align-items: center; justify-content: space-between; }
.sec-card-title { font-size: 0.6rem; font-weight: 500; letter-spacing: 2.5px; text-transform: uppercase; color: rgba(255,255,255,0.55); display: flex; align-items: center; gap: 7px; }
.sec-card-title svg { color: rgba(255,255,255,0.35); }
.sec-card-badge { font-size: 0.58rem; font-weight: 600; color: var(--nv); background: var(--gd-light); padding: 2px 9px; border-radius: 100px; }

/* ── HK LIST ── */
.hk-list { display: flex; flex-direction: column; }
.hk-item { display: flex; align-items: center; justify-content: space-between; gap: 12px; padding: 14px 20px; border-bottom: 1px solid var(--bd); transition: background 0.15s; }
.hk-item:last-child { border-bottom: none; }
.hk-item:hover { background: var(--nv-dim); }
.hk-info { flex: 1; min-width: 0; }
.hk-title { font-size: 0.9rem; font-weight: 600; color: var(--nv); margin-bottom: 4px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; }
.hk-meta { display: flex; flex-wrap: wrap; gap: 6px; align-items: center; }
.hk-chip { display: inline-flex; align-items: center; font-size: 0.62rem; font-weight: 500; padding: 2px 8px; border-radius: 5px; }
.chip-mode { background: var(--tl-dim); color: var(--tl); border: 1px solid rgba(46,107,114,0.18); }
.chip-pay  { background: var(--nv-dim); color: var(--nv); border: 1px solid rgba(14,31,61,0.12); }
.hk-dates { font-size: 0.72rem; color: var(--t3); margin-top: 3px; }
.btn-view { display: inline-flex; align-items: center; gap: 5px; background: transparent; border: 1px solid var(--bd2); color: var(--t2); font-size: 0.75rem; font-weight: 600; padding: 5px 12px; border-radius: 7px; transition: all 0.18s; white-space: nowrap; flex-shrink: 0; }
.btn-view:hover { background: var(--nv); color: #fff; border-color: var(--nv); }

/* ── FULL CARD (table) ── */
.full-card { background: var(--bg1); border: 1px solid var(--bd); border-radius: var(--r3); overflow: hidden; box-shadow: var(--sh-sm); margin-bottom: 24px; animation: rise 0.5s var(--ease) both; }
.full-card:nth-of-type(1){animation-delay:.2s} .full-card:nth-of-type(2){animation-delay:.25s}
.full-card-head { padding: 14px 20px; background: var(--nv); display: flex; align-items: center; justify-content: space-between; }
.full-card-title { font-size: 0.6rem; font-weight: 500; letter-spacing: 2.5px; text-transform: uppercase; color: rgba(255,255,255,0.55); display: flex; align-items: center; gap: 7px; }
.full-card-title svg { color: rgba(255,255,255,0.35); }
.full-card-badge { font-size: 0.58rem; font-weight: 600; color: var(--nv); background: var(--gd-light); padding: 2px 9px; border-radius: 100px; }
.full-card-badge.rs { background: #f5b8b8; color: #7a1f1f; }

/* ── TABLE ── */
.table-wrap { overflow-x: auto; }
table { width: 100%; border-collapse: collapse; }
thead tr { border-bottom: 1px solid var(--bd2); }
thead th { font-size: 0.6rem; font-weight: 600; letter-spacing: 2px; text-transform: uppercase; color: var(--t3); padding: 13px 18px; text-align: left; white-space: nowrap; }
tbody td { font-size: 0.875rem; color: var(--t1); padding: 13px 18px; border-bottom: 1px solid var(--bd); vertical-align: middle; }
tbody tr:last-child td { border-bottom: none; }
tbody tr { transition: background 0.15s; }
tbody tr:hover { background: var(--nv-dim); }
.idx { font-size: 0.8rem; color: var(--t3); font-weight: 500; }
.status-chip { display: inline-flex; align-items: center; gap: 5px; font-size: 0.62rem; font-weight: 600; letter-spacing: 0.5px; text-transform: uppercase; padding: 3px 10px; border-radius: 100px; }
.st-pending  { background: var(--gd-dim); color: #8a6a1c; border: 1px solid rgba(201,168,76,0.3); }
.st-reviewed { background: var(--tl-dim); color: var(--tl); border: 1px solid rgba(46,107,114,0.22); }
.s-dot { width: 5px; height: 5px; border-radius: 50%; flex-shrink: 0; background: currentColor; }
.btn-review, .btn-update { display: inline-flex; align-items: center; gap: 5px; font-size: 0.75rem; font-weight: 600; padding: 5px 12px; border-radius: 7px; transition: all 0.18s; }
.btn-review { background: var(--tl-dim); color: var(--tl); border: 1px solid rgba(46,107,114,0.22); }
.btn-review:hover { background: var(--tl); color: #fff; border-color: var(--tl); }
.btn-update { background: var(--nv-dim); color: var(--nv); border: 1px solid rgba(14,31,61,0.15); }
.btn-update:hover { background: var(--nv); color: #fff; border-color: var(--nv); }

/* ── EMPTY ── */
.empty-state { text-align: center; padding: 40px 20px; }
.empty-ico { width: 48px; height: 48px; border-radius: 12px; background: var(--bg2); border: 1px solid var(--bd); display: grid; place-items: center; margin: 0 auto 14px; color: var(--t3); }
.empty-state p { font-size: 0.84rem; color: var(--t3); }

/* ── FOOTER ── */
.site-footer { background: var(--nv); padding: 20px 40px; display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap; gap: 12px; margin-left: var(--sidebar-w); position: relative; z-index: 1; }
.f-brand { font-size: 0.88rem; font-weight: 600; color: rgba(255,255,255,0.55); }
.f-brand span { color: var(--gd-light); }
.f-copy { font-size: 0.6rem; color: rgba(255,255,255,0.25); letter-spacing: 0.5px; }

@keyframes rise { from { opacity:0; transform:translateY(16px); } to { opacity:1; transform:translateY(0); } }

@media (max-width:1100px) { .stats-grid { grid-template-columns: repeat(2,1fr); } }
@media (max-width:900px)  {
  .sidebar { transform: translateX(-100%); }
  .sidebar.open { transform: translateX(0); }
  .main { margin-left: 0; padding: 24px 20px 60px; }
  .site-footer { margin-left: 0; }
  .two-col { grid-template-columns: 1fr; }
}
@media (max-width:600px)  {
  .stats-grid { grid-template-columns: repeat(2,1fr); gap: 12px; }
  .main { padding: 20px 16px 48px; }
  .nav-welcome { display: none; }
}
</style>
</head>
<body>

<div class="bg-layer">
  <div class="bg-blot bb1"></div>
  <div class="bg-blot bb2"></div>
</div>

<!-- NAVBAR -->
<header class="navbar">
  <div class="navbar-left">
    <button class="sidebar-toggle" onclick="toggleSidebar()" aria-label="Toggle sidebar">
      <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <line x1="3" y1="6" x2="21" y2="6"/><line x1="3" y1="12" x2="21" y2="12"/><line x1="3" y1="18" x2="21" y2="18"/>
      </svg>
    </button>
    <a href="/judge-dashboard" class="brand">
      <div class="brand-mark">
        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
          <polyline points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"/>
        </svg>
      </div>
      <span class="brand-name">Code<span>Verse</span></span>
      <span class="judge-pill">Judge</span>
    </a>
  </div>
  <div class="navbar-right">
    <span class="nav-welcome">Welcome, <strong>${sessionScope.user.firstName} ${sessionScope.user.lastName}</strong></span>
    <div class="nav-avatar">${sessionScope.user.firstName.substring(0,1)}${sessionScope.user.lastName.substring(0,1)}</div>
  </div>
</header>

<!-- APP BODY -->
<div class="app-body">

  <!-- SIDEBAR -->
  <aside class="sidebar" id="sidebar">

    <div class="sb-section">
      <span class="sb-label">Overview</span>
      <a href="/judge-dashboard" class="sb-item active">
        <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
          <rect x="3" y="3" width="7" height="7"/><rect x="14" y="3" width="7" height="7"/>
          <rect x="14" y="14" width="7" height="7"/><rect x="3" y="14" width="7" height="7"/>
        </svg>
        Dashboard
      </a>
    </div>

    <div class="sb-div"></div>

    <div class="sb-section">
      <span class="sb-label">Work</span>
      <a href="/judge/submissions" class="sb-item">
        <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
          <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/>
          <polyline points="14 2 14 8 20 8"/>
          <line x1="16" y1="13" x2="8" y2="13"/>
          <line x1="16" y1="17" x2="8" y2="17"/>
        </svg>
        Review Submissions
      </a>
    </div>

    <div class="sb-div"></div>

    <div class="sb-section">
      <span class="sb-label">Account</span>
      <a href="/judge/profile" class="sb-item">
        <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
          <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/>
          <circle cx="12" cy="7" r="4"/>
        </svg>
        My Profile
      </a>
      <a href="/judge/change-password" class="sb-item">
        <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
          <rect x="3" y="11" width="18" height="11" rx="2" ry="2"/>
          <path d="M7 11V7a5 5 0 0 1 10 0v4"/>
        </svg>
        Change Password
      </a>
      <a href="/logout" class="sb-item danger">
        <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
          <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"/>
          <polyline points="16 17 21 12 16 7"/>
          <line x1="21" y1="12" x2="9" y2="12"/>
        </svg>
        Logout
      </a>
    </div>

  </aside>

  <!-- MAIN -->
  <main class="main">

    <!-- WELCOME -->
    <div class="page-header">
      <div class="welcome-row">
        <div class="welcome-text">
          <h1>Welcome back, ${sessionScope.user.firstName}!</h1>
          <p>Here's your judging workspace for today.</p>
        </div>
        <div class="welcome-badge">
          <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/>
          </svg>
          Judge
        </div>
      </div>
    </div>

    <!-- STATS -->
    <div class="stats-grid">
      <div class="stat-card">
        <div class="stat-ico ico-nv">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"/></svg>
        </div>
        <div class="stat-info"><div class="stat-val">${totalHackathon}</div><div class="stat-lbl">Total Hackathons</div></div>
      </div>
      <div class="stat-card">
        <div class="stat-ico ico-gd">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/></svg>
        </div>
        <div class="stat-info"><div class="stat-val">${upcomingHackathon}</div><div class="stat-lbl">Upcoming</div></div>
      </div>
      <div class="stat-card">
        <div class="stat-ico ico-tl">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><line x1="2" y1="12" x2="22" y2="12"/><path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"/></svg>
        </div>
        <div class="stat-info"><div class="stat-val">${ongoingHackathon}</div><div class="stat-lbl">Ongoing</div></div>
      </div>
      <div class="stat-card">
        <div class="stat-ico ico-rs">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/><line x1="16" y1="13" x2="8" y2="13"/></svg>
        </div>
        <div class="stat-info"><div class="stat-val">${pendingReviewSubmission}</div><div class="stat-lbl">Pending Reviews</div></div>
      </div>
    </div>

    <!-- WORKSPACE BANNER -->
    <div class="workspace-banner">
      <div class="workspace-text">
        <h3>Judge Workspace</h3>
        <p>You have <span class="pending-count">${pendingReviewSubmission} pending submission<c:if test="${pendingReviewSubmission != 1}">s</c:if></span> waiting for your review.</p>
      </div>
      <a href="/judge/submissions" class="btn-workspace">
        <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/><line x1="16" y1="13" x2="8" y2="13"/><line x1="16" y1="17" x2="8" y2="17"/></svg>
        Go to Submission Review
      </a>
    </div>

    <!-- TWO COL -->
    <div class="two-col">

      <!-- ONGOING HACKATHONS -->
      <div class="sec-card">
        <div class="sec-card-head">
          <span class="sec-card-title">
            <svg width="10" height="10" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"><polyline points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"/></svg>
            Ongoing Hackathons
          </span>
          <span class="sec-card-badge">${ongoingHackathon}</span>
        </div>
        <div class="hk-list">
          <c:choose>
            <c:when test="${empty ongoingHackathonList}">
              <div class="empty-state">
                <div class="empty-ico"><svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"/></svg></div>
                <p>No ongoing hackathons.</p>
              </div>
            </c:when>
            <c:otherwise>
              <c:forEach items="${ongoingHackathonList}" var="h">
                <div class="hk-item">
                  <div class="hk-info">
                    <div class="hk-title">${h.title}</div>
                    <div class="hk-meta">
                      <span class="hk-chip chip-mode">${h.eventType}</span>
                      <span class="hk-chip chip-pay">${h.payment}</span>
                    </div>
                    <div class="hk-dates">${h.registrationStartDate} &rarr; ${h.registrationEndDate}</div>
                  </div>
                  <a href="/judge/viewHackathon?hackathonId=${h.hackathonId}" class="btn-view">
                    <svg width="11" height="11" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/></svg>
                    View
                  </a>
                </div>
              </c:forEach>
            </c:otherwise>
          </c:choose>
        </div>
      </div>

      <!-- QUICK LINKS -->
      <div class="sec-card">
        <div class="sec-card-head">
          <span class="sec-card-title">
            <svg width="10" height="10" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"><path d="M10 13a5 5 0 0 0 7.54.54l3-3a5 5 0 0 0-7.07-7.07l-1.72 1.71"/><path d="M14 11a5 5 0 0 0-7.54-.54l-3 3a5 5 0 0 0 7.07 7.07l1.71-1.71"/></svg>
            Quick Links
          </span>
        </div>
        <div class="hk-list">
          <a href="/judge/submissions" class="hk-item">
            <div class="hk-info"><div class="hk-title">Review Submissions</div><div class="hk-dates">View and score all pending submissions</div></div>
            <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" style="color:var(--t4);flex-shrink:0"><line x1="5" y1="12" x2="19" y2="12"/><polyline points="12 5 19 12 12 19"/></svg>
          </a>
          <a href="/judge/profile" class="hk-item">
            <div class="hk-info"><div class="hk-title">My Profile</div><div class="hk-dates">Update your personal information</div></div>
            <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" style="color:var(--t4);flex-shrink:0"><line x1="5" y1="12" x2="19" y2="12"/><polyline points="12 5 19 12 12 19"/></svg>
          </a>
          <a href="/judge/change-password" class="hk-item">
            <div class="hk-info"><div class="hk-title">Change Password</div><div class="hk-dates">Update your account credentials</div></div>
            <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" style="color:var(--t4);flex-shrink:0"><line x1="5" y1="12" x2="19" y2="12"/><polyline points="12 5 19 12 12 19"/></svg>
          </a>
          <a href="/logout" class="hk-item">
            <div class="hk-info"><div class="hk-title" style="color:var(--rs)">Logout</div><div class="hk-dates">Sign out of your judge account</div></div>
            <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" style="color:var(--t4);flex-shrink:0"><line x1="5" y1="12" x2="19" y2="12"/><polyline points="12 5 19 12 12 19"/></svg>
          </a>
        </div>
      </div>

    </div>

    <!-- PENDING SUBMISSIONS TABLE -->
    <div class="full-card">
      <div class="full-card-head">
        <span class="full-card-title">
          <svg width="10" height="10" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/></svg>
          Pending Submissions
        </span>
        <span class="full-card-badge rs">${pendingReviewSubmission} pending</span>
      </div>
      <div class="table-wrap">
          <table>
          <thead>
              <tr>
              <th>#</th><th>Hackathon</th><th>Team</th><th>Submitted On</th><th>Status</th><th>Action</th>
              </tr>
          </thead>
          <tbody>
            <c:if test="${empty pendingSubmissionList}">
               <tr><td colspan="6"><div class="empty-state"><div class="empty-ico"><svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/><polyline points="22 4 12 14.01 9 11.01"/></svg></div><p>No pending submissions &mdash; you're all caught up!</p></div></tr>
            </c:if>
            <c:forEach items="${pendingSubmissionList}" var="s" varStatus="i">
               <tr>
                <td><span class="idx">${i.count}</span></td>
                <td style="font-weight:500">${submissionHackathonMap[s.hackathonId].title}</td>
                <td style="color:var(--t2)">${submissionTeamMap[s.teamId].teamName}</td>
                <td style="color:var(--t3);font-size:0.82rem">${s.submitedDate}</td>
                <td><span class="status-chip st-pending"><span class="s-dot"></span>Pending</span></td>
                <td>
                  <a href="/judge/submissions/review?submissionId=${s.hackathonSubmissionId}" class="btn-review">
                    <svg width="11" height="11" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"/><path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"/></svg>
                    Review
                  </a>
                </td>
               </tr>
            </c:forEach>
          </tbody>
         </table>
      </div>
    </div>

    <!-- REVIEWED SUBMISSIONS TABLE -->
    <div class="full-card">
      <div class="full-card-head">
        <span class="full-card-title">
          <svg width="10" height="10" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/><polyline points="22 4 12 14.01 9 11.01"/></svg>
          Reviewed Submissions
        </span>
        <span class="full-card-badge">${reviewedSubmissionList.size()} reviewed</span>
      </div>
      <div class="table-wrap">
         <table>
          <thead>
              <tr>
              <th>#</th><th>Hackathon</th><th>Team</th><th>Submitted On</th><th>Status</th><th>Action</th>
              </tr>
          </thead>
          <tbody>
            <c:if test="${empty reviewedSubmissionList}">
               <tr><td colspan="6"><div class="empty-state"><div class="empty-ico"><svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/></svg></div><p>No reviewed submissions yet.</p></div></tr>
            </c:if>
            <c:forEach items="${reviewedSubmissionList}" var="s" varStatus="i">
               <tr>
                <td><span class="idx">${i.count}</span></td>
                <td style="font-weight:500">${submissionHackathonMap[s.hackathonId].title}</td>
                <td style="color:var(--t2)">${submissionTeamMap[s.teamId].teamName}</td>
                <td style="color:var(--t3);font-size:0.82rem">${s.submitedDate}</td>
                <td><span class="status-chip st-reviewed"><span class="s-dot"></span>Reviewed</span></td>
                <td>
                  <a href="/judge/submissions/review?submissionId=${s.hackathonSubmissionId}" class="btn-update">
                    <svg width="11" height="11" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="1 4 1 10 7 10"/><path d="M3.51 15a9 9 0 1 0 .49-3.89"/></svg>
                    Update
                  </a>
                </td>
               </tr>
            </c:forEach>
          </tbody>
         </table>
      </div>
    </div>

  </main>
</div>

<!-- FOOTER -->
<footer class="site-footer">
  <div class="f-brand">Code<span>Verse</span> &mdash; Judge Panel</div>
  <div class="f-copy">&copy; 2026 CodeVerse. All rights reserved.</div>
</footer>

<script>
function toggleSidebar() {
  document.getElementById('sidebar').classList.toggle('open');
}
</script>

</body>
</html>