<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CodeVerse — Discover Hackathons</title>
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

svg {
	flex-shrink: 0;
	display: block;
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
	font-family: var(--ff);
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

/* ══ HERO ══ */
.hero {
	position: relative;
	z-index: 1;
	max-width: 820px;
	margin: 0 auto;
	text-align: center;
	padding: 72px 24px 48px;
}

.hero-badge {
	display: inline-flex;
	align-items: center;
	gap: 8px;
	background: var(--nv);
	color: var(--gd-light);
	font-family: var(--ff);
	font-size: 0.64rem;
	font-weight: 500;
	letter-spacing: 2px;
	text-transform: uppercase;
	padding: 5px 14px;
	border-radius: 100px;
	margin-bottom: 26px;
	animation: rise 0.7s var(--ease) both;
	box-shadow: var(--sh-sm);
}

.pulse {
	width: 6px;
	height: 6px;
	border-radius: 50%;
	background: var(--gd-light);
	animation: pls 2.2s ease-in-out infinite;
}

@
keyframes pls { 0%,100%{
	box-shadow: 0 0 0 0 rgba(224, 190, 115, 0.6)
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


rgba
(


224
,
190
,
115
,
0


)


}
}
.hero-h1 {
	font-family: var(--ff);
	font-size: clamp(38px, 7vw, 72px);
	font-weight: 700;
	line-height: 1.06;
	letter-spacing: -2px;
	color: var(--nv);
	animation: rise 0.7s 0.1s var(--ease) both;
}

.hero-h1 .shine {
	background: linear-gradient(130deg, var(--tl) 0%, var(--tl-light) 50%,
		#38a3ad 100%);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
	background-clip: text;
}

.hero-sub {
	margin: 18px auto 0;
	max-width: 500px;
	font-size: 1rem;
	color: var(--t2);
	line-height: 1.72;
	animation: rise 0.7s 0.2s var(--ease) both;
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
.search-wrap {
	max-width: 580px;
	margin: 32px auto 0;
	animation: rise 0.7s 0.3s var(--ease) both;
}

.search-inner {
	display: flex;
	align-items: center;
	background: var(--bg1);
	border: 1.5px solid var(--bd2);
	border-radius: 12px;
	overflow: hidden;
	transition: border-color 0.25s, box-shadow 0.25s;
	box-shadow: var(--sh-md);
}

.search-inner:focus-within {
	border-color: var(--tl);
	box-shadow: 0 0 0 4px var(--tl-dim), var(--sh-md);
}

.s-ico {
	padding: 0 14px;
	color: var(--t4);
	display: flex;
	align-items: center;
}

.search-inner input {
	flex: 1;
	background: transparent;
	border: none;
	outline: none;
	color: var(--t1);
	font-size: 0.92rem;
	padding: 13px 0;
}

.search-inner input::placeholder {
	color: var(--t4);
}

.s-btn {
	margin: 6px;
	padding: 8px 20px;
	background: var(--tl);
	color: #fff;
	border: none;
	border-radius: 8px;
	font-size: 0.85rem;
	font-weight: 600;
	cursor: pointer;
	transition: all 0.2s var(--ease);
	box-shadow: 0 2px 8px var(--tl-glow);
}

.s-btn:hover {
	background: var(--tl-light);
	transform: translateY(-1px);
}

/* ══ STATS ══ */
.stats {
	position: relative;
	z-index: 1;
	display: flex;
	justify-content: center;
	align-items: stretch;
	padding: 36px 24px 28px;
	animation: rise 0.7s 0.4s var(--ease) both;
}

.stat {
	text-align: center;
	padding: 0 44px;
	position: relative;
}

.stat+.stat::before {
	content: '';
	position: absolute;
	left: 0;
	top: 10%;
	bottom: 10%;
	width: 1px;
	background: linear-gradient(to bottom, transparent, var(--bd2),
		transparent);
}

.stat-val {
	font-family: var(--ff);
	font-size: 2.4rem;
	font-weight: 700;
	letter-spacing: -1.5px;
	color: var(--nv);
	margin-bottom: 4px;
	line-height: 1;
}

.stat-val span {
	color: var(--tl);
}

.stat-lbl {
	font-family: var(--ff);
	font-size: 0.6rem;
	font-weight: 500;
	letter-spacing: 2.2px;
	text-transform: uppercase;
	color: var(--t3);
}

/* ══ TICKER ══ */
.ticker-shell {
	position: relative;
	z-index: 1;
	overflow: hidden;
	border-top: 1px solid var(--bd);
	border-bottom: 1px solid var(--bd);
	padding: 10px 0;
	background: var(--bg1);
}

.ticker-shell::before, .ticker-shell::after {
	content: '';
	position: absolute;
	top: 0;
	bottom: 0;
	width: 80px;
	z-index: 2;
}

.ticker-shell::before {
	left: 0;
	background: linear-gradient(to right, var(--bg1), transparent);
}

.ticker-shell::after {
	right: 0;
	background: linear-gradient(to left, var(--bg1), transparent);
}

.ticker-track {
	display: flex;
	width: max-content;
	animation: tickMove 32s linear infinite;
}

/* hover pe rukega */
.ticker-shell:hover .ticker-track {
	animation-play-state: paused;
}

@
keyframes tickMove {from { transform:translateX(0);
	
}

to {
	transform: translateX(-50%);
}

}
.tk {
	display: flex;
	align-items: center;
	gap: 10px;
	padding: 0 28px;
	font-family: var(--ff);
	font-size: 0.65rem;
	color: var(--t3);
	white-space: nowrap;
	letter-spacing: 0.3px;
}

.tk strong {
	color: var(--nv);
	font-weight: 500;
}

.tk-sep {
	width: 3px;
	height: 3px;
	border-radius: 50%;
	background: var(--bd2);
	flex-shrink: 0;
}

/* ══ TRUST PILLS ══ */
.features {
	position: relative;
	z-index: 1;
	display: flex;
	justify-content: center;
	flex-wrap: wrap;
	gap: 8px;
	padding: 26px 24px 6px;
	animation: rise 0.7s 0.5s var(--ease) both;
}

.feat-pill {
	display: inline-flex;
	align-items: center;
	gap: 6px;
	font-size: 0.78rem;
	font-weight: 500;
	color: var(--t2);
	background: var(--bg1);
	border: 1px solid var(--bd2);
	padding: 6px 14px;
	border-radius: 100px;
	transition: all 0.18s;
	box-shadow: var(--sh-sm);
}

.feat-pill svg {
	color: var(--tl);
}

.feat-pill:hover {
	border-color: var(--tl);
	color: var(--nv);
	box-shadow: var(--sh-md);
}

/* ══ LAYOUT ══ */
.layout {
	position: relative;
	z-index: 1;
	display: flex;
	gap: 20px;
	max-width: 1440px;
	margin: 0 auto;
	padding: 28px 48px 80px;
}

/* ══ SIDEBAR ══ */
.sidebar {
	width: 248px;
	flex-shrink: 0;
}

.sb-box {
	background: var(--bg1);
	border: 1px solid var(--bd);
	border-radius: var(--r3);
	overflow: hidden;
	position: sticky;
	top: 74px;
	box-shadow: var(--sh-sm);
}

.sb-head {
	padding: 14px 18px;
	background: var(--nv);
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.sb-ttl {
	font-family: var(--ff);
	font-size: 0.61rem;
	font-weight: 500;
	letter-spacing: 2.5px;
	text-transform: uppercase;
	color: rgba(255, 255, 255, 0.5);
	display: flex;
	align-items: center;
	gap: 7px;
}

.sb-ttl svg {
	color: rgba(255, 255, 255, 0.35);
}

.act-badge {
	font-family: var(--ff);
	font-size: 0.58rem;
	font-weight: 500;
	color: var(--nv);
	background: var(--gd-light);
	padding: 2px 8px;
	border-radius: 100px;
}

.sb-body {
	padding: 16px 16px;
}

.fg {
	margin-bottom: 15px;
}

.fg-lbl {
	font-size: 0.73rem;
	font-weight: 600;
	color: var(--t2);
	margin-bottom: 8px;
	display: block;
	letter-spacing: 0.2px;
}

.pr {
	display: flex;
	flex-wrap: wrap;
	gap: 5px;
}

.pr input[type="radio"] {
	display: none;
}

.pr label {
	padding: 4px 11px;
	border-radius: 100px;
	border: 1px solid var(--bd2);
	font-size: 0.73rem;
	font-weight: 500;
	color: var(--t3);
	cursor: pointer;
	transition: all 0.16s;
	background: var(--bg);
}

.pr label:hover {
	border-color: var(--tl);
	color: var(--tl);
}

.pr input:checked+label {
	background: var(--nv);
	border-color: var(--nv);
	color: #fff;
}

.sel {
	width: 100%;
	padding: 8px 28px 8px 10px;
	background: var(--bg);
	border: 1px solid var(--bd2);
	border-radius: 8px;
	color: var(--t2);
	font-family: var(--ff);
	font-size: 0.82rem;
	outline: none;
	appearance: none;
	transition: border-color 0.2s;
	background-image:
		url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='10' height='6' viewBox='0 0 10 6'%3E%3Cpath fill='%238c97a4' d='M0 0l5 6 5-6z'/%3E%3C/svg%3E");
	background-repeat: no-repeat;
	background-position: right 10px center;
}

.sel:focus {
	border-color: var(--tl);
}

.sel option {
	background: var(--bg1);
	color: var(--t1);
}

.sb-div {
	height: 1px;
	background: var(--bd);
	margin: 12px 0;
}

.reset-btn {
	width: 100%;
	padding: 9px;
	background: transparent;
	border: 1px solid var(--bd2);
	border-radius: 8px;
	color: var(--t2);
	font-family: var(--ff);
	font-size: 0.82rem;
	font-weight: 500;
	transition: all 0.18s;
	cursor: pointer;
}

.reset-btn:hover {
	background: var(--nv-dim);
	border-color: var(--nv);
	color: var(--nv);
}

/* ══ CARDS COL ══ */
.cards-col {
	flex: 1;
	min-width: 0;
}

.col-top {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-bottom: 16px;
	flex-wrap: wrap;
	gap: 12px;
}

.col-title {
	font-family: var(--ff);
	font-size: 1.4rem;
	font-weight: 700;
	color: var(--nv);
	letter-spacing: -0.5px;
	display: flex;
	align-items: baseline;
	gap: 10px;
}

.col-count {
	font-family: var(--ff);
	font-size: 0.67rem;
	color: var(--t3);
	font-weight: 400;
}

.sort-sel {
	padding: 7px 28px 7px 11px;
	background: var(--bg1);
	border: 1px solid var(--bd2);
	border-radius: 8px;
	color: var(--t2);
	font-family: var(--ff);
	font-size: 0.8rem;
	outline: none;
	appearance: none;
	cursor: pointer;
	transition: border-color 0.2s;
	box-shadow: var(--sh-sm);
	background-image:
		url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='10' height='6' viewBox='0 0 10 6'%3E%3Cpath fill='%238c97a4' d='M0 0l5 6 5-6z'/%3E%3C/svg%3E");
	background-repeat: no-repeat;
	background-position: right 10px center;
}

.sort-sel option {
	background: var(--bg1);
}

.sort-sel:focus {
	border-color: var(--tl);
}

/* ══ GRID ══ */
.grid {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
	gap: 18px;
}

/* ══ CARD ══ */
.card {
	background: var(--bg1);
	border: 1px solid var(--bd);
	border-radius: var(--r3);
	overflow: hidden;
	display: flex;
	flex-direction: column;
	position: relative;
	transition: transform 0.26s var(--ease), box-shadow 0.26s, border-color
		0.26s;
	animation: rise 0.5s var(--ease) both;
	box-shadow: var(--sh-sm);
}

.card:nth-child(1) {
	animation-delay: .04s
}

.card:nth-child(2) {
	animation-delay: .08s
}

.card:nth-child(3) {
	animation-delay: .12s
}

.card:nth-child(4) {
	animation-delay: .16s
}

.card:nth-child(5) {
	animation-delay: .20s
}

.card:nth-child(6) {
	animation-delay: .24s
}

.card:hover {
	transform: translateY(-4px);
	border-color: rgba(46, 107, 114, 0.4);
	box-shadow: var(--sh-lg), 0 0 0 1px rgba(46, 107, 114, 0.08);
}

.c-bar {
	height: 3px;
	width: 100%;
}

.cb-nv {
	background: linear-gradient(90deg, var(--nv), #2e4a8c);
}

.cb-tl {
	background: linear-gradient(90deg, var(--tl), var(--tl-light), #5fbfca);
}

.cb-gd {
	background: linear-gradient(90deg, var(--gd), var(--gd-light), #f0d080);
}

.c-body {
	padding: 18px 20px;
	flex: 1;
	display: flex;
	flex-direction: column;
}

.c-row1 {
	display: flex;
	align-items: flex-start;
	justify-content: space-between;
	margin-bottom: 14px;
}

.c-ico {
	width: 42px;
	height: 42px;
	border-radius: 10px;
	display: grid;
	place-items: center;
	flex-shrink: 0;
}

.ico-nv {
	background: var(--nv-dim);
	border: 1px solid rgba(14, 31, 61, 0.12);
	color: var(--nv);
}

.ico-tl {
	background: var(--tl-dim);
	border: 1px solid rgba(46, 107, 114, 0.18);
	color: var(--tl);
}

.ico-gd {
	background: var(--gd-dim);
	border: 1px solid rgba(201, 168, 76, 0.2);
	color: var(--gd);
}

.c-status {
	display: inline-flex;
	align-items: center;
	gap: 5px;
	font-family: var(--ff);
	font-size: 0.62rem;
	font-weight: 600;
	letter-spacing: 0.5px;
	text-transform: uppercase;
	padding: 4px 10px;
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

.s-dot {
	width: 6px;
	height: 6px;
	border-radius: 50%;
	flex-shrink: 0;
}

.st-live .s-dot {
	background: var(--tl);
	animation: pls 2s infinite;
}

.st-soon .s-dot {
	background: var(--gd);
}

.c-title {
	font-family: var(--ff);
	font-size: 1.15rem;
	font-weight: 600;
	color: var(--nv);
	line-height: 1.3;
	margin-bottom: 8px;
	letter-spacing: -0.2px;
}

.c-desc {
	font-size: 0.88rem;
	color: var(--t2);
	line-height: 1.65;
	flex: 1;
	margin-bottom: 14px;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	overflow: hidden;
}

.c-chips {
	display: flex;
	flex-wrap: wrap;
	gap: 6px;
	margin-bottom: 16px;
}

.chip {
	display: inline-flex;
	align-items: center;
	gap: 4px;
	font-family: var(--ff);
	font-size: 0.65rem;
	font-weight: 500;
	letter-spacing: 0.2px;
	padding: 4px 10px;
	border-radius: 6px;
	line-height: 1.5;
}

.chip svg {
	width: 10px;
	height: 10px;
}

.ch-mode {
	background: var(--tl-dim);
	color: var(--tl);
	border: 1px solid rgba(46, 107, 114, 0.18);
}

.ch-team {
	background: var(--nv-dim);
	color: var(--nv);
	border: 1px solid rgba(14, 31, 61, 0.12);
}

.ch-free {
	background: rgba(46, 107, 114, 0.08);
	color: var(--tl);
	border: 1px solid rgba(46, 107, 114, 0.2);
}

.ch-paid {
	background: var(--rs-dim);
	color: var(--rs);
	border: 1px solid rgba(168, 88, 88, 0.2);
}

.ch-date {
	background: var(--bg2);
	color: var(--t2);
	border: 1px solid var(--bd);
}

.ch-elig {
	background: var(--gd-dim);
	color: #7a6020;
	border: 1px solid rgba(201, 168, 76, 0.2);
}

.c-foot {
	display: flex;
	align-items: center;
	gap: 10px;
	padding-top: 14px;
	border-top: 1px solid var(--bd);
}

.btn-view {
	flex: 1;
	display: inline-flex;
	align-items: center;
	justify-content: center;
	gap: 8px;
	background: transparent;
	border: 1px solid var(--bd2);
	border-radius: 8px;
	color: var(--t2);
	font-size: 0.85rem;
	font-weight: 600;
	padding: 9px 14px;
	transition: all 0.2s var(--ease);
	letter-spacing: 0.2px;
}

.btn-view:hover {
	background: var(--nv);
	color: #fff;
	border-color: var(--nv);
	transform: translateY(-1px);
	box-shadow: 0 4px 14px var(--nv-glow);
}

.btn-save {
	width: 38px;
	height: 38px;
	border-radius: 8px;
	border: 1px solid var(--bd);
	background: transparent;
	color: var(--t3);
	display: grid;
	place-items: center;
	cursor: pointer;
	transition: all 0.18s;
	flex-shrink: 0;
}

.btn-save:hover, .btn-save.on {
	background: var(--nv-dim);
	color: var(--nv);
	border-color: var(--bd2);
}

.card.hidden {
	display: none;
}

/* ══ EMPTY ══ */
.empty-msg {
	grid-column: 1/-1;
	text-align: center;
	padding: 72px 20px;
}

.empty-ico {
	width: 60px;
	height: 60px;
	border-radius: 14px;
	background: var(--bg2);
	border: 1px solid var(--bd);
	display: grid;
	place-items: center;
	margin: 0 auto 16px;
	color: var(--t3);
}

.empty-msg h3 {
	font-family: var(--ff);
	font-size: 1.2rem;
	font-weight: 600;
	color: var(--t2);
	margin-bottom: 6px;
}

.empty-msg p {
	font-size: 0.9rem;
	color: var(--t3);
}

.no-results {
	grid-column: 1/-1;
	display: none;
}

.no-results.show {
	display: block;
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
}

.f-brand {
	font-family: var(--ff);
	font-size: 0.95rem;
	font-weight: 600;
	color: rgba(255, 255, 255, 0.65);
}

.f-brand span {
	color: var(--gd-light);
}

.f-copy {
	font-family: var(--ff);
	font-size: 0.62rem;
	color: rgba(255, 255, 255, 0.28);
	letter-spacing: 0.5px;
}

/* ══ RESPONSIVE ══ */
@media ( max-width :1100px) {
	.layout {
		padding: 24px 24px 60px
	}
	.navbar {
		padding: 0 24px
	}
	.site-footer {
		padding: 24px 24px
	}
}

@media ( max-width :900px) {
	.layout {
		flex-direction: column
	}
	.sidebar {
		width: 100%
	}
	.sb-box {
		position: static
	}
	.grid {
		grid-template-columns: repeat(2, 1fr)
	}
	.stat {
		padding: 0 20px
	}
}

@media ( max-width :620px) {
	.navbar {
		padding: 0 16px
	}
	.hero {
		padding: 52px 16px 36px
	}
	.layout {
		padding: 18px 16px 48px
	}
	.grid {
		grid-template-columns: 1fr
	}
	.stats {
		flex-wrap: wrap;
		gap: 24px 0
	}
	.stat+.stat::before {
		display: none
	}
	.site-footer {
		padding: 20px 16px;
		flex-direction: column;
		text-align: center
	}
	.features {
		padding: 20px 16px 4px
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
		<a href="#" class="brand">
			<div class="brand-mark">
				<svg width="15" height="15" viewBox="0 0 24 24" fill="none"
					stroke="currentColor" stroke-width="2.5" stroke-linecap="round"
					stroke-linejoin="round">
        <polyline points="13 2 3 14 12 14 11 22 21 10 12 10 13 2" />
      </svg>
			</div> <span class="brand-name">Code<span>Verse</span></span>
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

	<!-- HERO -->
	<section class="hero">
		<div class="hero-badge">
			<span class="pulse"></span> 50+ Hackathons Active Right Now
		</div>
		<h1 class="hero-h1">
			Discover. Build.<br> <span class="shine">Win Together.</span>
		</h1>
		<p class="hero-sub">Find the perfect hackathon to challenge your
			skills, grow your network, and build things that actually matter.</p>
		<div class="search-wrap">
			<div class="search-inner">
				<span class="s-ico"> <svg width="16" height="16"
						viewBox="0 0 24 24" fill="none" stroke="currentColor"
						stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
          <circle cx="11" cy="11" r="8" />
						<line x1="21" y1="21" x2="16.65" y2="16.65" />
        </svg>
				</span> <input id="searchInput" type="text"
					placeholder="Search by name, theme, or technology...">
				<button class="s-btn">Search</button>
			</div>
		</div>
	</section>

	<!-- STATS -->
	<div class="stats">
		<div class="stat">
			<div class="stat-val">
				<span>24</span>
			</div>
			<div class="stat-lbl">Active Events</div>
		</div>
		<div class="stat">
			<div class="stat-val">
				<span>&#8377;1.2lac</span>
			</div>
			<div class="stat-lbl">Prize Pool</div>
		</div>
		<div class="stat">
			<div class="stat-val">
				<span>1K+</span>
			</div>
			<div class="stat-lbl">Participants</div>
		</div>
		<div class="stat">
			<div class="stat-val">
				<span>80%</span>
			</div>
			<div class="stat-lbl">Free Entry</div>
		</div>
	</div>

	<!-- TICKER -->
	<div class="ticker-shell" aria-hidden="true">
		<div class="ticker-fade-left"></div>
		<div class="ticker-fade-right"></div>
		<div class="ticker-track">

			<div class="tk">
				<strong>AI / ML</strong><span class="tk-sep"></span>
			</div>
			<div class="tk">
				<strong>Web3 &amp; Blockchain</strong><span class="tk-sep"></span>
			</div>
			<div class="tk">
				Open Registration<span class="tk-sep"></span>
			</div>
			<div class="tk">
				<strong>Cybersecurity</strong><span class="tk-sep"></span>
			</div>
			<div class="tk tk-prize">
				&#8377;50L Prize Pool<span class="tk-sep"></span>
			</div>
			<div class="tk">
				<strong>Climate Tech</strong><span class="tk-sep"></span>
			</div>
			<div class="tk">
				Solo &amp; Team Events<span class="tk-sep"></span>
			</div>
			<div class="tk">
				<strong>HealthTech</strong><span class="tk-sep"></span>
			</div>
			<div class="tk">
				Online &amp; Offline<span class="tk-sep"></span>
			</div>
			<div class="tk">
				<strong>FinTech</strong><span class="tk-sep"></span>
			</div>
			<div class="tk">
				New Events Weekly<span class="tk-sep"></span>
			</div>
			<div class="tk">
				<strong>Open Source</strong><span class="tk-sep"></span>
			</div>

			<!-- duplicate for seamless loop -->
			<div class="tk">
				<strong>AI / ML</strong><span class="tk-sep"></span>
			</div>
			<div class="tk">
				<strong>Web3 &amp; Blockchain</strong><span class="tk-sep"></span>
			</div>
			<div class="tk">
				Open Registration<span class="tk-sep"></span>
			</div>
			<div class="tk">
				<strong>Cybersecurity</strong><span class="tk-sep"></span>
			</div>
			<div class="tk tk-prize">
				&#8377;50L Prize Pool<span class="tk-sep"></span>
			</div>
			<div class="tk">
				<strong>Climate Tech</strong><span class="tk-sep"></span>
			</div>
			<div class="tk">
				Solo &amp; Team Events<span class="tk-sep"></span>
			</div>
			<div class="tk">
				<strong>HealthTech</strong><span class="tk-sep"></span>
			</div>
			<div class="tk">
				Online &amp; Offline<span class="tk-sep"></span>
			</div>
			<div class="tk">
				<strong>FinTech</strong><span class="tk-sep"></span>
			</div>
			<div class="tk">
				New Events Weekly<span class="tk-sep"></span>
			</div>
			<div class="tk">
				<strong>Open Source</strong><span class="tk-sep"></span>
			</div>

		</div>
	</div>

	<!-- TRUST PILLS -->
	<div class="features">
		<div class="feat-pill">
			<svg width="12" height="12" viewBox="0 0 24 24" fill="none"
				stroke="currentColor" stroke-width="2.5" stroke-linecap="round"
				stroke-linejoin="round">
				<path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z" /></svg>
			Verified Organisers
		</div>
		<div class="feat-pill">
			<svg width="12" height="12" viewBox="0 0 24 24" fill="none"
				stroke="currentColor" stroke-width="2.5" stroke-linecap="round"
				stroke-linejoin="round">
				<circle cx="12" cy="12" r="10" />
				<polyline points="12 6 12 12 16 14" /></svg>
			Real-time Updates
		</div>
		<div class="feat-pill">
			<svg width="12" height="12" viewBox="0 0 24 24" fill="none"
				stroke="currentColor" stroke-width="2.5" stroke-linecap="round"
				stroke-linejoin="round">
				<path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2" />
				<circle cx="9" cy="7" r="4" />
				<path d="M23 21v-2a4 4 0 0 0-3-3.87M16 3.13a4 4 0 0 1 0 7.75" /></svg>
			Solo &amp; Team Friendly
		</div>
		<div class="feat-pill">
			<svg width="12" height="12" viewBox="0 0 24 24" fill="none"
				stroke="currentColor" stroke-width="2.5" stroke-linecap="round"
				stroke-linejoin="round">
				<polygon
					points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2" /></svg>
			Top Rated Events
		</div>
		<div class="feat-pill">
			<svg width="12" height="12" viewBox="0 0 24 24" fill="none"
				stroke="currentColor" stroke-width="2.5" stroke-linecap="round"
				stroke-linejoin="round">
				<rect x="2" y="3" width="20" height="14" rx="2" />
				<line x1="8" y1="21" x2="16" y2="21" />
				<line x1="12" y1="17" x2="12" y2="21" /></svg>
			Online &amp; Offline
		</div>
		<div class="feat-pill">
			<svg width="12" height="12" viewBox="0 0 24 24" fill="none"
				stroke="currentColor" stroke-width="2.5" stroke-linecap="round"
				stroke-linejoin="round">
				<line x1="12" y1="1" x2="12" y2="23" />
				<path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6" /></svg>
			Cash &amp; Prizes
		</div>
	</div>

	<!-- LAYOUT -->
	<div class="layout">

		<!-- SIDEBAR -->
		<aside class="sidebar">
			<div class="sb-box">
				<div class="sb-head">
					<span class="sb-ttl"> <svg width="10" height="10"
							viewBox="0 0 24 24" fill="none" stroke="currentColor"
							stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
            <line x1="4" y1="6" x2="20" y2="6" />
							<line x1="8" y1="12" x2="16" y2="12" />
							<line x1="11" y1="18" x2="13" y2="18" />
          </svg> Filters
					</span> <span class="act-badge" id="activeFilterCount">0 active</span>
				</div>
				<div class="sb-body">
					<div class="fg">
						<span class="fg-lbl">Entry Type</span>
						<div class="pr">
							<input type="radio" name="type" value="" id="t-all" checked><label
								for="t-all">All</label> <input type="radio" name="type"
								value="FREE" id="t-free"><label for="t-free">Free</label>
							<input type="radio" name="type" value="PAID" id="t-paid"><label
								for="t-paid">Paid</label>
						</div>
					</div>
					<div class="fg">
						<span class="fg-lbl">Status</span>
						<div class="pr">
							<input type="radio" name="status" value="" id="s-all" checked><label
								for="s-all">All</label> <input type="radio" name="status"
								value="ONGOING" id="s-live"><label for="s-live">Live</label>
							<input type="radio" name="status" value="UPCOMING" id="s-soon"><label
								for="s-soon">Soon</label> <input type="radio" name="status"
								value="COMPLETED" id="s-end"><label for="s-end">Ended</label>
						</div>
					</div>
					<div class="fg">
						<span class="fg-lbl">Event Mode</span>
						<div class="pr">
							<input type="radio" name="mode" value="" id="m-all" checked><label
								for="m-all">All</label> <input type="radio" name="mode"
								value="ONLINE" id="m-on"><label for="m-on">Online</label>
							<input type="radio" name="mode" value="OFFLINE" id="m-off"><label
								for="m-off">Offline</label> <input type="radio" name="mode"
								value="HYBRID" id="m-hyb"><label for="m-hyb">Hybrid</label>
						</div>
					</div>
					<div class="fg">
						<span class="fg-lbl">Team Size</span> <select id="teamSizeFilter"
							class="sel">
							<option value="">Any size</option>
							<option value="1">Solo (1)</option>
							<option value="2">2 Members</option>
							<option value="4">4 Members</option>
							<option value="6">6+ Members</option>
						</select>
					</div>
					<div class="fg">
						<span class="fg-lbl">Eligibility</span> <select
							id="eligibilityFilter" class="sel">
							<option value="">Everyone</option>

							<c:forEach var="u" items="${allUserType}">
								<option value="${u.userTypeId}">${u.userType}</option>
							</c:forEach>

						</select>
					</div>
					<div class="sb-div"></div>
					<button class="reset-btn" id="resetBtn">Reset All Filters</button>
				</div>
			</div>
		</aside>

		<!-- CARDS -->
		<main class="cards-col">
			<div class="col-top">
				<div class="col-title">
					All Hackathons <span class="col-count" id="resultsCount"></span>
				</div>
				<select class="sort-sel" id="sortSelect">
					<option value="default">Latest First</option>
					<option value="title-asc">Name: A to Z</option>
					<option value="title-desc">Name: Z to A</option>
					<option value="team-asc">Team: Smallest</option>
					<option value="team-desc">Team: Largest</option>
				</select>
			</div>

			<div class="grid" id="cardsGrid">
				<c:choose>
					<c:when test="${empty hackathons}">
						<div class="empty-msg">
							<div class="empty-ico">
								<svg width="22" height="22" viewBox="0 0 24 24" fill="none"
									stroke="currentColor" stroke-width="1.5" stroke-linecap="round"
									stroke-linejoin="round">
                <circle cx="11" cy="11" r="8" />
									<line x1="21" y1="21" x2="16.65" y2="16.65" />
              </svg>
							</div>
							<h3>No hackathons yet</h3>
							<p>Check back soon — new events drop every week.</p>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach items="${hackathons}" var="h" varStatus="loop">
							<c:set var="m3" value="${loop.index % 3}" />
							<div class="card" data-title="${fn:toLowerCase(h.title)}"
								data-desc="${fn:toLowerCase(h.description)}"
								data-type="${h.payment}" data-status="${h.status}"
								data-mode="${h.eventType}" data-minteam="${h.minTeamSize}"
								data-maxteam="${h.maxTeamSize}"
								data-eligibility="${h.userTypeId}">

								<c:choose>
									<c:when test="${m3 == 0}">
										<div class="c-bar cb-nv"></div>
									</c:when>
									<c:when test="${m3 == 1}">
										<div class="c-bar cb-tl"></div>
									</c:when>
									<c:otherwise>
										<div class="c-bar cb-gd"></div>
									</c:otherwise>
								</c:choose>

								<div class="c-body">
									<div class="c-row1">
										<c:choose>
											<c:when test="${m3 == 0}">
												<div class="c-ico ico-nv">
													<svg width="18" height="18" viewBox="0 0 24 24" fill="none"
														stroke="currentColor" stroke-width="2"
														stroke-linecap="round" stroke-linejoin="round">
														<polyline points="13 2 3 14 12 14 11 22 21 10 12 10 13 2" /></svg>
												</div>
											</c:when>
											<c:when test="${m3 == 1}">
												<div class="c-ico ico-tl">
													<svg width="18" height="18" viewBox="0 0 24 24" fill="none"
														stroke="currentColor" stroke-width="2"
														stroke-linecap="round" stroke-linejoin="round">
														<polygon
															points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2" /></svg>
												</div>
											</c:when>
											<c:otherwise>
												<div class="c-ico ico-gd">
													<svg width="18" height="18" viewBox="0 0 24 24" fill="none"
														stroke="currentColor" stroke-width="2"
														stroke-linecap="round" stroke-linejoin="round">
														<circle cx="12" cy="12" r="10" />
														<line x1="2" y1="12" x2="22" y2="12" />
														<path
															d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z" /></svg>
												</div>
											</c:otherwise>
										</c:choose>

										<c:choose>
											<c:when test="${h.status == 'ONGOING'}">
												<span class="c-status st-live"><span class="s-dot"></span>Live</span>
											</c:when>
											<c:when test="${h.status == 'UPCOMING'}">
												<span class="c-status st-soon"><span class="s-dot"></span>Soon</span>
											</c:when>
											<c:otherwise>
												<span class="c-status st-over">Ended</span>
											</c:otherwise>
										</c:choose>
									</div>

									<h3 class="c-title">${h.title}</h3>
									<p class="c-desc">
										<c:choose>
											<c:when test="${not empty h.description}">${h.description}</c:when>
											<c:otherwise>Showcase your skills, collaborate with talented developers, and build something extraordinary.</c:otherwise>
										</c:choose>
									</p>

									<div class="c-chips">
										<span class="chip ch-mode"> <svg viewBox="0 0 24 24"
												fill="none" stroke="currentColor" stroke-width="2.5"
												stroke-linecap="round" stroke-linejoin="round">
												<circle cx="12" cy="12" r="10" />
												<line x1="2" y1="12" x2="22" y2="12" />
												<path
													d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z" /></svg>
											${h.eventType}
										</span> <span class="chip ch-team"> <svg viewBox="0 0 24 24"
												fill="none" stroke="currentColor" stroke-width="2.5"
												stroke-linecap="round" stroke-linejoin="round">
												<path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2" />
												<circle cx="9" cy="7" r="4" />
												<path
													d="M23 21v-2a4 4 0 0 0-3-3.87M16 3.13a4 4 0 0 1 0 7.75" /></svg>
											${h.minTeamSize}&#8211;${h.maxTeamSize}
										</span>
										<c:choose>
											<c:when test="${h.payment == 'FREE'}">
												<span class="chip ch-free">FREE</span>
											</c:when>
											<c:otherwise>
												<span class="chip ch-paid">PAID</span>
											</c:otherwise>
										</c:choose>
										<c:if test="${not empty h.registrationEndDate}">
											<span class="chip ch-date"> <svg viewBox="0 0 24 24"
													fill="none" stroke="currentColor" stroke-width="2.5"
													stroke-linecap="round" stroke-linejoin="round">
													<rect x="3" y="4" width="18" height="18" rx="2" />
													<line x1="16" y1="2" x2="16" y2="6" />
													<line x1="8" y1="2" x2="8" y2="6" />
													<line x1="3" y1="10" x2="21" y2="10" /></svg> Ends
												${h.registrationEndDate}
											</span>
										</c:if>
										<c:if test="${not empty h.userTypeId}">
											<span class="chip ch-elig"> <svg viewBox="0 0 24 24"
													fill="none" stroke="currentColor" stroke-width="2.5"
													stroke-linecap="round" stroke-linejoin="round">
													<path d="M22 10v6M2 10l10-5 10 5-10 5z" />
													<path d="M6 12v5c3 3 9 3 12 0v-5" /></svg> ${h.userTypeId}
											</span>
										</c:if>
									</div>

									<div class="c-foot">
										<a href="/participant/hackathon/${h.hackathonId}" class="btn-view">
											View Details <svg width="11" height="11" viewBox="0 0 24 24"
												fill="none" stroke="currentColor" stroke-width="2.5"
												stroke-linecap="round" stroke-linejoin="round">
												<line x1="5" y1="12" x2="19" y2="12" />
												<polyline points="12 5 19 12 12 19" /></svg>
										</a>
										<button class="btn-save" title="Save"
											onclick="this.classList.toggle('on')">
											<svg width="13" height="13" viewBox="0 0 24 24" fill="none"
												stroke="currentColor" stroke-width="2"
												stroke-linecap="round" stroke-linejoin="round">
												<path d="M19 21l-7-5-7 5V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2z" /></svg>
										</button>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>

				<div class="no-results" id="noResults">
					<div class="empty-msg">
						<div class="empty-ico">
							<svg width="22" height="22" viewBox="0 0 24 24" fill="none"
								stroke="currentColor" stroke-width="1.5" stroke-linecap="round"
								stroke-linejoin="round">
              <circle cx="11" cy="11" r="8" />
								<line x1="21" y1="21" x2="16.65" y2="16.65" />
								<line x1="8" y1="11" x2="14" y2="11" />
            </svg>
						</div>
						<h3>No hackathons match</h3>
						<p>Try different keywords or reset the filters.</p>
					</div>
				</div>
			</div>
		</main>

	</div>

	<!-- FOOTER -->
	<footer class="site-footer">
		<div class="f-brand">
			Code<span>Verse</span> - Your Gateway to Innovation
		</div>
		<div class="f-copy">&copy; 2026 CodeVerse. All rights reserved.</div>
	</footer>

	<script>

(function(){

var pb = document.getElementById('pgbar');

window.addEventListener('scroll',function(){
	var s = window.scrollY;
	var h = document.documentElement.scrollHeight - window.innerHeight;
	pb.style.width = (h>0 ? (s/h)*100 : 0) + '%';
});


const cards = Array.from(document.querySelectorAll('.card'));
const search = document.getElementById('searchInput');
const teamSel = document.getElementById('teamSizeFilter');
const eligSel = document.getElementById('eligibilityFilter');
const sortSel = document.getElementById('sortSelect');
const resetBtn = document.getElementById('resetBtn');

const noRes = document.getElementById('noResults');
const countEl = document.getElementById('resultsCount');
const badgeEl = document.getElementById('activeFilterCount');

const grid = document.getElementById('cardsGrid');

const originalOrder = cards.slice();



function teamMatch(card,selected){

	if(!selected) return true;

	let min = parseInt(card.dataset.minteam) || 0;
	let max = parseInt(card.dataset.maxteam) || 99;

	selected = parseInt(selected);

	if(selected === 1) return min <= 1 && max >= 1;
	if(selected === 2) return min <= 2 && max >= 2;
	if(selected === 4) return min <= 4 && max >= 4;
	if(selected === 6) return max >= 6;

	return true;
}



function runFilters(){

	let keyword = search.value.trim().toLowerCase();

	let type = document.querySelector('input[name="type"]:checked').value;
	let status = document.querySelector('input[name="status"]:checked').value;
	let mode = document.querySelector('input[name="mode"]:checked').value;

	let team = teamSel.value;
	let elig = eligSel.value;

	let sort = sortSel.value;

	let visibleCards = [];


	cards.forEach(card => {

		let text = (
			card.dataset.title + " " +
			card.dataset.desc + " " +
			card.dataset.mode
		).toLowerCase();


		let ok =
			(!keyword || text.includes(keyword)) &&
			(!type || card.dataset.type === type) &&
			(!status || card.dataset.status === status) &&
			(!mode || card.dataset.mode === mode) &&
			(!elig || card.dataset.eligibility == elig) &&
			teamMatch(card,team);


		card.classList.toggle("hidden", !ok);

		if(ok) visibleCards.push(card);

	});


	sortCards(sort);

	countEl.textContent = "(" + visibleCards.length + ")";

	let activeFilters =
		(keyword ? 1:0) +
		(type ? 1:0) +
		(status ? 1:0) +
		(mode ? 1:0) +
		(team ? 1:0) +
		(elig ? 1:0);

	badgeEl.textContent = activeFilters + " active";

	noRes.classList.toggle("show", visibleCards.length === 0);

}



function sortCards(type){

	let sorted;

	if(type === "title-asc"){
		sorted = cards.slice().sort((a,b)=>a.dataset.title.localeCompare(b.dataset.title));
	}

	else if(type === "title-desc"){
		sorted = cards.slice().sort((a,b)=>b.dataset.title.localeCompare(a.dataset.title));
	}

	else if(type === "team-asc"){
		sorted = cards.slice().sort((a,b)=>parseInt(a.dataset.minteam)-parseInt(b.dataset.minteam));
	}

	else if(type === "team-desc"){
		sorted = cards.slice().sort((a,b)=>parseInt(b.dataset.maxteam)-parseInt(a.dataset.maxteam));
	}

	else{
		sorted = originalOrder;
	}

	sorted.forEach(c => grid.insertBefore(c,noRes));

}



search.addEventListener("input",runFilters);

document.querySelectorAll('input[name="type"],input[name="status"],input[name="mode"]')
.forEach(r=>r.addEventListener("change",runFilters));

teamSel.addEventListener("change",runFilters);

eligSel.addEventListener("change",runFilters);

sortSel.addEventListener("change",runFilters);



resetBtn.addEventListener("click",function(){

	search.value = "";

	document.getElementById("t-all").checked = true;
	document.getElementById("s-all").checked = true;
	document.getElementById("m-all").checked = true;

	teamSel.value = "";
	eligSel.value = "";
	sortSel.value = "default";

	runFilters();

});


runFilters();

})();

</script>

</body>
</html>