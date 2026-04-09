<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>

<title>User Management</title>

<jsp:include page="AdminCSS.jsp"></jsp:include>

<!-- Google Fonts — same as Dashboard -->
<link
	href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=DM+Sans:wght@300;400;500;600&display=swap"
	rel="stylesheet">

<style>

/* ===========================
     ROOT VARIABLES — same English Palette
  =========================== */
:root {
	--navy: #1B2A4A;
	--oxford: #0E1F3D;
	--eton: #2E6B72;
	--sage: #4A7C6F;
	--ivory: #F7F4EE;
	--cream: #EDE9E0;
	--slate: #4B5B6E;
	--muted: #8C97A4;
	--gold: #C9A84C;
	--rose: #A85858;
	--white: #FFFFFF;
	--shadow-sm: 0 2px 12px rgba(27, 42, 74, 0.08);
	--shadow-md: 0 8px 32px rgba(27, 42, 74, 0.12);
	--shadow-lg: 0 16px 48px rgba(27, 42, 74, 0.16);
	--radius: 14px;
	--radius-sm: 8px;
}

* {
	box-sizing: border-box;
}

body {
	font-family: 'DM Sans', sans-serif;
	background: var(--ivory);
	color: var(--navy);
}

/* ===========================
     PAGE FADE-IN
  =========================== */
.content-wrapper {
	padding: 2rem 2rem 1rem !important;
	animation: pageFadeIn 0.7s ease both;
}

@
keyframes pageFadeIn {from { opacity:0;
	transform: translateY(18px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}

/* ===========================
     PAGE TITLE
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

/* ===========================
     SECTION LABEL
  =========================== */
.section-label {
	font-size: 0.7rem;
	font-weight: 700;
	letter-spacing: 2px;
	text-transform: uppercase;
	color: var(--muted);
	margin: 1.8rem 0 1rem;
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
     STAT CARDS
  =========================== */
.stat-card {
	border: none;
	border-radius: var(--radius);
	padding: 1.5rem 1.6rem;
	position: relative;
	overflow: hidden;
	cursor: default;
	transition: transform 0.3s ease, box-shadow 0.3s ease;
	box-shadow: var(--shadow-sm);
	animation: cardSlideUp 0.6s ease both;
}

.stat-card:hover {
	transform: translateY(-5px);
	box-shadow: var(--shadow-lg);
}

.stat-card::before {
	content: '';
	position: absolute;
	top: -30px;
	right: -30px;
	width: 100px;
	height: 100px;
	border-radius: 50%;
	opacity: 0.12;
	background: white;
	transition: transform 0.4s ease;
}

.stat-card:hover::before {
	transform: scale(1.5);
}

.stat-card p {
	font-size: 0.78rem;
	font-weight: 600;
	letter-spacing: 1.2px;
	text-transform: uppercase;
	opacity: 0.85;
	margin-bottom: 0.5rem;
}

.stat-card h2 {
	font-family: 'Playfair Display', serif;
	font-size: 2.6rem;
	font-weight: 700;
	line-height: 1;
	margin: 0;
}

.stat-icon {
	position: absolute;
	bottom: 14px;
	right: 18px;
	font-size: 2.8rem;
	opacity: 0.18;
}

.card-oxford {
	background: var(--oxford);
	color: var(--white);
}

.card-sage {
	background: var(--sage);
	color: var(--white);
}

.card-eton {
	background: var(--eton);
	color: var(--white);
}

.card-rose {
	background: var(--rose);
	color: var(--white);
}

@
keyframes cardSlideUp {from { opacity:0;
	transform: translateY(24px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
.stat-card:nth-child(1) {
	animation-delay: 0.1s;
}

.stat-card:nth-child(2) {
	animation-delay: 0.2s;
}

.stat-card:nth-child(3) {
	animation-delay: 0.3s;
}

.stat-card:nth-child(4) {
	animation-delay: 0.4s;
}

/* ===========================
     SEARCH + TOOLBAR
  =========================== */
.toolbar-card {
	background: var(--white);
	border-radius: var(--radius);
	box-shadow: var(--shadow-sm);
	padding: 1.2rem 1.5rem;
	display: flex;
	align-items: center;
	justify-content: space-between;
	gap: 1rem;
	animation: cardSlideUp 0.6s 0.45s ease both;
}

.search-wrap {
	position: relative;
	flex: 1;
	max-width: 360px;
}

.search-wrap .search-icon {
	position: absolute;
	left: 14px;
	top: 50%;
	transform: translateY(-50%);
	color: var(--muted);
	font-size: 0.9rem;
	pointer-events: none;
}

.search-input {
	width: 100%;
	padding: 9px 14px 9px 38px;
	border: 1.5px solid var(--cream);
	border-radius: 50px;
	font-family: 'DM Sans', sans-serif;
	font-size: 0.88rem;
	color: var(--navy);
	background: var(--ivory);
	outline: none;
	transition: border-color 0.2s, box-shadow 0.2s;
}

.search-input:focus {
	border-color: var(--eton);
	box-shadow: 0 0 0 3px rgba(46, 107, 114, 0.1);
	background: var(--white);
}

.search-input::placeholder {
	color: var(--muted);
}

.user-count-tag {
	font-size: 0.78rem;
	font-weight: 600;
	color: var(--muted);
	letter-spacing: 0.5px;
	white-space: nowrap;
}

.user-count-tag strong {
	color: var(--oxford);
	font-family: 'Playfair Display', serif;
	font-size: 1rem;
}

/* ===========================
     USER TABLE CARD
  =========================== */
.table-card {
	background: var(--white);
	border-radius: var(--radius);
	box-shadow: var(--shadow-sm);
	padding: 1.5rem 1.8rem;
	animation: cardSlideUp 0.6s 0.55s ease both;
}

.styled-table {
	width: 100%;
	border-collapse: collapse;
}

.styled-table thead tr {
	border-bottom: 2px solid var(--cream);
}

.styled-table thead th {
	font-size: 0.7rem;
	font-weight: 700;
	letter-spacing: 1.2px;
	text-transform: uppercase;
	color: var(--muted);
	padding: 0.6rem 0.9rem;
	text-align: left;
}

.styled-table tbody tr {
	border-bottom: 1px solid var(--ivory);
	transition: background 0.18s ease;
}

.styled-table tbody tr:hover {
	background: var(--ivory);
}

.styled-table tbody td {
	padding: 0.9rem 0.9rem;
	font-size: 0.88rem;
	color: var(--slate);
	vertical-align: middle;
}

/* Avatar circle */
.user-avatar {
	width: 34px;
	height: 34px;
	border-radius: 50%;
	background: var(--oxford);
	color: var(--gold);
	font-family: 'Playfair Display', serif;
	font-size: 0.85rem;
	font-weight: 700;
	display: inline-flex;
	align-items: center;
	justify-content: center;
	margin-right: 8px;
	flex-shrink: 0;
}

.user-name-cell {
	display: flex;
	align-items: center;
}

.user-name-text {
	font-weight: 600;
	color: var(--navy);
	font-size: 0.9rem;
}

/* Role + Status pills */
.pill {
	display: inline-block;
	padding: 3px 10px;
	border-radius: 50px;
	font-size: 0.72rem;
	font-weight: 700;
	letter-spacing: 0.5px;
}

.pill-admin {
	background: #E8F0FE;
	color: #2C4A6E;
}

.pill-user {
	background: var(--cream);
	color: var(--slate);
}

.pill-active {
	background: #E8F5EE;
	color: #2D6A4F;
}

.pill-inactive {
	background: #FEF0EB;
	color: #B5573B;
}

/* Action buttons */
.btn-action {
	display: inline-flex;
	align-items: center;
	gap: 4px;
	padding: 5px 12px;
	border-radius: var(--radius-sm);
	font-family: 'DM Sans', sans-serif;
	font-size: 0.78rem;
	font-weight: 600;
	text-decoration: none;
	border: 1.5px solid transparent;
	cursor: pointer;
	transition: all 0.2s ease;
	margin-right: 4px;
}

.btn-view {
	border-color: var(--slate);
	color: var(--slate);
	background: transparent;
}

.btn-view:hover {
	background: var(--slate);
	color: var(--white);
}

.btn-edit {
	border-color: var(--gold);
	color: var(--gold);
	background: transparent;
}

.btn-edit:hover {
	background: var(--gold);
	color: var(--oxford);
}

.btn-delete {
	border-color: var(--rose);
	color: var(--rose);
	background: transparent;
}

.btn-delete:hover {
	background: var(--rose);
	color: var(--white);
}

/* No results row */
.empty-row td {
	text-align: center;
	padding: 3rem 0;
	color: var(--muted);
	font-size: 0.9rem;
}

/* ===== DASHBOARD BACKGROUND FIX ===== */

/* main dashboard area */
.content-wrapper{
	background:#F3EFE7 !important;
}

/* page body soft contrast */
body{
	background:#F3EFE7 !important;
}

/* panels/cards area subtle contrast */
.main-panel{
	background:#F3EFE7 !important;
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


					<!-- ===========================
             PAGE TITLE
        =========================== -->
					<div class="welcome-badge">Admin Panel</div>
					<h3 class="page-title">User Management</h3>
					<p class="page-subtitle">View, edit and manage all registered
						users</p>


					<!-- ===========================
             STAT CARDS
        =========================== -->
					<div class="section-label">Overview</div>

					<div class="row g-3 mb-4">

						<div class="col-md-3">
							<div class="stat-card card-oxford">
								<p>Total Users</p>
								<h2>${userList.size()}</h2>
								<div class="stat-icon">👥</div>
							</div>
						</div>

						<div class="col-md-3">
							<div class="stat-card card-eton">
								<p>Admins</p>
								<h2>${adminCount}</h2>
								<div class="stat-icon">🛡</div>
							</div>
						</div>

						<div class="col-md-3">
							<div class="stat-card card-sage">
								<p>Active</p>
								<h2>${activeUsers}</h2>
								<div class="stat-icon">✅</div>
							</div>
						</div>

						<div class="col-md-3">
							<div class="stat-card card-rose">
								<p>Inactive</p>
								<h2>${inactiveUsers}</h2>
								<div class="stat-icon">⛔</div>
							</div>
						</div>

					</div>


					<!-- ===========================
             TOOLBAR
        =========================== -->
					<div class="section-label">All Users</div>

					<div class="toolbar-card mb-3">

						<div class="search-wrap">
							<span class="search-icon">🔍</span> <input type="text"
								class="search-input"
								placeholder="Search by name, email, role..."
								onkeyup="searchUser(this.value)">
						</div>

						<div class="user-count-tag">
							<strong>${userList.size()}</strong> users total
						</div>

					</div>


					<!-- ===========================
             USER TABLE
        =========================== -->
					<div class="table-card">
						<div class="table-responsive">
							<table class="styled-table">

								<thead>
									<tr>
										<th>#</th>
										<th>Name</th>
										<th>Email</th>
										<th>Role</th>
										<th>Gender</th>
										<th>Status</th>
										<th>Actions</th>
									</tr>
								</thead>

								<tbody id="userTable">

									<c:forEach items="${userList}" var="u" varStatus="s">
										<tr>

											<td style="color: var(--muted); font-size: 0.82rem;">${s.count}</td>

											<td>
												<div class="user-name-cell">
													<div class="user-avatar">
														${u.firstName.substring(0,1)}${u.lastName.substring(0,1)}
													</div>
													<span class="user-name-text">${u.firstName}
														${u.lastName}</span>
												</div>
											</td>

											<td style="color: var(--muted);">${u.email}</td>

											<td><c:choose>
													<c:when test="${u.role == 'ADMIN'}">
														<span class="pill pill-admin">${u.role}</span>
													</c:when>
													<c:otherwise>
														<span class="pill pill-user">${u.role}</span>
													</c:otherwise>
												</c:choose></td>

											<td>${u.gender}</td>

											<td><c:choose>
													<c:when test="${u.active}">
														<span class="pill pill-active">Active</span>
													</c:when>
													<c:otherwise>
														<span class="pill pill-inactive">Inactive</span>
													</c:otherwise>
												</c:choose></td>

											<td><a href="viewUser?userId=${u.userId}"
												class="btn-action btn-view">View</a> <a
												href="editUser?userId=${u.userId}"
												class="btn-action btn-edit">Edit</a> <a
												href="deleteUser?userId=${u.userId}"
												onclick="return confirm('Delete this user?');"
												class="btn-action btn-delete">Delete</a></td>

										</tr>
									</c:forEach>

									<c:if test="${empty userList}">
										<tr class="empty-row">
											<td colspan="7">No users found</td>
										</tr>
									</c:if>

								</tbody>

							</table>
						</div>
					</div>


				</div>

				<jsp:include page="AdminFooter.jsp"></jsp:include>

			</div>
		</div>
	</div>


	<!-- ===========================
     SEARCH SCRIPT
=========================== -->
	<script>
		function searchUser(input) {
			input = input.toLowerCase();
			var rows = document.querySelectorAll("#userTable tr");
			rows.forEach(function(row) {
				var text = row.innerText.toLowerCase();
				row.style.display = text.indexOf(input) !== -1 ? "" : "none";
			});
		}
	</script>

</body>
</html>
