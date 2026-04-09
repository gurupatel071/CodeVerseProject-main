<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- ✅ FONT (REQUIRED) -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

<style>

/* ✅ REQUIRED VARIABLES (FIX ISSUE) */
:root {
	--nv: #0e1f3d;
	--nv2: #1a3260;
	--nv-dim: rgba(14, 31, 61, 0.07);

	--tl: #2e6b72;

	--t2: #4b5b6e;

	--bd: rgba(14, 31, 61, 0.08);

	--ff: 'Inter', sans-serif;
}

/* ✅ FORCE SAME FONT */
.navbar, .navbar * {
	font-family: var(--ff);
}

/* ===== NAVBAR ===== */
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

/* ===== BRAND ===== */
.brand {
	display: flex;
	align-items: center;
	gap: 10px;
	text-decoration: none;
}

.brand-mark {
	width: 32px;
	height: 32px;
	border-radius: 8px;
	background: var(--nv);
	display: grid;
	place-items: center;
	color: #e0be73;
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

/* ===== LINKS ===== */
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
	text-decoration: none;
	transition: all 0.18s;
}

.nav-links a:hover {
	color: var(--nv);
	background: var(--nv-dim);
}

/* CTA */
.nav-cta {
	background: var(--nv);
	color: #fff !important;
	padding: 7px 16px;
	border-radius: 8px;
	font-weight: 600;
}

/* PROFILE */
.profile img {
	width: 32px;
	height: 32px;
	border-radius: 50%;
	object-fit: cover;
	margin-left: 10px;
}

</style>


<!-- ✅ EXACT SAME NAVBAR -->
<header class="navbar">

	<a href="/participant/home" class="brand">
		<div class="brand-mark">
			<svg width="15" height="15" viewBox="0 0 24 24" fill="none"
				stroke="currentColor" stroke-width="2.5"
				stroke-linecap="round" stroke-linejoin="round">
				<polyline points="13 2 3 14 12 14 11 22 21 10 12 10 13 2" />
			</svg>
		</div>
		<span class="brand-name">Code<span>Verse</span></span>
	</a>

	<nav class="nav-links">
		<a href="/participant/home">Explore</a>
		<a href="/participant/my-hackathons">My Hackathons</a>
		<!-- <a href="/participant/leaderboard">Leaderboard</a> -->

		<c:if test="${empty sessionScope.user}">
			<a href="/login">Login</a>
			<a href="/signup" class="nav-cta">Register</a>
		</c:if>

		<c:if test="${not empty sessionScope.user}">
			<a href="/logout">Logout</a>
		</c:if>

		<!-- PROFILE -->
		<c:if test="${not empty sessionScope.user}">
  <div class="profile">

    <c:choose>

      <c:when test="${not empty sessionScope.user.profilePicURL}">
        <img src="${sessionScope.user.profilePicURL}" 
             style="width:40px;height:40px;border-radius:50%;">
      </c:when>

      <c:otherwise>
        <img src="https://cdn-icons-png.flaticon.com/512/149/149071.png" 
             style="width:40px;height:40px;border-radius:50%;">
      </c:otherwise>

    </c:choose>

  </div>
</c:if>
	</nav>

</header>