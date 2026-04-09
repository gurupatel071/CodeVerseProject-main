<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${hackathon.title}| CodeVerse</title>
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
	rel="stylesheet">
<style>
:root {
	--bg: #f4f2ee;
	--bg1: #ffffff;
	--bg2: #eeecea;
	--bg3: #e5e2de;
	--nv: #0e1f3d;
	--nv2: #1a3260;
	--nv-dim: rgba(14, 31, 61, 0.07);
	--nv-glow: rgba(14, 31, 61, 0.18);
	--tl: #2e6b72;
	--tl-light: #3d8f98;
	--tl-dim: rgba(46, 107, 114, 0.1);
	--tl-glow: rgba(46, 107, 114, 0.2);
	--gd: #c9a84c;
	--gd-light: #e0be73;
	--gd-dim: rgba(201, 168, 76, 0.12);
	--rs: #a85858;
	--rs-dim: rgba(168, 88, 88, 0.1);
	--t1: #1a1f2e;
	--t2: #4b5b6e;
	--t3: #8c97a4;
	--t4: #b8c0ca;
	--bd: rgba(14, 31, 61, 0.08);
	--bd2: rgba(14, 31, 61, 0.13);
	--bd3: rgba(14, 31, 61, 0.22);
	--ff: 'Inter', sans-serif;
	--ease: cubic-bezier(0.16, 1, 0.3, 1);
	--r: 10px;
	--r2: 14px;
	--r3: 18px;
	--sh-sm: 0 1px 3px rgba(14, 31, 61, 0.06), 0 1px 2px
		rgba(14, 31, 61, 0.04);
	--sh-md: 0 4px 16px rgba(14, 31, 61, 0.08), 0 1px 4px
		rgba(14, 31, 61, 0.04);
	--sh-lg: 0 12px 36px rgba(14, 31, 61, 0.11), 0 2px 8px
		rgba(14, 31, 61, 0.06);
}

*, *::before, *::after {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

html {
	scroll-behavior: smooth;
}

body {
	font-family: var(--ff);
	background: var(--bg);
	color: var(--t1);
	min-height: 100vh;
	overflow-x: hidden;
	-webkit-font-smoothing: antialiased;
}

a {
	text-decoration: none;
	color: inherit;
}

button {
	font-family: var(--ff);
	cursor: pointer;
	border: none;
	background: none;
}

select {
	font-family: var(--ff);
	cursor: pointer;
}

input {
	font-family: var(--ff);
}

/* ══ BG ══ */
.bg-layer {
	position: fixed;
	inset: 0;
	z-index: 0;
	pointer-events: none;
	overflow: hidden;
}

.bg-blot {
	position: absolute;
	border-radius: 50%;
	filter: blur(120px);
}

.bb1 {
	width: 550px;
	height: 450px;
	opacity: 0.055;
	background: radial-gradient(circle, var(--tl) 0%, transparent 70%);
	top: -150px;
	right: -60px;
}

.bb2 {
	width: 450px;
	height: 380px;
	opacity: 0.04;
	background: radial-gradient(circle, var(--nv) 0%, transparent 70%);
	bottom: 0;
	left: -80px;
}

/* ══ PROGRESS ══ */
#pgbar {
	position: fixed;
	top: 0;
	left: 0;
	height: 2px;
	width: 0%;
	background: linear-gradient(90deg, var(--tl), var(--gd), var(--tl));
	background-size: 200% 100%;
	animation: barShimmer 3s linear infinite;
	z-index: 9999;
	transition: width 0.1s linear;
}

@
keyframes barShimmer {
	from {background-position: 200% 0
}

to {
	background-position: -200% 0
}

}

/* ══ NAVBAR ══ */
.navbar {
	position: sticky;
	top: 0;
	z-index: 500;
	height: 60px;
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 0 48px;
	background: rgba(244, 242, 238, 0.9);
	backdrop-filter: blur(20px) saturate(180%);
	border-bottom: 1px solid var(--bd);
	box-shadow: 0 1px 0 var(--bd);
}

.brand {
	display: flex;
	align-items: center;
	gap: 10px;
}

.brand-mark {
	width: 32px;
	height: 32px;
	border-radius: 8px;
	background: var(--nv);
	display: grid;
	place-items: center;
	color: var(--gd-light);
}

.brand-name {
	font-size: 1.1rem;
	font-weight: 700;
	color: var(--nv);
	letter-spacing: -0.3px;
}

.brand-name span {
	color: var(--tl);
}

.nav-links {
	display: flex;
	align-items: center;
	gap: 2px;
}

.nav-links a {
	font-size: 0.875rem;
	font-weight: 500;
	color: var(--t2);
	padding: 6px 13px;
	border-radius: 8px;
	transition: all 0.18s;
}

.nav-links a:hover {
	color: var(--nv);
	background: var(--nv-dim);
}

.nav-cta {
	display: inline-flex;
	align-items: center;
	gap: 6px;
	font-size: 0.85rem !important;
	font-weight: 600 !important;
	color: #fff !important;
	background: var(--nv) !important;
	padding: 7px 16px !important;
	border-radius: 8px !important;
	margin-left: 6px;
	transition: all 0.2s var(--ease) !important;
	box-shadow: var(--sh-sm);
}

.nav-cta:hover {
	background: var(--nv2) !important;
	transform: translateY(-1px);
	box-shadow: var(--sh-md) !important;
}

/* ══ PAGE WRAPPER ══ */
.page-wrapper {
	position: relative;
	z-index: 1;
	max-width: 1200px;
	margin: 0 auto;
	padding: 40px 48px 60px;
	animation: rise 0.7s var(--ease) both;
}

@
keyframes rise {
	from {opacity: 0;
	transform: translateY(20px)
}

to {
	opacity: 1;
	transform: translateY(0)
}

}

/* ══ BREADCRUMB ══ */
.breadcrumb {
	display: flex;
	align-items: center;
	gap: 0;
	font-size: 0.8rem;
	color: var(--t3);
	margin-bottom: 24px;
}

.breadcrumb a {
	color: var(--t2);
	transition: color 0.2s;
	padding: 0;
}

.breadcrumb a:hover {
	color: var(--tl);
}

.breadcrumb-sep {
	color: var(--t4);
	margin: 0 8px;
	font-size: 0.75rem;
	line-height: 1;
	display: inline-block;
	/* use a plain ASCII slash — no special unicode */
}

/* ══ HERO ══ */
.hero-section {
	background: var(--bg1);
	border: 1px solid var(--bd);
	border-radius: var(--r3);
	padding: 36px 40px;
	margin-bottom: 28px;
	box-shadow: var(--sh-md);
}

.hero-top {
	display: flex;
	align-items: center;
	gap: 8px;
	flex-wrap: wrap;
	margin-bottom: 18px;
}

.status-chip {
	display: inline-flex;
	align-items: center;
	gap: 6px;
	font-size: 0.68rem;
	font-weight: 700;
	letter-spacing: 0.6px;
	text-transform: uppercase;
	padding: 5px 13px;
	border-radius: 100px;
}

.st-live {
	background: rgba(46, 107, 114, 0.1);
	color: var(--tl);
	border: 1px solid rgba(46, 107, 114, 0.22);
}

.st-soon {
	background: var(--gd-dim);
	color: #8a6a1c;
	border: 1px solid rgba(201, 168, 76, 0.3);
}

.st-over {
	background: var(--bg2);
	color: var(--t3);
	border: 1px solid var(--bd);
}

.dot {
	width: 6px;
	height: 6px;
	border-radius: 50%;
	flex-shrink: 0;
}

.st-live .dot {
	background: var(--tl);
	animation: pulse 2s infinite;
}

.st-soon .dot {
	background: var(--gd);
}

@
keyframes pulse { 0%,100%{
	box-shadow: 0 0 0 0 rgba(46, 107, 114, 0.5)
}

50
%
{
box-shadow
:
0
0
0
6px
rgba(
46
,
107
,
114
,
0
)
}
}
.payment-chip {
	display: inline-flex;
	align-items: center;
	font-size: 0.68rem;
	font-weight: 700;
	letter-spacing: 0.6px;
	text-transform: uppercase;
	padding: 5px 13px;
	border-radius: 100px;
}

.pay-free {
	background: rgba(46, 107, 114, 0.08);
	color: var(--tl);
	border: 1px solid rgba(46, 107, 114, 0.2);
}

.pay-paid {
	background: var(--rs-dim);
	color: var(--rs);
	border: 1px solid rgba(168, 88, 88, 0.2);
}

.hero-title {
	font-size: 2.5rem;
	font-weight: 800;
	color: var(--nv);
	letter-spacing: -0.8px;
	margin-bottom: 20px;
	line-height: 1.15;
}

.hero-meta {
	display: flex;
	align-items: center;
	gap: 28px;
	flex-wrap: wrap;
	font-size: 0.875rem;
	color: var(--t2);
	padding-top: 18px;
	border-top: 1px solid var(--bd);
}

.hero-meta-item {
	display: flex;
	align-items: center;
	gap: 7px;
	font-weight: 500;
}
/* inline SVG icons via CSS — no external library needed */
.ico {
	width: 16px;
	height: 16px;
	flex-shrink: 0;
	display: inline-block;
	vertical-align: middle;
	background-repeat: no-repeat;
	background-size: contain;
	background-position: center;
	opacity: 0.7;
}

.ico-pin {
	background-image:
		url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='%232e6b72' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpath d='M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z'/%3E%3Ccircle cx='12' cy='10' r='3'/%3E%3C/svg%3E");
}

.ico-clock {
	background-image:
		url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='%232e6b72' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Ccircle cx='12' cy='12' r='10'/%3E%3Cpolyline points='12 6 12 12 16 14'/%3E%3C/svg%3E");
}

.ico-cal {
	background-image:
		url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='%232e6b72' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Crect x='3' y='4' width='18' height='18' rx='2'/%3E%3Cline x1='16' y1='2' x2='16' y2='6'/%3E%3Cline x1='8' y1='2' x2='8' y2='6'/%3E%3Cline x1='3' y1='10' x2='21' y2='10'/%3E%3C/svg%3E");
}

.ico-doc {
	background-image:
		url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='%232e6b72' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpath d='M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z'/%3E%3Cpolyline points='14 2 14 8 20 8'/%3E%3C/svg%3E");
}

.ico-link {
	background-image:
		url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='%234b5b6e' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpath d='M10 13a5 5 0 0 0 7.54.54l3-3a5 5 0 0 0-7.07-7.07l-1.72 1.71'/%3E%3Cpath d='M14 11a5 5 0 0 0-7.54-.54l-3 3a5 5 0 0 0 7.07 7.07l1.71-1.71'/%3E%3C/svg%3E");
}

.ico-tw {
	background-image:
		url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='%234b5b6e' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpath d='M23 3a10.9 10.9 0 0 1-3.14 1.53 4.48 4.48 0 0 0-7.86 3v1A10.66 10.66 0 0 1 3 4s-4 9 5 13a11.64 11.64 0 0 1-7 2c9 5 20 0 20-11.5a4.5 4.5 0 0 0-.08-.83A7.72 7.72 0 0 0 23 3z'/%3E%3C/svg%3E");
}

.ico-arr {
	background-image:
		url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='%23ffffff' stroke-width='2.5' stroke-linecap='round' stroke-linejoin='round'%3E%3Cline x1='5' y1='12' x2='19' y2='12'/%3E%3Cpolyline points='12 5 19 12 12 19'/%3E%3C/svg%3E");
}

.ico-chk {
	background-image:
		url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='%23ffffff' stroke-width='2.5' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='20 6 9 17 4 12'/%3E%3C/svg%3E");
}

.ico-bolt {
	background-image:
		url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='%23e0be73' stroke-width='2.5' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='13 2 3 14 12 14 11 22 21 10 12 10 13 2'/%3E%3C/svg%3E");
}

/* ══ CONTENT GRID ══ */
.content-grid {
	display: grid;
	grid-template-columns: 2fr 1fr;
	gap: 24px;
	align-items: start;
}

/* ══ MAIN CARD ══ */
.main-card {
	background: var(--bg1);
	border: 1px solid var(--bd);
	border-radius: var(--r3);
	overflow: hidden;
	box-shadow: var(--sh-sm);
}

.card-header {
	padding: 16px 24px;
	border-bottom: 1px solid var(--bd);
	background: var(--bg2);
	display: flex;
	align-items: center;
	gap: 10px;
}

.card-header h2 {
	font-size: 0.95rem;
	font-weight: 600;
	color: var(--nv);
}

.card-body {
	padding: 28px 32px;
}

.hackathon-description {
	font-size: 0.95rem;
	line-height: 1.75;
	color: var(--t2);
	margin-bottom: 32px;
	padding-bottom: 28px;
	border-bottom: 1px solid var(--bd);
}

/* ══ INFO GRID ══ */
.info-grid {
	display: grid;
	grid-template-columns: repeat(2, 1fr);
	gap: 12px;
	margin-bottom: 28px;
}

.info-item {
	background: var(--bg2);
	border: 1px solid var(--bd);
	border-radius: var(--r);
	padding: 16px 20px;
	transition: all 0.2s;
}

.info-item:hover {
	border-color: rgba(46, 107, 114, 0.25);
	background: rgba(46, 107, 114, 0.04);
}

.info-label {
	font-size: 0.62rem;
	font-weight: 700;
	text-transform: uppercase;
	letter-spacing: 0.8px;
	color: var(--t3);
	margin-bottom: 6px;
}

.info-value {
	font-size: 1.05rem;
	font-weight: 700;
	color: var(--nv);
}

.info-value small {
	font-size: 0.78rem;
	font-weight: 400;
	color: var(--t3);
	margin-left: 3px;
}

/* ══ TAGS ══ */
.tags-section {
	
}

.tags-label {
	font-size: 0.62rem;
	font-weight: 700;
	text-transform: uppercase;
	letter-spacing: 0.8px;
	color: var(--t3);
	margin-bottom: 12px;
}

.tags-list {
	display: flex;
	flex-wrap: wrap;
	gap: 8px;
}

.tag {
	background: var(--bg2);
	border: 1px solid var(--bd2);
	color: var(--t2);
	font-size: 0.78rem;
	font-weight: 500;
	padding: 5px 13px;
	border-radius: 6px;
	transition: all 0.18s;
}

.tag:hover {
	background: var(--tl-dim);
	border-color: rgba(46, 107, 114, 0.3);
	color: var(--tl);
}

/* ══ SIDEBAR ══ */
.sidebar-card {
	background: var(--bg1);
	border: 1px solid var(--bd);
	border-radius: var(--r3);
	overflow: hidden;
	box-shadow: var(--sh-sm);
	position: sticky;
	top: 80px;
}

.sidebar-header {
	padding: 20px 24px;
	background: var(--nv);
	color: white;
	border-bottom: 1px solid rgba(255, 255, 255, 0.07);
}

.sidebar-header h3 {
	font-size: 1rem;
	font-weight: 700;
	letter-spacing: -0.2px;
	margin-bottom: 3px;
}

.sidebar-header p {
	font-size: 0.7rem;
	color: rgba(255, 255, 255, 0.45);
	font-weight: 400;
}

.sidebar-body {
	padding: 22px;
}

/* Prize Box */
.prize-box {
	text-align: center;
	padding: 20px 16px;
	background: linear-gradient(135deg, var(--gd-dim) 0%,
		rgba(201, 168, 76, 0.06) 100%);
	border: 1px solid rgba(201, 168, 76, 0.3);
	border-radius: var(--r);
	margin-bottom: 20px;
}

.prize-label {
	font-size: 0.65rem;
	font-weight: 700;
	text-transform: uppercase;
	letter-spacing: 0.8px;
	color: var(--t3);
	margin-bottom: 6px;
}

.prize-value {
	font-size: 1.5rem;
	font-weight: 800;
	color: var(--nv);
	letter-spacing: -0.5px;
}

.prize-sub {
	font-size: 0.7rem;
	color: var(--t3);
	margin-top: 3px;
}

/* Date Boxes */
.dates-section {
	margin-bottom: 4px;
}

.date-box {
	display: flex;
	align-items: center;
	gap: 12px;
	padding: 13px 0;
	border-bottom: 1px solid var(--bd);
}

.date-box:last-child {
	border-bottom: none;
}

.date-icon {
	width: 38px;
	height: 38px;
	border-radius: 9px;
	flex-shrink: 0;
	background: var(--tl-dim);
	display: grid;
	place-items: center;
}

.date-info {
	flex: 1;
}

.date-label {
	font-size: 0.62rem;
	font-weight: 700;
	text-transform: uppercase;
	letter-spacing: 0.8px;
	color: var(--t3);
	margin-bottom: 3px;
}

.date-value {
	font-size: 0.9rem;
	font-weight: 600;
	color: var(--nv);
}

/* Register Button */
.register-btn {
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 8px;
	width: 100%;
	padding: 13px 20px;
	background: var(--tl);
	color: white;
	border-radius: 10px;
	font-weight: 700;
	font-size: 0.95rem;
	transition: all 0.2s var(--ease);
	margin: 18px 0 10px;
	box-shadow: 0 4px 14px var(--tl-glow);
	cursor: pointer;
}

.register-btn:hover {
	background: var(--tl-light);
	transform: translateY(-2px);
	box-shadow: 0 8px 22px var(--tl-glow);
}

.register-btn.disabled {
	background: var(--bg3);
	color: var(--t3);
	pointer-events: none;
	box-shadow: none;
	border: 1px solid var(--bd);
	cursor: default;
}

.register-btn.success {
	background: var(--nv);
	pointer-events: none;
	box-shadow: none;
}

.reg-note {
	text-align: center;
	font-size: 0.72rem;
	color: var(--t3);
	line-height: 1.5;
}

/* Share */
.share-row {
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding-top: 18px;
	border-top: 1px solid var(--bd);
	margin-top: 6px;
}

.share-label {
	font-size: 0.7rem;
	color: var(--t3);
	font-weight: 600;
	letter-spacing: 0.5px;
	text-transform: uppercase;
}

.share-btns {
	display: flex;
	gap: 6px;
}

.share-btn {
	width: 34px;
	height: 34px;
	border-radius: 8px;
	background: transparent;
	border: 1px solid var(--bd2);
	display: grid;
	place-items: center;
	color: var(--t3);
	transition: all 0.18s;
	cursor: pointer;
}

.share-btn:hover {
	background: var(--nv-dim);
	border-color: var(--bd3);
}

/* ══ FOOTER ══ */
.site-footer {
	position: relative;
	z-index: 1;
	background: var(--nv);
	padding: 28px 48px;
	display: flex;
	align-items: center;
	justify-content: space-between;
	flex-wrap: wrap;
	gap: 16px;
	margin-top: 40px;
}

.f-brand {
	font-size: 0.95rem;
	font-weight: 600;
	color: rgba(255, 255, 255, 0.65);
}

.f-brand span {
	color: var(--gd-light);
}

.f-copy {
	font-size: 0.62rem;
	color: rgba(255, 255, 255, 0.28);
	letter-spacing: 0.5px;
}

/* ══ RESPONSIVE ══ */
@media ( max-width :1100px) {
	.navbar {
		padding: 0 24px;
	}
	.page-wrapper {
		padding: 30px 24px 50px;
	}
	.site-footer {
		padding: 24px;
	}
}

@media ( max-width :900px) {
	.content-grid {
		grid-template-columns: 1fr;
	}
	.sidebar-card {
		position: static;
	}
	.info-grid {
		grid-template-columns: 1fr;
	}
}

@media ( max-width :620px) {
	.navbar {
		padding: 0 16px;
	}
	.page-wrapper {
		padding: 20px 16px 40px;
	}
	.hero-section {
		padding: 24px 20px;
	}
	.hero-title {
		font-size: 1.8rem;
	}
	.card-body {
		padding: 20px;
	}
	.site-footer {
		padding: 20px 16px;
		flex-direction: column;
		text-align: center;
	}
}
</style>
</head>
<body>

	<div class="bg-layer">
		<div class="bg-blot bb1"></div>
		<div class="bg-blot bb2"></div>
	</div>
	<div id="pgbar"></div>

	<!-- NAVBAR -->
	<header class="navbar">
		<a href="home" class="brand">
			<div class="brand-mark">
				<span class="ico ico-bolt" style="width: 15px; height: 15px;"></span>
			</div> <span class="brand-name">Code<span>Verse</span></span>
		</a>
		<nav class="nav-links">
	 <a href="#">About</a>
			<a href="login">Login</a> <a href="signup" class="nav-cta">
				Register <span class="ico ico-arr"
				style="width: 11px; height: 11px; opacity: 1;"></span>
			</a>
		</nav>
	</header>

	<!-- PAGE WRAPPER -->
	<div class="page-wrapper">

		<!-- BREADCRUMB -->
		<div class="breadcrumb">
			<a href="home">Home</a> <span class="breadcrumb-sep">/</span> <a
				href="home">Hackathons</a> <span class="breadcrumb-sep">/</span> <span>${hackathon.title}</span>
		</div>

		<!-- HERO -->
		<div class="hero-section">
			<div class="hero-top">
				<c:choose>
					<c:when test="${hackathon.status == 'ONGOING'}">
						<span class="status-chip st-live"><span class="dot"></span>Live
							Now</span>
					</c:when>
					<c:when test="${hackathon.status == 'UPCOMING'}">
						<span class="status-chip st-soon"><span class="dot"></span>Upcoming</span>
					</c:when>
					<c:otherwise>
						<span class="status-chip st-over">Ended</span>
					</c:otherwise>
				</c:choose>

				<c:choose>
					<c:when test="${hackathon.payment == 'FREE'}">
						<span class="payment-chip pay-free">Free Entry</span>
					</c:when>
					<c:otherwise>
						<span class="payment-chip pay-paid">Paid Entry</span>
					</c:otherwise>
				</c:choose>

				<c:if test="${not empty hackathon.eventType}">
					<span class="payment-chip"
						style="background: var(--nv-dim); color: var(--nv); border: 1px solid var(--bd2);">
						${hackathon.eventType} </span>
				</c:if>
			</div>

			<h1 class="hero-title">${hackathon.title}</h1>

			<div class="hero-meta">
				<c:if test="${not empty hackathon.location}">
					<span class="hero-meta-item"> <span class="ico ico-pin"></span>
						${hackathon.location}
					</span>
				</c:if>
				<c:if test="${not empty hackathon.registrationEndDate}">
					<span class="hero-meta-item"> <span class="ico ico-clock"></span>
						Registration ends ${hackathon.registrationEndDate}
					</span>
				</c:if>
			</div>
		</div>

		<!-- CONTENT GRID -->
		<div class="content-grid">

			<!-- MAIN -->
			<div>
				<div class="main-card">
					<div class="card-header">
						<span class="ico ico-doc"></span>
						<h2>About This Hackathon</h2>
					</div>
					<div class="card-body">
						<div class="hackathon-description">
							<c:choose>
								<c:when test="${not empty hackathon.description}">
                ${hackathon.description}
              </c:when>
								<c:otherwise>
                Join this exciting hackathon and showcase your skills! Collaborate with talented developers, designers, and innovators to build something extraordinary. No description has been provided yet — check back soon for more details.
              </c:otherwise>
							</c:choose>
						</div>

						<!-- INFO GRID -->
						<div class="info-grid">
							<div class="info-item">
								<div class="info-label">Team Size</div>
								<div class="info-value">
									${hackathon.minTeamSize} &ndash; ${hackathon.maxTeamSize} <small>members</small>
								</div>
							</div>

							<div class="info-item">
								<div class="info-label">Entry Type</div>
								<div class="info-value">${hackathon.payment}</div>
							</div>

							<c:if test="${not empty hackathon.userTypeId}">
								<div class="info-item">
									<div class="info-label">Eligibility</div>
									<div class="info-value">

										<c:forEach var="u" items="${allUserType}">
											<c:if test="${u.userTypeId == hackathon.userTypeId}">
          ${u.userType}
        </c:if>
										</c:forEach>

									</div>
								</div>
							</c:if>

							<c:if test="${not empty hackathon.userId}">
								<div class="info-item">
									<div class="info-label">Organized by</div>
									<div class="info-value">Team #${hackathon.userId}</div>
								</div>
							</c:if>
						</div>

						<!-- TAGS -->
						<div class="tags-section">
							<div class="tags-label">Tags</div>
							<div class="tags-list">
								<span class="tag">${hackathon.eventType}</span>
								<c:if test="${hackathon.payment == 'FREE'}">
									<span class="tag">Free Entry</span>
								</c:if>
								<span class="tag">Hackathon</span> <span class="tag">#${hackathon.hackathonId}</span>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- SIDEBAR -->
			<div>
				<div class="sidebar-card">
					<div class="sidebar-header">
						<h3>Registration</h3>
						<p>Secure your spot today</p>
					</div>
					<div class="sidebar-body">

						<!-- Prize -->
						<div class="prize-box">
							<div class="prize-label">Prize Pool</div>
							<div class="prize-value">To be Announced</div>
							<div class="prize-sub">Stay tuned for updates</div>
						</div>

						<!-- Dates -->
						<div class="dates-section">
							<c:if test="${not empty hackathon.registrationStartDate}">
								<div class="date-box">
									<div class="date-icon">
										<span class="ico ico-cal"
											style="width: 18px; height: 18px; opacity: 0.85;"></span>
									</div>
									<div class="date-info">
										<div class="date-label">Registration Opens</div>
										<div class="date-value">${hackathon.registrationStartDate}</div>
									</div>
								</div>
							</c:if>

							<c:if test="${not empty hackathon.registrationEndDate}">
								<div class="date-box">
									<div class="date-icon">
										<span class="ico ico-cal"
											style="width: 18px; height: 18px; opacity: 0.85;"></span>
									</div>
									<div class="date-info">
										<div class="date-label">Registration Ends</div>
										<div class="date-value">${hackathon.registrationEndDate}</div>
									</div>
								</div>
							</c:if>
						</div>

						<!-- Register Button -->
						<c:choose>
							<c:when test="${not empty registered and registered}">
								<div class="register-btn success">
									<span class="ico ico-chk"
										style="width: 16px; height: 16px; opacity: 1;"></span> Already
									Registered
								</div>
							</c:when>
							<c:when test="${hackathon.status == 'COMPLETED'}">
								<div class="register-btn disabled">Event Ended</div>
							</c:when>
							<c:otherwise>
								<a href="registerHackathon?hackathonId=${hackathon.hackathonId}"
									class="register-btn"> Register Now <span
									class="ico ico-arr"
									style="width: 14px; height: 14px; opacity: 1;"></span>
								</a>
								<p class="reg-note">Free to join &nbsp;·&nbsp; Takes less
									than 2 min</p>
							</c:otherwise>
						</c:choose>

						<!-- Share -->
						<div class="share-row">
							<span class="share-label">Share</span>
							<div class="share-btns">
								<button class="share-btn" title="Copy link" onclick="copyLink()">
									<span class="ico ico-link" style="width: 14px; height: 14px;"></span>
								</button>
								<button class="share-btn" title="Share on Twitter">
									<span class="ico ico-tw" style="width: 14px; height: 14px;"></span>
								</button>
							</div>
						</div>

					</div>
				</div>
			</div>

		</div>
	</div>

	<!-- FOOTER -->
	<footer class="site-footer">
		<div class="f-brand">
			Code<span>Verse</span> — Your Gateway to Innovation
		</div>
		<div class="f-copy">&copy; 2026 CodeVerse. All rights reserved.</div>
	</footer>

	<script>
		(function() {
			var pb = document.getElementById('pgbar');
			window.addEventListener('scroll', function() {
				var s = window.scrollY;
				var h = document.documentElement.scrollHeight
						- window.innerHeight;
				pb.style.width = (h > 0 ? (s / h) * 100 : 0) + '%';
			});
		})();

		function copyLink() {
			navigator.clipboard.writeText(window.location.href).then(
					function() {
						var btn = event.currentTarget;
						btn.style.background = 'var(--nv-dim)';
						setTimeout(function() {
							btn.style.background = '';
						}, 1500);
					});
		}
	</script>

</body>
</html>
