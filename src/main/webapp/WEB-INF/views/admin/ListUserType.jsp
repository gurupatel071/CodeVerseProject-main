<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>User Type Management</title>

<jsp:include page="AdminCSS.jsp"></jsp:include>

<link
	href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=DM+Sans:wght@300;400;500;600&display=swap"
	rel="stylesheet">

<style>
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
@
keyframes cardSlideUp {from { opacity:0;
	transform: translateY(24px);
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
     TOOLBAR
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
	animation: cardSlideUp 0.6s 0.1s ease both;
	flex-wrap: wrap;
}

.search-wrap {
	position: relative;
	flex: 1;
	max-width: 320px;
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

.btn-new {
	display: inline-flex;
	align-items: center;
	gap: 6px;
	padding: 9px 20px;
	border-radius: var(--radius-sm);
	font-family: 'DM Sans', sans-serif;
	font-size: 0.85rem;
	font-weight: 600;
	text-decoration: none;
	background: var(--oxford);
	color: var(--gold);
	border: none;
	cursor: pointer;
	transition: all 0.22s ease;
	white-space: nowrap;
}

.btn-new:hover {
	background: var(--eton);
	color: var(--white);
	transform: translateY(-2px);
	box-shadow: var(--shadow-md);
}

/* ===========================
     TABLE CARD
  =========================== */
.table-card {
	background: var(--white);
	border-radius: var(--radius);
	box-shadow: var(--shadow-sm);
	overflow: hidden;
	animation: cardSlideUp 0.6s 0.2s ease both;
}

.styled-table {
	width: 100%;
	border-collapse: collapse;
}

.styled-table thead tr {
	border-bottom: 2px solid var(--cream);
	background: var(--ivory);
}

.styled-table thead th {
	font-size: 0.7rem;
	font-weight: 700;
	letter-spacing: 1.2px;
	text-transform: uppercase;
	color: var(--muted);
	padding: 0.9rem 1rem;
	text-align: left;
}

.styled-table tbody tr {
	border-bottom: 1px solid var(--ivory);
	transition: background 0.18s ease;
}

.styled-table tbody tr:hover {
	background: #F9F7F2;
}

.styled-table tbody td {
	padding: 0.95rem 1rem;
	font-size: 0.88rem;
	color: var(--slate);
	vertical-align: middle;
}

/* Type badge */
.type-badge {
	display: inline-flex;
	align-items: center;
	gap: 8px;
	font-weight: 600;
	color: var(--navy);
	font-size: 0.9rem;
}

.type-dot {
	width: 8px;
	height: 8px;
	border-radius: 50%;
	background: var(--eton);
	flex-shrink: 0;
}

/* ===========================
     ACTION BUTTONS
  =========================== */
.btn-action {
	display: inline-flex;
	align-items: center;
	gap: 4px;
	padding: 5px 14px;
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

.btn-edit {
	border-color: var(--gold);
	color: #8B6D1F;
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

/* ===========================
     EMPTY STATE
  =========================== */
.empty-state {
	text-align: center;
	padding: 4rem 2rem;
}

.empty-icon {
	font-size: 2.8rem;
	opacity: 0.25;
	margin-bottom: 0.7rem;
}

.empty-text {
	color: var(--muted);
	font-size: 0.9rem;
}

/* ===========================
     COUNT TAG
  =========================== */
.count-tag {
	font-size: 0.78rem;
	font-weight: 600;
	color: var(--muted);
}

.count-tag strong {
	color: var(--oxford);
	font-family: 'Playfair Display', serif;
	font-size: 1rem;
}

/* ===== DASHBOARD BACKGROUND FIX ===== */

/* main dashboard area */
.content-wrapper {
	background: #F3EFE7 !important;
}

/* page body soft contrast */
body {
	background: #F3EFE7 !important;
}

/* panels/cards area subtle contrast */
.main-panel {
	background: #F3EFE7 !important;
}

.action-cell {
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 10px;
	white-space: nowrap;
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
					<h3 class="page-title">User Type Management</h3>
					<p class="page-subtitle">Manage roles and user type
						classifications</p>

					<div class="section-label">All User Types</div>

					<!-- ===========================
             TOOLBAR
        =========================== -->
					<div class="toolbar-card mb-3">

						<div class="search-wrap">
							<span class="search-icon">🔍</span> <input type="text"
								class="search-input" placeholder="Search user types..."
								onkeyup="searchTable(this.value)">
						</div>

						<a href="newUserType" class="btn-new">＋ Add User Type</a>

					</div>

					<!-- ===========================
             TABLE
        =========================== -->
					<div class="table-card">
						<div class="table-responsive">
							<table class="styled-table">

								<thead>
									<tr>
										<th style="width: 80px;">#</th>
										<th>User Type</th>
										<th style="text-align: center; width: 160px;">Actions</th>
									</tr>
								</thead>

								<tbody id="userTypeTable">

									<c:forEach var="ut" items="${userTypeList}" varStatus="s">
										<tr>

											<td style="color: var(--muted); font-size: 0.82rem;">${s.count}</td>

											<td>
												<div class="type-badge">
													<span class="type-dot"></span> ${ut.userType}
												</div>
											</td>

											<td class="action-cell"><a
												href="editUserType?userTypeId=${ut.userTypeId}"
												class="btn-action btn-edit">Edit</a> <a
												href="deleteUserType?userTypeId=${ut.userTypeId}"
												onclick="return confirm('Are you sure you want to delete this user type?');"
												class="btn-action btn-delete">Delete</a></td>

										</tr>
									</c:forEach>

									<c:if test="${empty userTypeList}">
										<tr>
											<td colspan="3">
												<div class="empty-state">
													<div class="empty-icon">🏷️</div>
													<div class="empty-text">No user types found. Add your
														first one!</div>
												</div>
											</td>
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

	<script>
		function searchTable(input) {
			input = input.toLowerCase();
			var rows = document.querySelectorAll("#userTypeTable tr");
			rows.forEach(function(row) {
				var text = row.innerText.toLowerCase();
				row.style.display = text.indexOf(input) !== -1 ? "" : "none";
			});
		}
	</script>

</body>
</html>
